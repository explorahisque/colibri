<template> 
  <div class="overflow-y-auto h-screen relative">
    <!-- Barra lateral izquierda -->
    <div class="w-16 flex flex-col justify-center items-center space-y-6">
      <div class="space-y-4 text-center">
        <!-- <button class="p-2">
          <new-icon class="w-6 h-6" />
        </button>
        <button class="p-2">
          <edit-icon class="w-6 h-6" />
        </button>
        <button class="p-2">
          <delete-icon class="w-6 h-6" />
        </button> -->
      </div>
    </div>
    <!-- Contenido principal -->
    <div
      class="dinamico-bg absolute top-0 left-0 w-full h-full"
      :style="{ backgroundImage: primeraImagen ? `url(${primeraImagen})` : '' }"
    ></div>
    <div
      class="w-5/6 py-4 overflow-hidden mt-[5rem] overflow-y-auto justify-self-center relative z-10 md:mt-[5rem]"
    >
      <button @click="$router.back()" class="w-1/8 font-semibold mb-4">
        ← Volver
      </button>
      <div>
        <div
          class="articulo-contenedor h-[80vh] overflow-hidden overflow-y-auto md:h-[70vh]"
        >
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
            <h2 class="text-xl font-semibold text-center">
              Contenido del artículo
            </h2>
            <div
              v-html="renderizarContenido(articulo.contenido)"
              ref="contenidoRef"
              class="prose columns-1 md:columns-3 lg:columns-3 gap-4"
            ></div>
          </div>
        </div>
      </div>
      <p v-if="loading" class="text-gray-600 mt-6 text-center">
        Cargando artículo...
      </p>
      <div
        v-if="modalVisible"
        class="modal fixed inset-0 flex items-center justify-center bg-black bg-opacity-50"
      >
        <div class="modal-contenido h-3/4 p-6 rounded-lg w-3/4 relative">
          <button
            @click="cerrarModal"
            class="cerrar-modal absolute top-2 right-2 w-15 h-15"
          >
            <CerrarIcon class="w-6 h-6 text-white-500" />
          </button>
          <iframe 
            :src="iframeSrc" 
            class="w-full h-full border rounded"
            allowfullscreen
            allow="fullscreen"
          ></iframe>
        </div>
      </div>
      <!-- Lightbox -->
      <div
        v-if="lightboxVisible"
        class="lightbox fixed inset-0 z-50 flex items-center justify-center bg-black bg-opacity-75"
      >
        <div class="relative margin-auto max w-full flex items-center justify-center">
          <img
            :src="lightboxImageSrc"
            alt="Imagen ampliada"
            class=""
            :style="{
              transform: `scale(${lightboxZoom}) translate(${lightboxOffset.x}px, ${lightboxOffset.y}px)`,
            }"
            @wheel="onLightboxWheel"
            @mousedown="onLightboxMouseDown"
            @touchstart="onLightboxTouchStart"
            @touchmove="onLightboxTouchMove"
            @touchend="onLightboxTouchEnd"
          >
          
          <div class="fixed bottom-0 flex space-x-2">
            <button
              @click="ajustarZoom(0.1)"
              class="bg-gray-800 text-white p-2 rounded"
            >
              +
            </button>
            <button
              @click="ajustarZoom(-0.1)"
              class="bg-gray-800 text-white p-2 rounded"
            >
              -
            </button>
            <button
              @click="moverImagen(-10, 0)"
              class="bg-gray-800 text-white p-2 rounded"
            >
              ←
            </button>
            <button
              @click="moverImagen(10, 0)"
              class="bg-gray-800 text-white p-2 rounded"
            >
              →
            </button>
            <button
              @click="moverImagen(0, -10)"
              class="bg-gray-800 text-white p-2 rounded"
            >
              ↑
            </button>
            <button
              @click="moverImagen(0, 10)"
              class="bg-gray-800 text-white p-2 rounded"
            >
              ↓
            </button>
            <button
            @click="cerrarLightbox"
            class="bg-gray-800 text-white p-2 rounded-full"
          >
            <CerrarIcon class="w-6 h-6" />
          </button>
          </div>
        </div>
      </div>
    </div>
    <!-- Barra lateral derecha -->
    <div class="w-16 fixed right-0 top-20 bottom-0 flex flex-col justify-start items-center py-8 z-20">
      <div class="space-y-2 text-center overflow-y-auto max-h-[80vh] scrollbar-hide">
        <ul class="scrollspy-nav">
          <li
            v-for="(heading, index) in tableOfContents"
            :key="index"
            class="cursor-pointer mb-3 relative group"
          >
            <button
              @click="scrollToHeading(heading.id)"
              class="p-2 flex items-center justify-center rounded-full bg-opacity-50 hover:bg-opacity-100 transition-all duration-300"
              :class="activeHeading === heading.id ? 'bg-primary-accent' : 'bg-primary-bg'"
              :title="heading.text"
            >
              <span class="bullet-point"></span>
            </button>
            <span class="tooltip-text hidden group-hover:block absolute left-full ml-2 bg-secondary-accent p-2 rounded text-xs whitespace-nowrap">
              {{ heading.text }}
            </span>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
