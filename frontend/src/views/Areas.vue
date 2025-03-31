<template>
  <div class="min-h-screen p-6 bg-gradient-to-b from-pink-100 to-purple-200 text-gray-800">
    <header class="mb-6 text-center">
      <h1 class="text-3xl font-bold">Áreas</h1>
      <input
        v-model="searchQuery"
        type="text"
        placeholder="Buscar área..."
        class="mt-4 w-2/3 p-3 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-300 mx-auto block"
      />
    </header>

    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
      <div v-for="area in filteredAreas" 
           :key="area.id" 
           @mouseenter="playUISound('navigation.hover', 0.2)"
           class="bg-white shadow-md rounded-lg p-4 cursor-pointer hover:shadow-lg transition">
        <router-link :to="`/area/${area.id}`" class="text-xl font-semibold text-blue-600 hover:underline">
          {{ area.nombre }}
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
import { ref, computed, onMounted } from "vue";
import { soundMixin } from '@/plugins/sound';

export default {
  mixins: [soundMixin],
  setup() {
    const searchQuery = ref("");
    const areas = ref([]);

    const fetchAreas = async () => {
      try {
        const res = await fetch("https://colibriback.onrender.com/api/areas");
        areas.value = await res.json();
      } catch (error) {
        console.error("Error al obtener las áreas", error);
      }
    };

    onMounted(fetchAreas);

    const filteredAreas = computed(() => {
      if (!searchQuery.value) return areas.value;
      const q = searchQuery.value.toLowerCase();
      return areas.value.filter(a => a.nombre.toLowerCase().includes(q));
    });

    return { searchQuery, filteredAreas };
  },
};
</script>
