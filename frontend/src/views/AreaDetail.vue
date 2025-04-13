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
        <h2 class="text-center p-4">{{ areaNombre }}<br /></h2>
        <!-- Buscador -->
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
            <div class="cinta-horizontal relative">
              <h3 class="text-lg font-semibold">Grados</h3>
              <div class="loop-container"
                  :class="[{ 'animate-grados': !activeFilters.grados }, { 'paused': !!activeFilters.grados }]">
                <div class="loop-content flex space-x-2">
                  <button
                    v-for="gradoName in filteredGradoNames"
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
            <h2 class="">{{ articulo.nombre }}</h2>
            <p class="">
              <u>Grado:</u> {{ articulo.gradoNombre }}<br/>
              <u>Tema:</u> {{ articulo.temaNombre }}
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
    const areaId = route.params.id; // Obtener el ID del área desde la URL
    const searchQuery = ref("");
    const articulos = ref([]);
    const gradoNames = ref([]);
    const temaNames = ref([]);
    const activeFilters = ref({ grados: null, temas: null });
    const areaNombre = ref(""); // Almacena el nombre del área actual

    const fetchAllData = async () => {
      try {
        const resarticulos = await fetch("https://colibriback.onrender.com/api/articulos").then(r => r.json());
        const resTemas = await fetch("https://colibriback.onrender.com/api/temas").then(r => r.json());
        const resAreas = await fetch("https://colibriback.onrender.com/api/areas").then(r => r.json());
        const resGrados = await fetch("https://colibriback.onrender.com/api/grados").then(r => r.json());

        // Obtener el nombre del área actual
        const areaActual = resAreas.find(a => a.id === parseInt(areaId));
        areaNombre.value = areaActual ? areaActual.nombre : "Desconocido";

        // Filtrar artículos por areaId
        const articulosFiltrados = resarticulos.filter(st => st.area_id === parseInt(areaId));

        articulos.value = articulosFiltrados.map(st => {
          const tema = resTemas.find(t => t.id === st.tema_id) || {};
          const grado = resGrados.find(g => g.id === st.grado_id) || {};
          return {
            ...st,
            nombre: st.titulo,
            temaNombre: tema.nombre || "Sin Tema",
            gradoNombre: grado.nombre || "Sin Grado",
            contenido: st.contenido || "<p>Escribe aquí...</p>"
          };
        });

        // Filtrar grados correspondientes al área
        const gradosFiltrados = resGrados.filter(grado =>
          articulosFiltrados.some(articulo => articulo.grado_id === grado.id)
        );
        gradoNames.value = gradosFiltrados.map(grado => grado.nombre);

        // Filtrar temas correspondientes al área
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
      if (activeFilters.value.grados) {
        result = result.filter(st => st.gradoNombre === activeFilters.value.grados);
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

    const filteredGradoNames = computed(() => {
      return gradoNames.value;
    });

    const filteredTemaNames = computed(() => {
      if (!activeFilters.value.grados) return temaNames.value;
      const articulosGrado = articulos.value.filter(st => st.gradoNombre === activeFilters.value.grados);
      return [...new Set(articulosGrado.map(st => st.temaNombre))];
    });

    return {
      searchQuery,
      articulos,
      gradoNames,
      temaNames,
      activeFilters,
      filteredarticulos,
      filteredGradoNames,
      filteredTemaNames,
      toggleFilter,
      areaNombre
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

