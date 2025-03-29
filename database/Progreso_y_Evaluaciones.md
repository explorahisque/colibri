# Progreso y Evaluaciones

Este documento describe la estrategia para extender la funcionalidad de la aplicación educativa, permitiendo registrar el progreso de los usuarios en la lectura de artículos y la realización de evaluaciones (exámenes) estilo ICFES. La propuesta se integra sobre la estructura actual sin modificarla, agregando nuevas tablas y optimizaciones para un sistema robusto y escalable.

---

## 1. Lógica General del Sistema

### 1.1. Objetivos

- **Progreso:** Permitir que un usuario establezca una meta para completar el contenido de un **grado**, **área** o **tema**. El progreso se determina verificando que el usuario haya abierto (o marcado) el 100% de los artículos asociados a esa meta.
- **Evaluaciones:** Facilitar la realización de exámenes que permitan evaluar el dominio del contenido a nivel de tema, área, grado o global. Los exámenes se generan a partir de un gran banco de preguntas, con alternativas aleatorias para evitar trampas. Se permite reintentar los exámenes de forma ilimitada.

---

## 2. Estructura de la Base de Datos

### 2.1. Tablas Existentes (sin modificación)

- **usuarios**  
- **grados**  
- **areas**  
- **temas**  
- **articulos**

Estas tablas ya están en producción y se utilizarán para referenciar los contenidos y la categorización educativa.

---

## 3. Nuevas Tablas para Progreso y Evaluaciones

### 3.1. Registro de Progreso

#### Tabla: `progreso_articulos`

Esta tabla registra qué artículos ha abierto cada usuario para calcular el avance de lectura.

```sql
CREATE TABLE progreso_articulos (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER NOT NULL REFERENCES usuarios(id) ON DELETE CASCADE,
    articulo_id INTEGER NOT NULL REFERENCES articulos(id) ON DELETE CASCADE,
    fecha TIMESTAMPTZ DEFAULT now(),
    CONSTRAINT usuario_articulo_unico UNIQUE (usuario_id, articulo_id)
);
```

- **Notas:**  
  - La restricción única asegura que no se registre duplicadamente el mismo artículo para un usuario.
  - Con esta tabla se pueden realizar consultas agregadas para determinar el porcentaje de progreso en un grado, área o tema.

---

### 3.2. Banco de Preguntas y Alternativas

#### Tabla: `preguntas`

Contiene la información de cada pregunta, permitiendo la vinculación a un **grado**, **área** o **tema**.

```sql
CREATE TABLE preguntas (
    id SERIAL PRIMARY KEY,
    enunciado TEXT NOT NULL,
    dificultad VARCHAR(20),
    grado_id INTEGER REFERENCES grados(id),
    area_id INTEGER REFERENCES areas(id),
    tema_id INTEGER REFERENCES temas(id)
);
```

#### Tabla: `alternativas`

Registra las alternativas para cada pregunta, identificando la respuesta correcta.

```sql
CREATE TABLE alternativas (
    id SERIAL PRIMARY KEY,
    pregunta_id INTEGER NOT NULL REFERENCES preguntas(id) ON DELETE CASCADE,
    texto TEXT NOT NULL,
    es_correcta BOOLEAN NOT NULL DEFAULT false
);
```

- **Notas:**  
  - Se pueden agregar columnas adicionales, como etiquetas o categorías, para mayor flexibilidad en la asignación de preguntas a múltiples dimensiones.

---

### 3.3. Registro de Evaluaciones y Respuestas

#### Tabla: `evaluaciones`

Almacena cada intento de evaluación realizado por un usuario. Permite distinguir el tipo de evaluación (por tema, área, grado o global) y asociar la prueba con la categoría evaluada.

```sql
CREATE TABLE evaluaciones (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER NOT NULL REFERENCES usuarios(id) ON DELETE CASCADE,
    tipo VARCHAR(20) NOT NULL,  -- Valores sugeridos: 'tema', 'area', 'grado', 'global'
    categoria_id INTEGER,       -- Id del tema, área o grado evaluado (nulo en evaluaciones globales)
    fecha_inicio TIMESTAMPTZ DEFAULT now(),
    fecha_fin TIMESTAMPTZ,
    puntaje NUMERIC,            -- Puntaje obtenido
    total_preguntas INTEGER
);
```

#### Tabla: `respuestas_evaluacion`

Registra la respuesta de cada pregunta en un intento de evaluación, permitiendo calcular los aciertos y el puntaje.

```sql
CREATE TABLE respuestas_evaluacion (
    id SERIAL PRIMARY KEY,
    evaluacion_id INTEGER NOT NULL REFERENCES evaluaciones(id) ON DELETE CASCADE,
    pregunta_id INTEGER NOT NULL REFERENCES preguntas(id),
    alternativa_id INTEGER REFERENCES alternativas(id),
    respondida_en TIMESTAMPTZ DEFAULT now()
);
```

- **Notas:**  
  - La separación entre `evaluaciones` y `respuestas_evaluacion` facilita la administración de múltiples intentos y el análisis detallado de resultados.

---

## 4. Optimización y Mejoras Adicionales

### 4.1. Materialized Views para Reportes de Progreso

Si el cálculo del progreso resulta complejo o se realiza con frecuencia, se puede crear una _materialized view_ que consolide el porcentaje de artículos vistos por usuario, grado, área o tema.  
**Ejemplo:**

