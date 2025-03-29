<template>
  <div class="overflow-y-auto h-screen relative">
    <div 
      class="dinamico-bg absolute top-0 left-0 w-full h-full" 
      :style="{ backgroundImage: primeraImagen ? `url(${primeraImagen})` : '' }"
    ></div>
    <div class="w-5/6 py-4 overflow-hidden pt-24 overflow-y-auto justify-self-center relative z-10">
      <button @click="$router.back()" class="w-1/8 font-semibold mb-4">
        ← Volver
      </button>
      <div>
        <div class="articulo-contenedor overflow-hidden overflow-y-auto" style="height: 70vh;">
          <h1 class="text-2xl font-bold text-center">{{ articulo.titulo }}</h1>
          <div class="mt-4">
            <h2 class="text-lg font-semibold">Grado:</h2>
            <div>{{ gradoNombre || "Cargando..." }}</div>
          </div>
          <div class="mt-4">
            <h3 class="text-lg font-semibold">Área:</h3>
            <div>{{ areaNombre || "Cargando..." }}</div>
          </div>
          <div class="mt-4">
            <h4 class="text-lg font-semibold">Tema:</h4>
            <div>{{ temaNombre || "Cargando..." }}</div>
          </div>
          <div v-if="articulo.contenido" class="mt-6">
            <h2 class="text-xl font-semibold text-center">Contenido del artículo</h2>
            <div v-html="renderizarContenido(articulo.contenido)" ref="contenidoRef" class="prose columns-1 md:columns-3 lg:columns-3 gap-4"></div>
          </div>
        </div>
      </div>
      <p v-if="loading" class="text-gray-600 mt-6 text-center">Cargando artículo...</p>
      <div v-if="modalVisible" class="modal fixed inset-0 flex items-center justify-center bg-black bg-opacity-50">
        <div class="modal-contenido h-3/4 p-6 rounded-lg w-3/4 relative">
          <button @click="cerrarModal" class="cerrar-modal absolute top-2 right-2 w-15 h-15">
            <CerrarIcon class="w-6 h-6 text-white-500"/>
          </button>
          <iframe :src="iframeSrc" class="w-full h-full border rounded"></iframe>
        </div>
      </div>
      <!-- Lightbox -->
      <div v-if="lightboxVisible" class="lightbox fixed inset-0 z-50 flex items-center justify-center bg-black bg-opacity-75">
        <div class="relative">
          <img 
            :src="lightboxImageSrc" 
            alt="Imagen ampliada" 
            class="" 
            :style="{
              transform: `scale(${lightboxZoom}) translate(${lightboxOffset.x}px, ${lightboxOffset.y}px)`
            }"
            @wheel="onLightboxWheel"
            @mousedown="onLightboxMouseDown"
            @touchstart="onLightboxTouchStart"
            @touchmove="onLightboxTouchMove"
            @touchend="onLightboxTouchEnd"
          >
          <button @click="cerrarLightbox" class="absolute top-4 right-4 bg-gray-800 text-white p-2 rounded-full">
            <CerrarIcon class="w-6 h-6"/>
          </button>
          <div class="absolute bottom-4 left-4 flex space-x-2">
            <button @click="ajustarZoom(0.1)" class="bg-gray-800 text-white p-2 rounded">+</button>
            <button @click="ajustarZoom(-0.1)" class="bg-gray-800 text-white p-2 rounded">-</button>
            <button @click="moverImagen(-10, 0)" class="bg-gray-800 text-white p-2 rounded">←</button>
            <button @click="moverImagen(10, 0)" class="bg-gray-800 text-white p-2 rounded">→</button>
            <button @click="moverImagen(0, -10)" class="bg-gray-800 text-white p-2 rounded">↑</button>
            <button @click="moverImagen(0, 10)" class="bg-gray-800 text-white p-2 rounded">↓</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { ref, onMounted, watch, nextTick } from "vue";
import { useRoute } from "vue-router";
import axios from "axios";
import { marked } from 'marked'; // Importa marked
import CerrarIcon from "@/assets/cerrar.svg?component";

marked.setOptions({
  breaks: true, // Enable line breaks
});

