<template>
  <div class="h-screen w-full flex">
    <!-- Barra lateral izquierda -->
    <div class="w-16 flex flex-col justify-center items-center space-y-6">
      <div class="space-y-4 text-center">
        
      </div>
    </div>
    <!-- Contenido principal -->
    <div class="flex-1 flex flex-col py-4 overflow-hidden pt-24  overflow-y-auto">
      <!-- Buscador -->
      <div class="flex items-center justify-center mb-4">
          <input
            type="text"
            v-model="searchQuery"
            placeholder="Buscar subtema..."
            class="w-1/2 p-3"
          />
        </div>
      <div class="overflow-y-auto">
        <!-- Filtros interactivos -->
        <div class="mt-6 space-y-4">
          <!-- Filtro de Grados -->
          <div class="cinta-horizontal relative">
            <h2 class="text-xl font-semibold">Grados</h2>
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
                    'btn-filtro-activo': activeFilters.grados !== gradoName,
                    'btn-filtro': activeFilters.grados === gradoName                    
                  }"
                  class=""
                >
                  {{ gradoName }}
                </button>
              </div>
            </div>
          </div>

          <!-- Filtro de Áreas -->
          <div class="cinta-horizontal relative">
            <h3 class="text-lg font-semibold">Áreas</h3>
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
                    'btn-filtro-activo': activeFilters.areas !== areaName,
                    'btn-filtro': activeFilters.areas === areaName
                  }"
                  class=""
                >
                  {{ areaName }}
                </button>
              </div>
            </div>
          </div>

          <!-- Filtro de Temas -->
          <div class="cinta-horizontal relative">
            <h4 class="text-base font-semibold">Temas</h4>
            <div class="loop-container"
                :class="[{ 'animate-temas': !activeFilters.temas }, { 'paused': !!activeFilters.temas }]">
              <div class="loop-content flex space-x-2">
                <!-- Botones originales -->
                <button
                  v-for="temaName in filteredTemaNames"
                  :key="temaName"
                  @click="toggleFilter('temas', temaName)"
                  :class="{
                    'btn-filtro-activo': activeFilters.temas !== temaName,
                    'btn-filtro': activeFilters.temas === temaName
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
                    'btn-filtro-activo': activeFilters.temas !== temaName,
                    'btn-filtro': activeFilters.temas === temaName
                  }"
                  class=""
                >
                  {{ temaName }}
                </button>
              </div>
            </div>
          </div>
        </div>

        <!-- Tarjetas de Subtemas -->
        <div class="mt-8 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          <div v-for="subtema in filteredSubtemas" :key="subtema.id" class="card">
            <router-link :to="`/subtema/${subtema.id}`" class="h2">
              {{ subtema.nombre }}
            </router-link>
            <p class="text-sm">
              <strong>Grado:</strong> {{ subtema.gradoNombre }}<br />
              <strong>Área:</strong> {{ subtema.areaNombre }}<br />
              <strong>Tema:</strong> {{ subtema.temaNombre }}
            </p>

            <!-- 🔹 Botones de acciones -->
            
          </div>
        </div>

      </div>
    </div>
    <!-- Barra lateral derecha -->
    <div class="w-16 flex flex-col justify-center items-center space-y-6">
      <div class="space-y-4 text-center">
        <button class="p-2">
          <import-icon class="w-6 h-6" />
        </button>
        <button class="p-2">
          <print-icon class="w-6 h-6" />
        </button>
        <button class="p-2">
          <export-icon class="w-6 h-6" />
        </button>
      </div>
    </div>
  </div>
   <!-- Modal de Edición -->
   

  

</template>

<script>
import { ref, computed, onMounted, reactive, watch } from "vue";
import { nextTick } from "vue";