import { ref, onMounted, watch, nextTick, onUnmounted } from "vue";
import { useRoute } from "vue-router";
import axios from "axios";
import { marked } from "marked"; // Importa marked
import CerrarIcon from "@/assets/cerrar.svg?component";
import { soundMixin } from '@/plugins/sound';

marked.setOptions({
  breaks: true, // Enable line breaks
});

export default {
  mixins: [soundMixin],
  components: {
    CerrarIcon,
  },
  setup() {
    // Extract sound methods from mixin at the start of setup
    const { playUISound, playAlertSound } = soundMixin.methods;
    
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

    // Lightbox
    const lightboxVisible = ref(false);
    const lightboxImageSrc = ref("");
    const lightboxZoom = ref(1);
    const lightboxOffset = ref({ x: 0, y: 0 });
    const isDragging = ref(false);
    const dragStart = ref({ x: 0, y: 0 });
    const initialOffset = ref({ x: 0, y: 0 });
    const isPinching = ref(false);
    const pinchStartDistance = ref(0);
    const initialZoom = ref(1);

    const tableOfContents = ref([]);
    const activeHeading = ref('');

    // Extract headings from content and build table of contents
    const buildTableOfContents = () => {
      nextTick(() => {
        if (!contenidoRef.value) return;
        
        const headingElements = contenidoRef.value.querySelectorAll('h1, h2, h3, h4, h5, h6');
        const headings = [];
        
        headingElements.forEach((el, index) => {
          // Ensure each heading has an id
          if (!el.id) {
            el.id = `heading-${index}`;
          }
          
          headings.push({
            id: el.id,
            text: el.textContent.trim(),
            level: parseInt(el.tagName.substring(1), 10)
          });
        });
        
        tableOfContents.value = headings;
      });
    };

    // Function to scroll to a specific heading when clicked in TOC
    const scrollToHeading = (id) => {
      playUISound('ui.tap');
      const element = document.getElementById(id);
      if (element) {
        element.scrollIntoView({ behavior: 'smooth', block: 'start' });
        activeHeading.value = id;
      }
    };

    // Update active heading based on scroll position
    const updateActiveHeading = () => {
      if (!contenidoRef.value) return;
      
      const headings = tableOfContents.value;
      const scrollPosition = window.scrollY + 100; // Offset to trigger earlier
      
      for (let i = headings.length - 1; i >= 0; i--) {
        const element = document.getElementById(headings[i].id);
        if (element && element.offsetTop <= scrollPosition) {
          activeHeading.value = headings[i].id;
          return;
        }
      }
      
      // If we get here, no heading is active
      activeHeading.value = '';
    };

    const fetcharticuloById = async (id) => {
      try {
        const { data } = await axios.get(
          `https://colibriback.onrender.com/api/articulos/${id}`
        );
        articulo.value = data;

        if (typeof articulo.value.contenido === "string") {
          // Check if the string looks like a JSON object
          if (
            articulo.value.contenido.trim().startsWith("{") ||
            articulo.value.contenido.trim().startsWith("[")
          ) {
            try {
              articulo.value.contenido = JSON.parse(articulo.value.contenido);
            } catch (e) {
              console.warn(
                "⚠️ No se pudo parsear articulo.contenido, se usará como string.",
                e
              );
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
        const { data } = await axios.get(
          `https://colibriback.onrender.com/api/temas/${id}`
        );
        return data;
      } catch (error) {
        console.error("❌ Error al obtener el tema:", error);
        return null;
      }
    };

    const fetchAreaById = async (id) => {
      if (!id) return null;
      try {
        const { data } = await axios.get(
          `https://colibriback.onrender.com/api/areas/${id}`
        );
        return data;
      } catch (error) {
        console.error("❌ Error al obtener el área:", error);
        return null;
      }
    };

    const fetchGradoById = async (id) => {
      if (!id) return null;
      try {
        const { data } = await axios.get(
          `https://colibriback.onrender.com/api/grados/${id}`
        );
        return data;
      } catch (error) {
        console.error("❌ Error al obtener el grado:", error);
        return null;
      }
    };

    const abrirModal = (link) => {
      playUISound('ui.unlock');
      try {
        const url = new URL(link);
    
        // Sitios académicos que deben abrirse en nueva pestaña
        if (
          url.hostname.includes("scielo.org") || 
          url.hostname.includes("academia.edu") || 
          url.hostname.includes("franzabaleta.com") ||          
          url.hostname.includes("khanacademy.org") ||
          url.hostname.includes("banrepcultural.org") ||
          url.hostname.includes("liveworksheets.com") ||
          url.hostname.includes("humboldt.org.co") ||
          url.hostname.includes("wwf-scp.org") ||
          url.hostname.includes("researchgate.net")
        ) {
          window.open(link, "_blank");
          return;
        }
    
        // Enlaces de plataformas multimedia que se embeben directamente
        if (url.hostname.includes("spotify.com")) {
          window.open(link, "_blank");
          return;
        }
    
        if (
          url.hostname === "youtube.com" ||
          url.hostname === "www.youtube.com"
        ) {
          const videoId = url.searchParams.get("v");
          iframeSrc.value = `https://www.youtube.com/embed/${videoId}?autoplay=1&rel=0&modestbranding=1`;
        } else if (url.hostname === "youtu.be") {
          const videoId = url.pathname.substring(1);
          iframeSrc.value = `https://www.youtube.com/embed/${videoId}?autoplay=1&rel=0&modestbranding=1`;
        } else {
          // Cualquier otro enlace se muestra en el iframe dentro del lightbox
          iframeSrc.value = link;
        }
        modalVisible.value = true;
      } catch (error) {
        playAlertSound('error');
        console.error("Error al procesar la URL:", error);
        iframeSrc.value = link;
        modalVisible.value = true;
      }
    };

    const cerrarModal = () => {
      playUISound('ui.lock');
      modalVisible.value = false;
      iframeSrc.value = "";
    };

    const renderizarContenido = (contenido) => {
      if (!contenido) return "<p>Contenido no disponible</p>";

      // Check if content is already HTML
      if (contenido.trim().startsWith("<")) {
        // If it's HTML, process links and images directly
        const temp = document.createElement("div");
        temp.innerHTML = contenido;

        // Process links: Embed videos, open others in new tab
        temp.querySelectorAll("a").forEach((a) => {
          const href = a.getAttribute("href");
          if (href && (href.includes("youtube.com") || href.includes("youtu.be"))) {
            const videoId = href.includes("youtube.com")
              ? new URL(href).searchParams.get("v")
              : href.split("/").pop();
            const iframe = document.createElement("iframe");
            iframe.src = `https://www.youtube.com/embed/${videoId}?autoplay=0&rel=0&modestbranding=1`;
            iframe.classList.add("w-full", "aspect-video", "rounded", "my-4"); // Added aspect-video and margin
            iframe.setAttribute("allowfullscreen", "true");
            iframe.setAttribute("allow", "accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"); // Added recommended allow attributes
            a.replaceWith(iframe);
          } else if (href && !href.startsWith("#")) {
            a.setAttribute("target", "_blank");
            a.removeAttribute("onclick"); // Remove modal trigger
          }
        });

        // Add lightbox functionality to images
        temp.querySelectorAll("img").forEach((img) => {
          img.classList.add("cursor-pointer");
          img.onclick = () => abrirLightbox(img.src);
        });

        return temp.innerHTML;
      }

      // Process Markdown content
      let contenidoLimpio = contenido.replace(/\\n/g, "\n");
      const campoRegex = /^".+?":\s*"(.*)"$/s;
      const match = contenidoLimpio.match(campoRegex);
      if (match) {
        contenidoLimpio = match[1];
      }

      let htmlContent = marked(contenidoLimpio);
      const temp = document.createElement("div");
      temp.innerHTML = htmlContent;

      // Agrupar nodos en tarjetas a partir de cada título H1/H2
      const container = document.createElement("div");
      let currentCard = null;
      Array.from(temp.childNodes).forEach((node) => {
        if (
          node.nodeType === Node.ELEMENT_NODE &&
          /^H[1-2]$/.test(node.tagName)
        ) {
          if (currentCard) {
            container.appendChild(currentCard);
          }
          currentCard = document.createElement("div");
          currentCard.classList.add("card", "mb-4", "break-inside-avoid"); // Added some card styling
          currentCard.appendChild(node.cloneNode(true));
        } else {
          // If no card started yet (content before first H1/H2), create a default one
          if (!currentCard && node.textContent.trim()) {
             currentCard = document.createElement("div");
             currentCard.classList.add("card", "mb-4", "p-4", "bg-white", "bg-opacity-75", "rounded", "shadow", "break-inside-avoid");
          }
          // Append node to the current card if it exists
          if (currentCard) {
            currentCard.appendChild(node.cloneNode(true));
          } else {
             // If node is not whitespace and no card exists, append directly (should ideally not happen with card logic)
             if (node.textContent.trim()) {
                container.appendChild(node.cloneNode(true));
             }
          }
        }
      });
      if (currentCard) {
        container.appendChild(currentCard); // Append the last card
      }

      // Process links and images within the final container structure
      container.querySelectorAll("a").forEach((a) => {
        const href = a.getAttribute("href");
        if (!href) return;
        
        try {
          // Check if it's an internal anchor link
          if (href.startsWith("#")) {
            // Keep internal links as they are
            return;
          }
          
          const url = new URL(href);
          
          // Enlaces de YouTube se embeben directamente
          if (url.hostname.includes("youtube.com") || url.hostname.includes("youtu.be")) {
            const videoId = url.hostname.includes("youtube.com")
              ? url.searchParams.get("v")
              : url.pathname.split("/").pop();
            
            if (videoId) {
              const iframe = document.createElement("iframe");
              iframe.src = `https://www.youtube.com/embed/${videoId}?autoplay=0&rel=0&modestbranding=1`;
              iframe.classList.add("w-full", "aspect-video", "rounded", "my-4");
              iframe.setAttribute("allowfullscreen", "true");
              iframe.setAttribute("allow", "accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share");
              
              if (a.parentElement.tagName === 'P' && a.parentElement.textContent.trim() === a.textContent.trim()) {
                a.parentElement.replaceWith(iframe);
              } else {
                a.replaceWith(iframe);
              }
            }
          } 
          // Sitios académicos que se abren en nueva pestaña
          else if (
            url.hostname.includes("scielo.org") || 
            url.hostname.includes("academia.edu") || 
            url.hostname.includes("banrepcultural.org") ||
            url.hostname.includes("researchgate.net") ||
            url.hostname.includes("spotify.com")
          ) {
            a.setAttribute("target", "_blank");
            a.setAttribute("rel", "noopener noreferrer");
          } 
          // Cualquier otro enlace externo se muestra en el modal con iframe
          else {
            // Mark the link with a data attribute that we'll use for delegation
            a.setAttribute("data-modal-link", href);
            a.setAttribute("href", "#");
            a.classList.add("modal-link");
            a.style.cursor = "pointer";
            a.style.textDecoration = "underline";
          }
        } catch (e) {
          console.warn("Error al procesar URL en enlace:", href, e);
          
          // For invalid URLs, still open in modal
          a.setAttribute("data-modal-link", href);
          a.setAttribute("href", "#");
          a.classList.add("modal-link");
          a.style.cursor = "pointer";
        }
      });

      // Add lightbox functionality to images within the final container
      container.querySelectorAll("img").forEach((img) => {
        img.classList.add("cursor-pointer", "my-4", "rounded", "shadow"); // Added margin, rounded, shadow
        img.onclick = () => abrirLightbox(img.src);
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
      playUISound('ui.unlock');
      lightboxImageSrc.value = src;
      lightboxVisible.value = true;
      lightboxZoom.value = 1;
      lightboxOffset.value = { x: 0, y: 0 };
    };

    const cerrarLightbox = () => {
      playUISound('ui.lock');
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

    // Add a delegate event listener for modal links
    const attachModalLinkListeners = () => {
      if (contenidoRef.value) {
        // Remove previous listener to avoid duplicates if re-attaching
        contenidoRef.value.removeEventListener("click", handleModalLinkClick); 
        contenidoRef.value.addEventListener("click", handleModalLinkClick);
      }
    };

    // Define the handler function separately
    const handleModalLinkClick = (event) => {
      let target = event.target;
      while (target && target !== contenidoRef.value) {
        if (target.hasAttribute && target.hasAttribute("data-modal-link")) {
          event.preventDefault();
          const href = target.getAttribute("data-modal-link");
          if (href) {
            abrirModal(href);
          }
          return; // Stop propagation and further checks
        }
        target = target.parentElement;
      }
    };

    // Exponer la función abrirModal globalmente para que los enlaces puedan acceder a ella
    // REMOVE OR COMMENT OUT this line if abrirModal is ONLY for non-video links handled outside renderizarContenido
    // window.abrirModalArticulo = (href) => {
    //   // Check if it's a video link, if so, do nothing as it should be embedded
    //   try {
    //     const url = new URL(href);
    //     if (url.hostname.includes("youtube.com") || url.hostname.includes("youtu.be")) {
    //       console.warn("Attempted to open YouTube link in modal, but it should be embedded.");
    //       return;
    //     }
    //   } catch (e) { /* Ignore invalid URLs for this check */ }
    //   abrirModal(href);
    // };

    // **Corrected Hash Handling**
    const scrollToHeadingByText = (hashText) => {
      if (!hashText) return;
      nextTick(() => {
        // Buscar el elemento cuyo texto contenga ese hash
        const headings = document.querySelectorAll("h1, h2, h3, h4, h5, h6");
        for (const heading of headings) {
          if (
            heading.textContent
              .trim()
              .toLowerCase()
              .includes(hashText.toLowerCase())
          ) {
            heading.scrollIntoView({ behavior: "smooth" });
            break; // Stop after finding the first match
          }
        }
      });
    };

    watch(
      () => route.hash,
      (newHash) => {
        const hashText = decodeURIComponent(newHash.substring(1));
        scrollToHeadingByText(hashText);
      }
    );

    onMounted(async () => {
      const articuloId = route.params.id;
      await fetcharticuloById(articuloId);

      try {
        const tema = await fetchTemaById(articulo.value.tema_id);
        temaNombre.value = tema?.nombre || "Sin Tema";

        const area = await fetchAreaById(
          tema?.area_id || articulo.value.area_id
        );
        areaNombre.value = area?.nombre || "Sin Área";

        const grado = await fetchGradoById(
          area?.grado_id || articulo.value.grado_id
        );
        gradoNombre.value = grado?.nombre || "Desconocido";
      } catch (error) {
        console.error(
          "❌ Error al obtener nombres de grado, área y tema:",
          error
        );
      }

      // Initial scroll on mount
      if (route.hash) {
        const hashText = decodeURIComponent(route.hash.substring(1));
        scrollToHeadingByText(hashText);
      }

      nextTick(() => {
        obtenerPrimeraImagen();
        attachLightboxListeners();
        attachModalLinkListeners(); // Initial attachment
        buildTableOfContents();
        // Add scroll event listener to update active heading
        window.addEventListener('scroll', updateActiveHeading);
      });
    });

    // Watch for content changes to rebuild TOC and re-attach listeners
    watch(() => articulo.value.contenido, () => {
      nextTick(() => {
        // Re-attach listeners after content is updated by v-html
        attachLightboxListeners(); 
        attachModalLinkListeners(); 
        buildTableOfContents();
        obtenerPrimeraImagen(); // Also re-check for first image
      });
    });

    // Clean up event listener
    onUnmounted(() => {
      window.removeEventListener('scroll', updateActiveHeading);
      // Clean up modal link listener
      if (contenidoRef.value) {
        contenidoRef.value.removeEventListener("click", handleModalLinkClick);
      }
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
      playUISound,
      playAlertSound,
      tableOfContents,
      activeHeading,
      scrollToHeading,
      attachLightboxListeners,
    };
  },
};
</script>

<style scoped>
.scrollspy-nav {
  list-style-type: none;
  padding: 0;
}

.bullet-point {
  width: 8px;
  height: 8px;
  border-radius: 50%;
  background-color: var(--primary-text);
  display: block;
}

.tooltip-text {
  color: var(--primary-text);
  z-index: 100;
  max-width: 200px;
  overflow: hidden;
  text-overflow: ellipsis;
}

.scrollbar-hide::-webkit-scrollbar {
  display: none;
}

.scrollbar-hide {
  -ms-overflow-style: none;
  scrollbar-width: none;
}
</style>