export default {
  components: {
    CerrarIcon
  },
  setup() {
    const route = useRoute();
    const articulo = ref({});
    const temaNombre = ref(null);
    const areaNombre = ref(null);
    const gradoNombre = ref(null);
    const loading = ref(true);
    const modalVisible = ref(false);
    const iframeSrc = ref("");
    const contenidoRef = ref(null); // Ref para el contenedor del contenido
    const primeraImagen = ref(null);

    const fetcharticuloById = async (id) => {
      try {
        const { data } = await axios.get(`https://colibriback.onrender.com/api/articulos/${id}`);
        articulo.value = data;

        if (typeof articulo.value.contenido === "string") {
          // Check if the string looks like a JSON object
          if (articulo.value.contenido.trim().startsWith('{') || articulo.value.contenido.trim().startsWith('[')) {
            try {
              articulo.value.contenido = JSON.parse(articulo.value.contenido);
            } catch (e) {
              console.warn("⚠️ No se pudo parsear articulo.contenido, se usará como string.", e);
            }
          }
        }
      } catch (error) {
        console.error("❌ Error al obtener el articulo:", error);
      } finally {
        loading.value = false;
      }
    };

    const fetchTemaById = async (id) => {
      if (!id) return null;
      try {
        const { data } = await axios.get(`https://colibriback.onrender.com/api/temas/${id}`);
        return data;
      } catch (error) {
        console.error("❌ Error al obtener el tema:", error);
        return null;
      }
    };

    const fetchAreaById = async (id) => {
      if (!id) return null;
      try {
        const { data } = await axios.get(`https://colibriback.onrender.com/api/areas/${id}`);
        return data;
      } catch (error) {
        console.error("❌ Error al obtener el área:", error);
        return null;
      }
    };

    const fetchGradoById = async (id) => {
      if (!id) return null;
      try {
        const { data } = await axios.get(`https://colibriback.onrender.com/api/grados/${id}`);
        return data;
      } catch (error) {
        console.error("❌ Error al obtener el grado:", error);
        return null;
      }
    };

    const abrirModal = (link) => {
      try {
        const url = new URL(link);
        
        if (url.hostname.includes("spotify.com")) {
          window.open(link, "_blank");
          return;
        }
        
        if (url.hostname === "youtube.com" || url.hostname === "www.youtube.com") {
          const videoId = url.searchParams.get("v");
          iframeSrc.value = `https://www.youtube.com/embed/${videoId}`;
        } else if (url.hostname === "youtu.be") {
          const videoId = url.pathname.substring(1);
          iframeSrc.value = `https://www.youtube.com/embed/${videoId}`;
        } else if (url.hostname.includes("scielo.org")) {
          window.open(link, "_blank");
          return;
        }  else if (url.hostname.includes("researchgate.net")) {
          window.open(link, "_blank");
          return;
        } else {
          iframeSrc.value = link;
        }
        modalVisible.value = true;
      } catch (error) {
        console.error("Error al procesar la URL:", error);
        iframeSrc.value = link;
        modalVisible.value = true;
      }
    };

    const cerrarModal = () => {
      modalVisible.value = false;
      iframeSrc.value = "";
    };

    const renderizarContenido = (contenido) => {
      if (!contenido) return '<p>Contenido no disponible</p>';
      
      if (contenido.trim().startsWith('<')) {
        return contenido;
      }
      
      let contenidoLimpio = contenido.replace(/\\n/g, '\n');
      const campoRegex = /^".+?":\s*"(.*)"$/s;
      const match = contenidoLimpio.match(campoRegex);
      if (match) {
        contenidoLimpio = match[1];
      }
      
      let htmlContent = marked(contenidoLimpio);
      const temp = document.createElement('div');
      temp.innerHTML = htmlContent;
      
      // Agrupar nodos en tarjetas a partir de cada título
      const container = document.createElement('div');
      let currentCard = null;
      Array.from(temp.childNodes).forEach(node => {
        if (node.nodeType === Node.ELEMENT_NODE && /^H[1-2]$/.test(node.tagName)) {
          if (currentCard) {
            container.appendChild(currentCard);
          }
          currentCard = document.createElement('div');
          currentCard.classList.add('card', 'mb-4', 'break-inside-avoid');
          currentCard.appendChild(node.cloneNode(true));
        } else {
          if (currentCard) {
            currentCard.appendChild(node.cloneNode(true));
          } else {
            container.appendChild(node.cloneNode(true));
          }
        }
      });
      if (currentCard) {
        container.appendChild(currentCard);
      }
      
      // Restaurar funcionalidad de modal en enlaces externos y agregar target="_blank"
      container.querySelectorAll('a').forEach(a => {
        const href = a.getAttribute('href');
        if (href && !href.startsWith('#')) {
          a.setAttribute('target', '_blank');
          a.setAttribute('onclick', 'event.preventDefault(); window.abrirModalArticulo(this.href)');
        }
      });

      // Agrega funcionalidad de lightbox a las imágenes
      container.querySelectorAll('img').forEach(img => {
        img.classList.add('cursor-pointer');
        img.onclick = () => abrirLightbox(img.src); // Cambiar a `onclick` para asegurar el registro del evento
      });
      
      return container.innerHTML;
    };

    const obtenerPrimeraImagen = () => {
      const contenidoElement = contenidoRef.value;
      if (contenidoElement) {
        const imgElement = contenidoElement.querySelector("img");
        if (imgElement) {
          primeraImagen.value = imgElement.src;
        }
      }
    };

    const lightboxVisible = ref(false);
    const lightboxImageSrc = ref("");
    const lightboxZoom = ref(1);
    const lightboxOffset = ref({ x: 0, y: 0 });

    // Nuevos refs para interacciones
    const isDragging = ref(false);
    const dragStart = ref({ x: 0, y: 0 });
    const initialOffset = ref({ x: 0, y: 0 });
    const isPinching = ref(false);
    const pinchStartDistance = ref(0);
    const initialZoom = ref(1);

    // Funciones para arrastrar con mouse
    const onLightboxWheel = (e) => {
      e.preventDefault();
      const delta = e.deltaY < 0 ? 0.1 : -0.1;
      ajustarZoom(delta);
    };

    const onLightboxMouseDown = (e) => {
      isDragging.value = true;
      dragStart.value = { x: e.clientX, y: e.clientY };
      initialOffset.value = { ...lightboxOffset.value };
      window.addEventListener("mousemove", onLightboxMouseMove);
      window.addEventListener("mouseup", onLightboxMouseUp);
    };

    const onLightboxMouseMove = (e) => {
      if (!isDragging.value) return;
      const dx = e.clientX - dragStart.value.x;
      const dy = e.clientY - dragStart.value.y;
      lightboxOffset.value = {
        x: initialOffset.value.x + dx,
        y: initialOffset.value.y + dy,
      };
    };

    const onLightboxMouseUp = () => {
      isDragging.value = false;
      window.removeEventListener("mousemove", onLightboxMouseMove);
      window.removeEventListener("mouseup", onLightboxMouseUp);
    };

    // Funciones para interacción táctil
    const onLightboxTouchStart = (e) => {
      if (e.touches.length === 1) {
        isDragging.value = true;
        dragStart.value = { x: e.touches[0].clientX, y: e.touches[0].clientY };
        initialOffset.value = { ...lightboxOffset.value };
      } else if (e.touches.length === 2) {
        isPinching.value = true;
        const touch1 = e.touches[0];
        const touch2 = e.touches[1];
        const dx = touch2.clientX - touch1.clientX;
        const dy = touch2.clientY - touch1.clientY;
        pinchStartDistance.value = Math.hypot(dx, dy);
        initialZoom.value = lightboxZoom.value;
      }
    };

    const onLightboxTouchMove = (e) => {
      if (isDragging.value && e.touches.length === 1) {
        const dx = e.touches[0].clientX - dragStart.value.x;
        const dy = e.touches[0].clientY - dragStart.value.y;
        lightboxOffset.value = {
          x: initialOffset.value.x + dx,
          y: initialOffset.value.y + dy,
        };
      } else if (isPinching.value && e.touches.length === 2) {
        const touch1 = e.touches[0];
        const touch2 = e.touches[1];
        const dx = touch2.clientX - touch1.clientX;
        const dy = touch2.clientY - touch1.clientY;
        const newDistance = Math.hypot(dx, dy);
        const scaleFactor = newDistance / pinchStartDistance.value;
        lightboxZoom.value = Math.max(1, initialZoom.value * scaleFactor);
      }
    };

    const onLightboxTouchEnd = (e) => {
      if (e.touches.length === 0) {
        isDragging.value = false;
        isPinching.value = false;
      }
    };

    // Función para controles con teclado
    const onKeyDownLightbox = (e) => {
      if (!lightboxVisible.value) return;
      switch (e.key) {
        case "ArrowUp":
          moverImagen(0, -10);
          break;
        case "ArrowDown":
          moverImagen(0, 10);
          break;
        case "ArrowLeft":
          moverImagen(-10, 0);
          break;
        case "ArrowRight":
          moverImagen(10, 0);
          break;
        case "+":
        case "=":
          ajustarZoom(0.1);
          break;
        case "-":
          ajustarZoom(-0.1);
          break;
      }
    };

    // Registrar y remover listener de teclado según estado de lightbox
    watch(lightboxVisible, (val) => {
      if (val) {
        window.addEventListener("keydown", onKeyDownLightbox);
      } else {
        window.removeEventListener("keydown", onKeyDownLightbox);
      }
    });

    const abrirLightbox = (src) => {
      lightboxImageSrc.value = src;
      lightboxVisible.value = true;
      lightboxZoom.value = 1;
      lightboxOffset.value = { x: 0, y: 0 };
    };

    const cerrarLightbox = () => {
      lightboxVisible.value = false;
      lightboxImageSrc.value = "";
    };

    const ajustarZoom = (incremento) => {
      lightboxZoom.value = Math.max(1, lightboxZoom.value + incremento);
    };

    const moverImagen = (dx, dy) => {
      lightboxOffset.value.x += dx;
      lightboxOffset.value.y += dy;
    };

    // Listener delegado para el lightbox.
    const attachLightboxListeners = () => {
      if (contenidoRef.value) {
        contenidoRef.value.addEventListener("click", (event) => {
          if (event.target.tagName === "IMG") {
            abrirLightbox(event.target.src);
          }
        });
      }
    };

    // Exponer la función abrirModal globalmente para que los enlaces puedan acceder a ella
    window.abrirModalArticulo = (href) => {
      abrirModal(href);
    };

    onMounted(async () => {
      const articuloId = route.params.id;
      await fetcharticuloById(articuloId);

      try {
        const tema = await fetchTemaById(articulo.value.tema_id);
        temaNombre.value = tema?.nombre || "Sin Tema";

        const area = await fetchAreaById(tema?.area_id || articulo.value.area_id);
        areaNombre.value = area?.nombre || "Sin Área";

        const grado = await fetchGradoById(area?.grado_id || articulo.value.grado_id);
        gradoNombre.value = grado?.nombre || "Desconocido";
      } catch (error) {
        console.error("❌ Error al obtener nombres de grado, área y tema:", error);
      }

      if (route.hash) {
        nextTick(() => {
          // Quitar el "#" del hash
          const hashText = decodeURIComponent(route.hash.substring(1)).toLowerCase()
          
          // Buscar el elemento cuyo texto contenga ese hash
          const headings = document.querySelectorAll('h1, h2, h3, h4, h5, h6')
          for (const heading of headings) {
            if (heading.textContent.trim().toLowerCase().includes(hashText)) {
              heading.scrollIntoView({ behavior: 'smooth' })
              break
            }
          }
        })
      }

      nextTick(() => {
        obtenerPrimeraImagen();
        attachLightboxListeners();
      });
    });

    return {
      articulo,
      temaNombre,
      areaNombre,
      gradoNombre,
      loading,
      modalVisible,
      iframeSrc,
      abrirModal,
      cerrarModal,
      renderizarContenido,
      contenidoRef,
      primeraImagen,
      lightboxVisible,
      lightboxImageSrc,
      lightboxZoom,
      lightboxOffset,
      cerrarLightbox,
      ajustarZoom,
      moverImagen,
      // Nuevos handlers para lightbox:
      onLightboxWheel,
      onLightboxMouseDown,
      onLightboxTouchStart,
      onLightboxTouchMove,
      onLightboxTouchEnd,
    };
  },
};
</script>
