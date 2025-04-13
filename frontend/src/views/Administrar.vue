<template>
  <div class="h-screen w-full flex overflow-y-auto">
    <!-- Barra lateral izquierda -->
    <div class="w-16 flex flex-col justify-center items-center space-y-6">
      <div class="space-y-4 text-center">
        <button class="p-2" @click="nuevoarticulo">
          <new-icon class="w-6 h-6" />
        </button>
        <!-- Se pueden agregar botones para edición de filtros si se requiere -->
      </div>
    </div>
    <!-- Contenido principal -->
    <div class="flex-1 flex flex-col py-4 overflow-hidden pt-24 overflow-y-auto">
      <!-- Buscador -->
      <div class="flex items-center justify-center mb-4">
        <input
          type="text"
          v-model="searchQuery"
          placeholder="Buscar articulo..."
          class="w-1/2 p-3"
        />
      </div>
      <div class="overflow-y-auto">
        <!-- Filtros interactivos -->
        <div class="mt-6 space-y-4">
          <!-- Filtro de Grados -->
          <div class="flex items-center gap-6 justify-center">
              <h2 class="text-xl font-semibold">Grados</h2>
              <button @click="editarGrado" class="p-1">
                <edit-icon class="w-4 h-4" />
              </button>
            </div>
          <div class="cinta-horizontal relative">
            <div class="loop-content flex space-x-2">
              <button
                v-for="gradoName in gradoNames"
                :key="gradoName"
                @click="toggleFilter('grados', gradoName)"
                :class="{
                  'btn-filtro-activo': activeFilters.grados === gradoName,
                  'btn-filtro': activeFilters.grados !== gradoName
                }"
              >
                {{ gradoName }}
              </button>
            </div>
          </div>
          <!-- Filtro de Áreas -->
          <div class="flex items-center gap-6 justify-center">
              <h3 class="text-lg font-semibold">Áreas</h3>
              <button @click="editarArea" class="p-1">
                <edit-icon class="w-4 h-4" />
              </button>
            </div>
          <div class="cinta-horizontal relative">
            <div class="loop-content flex space-x-2">
              <button
                v-for="areaName in filteredAreaNames"
                :key="areaName"
                @click="toggleFilter('areas', areaName)"
                :class="{
                  'btn-filtro-activo': activeFilters.areas !== areaName,
                  'btn-filtro': activeFilters.areas === areaName
                }"
              >
                {{ areaName }}
              </button>
            </div>
          </div>
          <!-- Filtro de Temas -->
          <div class="flex items-center gap-6 justify-center">
              <h4 class="text-base font-semibold">Temas</h4>
              <button @click="editarTema" class="p-1">
                <edit-icon class="w-4 h-4" />
              </button>
            </div>
          <div class="cinta-horizontal relative">
            <div class="loop-content flex space-x-2">
              <button
                v-for="temaName in filteredTemaNames"
                :key="temaName"
                @click="toggleFilter('temas', temaName)"
                :class="{
                  'btn-filtro-activo': activeFilters.temas === temaName,
                  'btn-filtro': activeFilters.temas !== temaName
                }"
              >
                {{ temaName }}
              </button>
            </div>
          </div>
        </div>
        <!-- Tarjetas de articulos -->
        <div class="mt-8 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          <div v-for="articulo in filteredarticulos" :key="articulo.id" class="card p-4">
            <h2><router-link :to="`/articulo/${articulo.id}`" class="">
              {{ articulo.nombre }}
            </router-link></h2>
            <p class="">
              <u>Grado:</u> {{ articulo.gradoNombre }}<br />
              <u>Área:</u> {{ articulo.areaNombre }}<br />
              <u>Tema:</u> {{ articulo.temaNombre }}
            </p>
            <!-- Botones de Acciones CRUD -->
            <div class="flex space-x-2 mt-2">
              <button class="" @click="editararticulo(articulo)">
                <edit-icon class="w-4 h-4" />
              </button>
              <button class="" @click="confirmarEliminacion(articulo.id)">
                <delete-icon class="w-4 h-4" />
              </button>
              <button class="" @click="duplicararticulo(articulo.id)">
                <new-icon class="w-4 h-4" />
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Barra lateral derecha -->
    <div class="w-16 flex flex-col justify-center items-center space-y-6">
      <div class="space-y-4 text-center">
        <button class="p-2" @click="mostrarImportarModal = true">
          <import-icon class="w-6 h-6 text-white-500" />
        </button>
        <button class="p-2">
          <print-icon class="w-6 h-6 text-white-500" />
        </button>
        <button class="p-2" @click="abrirExportarModal">
          <export-icon class="w-6 h-6 text-white-500" />
        </button>
      </div>
    </div>
  </div>
  <!-- Modal para formulario de edición/creación de artículo -->
  <div v-if="mostrarModal" class="modal-overlay fixed inset-0 flex items-center justify-center">
    <div class="modal-contenido h-3/4 p-6 rounded-lg w-3/4 relative">
      <h2 class="text-xl font-bold mb-4">
        {{ articuloEditando.id ? 'Editar Artículo' : 'Nuevo Artículo' }}
      </h2>
      <div class="mb-4">
        <label class="block mb-1">Título</label>
        <input type="text" v-model="articuloEditando.nombre" class="w-full border px-3 py-2 rounded" />
      </div>
      <div class="mb-4">
        <label class="block mb-1">Contenido</label>
        <div id="editor" ref="editorRef" class="w-full border rounded min-h-[150px]"></div>
      </div>
      <div class="mb-4">
        <label class="block mb-1">Grado</label>
        <select v-model="articuloEditando.gradoId" class="w-full border px-3 py-2 rounded">
          <option v-for="grado in gradoNames" :key="grado" :value="gradoMap[grado]">
            {{ grado }}
          </option>
        </select>
      </div>
      <div class="mb-4">
        <label class="block mb-1">Área</label>
        <select v-model="articuloEditando.areaId" class="w-full border px-3 py-2 rounded">
          <option v-for="area in areaNames" :key="area" :value="areaMap[area]">
            {{ area }}
          </option>
        </select>
      </div>
      <div class="mb-4">
        <label class="block mb-1">Tema</label>
        <select v-model="articuloEditando.temaId" class="w-full border px-3 py-2 rounded">
          <option v-for="tema in temaNames" :key="tema" :value="temaMap[tema]">
            {{ tema }}
          </option>
        </select>
      </div>
      <div class="flex justify-end space-x-2">
        <button class="bg-gray-300 text-black px-4 py-2 rounded" @click="mostrarModal = false">Cancelar</button>
        <button class="bg-blue-500 text-white px-4 py-2 rounded" @click="guardararticulo()">Guardar</button>
      </div>
    </div>
  </div>
  <!-- Mover el modal de importación fuera del modal de edición -->
  <div v-if="mostrarImportarModal" class="modal-overlay fixed inset-0 flex items-center justify-center">
    <div class="modal-contenido h-3/4 p-6 rounded-lg w-3/4 relative">
      <h2 class="text-xl font-bold mb-4">Importar contenido de artículos</h2>
      <p class="mb-4">
        Adjunta un archivo en formato Markdown con el nombre estructurado como 
        <strong>"nombre_del_grado-nombre_del_area.md"</strong>. El contenido debe seguir este formato:
      </p>
      <pre class="p-4 rounded text-sm mb-4">
        ### Tema
        Nombre del Tema
        #### Artículo (Subtema)
        Nombre del Artículo
        ---articulo---
        Contenido completo del artículo en formato markdown con elementos en html
        ---articulo---
      </pre>
      <div class="mb-4">
        <label class="block mb-1">Archivo Markdown</label>
        <input type="file" @change="procesarArchivo" accept=".md" class="w-full border px-3 py-2 rounded" />
      </div>
      <div v-if="progresoImportacion > 0" class="mb-4">
        <p>Progreso de importación: {{ progresoImportacion }}%</p>
        <div class="w-full bg-gray-200 rounded-full h-4">
          <div class="bg-blue-500 h-4 rounded-full" :style="{ width: progresoImportacion + '%' }"></div>
        </div>
      </div>
      <div class="flex justify-end space-x-2">
        <button class="bg-gray-300 text-black px-4 py-2 rounded" @click="mostrarImportarModal = false">Cancelar</button>
      </div>
    </div>
  </div>
  <!-- Add this new modal at the end, before closing template tag -->
  <div v-if="mostrarExportarModal" class="modal-overlay fixed inset-0 flex items-center justify-center">
    <div class="modal-contenido h-auto p-6 rounded-lg w-3/4 bg-white relative">
      <h2 class="text-xl font-bold mb-4">Exportar contenido de artículos</h2>
      <div class="mb-4">
        <label class="block mb-1">Selecciona Grado</label>
        <select v-model="exportGrado" class="w-full border px-3 py-2 rounded">
          <option disabled value="">Seleccione un grado</option>
          <option v-for="grado in gradoNames" :key="grado" :value="grado">
            {{ grado }}
          </option>
        </select>
      </div>
      <div class="mb-4" v-if="exportGrado">
        <label class="block mb-1">Selecciona Área</label>
        <select v-model="exportArea" class="w-full border px-3 py-2 rounded">
          <option disabled value="">Seleccione un área</option>
          <option v-for="area in exportAreaNames" :key="area" :value="area">
            {{ area }}
          </option>
        </select>
      </div>
      <div class="flex justify-end space-x-2 mt-4">
        <button class="bg-gray-300 text-black px-4 py-2 rounded" @click="mostrarExportarModal = false">Cancelar</button>
        <button class="bg-blue-500 text-white px-4 py-2 rounded" @click="exportarTodo">Exportar todo</button>
        <button class="bg-blue-500 text-white px-4 py-2 rounded" @click="exportarMarkdown" :disabled="!exportGrado || !exportArea">
          Exportar selección
        </button>
      </div>
    </div>
  </div>
