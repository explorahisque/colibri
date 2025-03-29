<template>
  <div class="min-h-screen p-6 bg-gradient-to-b from-pink-100 to-purple-200 text-gray-800">
    <header class="mb-6 text-center">
      <h1 class="text-3xl font-bold">Grados</h1>
      <input
        v-model="searchQuery"
        type="text"
        placeholder="Buscar grado..."
        class="mt-4 w-2/3 p-3 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-300 mx-auto block"
      />
    </header>

    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
      <div v-for="grado in filteredGrados" :key="grado.id" class="bg-white shadow-md rounded-lg p-4 cursor-pointer hover:shadow-lg transition">
        <router-link :to="`/grado/${grado.id}`" class="text-xl font-semibold text-blue-600 hover:underline">
          {{ grado.nombre }}
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
import { ref, computed, onMounted } from "vue";
export default {
  setup() {
    const searchQuery = ref("");
    const grados = ref([]);

    const fetchGrados = async () => {
      try {
        const res = await fetch("http://localhost:3000/api/grados");
        grados.value = await res.json();
      } catch (error) {
        console.error("Error al obtener los grados", error);
      }
    };

    onMounted(fetchGrados);

    const filteredGrados = computed(() => {
      if (!searchQuery.value) return grados.value;
      const q = searchQuery.value.toLowerCase();
      return grados.value.filter(g => g.nombre.toLowerCase().includes(q));
    });

    return { searchQuery, filteredGrados };
  },
};
</script>
