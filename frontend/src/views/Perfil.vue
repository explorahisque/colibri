<template>
  <div class="h-screen w-full flex">
    <!-- Barra lateral izquierda -->
    <div class="w-16 flex flex-col justify-center items-center space-y-6">
      <div class="space-y-4">
        <button class="p-2">
          <search-icon class="w-6 h-6 text-white-500" />
        </button>
        <button class="p-2">
          <edit-icon class="w-6 h-6 text-white-500" />
        </button>
        <button class="p-2">
          <delete-icon class="w-6 h-6 text-white-500" />
        </button>
      </div>
    </div>

    <!-- Contenido principal -->
    <div class="flex-1 flex flex-col px-6 py-4 overflow-hidden">
      <img src="@/assets/avatar.png" alt="Perfil" class="w-24 h-24 mx-auto rounded-full">
      <h2 class="text-2xl font-bold text-gray-800 mt-4">Nombre del Estudiante</h2>
      <div class="max-w-lg mx-auto bg-white shadow-lg rounded-lg p-6 text-center">
        
        <p class="text-gray-600">Aprendiz en progreso 🚀</p>

        <!-- Progreso -->
        <div class="mt-6">
          <h3 class="text-lg font-semibold">Progreso General</h3>
          <div class="w-full bg-gray-200 rounded-full h-6 mt-3">
            <div class="bg-blue-400 h-6 rounded-full" :style="{ width: progreso + '%' }"></div>
          </div>
        </div>
      </div>
      <!-- Barra de búsqueda -->
      <div class="flex items-center justify-center mb-4">
        <input type="text" placeholder="Buscar" class="bg-pink-400 px-4 py-2 rounded-full outline-none text-white w-3/4 text-center" />
        <button>
          <search-icon class="w-6 h-6 text-pink-500" />
        </button>
      </div>

      <!-- Categorías -->
      <div class="flex justify-center flex-wrap text-sm overflow-hidden">
        <div class="whitespace-nowrap">| Lorem ipsum || Lorem ipsum || Lorem ipsum |</div>
      </div>
      
      <!-- Contenido con scroll -->
      <div class="flex-1 overflow-y-auto mt-4">
        <div class="grid grid-cols-3 gap-4 p-4">
          <div v-for="item in 3" :key="item" class="bg-pink-400 p-4 rounded-lg">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed diam nonummy nibh</p>
            <p class="text-sm mt-2">Tema</p>
            <p class="text-sm">Área</p>
            <p class="font-bold mt-2">Grado Sexto</p>
          </div>
        </div>
      </div>
    </div>

    <!-- Barra lateral derecha -->
    <div class="w-16 flex flex-col justify-center items-center space-y-6">
      <div class="space-y-4">
        <button class="p-2">
          <import-icon class="w-6 h-6 text-white-500" />
        </button>
        <button class="p-2">
          <print-icon class="w-6 h-6 text-white-500" />
        </button>
        <button class="p-2">
          <export-icon class="w-6 h-6 text-white-500" />
        </button>
      </div>
    </div>
  </div>
</template>

<style scoped>
  /* Evita el scroll general en la pantalla, pero permite scroll en el div de contenido */
  html, body, #app {
    height: 100%;
    overflow: hidden;
  }
</style>
<script>

export default {
  data() {
    return {
      progreso: 45, // Simulación de progreso
    };
  },
};
</script>
