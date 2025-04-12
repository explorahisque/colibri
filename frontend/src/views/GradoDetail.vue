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
        <h2 class="text-center p-4">{{ gradoNombre }}<br /></h2>
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
            <!-- Filtro de Áreas -->
            <div class="cinta-horizontal relative">
              <h3 class="text-lg font-semibold">Áreas</h3>
              <div class="loop-container"
                  :class="[{ 'animate-areas': !activeFilters.areas }, { 'paused': !!activeFilters.areas }]">
                <div class="loop-content flex space-x-2">
                  <button
                    v-for="areaName in filteredAreaNames"
                    :key="areaName"
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
            <div class="cinta-horizontal relative">
              <h4 class="text-base font-semibold">Temas</h4>
              <div class="loop-container"
                  :class="[{ 'animate-temas': !activeFilters.temas }, { 'paused': !!activeFilters.temas }]">
                <div class="loop-content flex space-x-2">
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
import { ref, computed, onMounted } from "vue";
import { useRoute } from "vue-router";

export default {
  setup() {
    const route = useRoute();
    const gradoId = route.params.id; // Obtener el ID del grado desde la URL
    const searchQuery = ref("");
    const articulos = ref([]);
    const areaNames = ref([]);
    const temaNames = ref([]);
    const activeFilters = ref({ areas: null, temas: null });
    const gradoNombre = ref(""); // Almacena el nombre del grado actual

    const fetchAllData = async () => {
      try {
        const resarticulos = await fetch("https://colibriback.onrender.com/api/articulos").then(r => r.json());
        const resTemas = await fetch("https://colibriback.onrender.com/api/temas").then(r => r.json());
        const resAreas = await fetch("https://colibriback.onrender.com/api/areas").then(r => r.json());
        const resGrados = await fetch("https://colibriback.onrender.com/api/grados").then(r => r.json());

        // Obtener el nombre del grado actual
        const gradoActual = resGrados.find(g => g.id === parseInt(gradoId));
        gradoNombre.value = gradoActual ? gradoActual.nombre : "Desconocido";

        // Filtrar artículos por gradoId
        const articulosFiltrados = resarticulos.filter(st => st.grado_id === parseInt(gradoId));

        articulos.value = articulosFiltrados.map(st => {
          const tema = resTemas.find(t => t.id === st.tema_id) || {};
          const area = resAreas.find(a => a.id === st.area_id) || {};
          return {
            ...st,
            nombre: st.titulo,
            temaNombre: tema.nombre || "Sin Tema",
            areaNombre: area.nombre || "Sin Área",
            contenido: st.contenido || "<p>Escribe aquí...</p>"
          };
        });

        // Filtrar áreas correspondientes al grado
        const areasFiltradas = resAreas.filter(area =>
          articulosFiltrados.some(articulo => articulo.area_id === area.id)
        );
        areaNames.value = areasFiltradas.map(area => area.nombre);

        // Filtrar temas correspondientes al grado
        const temasFiltrados = resTemas.filter(tema =>
          articulosFiltrados.some(articulo => articulo.tema_id === tema.id)
        );
        temaNames.value = temasFiltrados.map(tema => tema.nombre);
      } catch (error) {
        console.error("Error al cargar datos", error);
      }
    };

    onMounted(fetchAllData);

    const toggleFilter = (type, name) => {
      activeFilters.value[type] = activeFilters.value[type] === name ? null : name;
    };

    const filteredarticulos = computed(() => {
      let result = articulos.value;
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
      return areaNames.value;
    });

    const filteredTemaNames = computed(() => {
      if (!activeFilters.value.areas) return temaNames.value;
      const articulosArea = articulos.value.filter(st => st.areaNombre === activeFilters.value.areas);
      return [...new Set(articulosArea.map(st => st.temaNombre))];
    });

    return {
      searchQuery,
      articulos,
      areaNames,
      temaNames,
      activeFilters,
      filteredarticulos,
      filteredAreaNames,
      filteredTemaNames,
      toggleFilter,
      gradoNombre
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

