<template>
  <div class="h-screen w-full flex overflow-y-auto">
    <!-- Barra lateral izquierda -->
    <div class="w-16 flex flex-col justify-center items-center space-y-6">
      <div class="space-y-4 text-center">
        <button class="p-2" @click="nuevoarticulo">
          <new-icon class="w-6 h-6" />
        </button>
        <!-- Se pueden agregar botones para edición de filtros si se requiere -->
      </div>
    </div>
    <!-- Contenido principal -->
    <div class="flex-1 flex flex-col py-4 overflow-hidden pt-24 overflow-y-auto">
      <!-- Buscador -->
      <div class="flex items-center justify-center mb-4">
        <input
          type="text"
          v-model="searchQuery"
          placeholder="Buscar articulo..."
          class="w-1/2 p-3"
        />
      </div>
      <div class="overflow-y-auto">
        <!-- Filtros interactivos -->
        <div class="mt-6 space-y-4">
          <!-- Filtro de Grados -->
          <div class="flex items-center gap-6 justify-center">
              <h2 class="text-xl font-semibold">Grados</h2>
              <button @click="editarGrado" class="p-1">
                <edit-icon class="w-4 h-4" />
              </button>
            </div>
          <div class="cinta-horizontal relative">
            <div class="loop-content flex space-x-2">
              <button
                v-for="gradoName in gradoNames"
                :key="gradoName"
                @click="toggleFilter('grados', gradoName)"
                :class="{
                  'btn-filtro-activo': activeFilters.grados === gradoName,
                  'btn-filtro': activeFilters.grados !== gradoName
                }"
              >
                {{ gradoName }}
              </button>
            </div>
          </div>
          <!-- Filtro de Áreas -->
          <div class="flex items-center gap-6 justify-center">
              <h3 class="text-lg font-semibold">Áreas</h3>
              <button @click="editarArea" class="p-1">
                <edit-icon class="w-4 h-4" />
              </button>
            </div>
          <div class="cinta-horizontal relative">
            <div class="loop-content flex space-x-2">
              <button
                v-for="areaName in filteredAreaNames"
                :key="areaName"
                @click="toggleFilter('areas', areaName)"
                :class="{
                  'btn-filtro-activo': activeFilters.areas !== areaName,
                  'btn-filtro': activeFilters.areas === areaName
                }"
              >
                {{ areaName }}
              </button>
            </div>
          </div>
          <!-- Filtro de Temas -->
          <div class="flex items-center gap-6 justify-center">
              <h4 class="text-base font-semibold">Temas</h4>
              <button @click="editarTema" class="p-1">
                <edit-icon class="w-4 h-4" />
              </button>
            </div>
          <div class="cinta-horizontal relative">
            <div class="loop-content flex space-x-2">
              <button
                v-for="temaName in filteredTemaNames"
                :key="temaName"
                @click="toggleFilter('temas', temaName)"
                :class="{
                  'btn-filtro-activo': activeFilters.temas === temaName,
                  'btn-filtro': activeFilters.temas !== temaName
                }"
              >
                {{ temaName }}
              </button>
            </div>
          </div>
        </div>
        <!-- Tarjetas de articulos -->
        <div class="mt-8 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          <div v-for="articulo in filteredarticulos" :key="articulo.id" class="card p-4">
            <router-link :to="`/articulo/${articulo.id}`" class="h2 font-bold">
              {{ articulo.nombre }}
            </router-link>
            <p class="text-sm">
              <strong>Grado:</strong> {{ articulo.gradoNombre }}<br />
              <strong>Área:</strong> {{ articulo.areaNombre }}<br />
              <strong>Tema:</strong> {{ articulo.temaNombre }}
            </p>
            <!-- Botones de Acciones CRUD -->
            <div class="flex space-x-2 mt-2">
              <button class="" @click="editararticulo(articulo)">
                <edit-icon class="w-4 h-4" />
              </button>
              <button class="" @click="confirmarEliminacion(articulo.id)">
                <delete-icon class="w-4 h-4" />
              </button>
              <button class="" @click="duplicararticulo(articulo.id)">
                <new-icon class="w-4 h-4" />
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Barra lateral derecha -->
    <div class="w-16 flex flex-col justify-center items-center space-y-6">
      <div class="space-y-4 text-center">
        <!-- Se pueden agregar otros botones de acción si se requiere -->
      </div>
    </div>
  </div>

  <!-- Modal para formulario de edición/creación de artículo -->
  <div v-if="mostrarModal" class="modal-overlay fixed inset-0 flex items-center justify-center">
    <div class="modal-contenido h-3/4 p-6 rounded-lg w-3/4 relative">
      <h2 class="text-xl font-bold mb-4">
        {{ articuloEditando.id ? 'Editar Artículo' : 'Nuevo Artículo' }}
      </h2>
      <div class="mb-4">
        <label class="block mb-1">Título</label>
        <input type="text" v-model="articuloEditando.nombre" class="w-full border px-3 py-2 rounded" />
      </div>
      <div class="mb-4">
        <label class="block mb-1">Contenido</label>
        <div id="editor" ref="editorRef" class="w-full border rounded min-h-[150px]"></div>
      </div>
      <div class="mb-4">
        <label class="block mb-1">Grado</label>
        <select v-model="articuloEditando.gradoId" class="w-full border px-3 py-2 rounded">
          <option v-for="grado in gradoNames" :key="grado" :value="gradoMap[grado]">
            {{ grado }}
          </option>
        </select>
      </div>
      <div class="mb-4">
        <label class="block mb-1">Área</label>
        <select v-model="articuloEditando.areaId" class="w-full border px-3 py-2 rounded">
          <option v-for="area in areaNames" :key="area" :value="areaMap[area]">
            {{ area }}
          </option>
        </select>
      </div>
      <div class="mb-4">
        <label class="block mb-1">Tema</label>
        <select v-model="articuloEditando.temaId" class="w-full border px-3 py-2 rounded">
          <option v-for="tema in temaNames" :key="tema" :value="temaMap[tema]">
            {{ tema }}
          </option>
        </select>
      </div>
      <div class="flex justify-end space-x-2">
        <button class="bg-gray-300 text-black px-4 py-2 rounded" @click="mostrarModal = false">Cancelar</button>
        <button class="bg-blue-500 text-white px-4 py-2 rounded" @click="guardararticulo">Guardar</button>
      </div>
    </div>
  </div>