</template>

<script>
import { ref, computed, onMounted, onBeforeUnmount, watch, nextTick } from "vue";
import '@toast-ui/editor/dist/toastui-editor.css';
import Editor from '@toast-ui/editor';
import { soundMixin } from '@/plugins/sound';
import { parseMarkdownFile } from '@/utils/markdownImporter'; // Import helper script
import { generateMarkdown, generateAllMarkdowns } from '@/utils/markdownExporter'; // Add new import for markdownExporter
import JSZip from 'jszip'; // Add this import

export default {
  mixins: [soundMixin],
  setup() {
    const { playUISound, playAlertSound } = soundMixin.methods;

    const searchQuery = ref("");
    const articulos = ref([]);
    const gradoNames = ref([]);
    const areaNames = ref([]);
    const temaNames = ref([]);
    const activeFilters = ref({ grados: null, areas: null, temas: null });

    const mostrarModal = ref(false);
    const articuloEditando = ref({
      id: null,
      nombre: "",
      contenido: "<p>Escribe aquí...</p>",
      gradoId: null,
      areaId: null,
      temaId: null
    });
    const editor = ref(null);
    const editorRef = ref(null);

    const mostrarImportarModal = ref(false);
    const progresoImportacion = ref(0);

    const abrirImportarModal = () => {
      mostrarImportarModal.value = true;
    };

    const initEditor = (content = "<p>Escribe aquí...</p>") => {
      if (editorRef.value) {
        try {
          if (editor.value) {
            editor.value.destroy();
          }

          editor.value = new Editor({
            el: editorRef.value,
            height: '300px',
            initialEditType: 'markdown', // Usar solo Markdown
            previewStyle: 'vertical',
            initialValue: content,
            events: {
              change: () => {
                try {
                  actualizarContenido();
                } catch (error) {
                  console.error('Error al actualizar contenido:', error);
                }
              },
            }
          });
        } catch (error) {
          console.error('Error al inicializar el editor:', error);
        }
      }
    };

    const actualizarContenido = () => {
      if (!editor.value) return;

      try {
        // Obtener siempre el contenido como Markdown
        let content = editor.value.getMarkdown();
        if (content && typeof content === 'string') {
          articuloEditando.value.contenido = content;
        }
      } catch (error) {
        console.error('Error al obtener el contenido del editor:', error);
      }
    };

    onMounted(() => {
      fetchAllData();
    });

    onBeforeUnmount(() => {
      if (editor.value) {
        editor.value.destroy();
        editor.value = null;
      }
    });

    const confirmarEliminacion = (id) => {
      if (confirm("¿Estás seguro de que quieres eliminar este articulo?")) {
        eliminararticulo(id);
      }
    };

    const eliminararticulo = async (id) => {
      try {
        const token = localStorage.getItem("token");
        const response = await fetch(`https://colibriback.onrender.com/api/articulos/${id}`, {
          method: "DELETE",
          headers: {
            "Authorization": token ? `Bearer ${token}` : ""
          }
        });
        if (!response.ok) throw new Error("No se pudo eliminar el articulo");
        playAlertSound('success');
        alert("Artículo eliminado con éxito");
        fetchAllData();
      } catch (error) {
        playAlertSound('error');
        console.error("Error al eliminar el articulo", error);
        alert("No se pudo eliminar el articulo");
      }
    };

    const duplicararticulo = async (id) => {
      try {
        const token = localStorage.getItem("token");
        const response = await fetch(`https://colibriback.onrender.com/api/articulos/${id}`, {
          headers: { "Authorization": token ? `Bearer ${token}` : "" }
        });
        if (!response.ok) throw new Error("No se pudo obtener el articulo para duplicar");
        const articuloOriginal = await response.json();
        const nuevoarticuloData = {
          ...articuloOriginal,
          id: null,
          titulo: `${articuloOriginal.titulo} (Copia)`,
        };
        const createResponse = await fetch("https://colibriback.onrender.com/api/articulos", {
          method: "POST",
          headers: { 
            "Content-Type": "application/json",
            "Authorization": token ? `Bearer ${token}` : ""
          },
          body: JSON.stringify(nuevoarticuloData),
        });
        if (!createResponse.ok) throw new Error("No se pudo duplicar el articulo");
        alert("Artículo duplicado con éxito");
        fetchAllData();
      } catch (error) {
        console.error("Error al duplicar el articulo", error);
        alert("No se pudo duplicar el articulo");
      }
    };

    const fetchAllData = async () => {
      try {
        const resarticulos = await fetch("https://colibriback.onrender.com/api/articulos").then(r => r.json());
        const resTemas = await fetch("https://colibriback.onrender.com/api/temas").then(r => r.json());
        const resAreas = await fetch("https://colibriback.onrender.com/api/areas").then(r => r.json());
        const resGrados = await fetch("https://colibriback.onrender.com/api/grados").then(r => r.json());
        // Mapear nombres desde cada respuesta
        gradoNames.value = [...new Set(resGrados.map(g => g.nombre))];
        areaNames.value = [...new Set(resAreas.map(a => a.nombre))];
        temaNames.value = [...new Set(resTemas.map(t => t.nombre))];
        // Actualizar los mapas usando las tablas originales, no artículos
        gradoMap.value = {};
        resGrados.forEach(g => { gradoMap.value[g.nombre] = g.id; });
        areaMap.value = {};
        resAreas.forEach(a => { areaMap.value[a.nombre] = a.id; });
        temaMap.value = {};
        resTemas.forEach(t => { temaMap.value[t.nombre] = t.id; });
        // Mapear artículos usando datos ya obtenidos
        articulos.value = resarticulos.map(st => {
          const tema = resTemas.find(t => t.id === st.tema_id) || {};
          const area = resAreas.find(a => a.id === st.area_id) || {};
          const grado = resGrados.find(g => g.id === st.grado_id) || {};
          return {
            ...st,
            nombre: st.titulo,
            temaNombre: tema.nombre || "Sin Tema",
            areaNombre: area.nombre || "Sin Área",
            gradoNombre: grado.nombre || "Desconocido",
            temaId: tema.id,
            areaId: area.id,
            gradoId: grado.id,
            contenido: st.contenido || "<p>Escribe aquí...</p>"
          };
        });
      } catch (error) {
        console.error("Error al cargar datos", error);
      }
    };

    const toggleFilter = (type, name) => {
      activeFilters.value[type] = activeFilters.value[type] === name ? null : name;
      if (type === "grados") {
        activeFilters.value.areas = null;
        activeFilters.value.temas = null;
      }
      if (type === "areas") {
        activeFilters.value.temas = null;
      }
    };

    const filteredarticulos = computed(() => {
      let result = articulos.value;
      if (activeFilters.value.grados) {
        result = result.filter(st => st.gradoNombre === activeFilters.value.grados);
      }
      if (activeFilters.value.areas) {
        result = result.filter(st => st.areaNombre === activeFilters.value.areas);
      }
      if (activeFilters.value.temas) {
        result = result.filter(st => st.temaNombre === activeFilters.value.temas);
      }
      if (searchQuery.value) {
        const q = searchQuery.value.toLowerCase();
        result = result.filter(st => st.nombre.toLowerCase().includes(q));
      }
      return result;
    });

    const filteredAreaNames = computed(() => {
      if (!activeFilters.value.grados) return areaNames.value;
      const articulosGrado = articulos.value.filter(st => st.gradoNombre === activeFilters.value.grados);
      return [...new Set(articulosGrado.map(st => st.areaNombre))];
    });

    const filteredTemaNames = computed(() => {
      if (!activeFilters.value.areas) return temaNames.value;
      const articulosArea = articulos.value.filter(st => st.areaNombre === activeFilters.value.areas);
      return [...new Set(articulosArea.map(st => st.temaNombre))];
    });

    const gradoMap = ref({});
    const areaMap = ref({});
    const temaMap = ref({});
    const actualizarMapas = () => {
      gradoMap.value = {};
      areaMap.value = {};
      temaMap.value = {};
      articulos.value.forEach(st => {
        gradoMap.value[st.gradoNombre] = st.gradoId;
        areaMap.value[st.areaNombre] = st.areaId;
        temaMap.value[st.temaNombre] = st.temaId;
      });
    };

    const editararticulo = (articulo) => {
      playUISound('ui.unlock');
      articuloEditando.value = {
        id: articulo.id,
        nombre: articulo.nombre,
        contenido: articulo.contenido || "<p>Escribe aquí...</p>",
        gradoId: articulo.gradoId,
        areaId: articulo.areaId,
        temaId: articulo.temaId,
      };
      mostrarModal.value = true;
      nextTick(() => {
        initEditor(articuloEditando.value.contenido);
      });
    };

    const nuevoarticulo = () => {
      playUISound('ui.tap');
      articuloEditando.value = {
        id: null,
        nombre: "",
        contenido: "<p>Escribe aquí...</p>",
        gradoId: null,
        areaId: null,
        temaId: null
      };
      mostrarModal.value = true;
      nextTick(() => {
        initEditor(articuloEditando.value.contenido);
      });
    };

    const guardararticulo = async (overrideData = null) => {
      // Check if overrideData is an event object
      if (overrideData instanceof Event) {
        console.log("Evento detectado, usando articuloEditando directamente");
        overrideData = null;
      }
      
      const dataToSave = overrideData || articuloEditando.value;
      console.log("Datos a guardar:", dataToSave);
      
      if (!dataToSave) {
        console.error("Error: No hay datos para guardar");
        alert("Error: No hay datos para guardar");
        return;
      }
      
      // Asegurar que nombre sea una cadena, o usar cadena vacía como fallback
      const nombre = (dataToSave.nombre || "").toString();
      
      if (!nombre.trim()) {
        alert("El nombre del artículo es obligatorio");
        return;
      }
      
      try {
        if (!overrideData) {
          await new Promise(resolve => setTimeout(resolve, 200));
          actualizarContenido();
        }
        const metodo = dataToSave.id ? "PUT" : "POST";
        const url = dataToSave.id
          ? `https://colibriback.onrender.com/api/articulos/${dataToSave.id}`
          : "https://colibriback.onrender.com/api/articulos";
        const token = localStorage.getItem("token");
        
        // Validar que los IDs sean valores válidos o null
        const grado_id = dataToSave.gradoId || null;
        const area_id = dataToSave.areaId || null;
        const tema_id = dataToSave.temaId || null;
        
        // Asegurar que el contenido sea una cadena válida
        const contenido = (dataToSave.contenido && typeof dataToSave.contenido === 'string') 
          ? dataToSave.contenido.trim() || "<p>Escribe aquí...</p>" 
          : "<p>Escribe aquí...</p>";
        
        const response = await fetch(url, {
          method: metodo,
          headers: {
            "Content-Type": "application/json",
            "Authorization": token ? `Bearer ${token}` : ""
          },
          body: JSON.stringify({
            id: dataToSave.id,
            titulo: nombre,  // FIXED: Changed from "nombre" to the correctly defined variable "nombre"
            contenido: contenido,
            grado_id: grado_id,
            area_id: area_id,
            tema_id: tema_id,
            usuario_id: localStorage.getItem("usuario_id") || 1,
          }),
        });
        if (!response.ok) throw new Error("Error al guardar el articulo");
        playAlertSound('success'); // Added this line from old version
        alert("Artículo guardado con éxito");
        mostrarModal.value = false;
        fetchAllData();
      } catch (error) {
        playAlertSound('error'); // Added this line from old version
        console.error("Error al guardar el articulo", error);
        alert("Hubo un error al guardar el articulo");
      }
    };

    const procesarArchivo = async (event) => {
      const file = event.target.files[0];
      if (!file) return;
      
      console.log("[Importación] Archivo seleccionado:", file.name);
      
      try {
        const content = await file.text();
        console.log("[Importación] Contenido del archivo leído correctamente.");
        
        const parsedData = parseMarkdownFile(content);
        console.log("[Importación] Datos parseados:", parsedData);
        
        for (let i = 0; i < parsedData.length; i++) {
          const { tema, articulo, contenido } = parsedData[i];
          console.log(`[Importación] Procesando registro ${i + 1}: Artículo "${articulo || 'Sin nombre'}" del tema "${tema || 'Sin tema'}"`);
          
          // Verificar que el artículo tiene un nombre
          if (!articulo) {
            console.warn("[Importación] Se encontró un artículo sin nombre, omitiendo...");
            continue;
          }
          
          const existingArticulo = articulos.value.find(a => a.nombre === articulo);
      
          if (existingArticulo) {
            console.log(`[Importación] Artículo "${articulo}" ya existe.`);
            // Si el contenido importado es idéntico al existente, se salta sin preguntar
            if (contenido && contenido.trim() === existingArticulo.contenido.trim()) {
              console.log(`[Importación] El contenido del artículo "${articulo}" es idéntico; se omite su actualización.`);
            } else {
              const replace = confirm(`El artículo "${articulo}" ya existe. ¿Deseas reemplazar su contenido?`);
              console.log(`[Importación] Decisión de reemplazo para "${articulo}":`, replace);
              if (replace) {
                await guardararticulo({
                  ...existingArticulo,
                  contenido: contenido && contenido.trim() ? contenido : existingArticulo.contenido,
                  temaId: (tema && temaMap.value[tema]) || existingArticulo.temaId,
                });
                console.log(`[Importación] Contenido del artículo "${articulo}" reemplazado.`);
              } else {
                console.log(`[Importación] Se omite el reemplazo del artículo "${articulo}".`);
              }
            }
          } else {
            // For new articles, use the imported fields
            await guardararticulo({
              id: null,
              nombre: articulo,
              contenido: contenido && contenido.trim() ? contenido : "<p>Escribe aquí...</p>",
              temaId: tema && temaMap.value && temaMap.value[tema] ? temaMap.value[tema] : null,
              gradoId: null, // No podemos asignar automáticamente
              areaId: null,  // No podemos asignar automáticamente
            });
            console.log(`[Importación] Nuevo artículo "${articulo}" creado.`);
          }
      
          progresoImportacion.value = Math.round(((i + 1) / parsedData.length) * 100);
          console.log(`[Importación] Progreso actual: ${progresoImportacion.value}%`);
        }
      
        console.log("[Importación] Proceso completado con éxito");
        alert('Importación completada con éxito');
        progresoImportacion.value = 0;
        mostrarImportarModal.value = false;
        fetchAllData();
      } catch (error) {
        console.error('[Importación] Error durante el procesamiento del archivo:', error);
        alert('Hubo un error al procesar el archivo');
      }
    };

    // Funciones dummy para editar entidades de filtros
    const editarGrado = () => {
      alert("Funcionalidad para editar grados no implementada todavía");
    };
    const editarArea = () => {
      alert("Funcionalidad para editar áreas no implementada todavía");
    };
    const editarTema = () => {
      alert("Funcionalidad para editar temas no implementada todavía");
    };

    // Add new reactive variables for export
    const mostrarExportarModal = ref(false);
    const exportGrado = ref("");
    const exportArea = ref("");
    
    // Add computed property for filtered areas
    const exportAreaNames = computed(() => {
      const areas = articulos.value
        .filter(a => a.gradoNombre === exportGrado.value)
        .map(a => a.areaNombre);
      return [...new Set(areas)];
    });

    // Add export related functions
    const abrirExportarModal = () => {
      exportGrado.value = "";
      exportArea.value = "";
      mostrarExportarModal.value = true;
    };

    const exportarMarkdown = () => {
      if (!exportGrado.value || !exportArea.value) return;
      
      const mdContent = generateMarkdown(articulos.value, exportGrado.value, exportArea.value);
      if (!mdContent) {
        alert("No hay artículos para exportar con esos criterios.");
        return;
      }

      const filename = `grado_${exportGrado.value.replace(/\s+/g, '_').toLowerCase()}-${exportArea.value.replace(/\s+/g, '_').toLowerCase()}.md`;
      const blob = new Blob([mdContent], { type: "text/markdown;charset=utf-8" });
      const url = URL.createObjectURL(blob);
      const a = document.createElement("a");
      a.href = url;
      a.download = filename;
      document.body.appendChild(a);
      a.click();
      document.body.removeChild(a);
      URL.revokeObjectURL(url);
      mostrarExportarModal.value = false;
    };

    const exportarTodo = async () => {
      try {
        const files = generateAllMarkdowns(articulos.value);
        if (!files.length) {
          alert("No hay artículos para exportar");
          return;
        }

        const zip = new JSZip();
        files.forEach(file => {
          zip.file(file.filename, file.content);
        });

        const content = await zip.generateAsync({ type: "blob" });
        const url = URL.createObjectURL(content);
        const a = document.createElement("a");
        a.href = url;
        a.download = "colibri_todos_los_articulos.zip";
        document.body.appendChild(a);
        a.click();
        document.body.removeChild(a);
        URL.revokeObjectURL(url);
        mostrarExportarModal.value = false;
      } catch (error) {
        console.error("Error al crear archivo ZIP:", error);
        alert("Error al crear el archivo ZIP");
      }
    };

    watch(mostrarModal, (newVal) => {
      if (!newVal && editor.value) {
        editor.value.destroy();
        editor.value = null;
      }
    });

    watch(() => articuloEditando.value.contenido, () => {
      // Force update if needed
    }, { deep: true });

    return {
      searchQuery,
      articulos,
      gradoNames,
      areaNames,
      temaNames,
      activeFilters,
      filteredarticulos,
      filteredAreaNames,
      filteredTemaNames,
      toggleFilter,
      editararticulo,
      nuevoarticulo,
      guardararticulo,
      mostrarModal,
      articuloEditando,
      editorRef,
      editor,
      actualizarContenido,
      confirmarEliminacion,
      eliminararticulo,
      duplicararticulo,
      gradoMap,
      areaMap,
      temaMap,
      editarGrado,
      editarArea,
      editarTema,
      playUISound,
      playAlertSound,
      mostrarImportarModal,
      abrirImportarModal,
      progresoImportacion,
      procesarArchivo,
      mostrarExportarModal,
      exportGrado,
      exportArea,
      exportAreaNames,
      abrirExportarModal,
      exportarMarkdown,
      exportarTodo,
    };
  }
};
</script>

<style>
/* Estilos para los botones de filtro */
.btn-filtro {
  @apply px-4 py-2 transition-colors;
  border-radius: 100px;
  border-bottom-right-radius: 0; 
}

.btn-filtro-activo {
  @apply px-4 py-2 transition-colors;
}

/* Estilos adicionales para el editor */
.toastui-editor-defaultUI {
  border-radius: 0.375rem;
}

/* Asegurarse de que el contenedor del editor tenga altura mínima */
#editor {
  min-height: 300px;
}
</style>

