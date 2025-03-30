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
      <h2 class="text-2xl font-bold mt-4 self-center">{{ userName }}</h2>
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

<script>
import { ref, onMounted } from 'vue';

export default {
  setup() {
    const userName = ref('Cargando...');
    const progreso = ref(45);

    const getAuthenticatedUserId = async () => {
      // Intenta obtener el ID del usuario desde el almacenamiento local
      const userId = localStorage.getItem('userId');
      if (!userId) {
        console.error('No se encontró el ID del usuario en el almacenamiento local.');
        return null;
      }
      return parseInt(userId, 10); // Convierte el ID a un número
    };

    const fetchUserData = async () => {
      try {
        const userId = await getAuthenticatedUserId();

        if (!userId) {
          userName.value = 'Usuario no autenticado';
          return;
        }

        const response = await fetch(`https://colibriback.onrender.com/api/usuarios/${userId}`);
        if (!response.ok) {
          if (response.status === 404) {
            console.warn('Usuario no encontrado en la API.');
            userName.value = 'Usuario no encontrado';
          } else {
            throw new Error(`Error al obtener datos del usuario: ${response.status}`);
          }
          return;
        }

        const userData = await response.json();
        userName.value = userData.nombre || 'Usuario'; // Asegúrate de usar "nombre" correctamente
      } catch (error) {
        console.error('Error al obtener el nombre del usuario:', error);
        userName.value = 'Error al cargar usuario';
      }
    };

    onMounted(fetchUserData);

    return {
      userName,
      progreso,
    };
  },
};
</script>
