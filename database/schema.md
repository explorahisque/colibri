# 📄 Base de Datos - Co-Libri Learning

## 🔄 Limpieza Inicial
```sql
DROP TABLE IF EXISTS articulos CASCADE;
DROP TABLE IF EXISTS temas CASCADE;
DROP TABLE IF EXISTS areas CASCADE;
DROP TABLE IF EXISTS grados CASCADE;
DROP TABLE IF EXISTS usuarios CASCADE;
```

---

## 🗄️ Esquema de la Base de Datos

### 📌 Tabla: usuarios
```sql
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password TEXT NOT NULL,
    rol VARCHAR(20) NOT NULL CHECK(rol IN ('administrador', 'estudiante'))
);
```

### 📌 Tabla: grados
```sql
CREATE TABLE grados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);
```

### 📌 Tabla: areas
```sql
CREATE TABLE areas (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);
```

### 📌 Tabla: temas
```sql
CREATE TABLE temas (
    id SERIAL PRIMARY KEY,
    nombre TEXT NOT NULL UNIQUE
);
```

### 📌 Tabla: articulos
```sql
CREATE TABLE articulos (
    id SERIAL PRIMARY KEY,
    titulo TEXT NOT NULL,
    contenido JSONB NOT NULL DEFAULT '[
        {
            "titulo": "Título del primer elemento",
            "descripcion": "<h2>Título ejemplo</h2><p>Acá copiar y pegar todo el contenido incluyendo</p><a href=\\"https://ejemplo.com/\\">",
            "link": "Por el momento dejar vacío, si hay links incluirlos en la descripción",
            "multimedia": ["https://ejemplo.com/imagen.jpg", "https://ejemplo.com/video.mp4"],
            "fuente": "Mencionar la fuente o dejar vacía"
        }
    ]'::jsonb,
    grado_id INTEGER NOT NULL REFERENCES grados(id) ON DELETE CASCADE,
    area_id INTEGER NOT NULL REFERENCES areas(id) ON DELETE CASCADE,
    tema_id INTEGER NOT NULL REFERENCES temas(id) ON DELETE CASCADE,
    usuario_id INTEGER REFERENCES usuarios(id) ON DELETE CASCADE DEFAULT 1,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);
```

---

## 🗺️ Diagrama Entidad-Relación (ERD textual)

```
usuarios (1) ───< (N) articulos >─── (1) grados
                                  ├─── (1) areas
                                  └─── (1) temas
```

┌─────────────┐              ┌──────────────┐
│  usuarios   │              │   grados     │
├─────────────┤              ├──────────────┤
│ id (PK)     │◄────────┐    │ id (PK)      │◄─────┐
│ nombre      │         │    │ nombre       │      │
│ email       │         │    └──────────────┘      │
│ password    │         │                          │
│ rol         │         │                          │
└─────────────┘         │                          │
                        │                          │
                        │                          │
                        │                          │
                        │                          │
                        │                          │
                        │                          │
┌───────────────────────────────────────────────────────────────────────────┐
│                               articulos                                   │
├───────────────────────────────────────────────────────────────────────────┤
│ id (PK)                                                                  │
│ titulo                                                                   │
│ contenido (JSONB con plantilla por defecto)                              │
│ grado_id (FK → grados.id)                                               │
│ area_id  (FK → areas.id)                                                │
│ tema_id  (FK → temas.id)                                                │
│ usuario_id (FK → usuarios.id) DEFAULT 1                                 │
│ created_at (timestamp)                                                  │
│ updated_at (timestamp)                                                  │
└───────────────────────────────────────────────────────────────────────────┘
                        ▲                          ▲
                        │                          │
                        │                          │
                ┌───────┴───────┐            ┌──────┴───────┐
                │     areas     │            │     temas    │
                ├───────────────┤            ├──────────────┤
                │ id (PK)       │            │ id (PK)      │
                │ nombre        │            │ nombre       │
                └───────────────┘            └──────────────┘



- **usuarios**: Creador del artículo, opcional (por defecto `1`)
- **grados**: Relacionado al nivel educativo
- **areas**: Área de conocimiento
- **temas**: Tema específico
- **articulos**: Contiene el contenido estructurado en JSONB con plantilla de ejemplo precargada.

---

## ✅ Notas
- La base está en codificación **UTF8**
- `contenido` en `articulos` tiene una plantilla JSON por defecto
- Uso de `ON DELETE CASCADE` en claves foráneas para mantener integridad
- Las contraseñas deben guardarse **cifradas con bcrypt**

---

¿Quieres este archivo `.md` listo para descargar o seguir trabajando sobre este esquema?