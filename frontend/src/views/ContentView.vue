<template>
  <div class="container mx-auto px-4 py-8">
    <!-- Header con estilo existente -->
    <div class="header-section mb-8">
      <h1 class="title text-4xl font-bold text-center mb-2">{{ currentGrade }}</h1>
      <p class="subtitle text-xl text-gray-600 text-center">Explora los temas y contenidos</p>
    </div>

    <!-- Selector de grado -->
    <div class="flex justify-center mb-8">
      <select 
        v-model="selectedGrade"
        class="select-primary px-4 py-2 rounded-lg border-2 border-[#C3B1E1]"
      >
        <option value="Grado Sexto">Grado Sexto</option>
        <option value="Grado Séptimo">Grado Séptimo</option>
        <option value="Grado Octavo">Grado Octavo</option>
        <option value="Grado Noveno">Grado Noveno</option>
        <option value="Grado Once">Grado Once</option>
      </select>
    </div>

    <!-- Contenido del grado -->
    <div v-if="sections" class="grid grid-cols-1 md:grid-cols-12 gap-6">
      <!-- Sidebar con secciones -->
      <div class="md:col-span-3">
        <div class="card bg-white p-6 rounded-lg shadow">
          <h2 class="card-title text-xl font-bold mb-4">Secciones</h2>
          <ul class="space-y-2">
            <li v-for="(section, index) in sections" :key="index">
              <button 
                @click="selectedSection = index"
                :class="[
                  'w-full text-left p-3 rounded transition-all',
                  selectedSection === index 
                    ? 'bg-[#AEEEEE] text-[#1C1C1C]' 
                    : 'hover:bg-gray-100'
                ]"
              >
                {{ section.title }}
              </button>
            </li>
          </ul>
        </div>
      </div>

      <!-- Contenido principal -->
      <div class="md:col-span-9">
        <div v-if="currentSection" class="card bg-white p-8 rounded-lg shadow">
          <h2 class="text-2xl font-bold mb-6">{{ currentSection.title }}</h2>
          <div 
            class="prose max-w-none"
            v-html="currentSection.content"
          ></div>
        </div>
        <div v-else class="text-center text-gray-500">
          Selecciona una sección para ver su contenido
        </div>
      </div>
    </div>

    <!-- Estado de carga -->
    <div v-else class="loading-state text-center py-12">
      <p class="text-gray-500">Cargando contenido...</p>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, watch, onMounted } from 'vue';
import { getGradeContent } from '@/services/contentService';

const selectedGrade = ref('Grado Sexto');
const sections = ref(null);
const selectedSection = ref(0);

const currentSection = computed(() => 
  sections.value && selectedSection.value !== null 
    ? sections.value[selectedSection.value] 
    : null
);

const currentGrade = computed(() => selectedGrade.value);

const loadContent = async () => {
  sections.value = null;
  sections.value = await getGradeContent(selectedGrade.value);
  selectedSection.value = 0;
};

watch(selectedGrade, loadContent);

onMounted(loadContent);
</script>

<style scoped>
/* Mantén solo los estilos específicos que no están en el sistema de diseño global */
.prose img {
  @apply rounded-lg shadow my-4 mx-auto;
}

.prose a {
  @apply text-[#C3B1E1] hover:text-[#FFB6C1] transition-colors;
}
</style>
