<template>
  <div class="h-screen w-full flex relative">
    <!-- Slideshow de fondo -->
      <div class="absolute inset-0 z-0 slideshow">
        <div 
          v-for="(image, index) in slideshowImages" 
          :key="index" 
          class="absolute inset-0 bg-cover bg-center transition-opacity duration-1000"
          :class="{ 'opacity-0': currentImageIndex !== index, 'opacity-30': currentImageIndex === index }"
          :style="{ backgroundImage: `url(${image})` }"
        ></div>
      </div>

    <div class="flex-1 flex flex-col py-4 overflow-hidden pt-24 overflow-y-auto relative z-10">
      <!-- Tarjeta de Bienvenida -->
      <div v-if="!authState.isAuthenticated" class="login-box flex flex-col items-center text-center p-6">
        <button class="logo align-middle cursor-none">
          <user-book-icon class="w-20 h-20 text-white-500" />
        </button>
        <h1 class="text-2xl font-light mb-4">
          Hola Usuari@
        </h1>
        <div class="w-full flex items-center justify-center">
          <router-link to="/iniciar" class="transition" aria-label="Ingresar a la plataforma">
            <button>
              <right-icon class="w-7 h-7 text-white-500" />
            </button>
          </router-link>
        </div>
      </div>

      <!-- Tarjeta de usuario logueado -->
      <div v-else class="login-box flex flex-col items-center text-center p-6">
        <button class="logo align-middle cursor-none">
          <user-book-icon class="w-20 h-20 text-white-500" />
        </button>
        <h1 class="text-2xl font-light mb-4">
          Hola {{ authState.user?.nombre || 'Usuari@' }}
        </h1>
        <!-- Accesos rápidos -->
        <div class="dashboard w-full overflow-x-auto">
          <div class="flex items-center whitespace-nowrap">
            <h2>
              <router-link 
                v-for="grado in gradoNames" 
                :key="grado.id" 
                :to="`/grados/${grado.id}`" 
                class="inline-block p-4 text-center transition card mx-2"
                @mouseenter="handleCardHover"
              >
                {{ grado.nombre }}
              </router-link>
            </h2>
          </div>
        </div>
        <div class="w-full grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-4">
          <router-link 
            v-for="area in areaNames" 
            :key="area.id" 
            :to="`/areas/${area.id}`" 
            class="p-4 text-center transition card area-card relative content-center"
            @mouseenter="handleCardHover"
          >
            <div 
              class="img-card absolute inset-0 bg-cover bg-center opacity-50" 
              :style="{ backgroundImage: `url(/src/assets/${normalizeName(area.nombre)}.webp)` }"
            ></div>
            <span class="relative z-10">{{ area.nombre }}</span>
          </router-link>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { useAuth } from '@/composables/useAuth';
import { soundMixin } from '@/plugins/sound';

const contenidos = ref([]);
const gradoNames = ref([]);
const areaNames = ref([]);
const { authState, checkAuth } = useAuth(); // Usa authState directamente
const { playUISound } = soundMixin.methods;

// Función para obtener los grados desde la API
const fetchGrados = async () => {
  try {
    const response = await fetch('https://colibriback.onrender.com/api/grados');
    if (!response.ok) throw new Error('Error al obtener los grados');
    const grados = await response.json();
    gradoNames.value = grados.map(grado => ({ id: grado.id, nombre: grado.nombre }));
  } catch (error) {
    console.error('Error al cargar los grados:', error);
  }
};

// Función para obtener las áreas desde la API
const fetchAreas = async () => {
  try {
    const response = await fetch('https://colibriback.onrender.com/api/areas');
    if (!response.ok) throw new Error('Error al obtener las áreas');
    const areas = await response.json();
    areaNames.value = areas.map(area => ({ id: area.id, nombre: area.nombre }));
  } catch (error) {
    console.error('Error al cargar las áreas:', error);
  }
};

// Función para normalizar nombres (reemplazar espacios, eliminar paréntesis y caracteres especiales)
const normalizeName = (name) => {
  return name
    .toLowerCase()
    .replace(/\s+/g, '_') // Reemplazar espacios por guiones bajos
    .replace(/[()]/g, '') // Eliminar paréntesis
    .replace(/[^a-z0-9_]/g, ''); // Eliminar caracteres especiales excepto letras, números y guiones bajos
};

// Slideshow
const slideshowImages = ref([]);
const currentImageIndex = ref(0);

const loadSlideshowImages = async () => {
  const images = import.meta.glob('/src/assets/*.webp', { eager: true });
  slideshowImages.value = Object.values(images).map((module) => module.default);
};

const startSlideshow = () => {
  setInterval(() => {
    currentImageIndex.value = (currentImageIndex.value + 1) % slideshowImages.value.length;
  }, 5000);
};

// Add hover sound to cards
const handleCardHover = () => {
  playUISound('ui.tap', 0.2);
};

// Verificar el estado de autenticación y cargar los grados y áreas al montar el componente
onMounted(async () => {
  const isAuthChecked = await checkAuth();
  if (!isAuthChecked) {
    console.log('Usuario no autenticado o token inválido.');
  } else {
    console.log('Usuario autenticado:', authState.user); // Usa authState.user
    await fetchGrados();
    await fetchAreas();
  }
  await loadSlideshowImages();
  startSlideshow();
});
</script>
