<template>
  <div class="h-screen w-full flex">
    <!-- Barra lateral izquierda -->
    <div class="w-16 flex flex-col justify-center items-center space-y-6">
      <div class="space-y-4 text-center">
        <!-- <button class="p-2">
          <new-icon class="w-6 h-6" />
        </button>
        <button class="p-2">
          <edit-icon class="w-6 h-6" />
        </button>
        <button class="p-2">
          <delete-icon class="w-6 h-6" />
        </button> -->
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
            class="w-full p-3"
          />
        </div>
      <div class="overflow-y-auto">
        <!-- Filtros interactivos -->
        <div class="mt-6 space-y-4">
          <!-- Filtro de Grados -->
          <h2 class="text-xl font-semibold">Grados</h2>
          <div class="cinta-horizontal relative">            
            <!-- 
              :class con objeto: 
              - 'animate-grados' se aplica cuando NO hay un grado activo
              - 'paused' se aplica cuando SÍ hay un grado activo
            -->
            <div class="loop-container"
                :class="[{ 'animate-grados': !activeFilters.grados }, { 'paused': !!activeFilters.grados }]">
              <div class="loop-content flex space-x-2">
                <!-- Botones originales -->
                <button
                  v-for="gradoName in gradoNames"
                  :key="gradoName"
                  @click="toggleFilter('grados', gradoName)"
                  :class="{
                    'btn-filtro-activo': activeFilters.grados === gradoName,
                    'btn-filtro': activeFilters.grados !== gradoName
                  }"
                  class=""
                >
                  {{ gradoName }}
                </button>

                <!-- Duplicado de botones para loop infinito -->
                <button
                  v-for="gradoName in gradoNames"
                  :key="'dup-grados-' + gradoName"
                  @click="toggleFilter('grados', gradoName)"
                  :class="{
                    'btn-filtro-activo': activeFilters.grados === gradoName,
                    'btn-filtro': activeFilters.grados !== gradoName
                  }"
                  class=""
                >
                  {{ gradoName }}
                </button>
              </div>
            </div>
          </div>

          <!-- Filtro de Áreas -->
          <h3 class="text-lg font-semibold">Áreas</h3>
          <div class="cinta-horizontal relative">
            <div class="loop-container"
                :class="[{ 'animate-areas': !activeFilters.areas }, { 'paused': !!activeFilters.areas }]">
              <div class="loop-content flex space-x-2">
                <!-- Botones originales -->
                <button
                  v-for="areaName in filteredAreaNames"
                  :key="areaName"
                  @click="toggleFilter('areas', areaName)"
                  :class="{
                    'btn-filtro-activo': activeFilters.areas !== areaName,
                    'btn-filtro': activeFilters.areas === areaName
                  }"
                  class=""
                >
                  {{ areaName }}
                </button>

                <!-- Duplicado de botones para loop infinito -->
                <button
                  v-for="areaName in filteredAreaNames"
                  :key="'dup-areas-' + areaName"
                  @click="toggleFilter('areas', areaName)"
                  :class="{
                    'btn-filtro-activo': activeFilters.areas === areaName,
                    'btn-filtro': activeFilters.areas !== areaName
                  }"
                  class=""
                >
                  {{ areaName }}
                </button>
              </div>
            </div>
          </div>

          <!-- Filtro de Temas -->
          <h4 class="text-base font-semibold">Temas</h4>
          <div class="cinta-horizontal relative">
            <div class="loop-container"
                :class="[{ 'animate-temas': !activeFilters.temas }, { 'paused': !!activeFilters.temas }]">
              <div class="loop-content flex space-x-2">
                <!-- Botones originales -->
                <button
                  v-for="temaName in filteredTemaNames"
                  :key="temaName"
                  @click="toggleFilter('temas', temaName)"
                  :class="{
                    'btn-filtro-activo': activeFilters.temas === temaName,
                    'btn-filtro': activeFilters.temas !== temaName
                  }"
                  class=""
                >
                  {{ temaName }}
                </button>

                <!-- Duplicado de botones para loop infinito -->
                <button
                  v-for="temaName in filteredTemaNames"
                  :key="'dup-temas-' + temaName"
                  @click="toggleFilter('temas', temaName)"
                  :class="{
                    'btn-filtro-activo': activeFilters.temas === temaName,
                    'btn-filtro': activeFilters.temas !== temaName
                  }"
                  class=""
                >
                  {{ temaName }}
                </button>
              </div>
            </div>
          </div>
        </div>

        <!-- Tarjetas de articulos -->
        <div class="mt-8 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          <router-link
            v-for="articulo in filteredarticulos"
            :key="articulo.id"
            :to="`/articulo/${articulo.id}`"
            class="card block p-4 rounded-lg shadow hover:shadow-lg transition"
            @mouseenter="handleCardHover"
            @click="handleCardClick"
          >
            <h2 class="font-bold text-lg mb-2">{{ articulo.nombre }}</h2>
            <p class="text-sm">
              <strong>Grado:</strong> {{ articulo.gradoNombre }}<br />
              <strong>Área:</strong> {{ articulo.areaNombre }}<br />
              <strong>Tema:</strong> {{ articulo.temaNombre }}
            </p>
          </router-link>
        </div>

      </div>
    </div>
    <!-- Barra lateral derecha -->
    <div class="w-16 flex flex-col justify-center items-center space-y-6">
      <div class="space-y-4 text-center">
        <!-- <button class="p-2">
          <import-icon class="w-6 h-6" />
        </button>
        <button class="p-2">
          <print-icon class="w-6 h-6" />
        </button>
        <button class="p-2">
          <export-icon class="w-6 h-6" />
        </button> -->
      </div>
    </div>
  </div>
  