```sql
CREATE MATERIALIZED VIEW progreso_por_usuario AS
SELECT
    u.id AS usuario_id,
    g.id AS grado_id,
    COUNT(pa.articulo_id) AS articulos_vistos,
    (SELECT COUNT(*) FROM articulos a WHERE a.grado_id = g.id) AS total_articulos,
    ROUND((COUNT(pa.articulo_id)::numeric / NULLIF((SELECT COUNT(*) FROM articulos a WHERE a.grado_id = g.id), 0)) * 100, 2) AS porcentaje_progreso
FROM usuarios u
JOIN progreso_articulos pa ON u.id = pa.usuario_id
JOIN articulos a ON pa.articulo_id = a.id
JOIN grados g ON a.grado_id = g.id
GROUP BY u.id, g.id;
```

- **Nota:** Se debe programar la actualización (REFRESH) de esta vista según la frecuencia necesaria.

### 4.2. Índices Adicionales

- **Progreso:**  
  Aunque la restricción única en `progreso_articulos` crea un índice en `(usuario_id, articulo_id)`, evalúa la posibilidad de crear índices adicionales para consultas frecuentes, por ejemplo, en `articulos` sobre las columnas `grado_id`, `area_id` y `tema_id`.

- **Evaluaciones:**  
  Crea índices en las columnas `tipo` y `categoria_id` de `evaluaciones`, y en `pregunta_id` de `alternativas` y `respuestas_evaluacion`, para mejorar el rendimiento en la generación de exámenes y el análisis de resultados.

### 4.3. Selección Aleatoria Eficiente

Para la generación de exámenes, considera optimizar la selección aleatoria:
- **Muestreo en la base de datos:** Utiliza funciones de muestreo (por ejemplo, `ORDER BY random() LIMIT n`) o crea pools predefinidos para cada categoría.
- **Precálculo de Pools:** Si el conjunto de preguntas por categoría es grande y se consulta frecuentemente, podrías almacenar temporalmente un "pool" de preguntas para acelerar la selección.

### 4.4. Auditoría y Historial

Para un control más exhaustivo:
- **Triggers y Logs:**  
  Implementa triggers que registren cambios importantes (por ejemplo, reintentos en evaluaciones o modificaciones en el progreso) en una tabla de auditoría. Esto facilitará el análisis histórico y la retroalimentación a los usuarios.

---

## 5. Instrucciones de Implementación y Mantenimiento

### 5.1. Implementación Inicial

1. **Realiza un Backup:**  
   Antes de aplicar cambios, respalda la base de datos actual.

2. **Ejecuta los Scripts SQL:**  
   - Agrega las nuevas tablas (`progreso_articulos`, `preguntas`, `alternativas`, `evaluaciones`, `respuestas_evaluacion`) mediante los scripts proporcionados.
   - Verifica la correcta creación de las tablas consultando `\dt`.

3. **Pruebas Iniciales:**  
   - Inserta datos de prueba en las nuevas tablas para validar relaciones y restricciones.
   - Ejecuta consultas de ejemplo para asegurarte de que el registro de progreso y la generación de evaluaciones funcionan correctamente.

4. **Implementa Materialized Views (Opcional):**  
   Si decides utilizar materialized views para reportes, crea la vista y configura un mecanismo (por ejemplo, un cron job o una función programada) para refrescarla de forma periódica.

### 5.2. Integración con la Lógica de la Aplicación

1. **Registro del Progreso:**  
   - Al marcar que un usuario abrió o completó un artículo, inserta un registro en `progreso_articulos`.
   - Realiza consultas agregadas para calcular el porcentaje de avance en función de la meta establecida (por ejemplo, un grado o área).

2. **Generación de Evaluaciones:**  
   - Para iniciar un examen, filtra las preguntas del banco (`preguntas`) según el criterio (tema, área o grado) y selecciona aleatoriamente las preguntas.
   - Reordena las alternativas obtenidas desde la tabla `alternativas` en la UI.
   - Al finalizar el examen, inserta un registro en `evaluaciones` y almacena cada respuesta en `respuestas_evaluacion` para calcular el puntaje.

3. **Manejo de Reintentos:**  
   Permite que los usuarios realicen evaluaciones múltiples. La tabla `evaluaciones` permite comparar resultados y generar estadísticas.

### 5.3. Mantenimiento y Optimización Continua

1. **Monitoreo de Rendimiento:**  
   - Revisa periódicamente las consultas que calculan el progreso y generan evaluaciones.  
   - Ajusta índices o actualiza materialized views según la carga de trabajo.

2. **Auditoría y Logs:**  
   - Si implementas triggers para auditoría, asegúrate de que la tabla de logs se mantenga limpia y no afecte el rendimiento.
   - Considera la implementación de herramientas de monitoreo para detectar consultas lentas.

3. **Actualizaciones en el Banco de Preguntas:**  
   - Actualiza periódicamente el pool de preguntas y revisa la categorización de cada una para asegurar que los exámenes sean pertinentes y variados.
   - Implementa mecanismos para revisar y eliminar preguntas obsoletas o duplicadas.

4. **Documentación y Retroalimentación:**  
   - Mantén actualizada la documentación del esquema y de la lógica del sistema.  
   - Recoge feedback de los usuarios para ajustar la dificultad y la selección de preguntas.

---

## 6. Conclusión

La estrategia presentada permite ampliar la funcionalidad de la plataforma educativa de forma modular y escalable. Se mantienen los datos existentes sin modificaciones, mientras se agregan nuevas tablas y optimizaciones para el registro de progreso y la realización de evaluaciones. La separación de responsabilidades, junto con las mejoras sugeridas, garantiza un sistema robusto y adaptable a futuras necesidades.

---

Este documento se puede complementar con scripts y documentación adicional en la aplicación, facilitando tanto la integración inicial como el mantenimiento a largo plazo.