</template>

<script>
import { ref, computed, onMounted, onBeforeUnmount, watch, nextTick } from "vue";
import '@toast-ui/editor/dist/toastui-editor.css';
import Editor from '@toast-ui/editor';

export default {
  setup() {
    const searchQuery = ref("");
    const articulos = ref([]);
    const gradoNames = ref([]);
    const areaNames = ref([]);
    const temaNames = ref([]);
    const activeFilters = ref({ grados: null, areas: null, temas: null });

    const mostrarModal = ref(false);
    const articuloEditando = ref({
      id: null,
      nombre: "",
      contenido: "<p>Escribe aquí...</p>",
      gradoId: null,
      areaId: null,
      temaId: null
    });
    const editor = ref(null);
    const editorRef = ref(null);

    const initEditor = (content = "<p>Escribe aquí...</p>") => {
      if (editorRef.value) {
        try {
          if (editor.value) {
            editor.value.destroy();
          }

          editor.value = new Editor({
            el: editorRef.value,
            height: '300px',
            initialEditType: 'markdown', // Usar solo Markdown
            previewStyle: 'vertical',
            initialValue: content,
            events: {
              change: () => {
                try {
                  actualizarContenido();
                } catch (error) {
                  console.error('Error al actualizar contenido:', error);
                }
              },
            }
          });
        } catch (error) {
          console.error('Error al inicializar el editor:', error);
        }
      }
    };

    const actualizarContenido = () => {
      if (!editor.value) return;

      try {
        // Obtener siempre el contenido como Markdown
        let content = editor.value.getMarkdown();
        if (content && typeof content === 'string') {
          articuloEditando.value.contenido = content;
        }
      } catch (error) {
        console.error('Error al obtener el contenido del editor:', error);
      }
    };

    onMounted(() => {
      fetchAllData();
    });

    onBeforeUnmount(() => {
      if (editor.value) {
        editor.value.destroy();
        editor.value = null;
      }
    });

    const confirmarEliminacion = (id) => {
      if (confirm("¿Estás seguro de que quieres eliminar este articulo?")) {
        eliminararticulo(id);
      }
    };

    const eliminararticulo = async (id) => {
      try {
        const token = localStorage.getItem("token");
        const response = await fetch(`https://colibriback.onrender.com/api/articulos/${id}`, {
          method: "DELETE",
          headers: {
            "Authorization": token ? `Bearer ${token}` : ""
          }
        });
        if (!response.ok) throw new Error("No se pudo eliminar el articulo");
        alert("Artículo eliminado con éxito");
        fetchAllData();
      } catch (error) {
        console.error("Error al eliminar el articulo", error);
        alert("No se pudo eliminar el articulo");
      }
    };

    const duplicararticulo = async (id) => {
      try {
        const token = localStorage.getItem("token");
        const response = await fetch(`https://colibriback.onrender.com/api/articulos/${id}`, {
          headers: { "Authorization": token ? `Bearer ${token}` : "" }
        });
        if (!response.ok) throw new Error("No se pudo obtener el articulo para duplicar");
        const articuloOriginal = await response.json();
        const nuevoarticuloData = {
          ...articuloOriginal,
          id: null,
          titulo: `${articuloOriginal.titulo} (Copia)`,
        };
        const createResponse = await fetch("https://colibriback.onrender.com/api/articulos", {
          method: "POST",
          headers: { 
            "Content-Type": "application/json",
            "Authorization": token ? `Bearer ${token}` : ""
          },
          body: JSON.stringify(nuevoarticuloData),
        });
        if (!createResponse.ok) throw new Error("No se pudo duplicar el articulo");
        alert("Artículo duplicado con éxito");
        fetchAllData();
      } catch (error) {
        console.error("Error al duplicar el articulo", error);
        alert("No se pudo duplicar el articulo");
      }
    };

    const fetchAllData = async () => {
      try {
        const resarticulos = await fetch("https://colibriback.onrender.com/api/articulos").then(r => r.json());
        const resTemas = await fetch("https://colibriback.onrender.com/api/temas").then(r => r.json());
        const resAreas = await fetch("https://colibriback.onrender.com/api/areas").then(r => r.json());
        const resGrados = await fetch("https://colibriback.onrender.com/api/grados").then(r => r.json());
        // Mapear nombres desde cada respuesta
        gradoNames.value = [...new Set(resGrados.map(g => g.nombre))];
        areaNames.value = [...new Set(resAreas.map(a => a.nombre))];
        temaNames.value = [...new Set(resTemas.map(t => t.nombre))];
        // Actualizar los mapas usando las tablas originales, no artículos
        gradoMap.value = {};
        resGrados.forEach(g => { gradoMap.value[g.nombre] = g.id; });
        areaMap.value = {};
        resAreas.forEach(a => { areaMap.value[a.nombre] = a.id; });
        temaMap.value = {};
        resTemas.forEach(t => { temaMap.value[t.nombre] = t.id; });
        // Mapear artículos usando datos ya obtenidos
        articulos.value = resarticulos.map(st => {
          const tema = resTemas.find(t => t.id === st.tema_id) || {};
          const area = resAreas.find(a => a.id === st.area_id) || {};
          const grado = resGrados.find(g => g.id === st.grado_id) || {};
          return {
            ...st,
            nombre: st.titulo,
            temaNombre: tema.nombre || "Sin Tema",
            areaNombre: area.nombre || "Sin Área",
            gradoNombre: grado.nombre || "Desconocido",
            temaId: tema.id,
            areaId: area.id,
            gradoId: grado.id,
            contenido: st.contenido || "<p>Escribe aquí...</p>"
          };
        });
      } catch (error) {
        console.error("Error al cargar datos", error);
      }
    };

    const toggleFilter = (type, name) => {
      activeFilters.value[type] = activeFilters.value[type] === name ? null : name;
      if (type === "grados") {
        activeFilters.value.areas = null;
        activeFilters.value.temas = null;
      }
      if (type === "areas") {
        activeFilters.value.temas = null;
      }
    };

    const filteredarticulos = computed(() => {
      let result = articulos.value;
      if (activeFilters.value.grados) {
        result = result.filter(st => st.gradoNombre === activeFilters.value.grados);
      }
      if (activeFilters.value.areas) {
        result = result.filter(st => st.areaNombre === activeFilters.value.areas);
      }
      if (activeFilters.value.temas) {
        result = result.filter(st => st.temaNombre === activeFilters.value.temas);
      }
      if (searchQuery.value) {
        const q = searchQuery.value.toLowerCase();
        result = result.filter(st => st.nombre.toLowerCase().includes(q));
      }
      return result;
    });

    const filteredAreaNames = computed(() => {
      if (!activeFilters.value.grados) return areaNames.value;
      const articulosGrado = articulos.value.filter(st => st.gradoNombre === activeFilters.value.grados);
      return [...new Set(articulosGrado.map(st => st.areaNombre))];
    });

    const filteredTemaNames = computed(() => {
      if (!activeFilters.value.areas) return temaNames.value;
      const articulosArea = articulos.value.filter(st => st.areaNombre === activeFilters.value.areas);
      return [...new Set(articulosArea.map(st => st.temaNombre))];
    });

    const gradoMap = ref({});
    const areaMap = ref({});
    const temaMap = ref({});
    const actualizarMapas = () => {
      gradoMap.value = {};
      areaMap.value = {};
      temaMap.value = {};
      articulos.value.forEach(st => {
        gradoMap.value[st.gradoNombre] = st.gradoId;
        areaMap.value[st.areaNombre] = st.areaId;
        temaMap.value[st.temaNombre] = st.temaId;
      });
    };

    const editararticulo = (articulo) => {
      articuloEditando.value = {
        id: articulo.id,
        nombre: articulo.nombre,
        contenido: articulo.contenido || "<p>Escribe aquí...</p>",
        gradoId: articulo.gradoId,
        areaId: articulo.areaId,
        temaId: articulo.temaId,
      };
      mostrarModal.value = true;
      nextTick(() => {
        initEditor(articuloEditando.value.contenido);
      });
    };

    const nuevoarticulo = () => {
      articuloEditando.value = {
        id: null,
        nombre: "",
        contenido: "<p>Escribe aquí...</p>",
        gradoId: null,
        areaId: null,
        temaId: null
      };
      mostrarModal.value = true;
      nextTick(() => {
        initEditor(articuloEditando.value.contenido);
      });
    };

    const guardararticulo = async () => {
      if (!articuloEditando.value.nombre.trim()) {
        alert("El nombre del articulo es obligatorio");
        return;
      }

      try {
        // Actualizar el contenido una última vez antes de guardar
        setTimeout(async () => {
          actualizarContenido();
          
          const metodo = articuloEditando.value.id ? "PUT" : "POST";
          const url = articuloEditando.value.id
            ? `https://colibriback.onrender.com/api/articulos/${articuloEditando.value.id}`
            : "https://colibriback.onrender.com/api/articulos";
          
          const token = localStorage.getItem("token");
          const response = await fetch(url, {
            method: metodo,
            headers: { 
              "Content-Type": "application/json",
              "Authorization": token ? `Bearer ${token}` : ""
            },
            body: JSON.stringify({
              titulo: articuloEditando.value.nombre,
              contenido: articuloEditando.value.contenido,
              grado_id: articuloEditando.value.gradoId,
              area_id: articuloEditando.value.areaId,
              tema_id: articuloEditando.value.temaId,
            }),
          });
          
          if (!response.ok) throw new Error("Error al guardar el articulo");
          alert("Artículo guardado con éxito");
          mostrarModal.value = false;
          fetchAllData();
        }, 200);
      } catch (error) {
        console.error("Error al guardar el articulo", error);
        alert("Hubo un error al guardar el articulo");
      }
    };

    // Funciones dummy para editar entidades de filtros
    const editarGrado = () => {
      alert("Funcionalidad para editar grados no implementada todavía");
    };
    const editarArea = () => {
      alert("Funcionalidad para editar áreas no implementada todavía");
    };
    const editarTema = () => {
      alert("Funcionalidad para editar temas no implementada todavía");
    };

    watch(mostrarModal, (newVal) => {
      if (!newVal && editor.value) {
        editor.value.destroy();
        editor.value = null;
      }
    });

    watch(() => articuloEditando.value.contenido, () => {
      // Force update if needed
    }, { deep: true });

    return {
      searchQuery,
      articulos,
      gradoNames,
      areaNames,
      temaNames,
      activeFilters,
      filteredarticulos,
      filteredAreaNames,
      filteredTemaNames,
      toggleFilter,
      editararticulo,
      nuevoarticulo,
      guardararticulo,
      mostrarModal,
      articuloEditando,
      editorRef,
      editor,
      actualizarContenido,
      confirmarEliminacion,
      eliminararticulo,
      duplicararticulo,
      gradoMap,
      areaMap,
      temaMap,
      editarGrado,
      editarArea,
      editarTema
    };
  }
};
</script>

<style>
/* Estilos para los botones de filtro */
.btn-filtro {
  @apply px-4 py-2 transition-colors;
  border-radius: 100px;
  border-bottom-right-radius: 0; 
}

.btn-filtro-activo {
  @apply px-4 py-2 transition-colors;
}

/* Estilos adicionales para el editor */
.toastui-editor-defaultUI {
  border-radius: 0.375rem;
}

/* Asegurarse de que el contenedor del editor tenga altura mínima */
#editor {
  min-height: 300px;
}
</style>

