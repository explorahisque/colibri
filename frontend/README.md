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
  if (!usuario && to.path !== "/iniciar") {
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