export default {
  components: {
    // ... (Tus componentes) ...
  },
  setup() {
    // ... (Tus variables ref se mantienen igual) ...
    const searchQuery = ref("");
    const subtemas = ref([]);
    const gradoNames = ref([]);
    const areaNames = ref([]);
    const temaNames = ref([]);
    const activeFilters = ref({ grados: null, areas: null, temas: null });

    

    // Editor reference
    const editorRef = ref(null);

    // 🔹 Actualizar el contenido del subtema al escribir en el editor
    const actualizarContenido = () => {
      
    };

    // 🔹 Confirmar la eliminación de un subtema
    const confirmarEliminacion = (id) => {
      
    };

    // 🔹 Eliminar un subtema
    const eliminarSubtema = async (id) => {
      
    };

    // 🔹 Duplicar un subtema
    const duplicarSubtema = async (id) => {
      
    };

    // 🔹 Obtener todos los datos
    const fetchAllData = async () => {
      try {
        const resSubtemas = await fetch("https://colibriback.onrender.com/api/subtemas").then(r => r.json());
        const resTemas = await fetch("https://colibriback.onrender.com/api/temas").then(r => r.json());
        const resAreas = await fetch("https://colibriback.onrender.com/api/areas").then(r => r.json());
        const resGrados = await fetch("https://colibriback.onrender.com/api/grados").then(r => r.json());

        // Unificar datos de subtemas con sus relaciones
        subtemas.value = resSubtemas.map(st => {
          const tema = resTemas.find(t => t.id === st.tema_id) || {};
          const area = resAreas.find(a => a.id === tema.area_id) || {};
          const grado = resGrados.find(g => g.id === area.grado_id) || {};

          return {
            ...st,
            temaNombre: tema.nombre || "Sin Tema",
            areaNombre: area.nombre || "Sin Área",
            gradoNombre: grado.nombre || "Desconocido",
            temaId: tema.id,
            areaId: area.id,
            gradoId: grado.id,
            contenido: st.contenido || "<p>Escribe aquí...</p>" // 🔹 Se asegura que el contenido sea HTML válido
          };
        });

        // Extraer nombres únicos para los filtros
        gradoNames.value = [...new Set(subtemas.value.map(st => st.gradoNombre))];
        areaNames.value = [...new Set(subtemas.value.map(st => st.areaNombre))];
        temaNames.value = [...new Set(subtemas.value.map(st => st.temaNombre))];

        // Actualizar los mapas
        actualizarMapas();
      } catch (error) {
        console.error("Error al cargar datos", error);
      }
    };

    onMounted(fetchAllData);

    // 🔹 Toggle de filtros
    const toggleFilter = (type, name) => {
      activeFilters.value[type] = activeFilters.value[type] === name ? null : name;
      if (type === "grados") activeFilters.value.areas = activeFilters.value.temas = null;
      if (type === "areas") activeFilters.value.temas = null;
    };

    // 🔹 Filtrado de subtemas según filtros activos y buscador
    const filteredSubtemas = computed(() => {
      let result = subtemas.value;
      if (activeFilters.value.grados) result = result.filter(st => st.gradoNombre === activeFilters.value.grados);
      if (activeFilters.value.areas) result = result.filter(st => st.areaNombre === activeFilters.value.areas);
      if (activeFilters.value.temas) result = result.filter(st => st.temaNombre === activeFilters.value.temas);
      if (searchQuery.value) {
        const q = searchQuery.value.toLowerCase();
        result = result.filter(st => st.nombre.toLowerCase().includes(q));
      }
      return result;
    });

    // 🔹 Filtrado dinámico de áreas según grado
    const filteredAreaNames = computed(() => {
      if (!activeFilters.value.grados) return areaNames.value;
      const subtemasGrado = subtemas.value.filter(st => st.gradoNombre === activeFilters.value.grados);
      return [...new Set(subtemasGrado.map(st => st.areaNombre))];
    });

    // 🔹 Filtrado dinámico de temas según área
    const filteredTemaNames = computed(() => {
      if (!activeFilters.value.areas) return temaNames.value;
      const subtemasArea = subtemas.value.filter(st => st.areaNombre === activeFilters.value.areas);
      return [...new Set(subtemasArea.map(st => st.temaNombre))];
    });

    const gradoMap = ref({});
    const areaMap = ref({});
    const temaMap = ref({});

    const actualizarMapas = () => {
      gradoMap.value = {};
      areaMap.value = {};
      temaMap.value = {};
      subtemas.value.forEach(st => {
        gradoMap.value[st.gradoNombre] = st.gradoId;
        areaMap.value[st.areaNombre] = st.areaId;
        temaMap.value[st.temaNombre] = st.temaId;
      });
    };

    // 🔹 Abrir el modal para EDITAR un subtema
    const editarSubtema = (subtema) => {
      
    };

    const generarHTMLDesdeJSON = (contenido) => {
      if (!contenido || typeof contenido !== "object") return "<p>Contenido no disponible</p>";

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

    // 🔹 Abrir el modal para CREAR un nuevo subtema
    const nuevoSubtema = () => {
      
    };

    // 🔹 Guardar cambios del subtema (editar o crear)
    const guardarSubtema = async () => {
      

      
    };

    // 🔹 Force update for content
    watch(
      () => subtemaEditando.value.contenido,
      () => {
        // Force update
      },
      { deep: true }
    );

    return {
      searchQuery,
      subtemas,
      gradoNames,
      areaNames,
      temaNames,
      activeFilters,
      filteredSubtemas,
      filteredAreaNames,
      filteredTemaNames,
      toggleFilter,
      
      
      
      
      editorRef,
      actualizarContenido,
      
      
      gradoMap,
      areaMap,
      temaMap
    };
  }
};
</script>

<style>
/* Pausar la animación */
.paused {
  animation-play-state: paused !important;
}

</style>

