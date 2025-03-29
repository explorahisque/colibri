# Documentación del Frontend

## Introducción
Este proyecto constituye la interfaz de usuario de la aplicación Co-Libri Learning y se implementa utilizando Vite, Vue 3 y Tailwind CSS, ofreciendo una experiencia moderna, responsiva y minimalista.

## Arquitectura e Implementación
- **Vite + Vue 3:** Se utiliza una Single Page Application (SPA) iniciada en `index.html` con el script principal en `src/main.js`.
- **Tailwind CSS y PostCSS:** Se configuran en `tailwind.config.js` y `postcss.config.js` para lograr un diseño ágil y optimizado.
- **Gestión de Dependencias:** El manejo de módulos se realiza mediante npm, como se ve en `package.json`.

## Funcionamiento Detallado

### Conexión a las APIs
El frontend se comunica con el backend a través de peticiones HTTP utilizando la librería `axios`. Las URLs base de las APIs están definidas en los servicios (`src/services`), y se realizan peticiones a endpoints específicos para obtener y manipular los datos.

```javascript
// Ejemplo de petición GET con axios
import axios from 'axios';

const API_URL = 'http://localhost:3000/api/';

export const obtenerSubtemas = async () => {
  try {
    const response = await axios.get(API_URL + 'subtemas');
    return response.data;
  } catch (error) {
    console.error("Error al obtener los subtemas:", error);
    return null;
  }
};
```

### Obtención y Visualización del Contenido
1. **Petición a la API:** Se realiza una petición GET al endpoint correspondiente para obtener los datos (ej: subtemas, temas, áreas, grados).
2. **Respuesta de la API:** La API responde con un array de objetos en formato JSON.
3. **Almacenamiento de Datos:** Los datos se almacenan en variables reactivas (`ref`) de Vue 3.
4. **Visualización:** Se utilizan las directivas de Vue (`v-for`, `v-if`) para renderizar los datos en el template HTML.

```vue
<template>
  <div v-for="subtema in subtemas" :key="subtema.id">
    <h2>{{ subtema.nombre }}</h2>
    <p>{{ subtema.descripcion }}</p>
  </div>
</template>

<script>
import { ref, onMounted } from 'vue';
import { obtenerSubtemas } from '@/services/subtemaService';

export default {
  setup() {
    const subtemas = ref([]);

    onMounted(async () => {
      subtemas.value = await obtenerSubtemas();
    });

    return { subtemas };
  }
}
</script>
```

### Filtrado del Contenido
El frontend implementa un sistema de filtros interactivos que permite a los usuarios refinar la búsqueda de contenidos. Los filtros se aplican en cascada, es decir, al seleccionar un grado, se filtran las áreas correspondientes, y al seleccionar un área, se filtran los temas correspondientes.

1. **Filtros Activos:** Se mantienen los filtros seleccionados por el usuario en variables reactivas (`ref`).
2. **Filtrado Dinámico:** Se utilizan propiedades computadas (`computed`) para filtrar los datos en función de los filtros activos.
3. **Actualización de la UI:** La UI se actualiza automáticamente al cambiar los filtros, gracias a la reactividad de Vue 3.

```vue
<template>
  <div>
    <select v-model="gradoSeleccionado">
      <option value="">Todos los grados</option>
      <option v-for="grado in grados" :key="grado.id" :value="grado.id">{{ grado.nombre }}</option>
    </select>
    <ul>
      <li v-for="subtema in subtemasFiltrados" :key="subtema.id">
        {{ subtema.nombre }}
      </li>
    </ul>
  </div>
</template>

<script>
import { ref, computed } from 'vue';

export default {
  props: {
    subtemas: {
      type: Array,
      required: true
    },
    grados: {
      type: Array,
      required: true
    }
  },
  setup(props) {
    const gradoSeleccionado = ref('');

    const subtemasFiltrados = computed(() => {
      if (!gradoSeleccionado.value) {
        return props.subtemas;
      }
      return props.subtemas.filter(subtema => subtema.grado_id === gradoSeleccionado.value);
    });

    return { gradoSeleccionado, subtemasFiltrados };
  }
}
</script>
```

### Aspectos Desconocidos
- **Manejo de errores:** Aún no se ha implementado un sistema robusto de manejo de errores para las peticiones a la API.
- **Autenticación y Autorización:** La implementación de la autenticación y autorización de usuarios está pendiente.
- **Edición y Actualización de Contenidos:** La interfaz para la edición y actualización de contenidos aún se encuentra en desarrollo presentando varios problemas.

## Funcionalidades Implementadas
- Navegación interactiva y diseño responsivo adaptable a distintos dispositivos.
- Integración de estilos modernos con Tailwind CSS.
- Soporte para componentes Vue dinámicos.

## Elementos Pendientes por Corregir
- **Edición y actualización de contenidos:**  
  Se debe implementar la interfaz que permita modificar y actualizar el contenido directamente desde el frontend.
- **Permisos de Usuarios para Gestión de Contenido:**  
  Es necesario definir roles y permisos que controlen quién puede gestionar (crear, editar, borrar) el contenido.

## Funcionalidades Pendientes de Implementar
- Integración completa con la API del backend para sincronización y persistencia de datos.
- Módulos de autenticación y autorización para la gestión segura de contenidos.
- Interfaces para edición en tiempo real con validación y vistas previas.
- Mejoras en usabilidad y accesibilidad, incluyendo ajustes de tamaño de fuente y opciones de lectura en voz alta.

## Ejecución y Contribución
- Se recomienda seguir las buenas prácticas de desarrollo y usar el control de versiones para colaborar.
- Para contribuir o reportar errores, sigue las directrices incluidas en la documentación interna del repositorio.

## Conclusión
El frontend de Co-Libri Learning está diseñado para ser moderno y accesible. Sin embargo, aún quedan pendientes mejoras en la edición y gestión de contenidos, así como la implementación de permisos de usuario, que serán abordados en futuras versiones.