</template>

<script>
import { ref, computed, onMounted, watch, nextTick } from "vue";
import { playSound, hasInteracted } from "@/services/soundService";

export default {
  components: {
    // ... (Tus componentes) ...
  },
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

    const editorRef = ref(null);
    const actualizarContenido = () => {
      articuloEditando.value.contenido = editorRef.value?.innerHTML || "<p>Escribe aquí...</p>";
    };

    const confirmarEliminacion = (id) => {
      if (confirm("¿Estás seguro de que quieres eliminar este articulo?")) {
        eliminararticulo(id);
      }
    };

    const eliminararticulo = async (id) => {
      try {
        const response = await fetch(`https://colibriback.onrender.com/api/articulos/${id}`, {
          method: "DELETE",
        });
        if (!response.ok) throw new Error("No se pudo eliminar el articulo");
        alert("articulo eliminado con éxito");
        fetchAllData();
      } catch (error) {
        console.error("Error al eliminar el articulo", error);
        alert("No se pudo eliminar el articulo");
      }
    };

    const duplicararticulo = async (id) => {
      try {
        const response = await fetch(`https://colibriback.onrender.com/api/articulos/${id}`);
        if (!response.ok) throw new Error("No se pudo obtener el articulo para duplicar");
        const articuloOriginal = await response.json();
        const nuevoarticuloData = {
          ...articuloOriginal,
          id: null,
          titulo: `${articuloOriginal.titulo} (Copia)`,
        };
        const createResponse = await fetch("https://colibriback.onrender.com/api/articulos", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify(nuevoarticuloData),
        });
        if (!createResponse.ok) throw new Error("No se pudo duplicar el articulo");
        alert("articulo duplicado con éxito");
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

        // Mapear los datos para relacionar IDs con nombres
        const temasMap = resTemas.reduce((map, tema) => {
          map[tema.id] = tema;
          return map;
        }, {});
        const areasMap = resAreas.reduce((map, area) => {
          map[area.id] = area;
          return map;
        }, {});
        const gradosMap = resGrados.reduce((map, grado) => {
          map[grado.id] = grado;
          return map;
        }, {});

        articulos.value = resarticulos.map(st => {
          const tema = temasMap[st.tema_id] || {};
          const area = areasMap[st.area_id] || {};
          const grado = gradosMap[st.grado_id] || {};
          return {
            ...st,
            nombre: st.titulo, // Usar la propiedad correcta para el nombre
            temaNombre: tema.nombre || "Sin Tema",
            areaNombre: area.nombre || "Sin Área",
            gradoNombre: grado.nombre || "Desconocido",
            temaId: tema.id,
            areaId: area.id,
            gradoId: grado.id,
            contenido: st.contenido || "<p>Escribe aquí...</p>"
          };
        });

        gradoNames.value = [...new Set(resGrados.map(g => g.nombre))];
        areaNames.value = [...new Set(resAreas.map(a => a.nombre))];
        temaNames.value = [...new Set(resTemas.map(t => t.nombre))];

        actualizarMapas();
      } catch (error) {
        console.error("Error al cargar datos", error);
      }
    };

    onMounted(fetchAllData);

    const toggleFilter = async (type, name) => {
      const oldValue = activeFilters.value[type];
      activeFilters.value[type] = oldValue === name ? null : name;
      
      if (hasInteracted.value) {
        try {
          await playSound(oldValue === name ? 'filter.off' : 'filter.on', 0.3);
        } catch (error) {
          console.error('Error al reproducir sonido:', error);
        }
      }
      
      if (type === "grados") {
        activeFilters.value.areas = null;
        activeFilters.value.temas = null;
      }
      if (type === "areas") {
        activeFilters.value.temas = null;
      }
    };

    const handleCardHover = async () => {
      if (!hasInteracted.value) return;
      try {
        await playSound('navigation.hover', 0.3);
      } catch (error) {
        console.error('Error al reproducir sonido:', error);
      }
    };

    const handleCardClick = async () => {
      try {
        await playSound('navigation.forward');
      } catch (error) {
        console.error('Error al reproducir sonido:', error);
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
      nextTick(() => {
        if (editorRef.value) {
          editorRef.value.innerHTML = articuloEditando.value.contenido;
        }
      });
      mostrarModal.value = true;
    };

    const generarHTMLDesdeJSON = (contenido) => {
      if (!contenido || typeof contenido !== "object")
        return "<p>Contenido no disponible</p>";
      let html = "";
      Object.entries(contenido).forEach(([categoria, fuentes]) => {
        html += `<h2 class="text-blue-600 font-medium mt-2">${categoria}</h2>`;
        Object.entries(fuentes).forEach(([fuente, items]) => {
          html += `<h3 class="text-gray-700 font-semibold mt-1">${fuente}</h3>`;
          if (Array.isArray(items)) {
            html += `<p>`;
            items.forEach((item) => {
              html += `🔹 <a href="${item.link}" class="text-blue-500 hover:underline" target="_blank">
                        ${item.title}
                      </a><br>${item.snippet || "No hay descripción disponible."}<br><br>`;
            });
            html += `</p>`;
          }
        });
      });
      return html || "<p>Contenido no disponible</p>";
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
    };

    const guardararticulo = async () => {
      if (!articuloEditando.value.nombre.trim()) {
        alert("El nombre del articulo es obligatorio");
        return;
      }
      articuloEditando.value.contenido = editorRef.value?.innerHTML || "<p>Escribe aquí...</p>";
      console.log("Datos que se enviarán al backend:", articuloEditando.value);
      try {
        const metodo = articuloEditando.value.id ? "PUT" : "POST";
        const url = articuloEditando.value.id
          ? `https://colibriback.onrender.com/api/articulos/${articuloEditando.value.id}`
          : "https://colibriback.onrender.com/api/articulos";
        const response = await fetch(url, {
          method: metodo,
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            titulo: articuloEditando.value.nombre,
            contenido: articuloEditando.value.contenido,
            grado_id: articuloEditando.value.gradoId,
            area_id: articuloEditando.value.areaId,
            tema_id: articuloEditando.value.temaId,
          }),
        });
        if (!response.ok) throw new Error("Error al guardar el articulo");
        alert("articulo guardado con éxito");
        mostrarModal.value = false;
        fetchAllData();
      } catch (error) {
        console.error("Error al guardar el articulo", error);
        alert("Hubo un error al guardar el articulo");
      }
    };

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
      actualizarContenido,
      confirmarEliminacion,
      eliminararticulo,
      duplicararticulo,
      gradoMap,
      areaMap,
      temaMap,
      handleCardHover,
      handleCardClick
    };
  }
};
</script>

<style>
/* Pausar la animación */
.paused {
  animation-play-state: paused !important;
}

/* Estilos para los botones de filtro */
.btn-filtro {
  @apply px-4 py-2 rounded-lg transition-colors;
}

.btn-filtro-activo {
  @apply px-4 py-2 rounded-lg bg-black transition-colors;
}
</style>