# Documentación del Frontend

## Introducción
Este proyecto constituye la interfaz de usuario de la aplicación Co-Libri Learning, implementado con Vite, Vue 3 y Tailwind CSS, ofreciendo una experiencia moderna, responsiva y minimalista.

## Arquitectura e Implementación

### Estructura Base
- **Vite + Vue 3:** SPA iniciada en `index.html` con el script principal en `src/main.js`
- **Tailwind CSS:** Configurado en `tailwind.config.js` con optimización para contenido dinámico
- **Vue Router:** Sistema de enrutamiento con protección de rutas y navegación dinámica
- **Gestión de Estado:** Implementación de composables y refs para manejo de estado local

### Sistema de Temas
El frontend implementa un sofisticado sistema de temas con variables CSS personalizadas:
- 7 temas predefinidos: Conocimiento, Arcilla, Bosque, Índigo, Raíces, Carbon, Light/Dark mode
- Cada tema define 15+ variables para colores y efectos visuales
- Transiciones suaves entre temas mediante `transition: all 0.3s ease-in-out`

### Sistema de Sonido
El frontend implementa un sistema de sonido basado en Material Design:

1. **Jerarquía de Sonidos:**
   - Brand sounds (nivel 1): Mnemonics
   - Hero sounds (nivel 2): Momentos de celebración
   - Alertas y notificaciones (nivel 3)
   - Sonidos UX primarios (nivel 4)
   - Sonidos UX secundarios (nivel 5)

2. **Tipos de Sonido:**
   - Feedback interactivo
   - Sonidos decorativos
   - Sonidos ambientales
   - Notificaciones y alertas
   - Sonidos de sistema

3. **Formatos y Optimización:**
   - Formatos: MP3/OGG para optimización
   - Equilibrio entre calidad y tamaño
   - Control de volumen logarítmico
   - Ecualización adaptativa

## Componentes y Vistas Principales

### Estructura de Navegación
```vue
<App>
  <Header /> <!-- Barra de navegación principal -->
  <router-view /> <!-- Contenido dinámico -->
</App>
```

### Rutas Implementadas
- `/`: Dashboard principal
- `/iniciar`: Página de inicio de sesión
- `/contenidos`: Visualización de contenidos
- `/articulo/:id`: Detalles de artículos
- `/perfil`: Gestión de perfil
- `/grados`: Listado de grados
- `/areas`: Listado de áreas
- `/temas`: Listado de temas
- `/administrar`: Panel de administración (protegido)

### Protección de Rutas
```javascript
router.beforeEach((to, from, next) => {
  const usuario = obtenerUsuario();
  if (!usuario y to.path !== "/iniciar") {
    next("/iniciar");
  } else {
    next();
  }
});
```

## Características Implementadas

### Sistema de Diseño
1. **Tipografía Personalizada:**
   - Fuente principal: Oxanium
   - Implementación mediante @font-face
   - Jerarquía tipográfica definida para títulos y texto

2. **Componentes UI:**
   - Botones futuristas con efectos hover y active
   - Tarjetas translúcidas con efectos de elevación
   - Inputs estilizados con enfoque en la accesibilidad
   - Modales y lightbox para contenido enriquecido

3. **Efectos Visuales:**
   - Transiciones suaves entre estados
   - Efectos de blur para capas superpuestas
   - Animaciones en scroll y hover
   - Gradientes dinámicos para fondos

### Características de Interacción
1. **Filtrado Dinámico:**
   - Implementación de filtros en cascada
   - Animaciones en cinta horizontal
   - Filtros persistentes entre navegaciones

2. **Visualización y Edición de Contenido:**
   - Editor WYSIWYG con ToastUI integrado
   - Soporte para Markdown en artículos
   - Lightbox para imágenes
   - Sistema de navegación jerárquico

## Problemas Identificados

### Críticos
1. **Manejo de Estado:**
   - No hay implementación de Vuex/Pinia
   - Estado distribuido entre componentes
   - Falta de persistencia en filtros

2. **Seguridad:**
   - Autenticación básica sin refresh tokens
   - Falta validación de permisos granular
   - No hay sanitización de contenido

### Mejoras Necesarias
1. **Rendimiento:**
   - Implementar lazy loading de imágenes
   - Optimizar animaciones CSS
   - Cachear respuestas de API

2. **Accesibilidad:**
   - Mejorar contraste en temas
   - Añadir atributos ARIA
   - Implementar navegación por teclado

## Próximas Implementaciones

### Corto Plazo
1. **Gestión de Estado:**
   - Implementar Pinia para estado global
   - Persistencia de preferencias de usuario
   - Cache de datos frecuentes

2. **Seguridad:**
   - Sistema de refresh tokens
   - Validación de formularios
   - Protección XSS

### Medio Plazo
1. **Rendimiento:**
   - Implementación de Service Workers
   - Precarga de rutas populares
   - Optimización de assets

2. **Funcionalidades:**
   - Sistema de búsqueda avanzado
   - Modo offline básico
   - Mejoras en el editor WYSIWYG actual

## Guía de Desarrollo
1. **Instalación:**
   ```bash
   npm install
   ```

2. **Desarrollo:**
   ```bash
   npm run dev
   ```

3. **Construcción:**
   ```bash
   npm run build
   ```

