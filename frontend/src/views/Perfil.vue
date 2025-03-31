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
    <div class="flex-1 flex flex-col py-4 overflow-hidden pt-24 overflow-y-auto">
      <img src="@/assets/avatar.png" alt="Perfil" class="w-24 h-24 mx-auto rounded-full">
      <h2 class="text-2xl font-bold mt-4 self-center">
        {{ isLoading ? 'Cargando...' : userName }}
      </h2>
      <div class="max-w-lg mx-auto shadow-lg rounded-lg p-6 text-center">
        
        <h3>Aprendiz en crecimiento 🚀</h3>
        <br>
        <p>Próximamente podrás hacer seguimiento a todo tus logros de estudio</p>

        <!-- Progreso -->
        <div class="mt-6">
          <h3 class="text-lg font-semibold">Progreso General</h3>
          <div class="w-full bg-gray-200 rounded-full h-6 mt-3">
            <div class="bg-blue-400 h-6 rounded-full" :style="{ width: progreso + '%' }"></div>
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
vue';
<script>
import { ref, onMounted, computed } from 'vue';
import { useAuth } from '@/composables/useAuth';

export default {
  setup() {
    const { authState, checkAuth } = useAuth();
    const progreso = 45;
    const isLoading = ref(true); // Estado de carga

    const userName = computed(() => {
      return authState.user?.nombre || authState.user?.email || 'Cargando...';
    });

    onMounted(async () => {
      const success = await checkAuth();
      isLoading.value = false; // Finaliza la carga
    });

    return {
      userName,
      progreso,
      isLoading, // Retorna isLoading
    };
  },
};
</script>
