<template>
  <div class="min-h-screen flex flex-col items-center bg-gradient-to-b from-pink-100 to-purple-200 text-gray-800 p-6">
    <header class="w-full max-w-4xl flex justify-between items-center mb-6">
      <h1 class="text-3xl font-bold">EstudioEnCasa</h1>
      <button @click="goToProfile" class="bg-white p-2 rounded-full shadow-md">👤</button>
    </header>

    <div class="w-full max-w-4xl grid grid-cols-1 md:grid-cols-2 gap-6">
      <div v-for="categoria in categorias" :key="categoria.id" class="bg-white p-6 rounded-xl shadow-md hover:shadow-lg transition cursor-pointer" @click="goToCategory(categoria.id)">
        <h2 class="text-xl font-semibold">{{ categoria.nombre }}</h2>
        <p class="text-sm text-gray-600">{{ categoria.descripcion }}</p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      categorias: [
        { id: 'contenidos', nombre: 'Explorar Contenidos', descripcion: 'Accede a los materiales educativos organizados por grado y área.' },
        { id: 'evaluaciones', nombre: 'Evaluaciones', descripcion: 'Pon a prueba tus conocimientos con cuestionarios interactivos.' },
        { id: 'favoritos', nombre: 'Guardados', descripcion: 'Accede rápidamente a tus temas favoritos.' }
      ]
    };
  },
  methods: {
    goToCategory(id) {
      this.$router.push(`/${id}`);
    },
    goToProfile() {
      this.$router.push('/perfil');
    }
  }
};
</script>

<style>
body {
  font-family: 'Arial', sans-serif;
}
</style>