## Convenciones y Estándares
- Componentes en PascalCase
- Props en camelCase
- Eventos en kebab-case
- CSS modular por componente
- Commits semánticos

## Contribución
Ver `CONTRIBUTING.md` para guías detalladas sobre:
- Flujo de trabajo Git
- Estándares de código
- Proceso de revisión
- Reporte de bugs

## Sistema de Sonido

### Arquitectura de Sonido
El sistema de sonido está diseñado siguiendo los principios de Material Design Sound, implementado en tres capas:

1. **Service Layer (`soundService.js`)**
   - Gestión de audio con cacheo y optimización
   - Control de volumen por tipo de sonido
   - Soporte para múltiples formatos (OGG/WAV)

2. **Plugin Layer (`plugins/sound.js`)**
   - Integración con Vue Router
   - Mixins para componentes
   - Gestión de navegación sonora

3. **Component Layer**
   - Integración mediante mixins
   - Eventos de interacción sonora
   - Feedback táctil y auditivo

### Tipos de Sonido Disponibles

```javascript
// Navegación
'navigation.hover'      // Hover sobre elementos navegables
'navigation.forward'    // Navegación hacia adelante
'navigation.back'       // Navegación hacia atrás
'navigation.error'     // Error en navegación
'navigation.complete'   // Completado de navegación

// Interacción UI
'ui.tap'               // Tap general
'ui.toggle'            // Toggle de estados
'ui.click'            // Click en elementos
'ui.lock'             // Bloqueo de elementos
'ui.unlock'           // Desbloqueo de elementos

// Alertas
'alert.error'          // Error crítico
'alert.warning'        // Advertencia
'alert.success'        // Éxito

// Estados
'state.confirm.up'     // Confirmación positiva
'state.confirm.down'   // Confirmación negativa

// Transiciones
'transition.left'      // Transición hacia la izquierda
'transition.right'     // Transición hacia la derecha

// Celebraciones
'celebration.simple'    // Celebración simple
'celebration.decorative' // Celebración decorativa
```

### Uso en Componentes

1. **Usando el Mixin de Sonido**
```javascript
import { soundMixin } from '@/plugins/sound';

export default {
  mixins: [soundMixin],
  methods: {
    handleClick() {
      this.playUISound('ui.tap');
    },
    handleSuccess() {
      this.playAlertSound('success');
    },
    handleAchievement() {
      this.playCelebrationSound('decorative');
    }
  }
}
```

2. **Usando el Servicio Directamente**
```javascript
import { playSound } from '@/services/soundService';

// En cualquier método:
await playSound('navigation.forward', 0.4);
```

### Volúmenes Optimizados
Los niveles de volumen están preconfigurados por tipo de sonido:
```javascript
navigation.hover: 0.2    // Sutil
ui.tap: 0.3             // Moderado
alert.error: 0.6        // Notable
celebration.simple: 0.5  // Medio
```

### Consideraciones de Uso

1. **Activación**
   - Los sonidos se activan con la primera interacción del usuario
   - Se puede desactivar/activar mediante `soundEnabled.value`

2. **Rendimiento**
   - Los sonidos se cachean automáticamente
   - Soporte progresivo (OGG → WAV)
   - Gestión automática de memoria

3. **Accesibilidad**
   - Volúmenes optimizados por contexto
   - Feedback consistente
   - Desactivación global disponible

## Funcionalidades Adicionales

### Editor WYSIWYG (ToastUI)
El frontend integra un editor WYSIWYG basado en ToastUI para la creación y edición de contenido en formato Markdown.

#### Uso:
```javascript
import Editor from '@toast-ui/editor';

const initEditor = (content = "<p>Escribe aquí...</p>") => {
  editor.value = new Editor({
    el: editorRef.value,
    height: '300px',
    initialEditType: 'markdown',
    previewStyle: 'vertical',
    initialValue: content,
  });
};
```

### Importación y Exportación de Contenido
El sistema permite importar archivos Markdown para crear artículos y exportar contenido en formato Markdown o ZIP.

#### Exportar Contenido:
```javascript
const exportarMarkdown = () => {
  const blob = new Blob([mdContent], { type: "text/markdown;charset=utf-8" });
  const url = URL.createObjectURL(blob);
  const a = document.createElement("a");
  a.href = url;
  a.download = filename;
  a.click();
};
```

#### Importar Contenido:
```javascript
const procesarArchivo = async (event) => {
  const file = event.target.files[0];
  const content = await file.text();
  const parsedData = parseMarkdownFile(content);
};
```

### Lightbox para Imágenes
El sistema incluye un lightbox para visualizar imágenes en un formato ampliado.

#### Uso:
```javascript
const abrirLightbox = (src) => {
  lightboxImageSrc.value = src;
  lightboxVisible.value = true;
};
```

### Sistema de Filtros
El frontend implementa un sistema de filtros dinámicos en cascada para grados, áreas y temas.

#### Ejemplo:
```javascript
const toggleFilter = (type, name) => {
  activeFilters.value[type] = activeFilters.value[type] === name ? null : name;
};
```

### Protección de Rutas con Roles
Además de la protección básica, se valida el rol del usuario para restringir el acceso a ciertas vistas.

#### Ejemplo:
```javascript
router.beforeEach((to, from, next) => {
  const usuario = obtenerUsuario();
  if (!usuario || usuario.rol !== "administrador") {
    next("/");
  } else {
    next();
  }
});
```
