<template>
  <div class="min-h-screen p-6 bg-gradient-to-b from-pink-100 to-purple-200 text-gray-800">
    <header class="mb-6 text-center">
      <h1 class="text-3xl font-bold">Temas</h1>
      <input
        v-model="searchQuery"
        type="text"
        placeholder="Buscar tema..."
        class="mt-4 w-2/3 p-3 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-300 mx-auto block"
      />
    </header>

    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
      <div v-for="tema in filteredTemas" :key="tema.id" class="bg-white shadow-md rounded-lg p-4 cursor-pointer hover:shadow-lg transition">
        <router-link :to="`/tema/${tema.id}`" class="text-xl font-semibold text-blue-600 hover:underline">
          {{ tema.nombre }}
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
    const temas = ref([]);

    const fetchTemas = async () => {
      try {
        const res = await fetch("http://localhost:3000/api/temas");
        temas.value = await res.json();
      } catch (error) {
        console.error("Error al obtener los temas", error);
      }
    };

    onMounted(fetchTemas);

    const filteredTemas = computed(() => {
      if (!searchQuery.value) return temas.value;
      const q = searchQuery.value.toLowerCase();
      return temas.value.filter(t => t.nombre.toLowerCase().includes(q));
    });

    return { searchQuery, filteredTemas };
  },
};
</script>
