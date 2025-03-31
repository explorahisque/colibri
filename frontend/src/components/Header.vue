<template>
  <header>
    <!-- Barra de Navegación para Pantallas Grandes y Medianas -->
    <nav class="barra-superior-desktop shadow-md w-full top-0 left-0 fixed hidden md:block z-40">
      <div class="max-w-5xl mx-auto flex justify-between p-4 items-center">
        <router-link to="/" class="text-xl font-bold flex items-center">
          <button class="logo align-middle boton-icono" aria-label="Inicio">
            <user-book-icon class="w-11 h-11 text-white-500" />
          </button>
          <span class="ml-2">Co-Libri Learning</span>
        </router-link>

        <div class="space-x-4 flex items-center">
          <button v-if="usuario" @click="handleNavigation('/contenidos')" class="boton-icono" aria-label="Contenidos">
            <book-icon class="w-11 h-11 text-white-500" />
            <span class="tooltip">Contenidos</span>
          </button>

          <button v-if="usuario" @click="handleNavigation('/perfil')" class="boton-icono" aria-label="Perfil de usuario">
            <user-icon class="w-11 h-11 text-white-500" />
            <span class="tooltip">Perfil</span>
          </button>

          <button v-if="esAdmin" @click="handleNavigation('/administrar')" class="boton-icono" aria-label="Administrar contenidos">
            <list-icon class="w-11 h-11 text-white-500" />
            <span class="tooltip">Administrar</span>
          </button>

          <button v-if="!usuario" @click="handleNavigation('/iniciar')" class="boton-icono" aria-label="Iniciar sesión">
            <login-icon class="w-11 h-11 text-white-500" />
            <span class="tooltip">Iniciar sesión</span>
          </button>

          <button v-if="usuario" @click="handleLogout" class="boton-icono" aria-label="Salir">
            <logout-icon class="w-11 h-11 text-white-500" />
            <span class="tooltip">Salir</span>
          </button>

          <button @click="togglePaletasDropdown" class="boton-icono" aria-label="Selector de colores">
            <colors-icon class="w-11 h-11 text-white-500" />
            <span class="tooltip">Colores</span>
          </button>

          <button @click="toggleSound" class="boton-icono" aria-label="Sonido">
            <sound-icon :class="{ 'opacity-50': !soundEnabled }" class="w-11 h-11 text-white-500" />
            <span class="tooltip">{{ soundEnabled ? 'Silenciar' : 'Activar sonido' }}</span>
          </button>

          <div v-if="showDropdown" class="palettes-dropdown">
            <ul>
              <li v-for="palette in paletas" :key="palette.name">
                <button @click="applyPalette(palette.class)">
                  {{ palette.name }}
                </button>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </nav>

    <!-- Barra de Navegación para Pantallas Pequeñas -->
    <nav class="barra-superior-mobile shadow-md w-full top-0 left-0 fixed md:hidden z-50">
      <div class="max-w-5xl mx-auto flex justify-between p-4 items-center">
        <router-link to="/" class="text-xl font-bold flex items-center">
          <button class="logo align-middle boton-icono" aria-label="Inicio">
            <user-book-icon class="w-11 h-11 text-white-500" />
          </button>
        </router-link>

        <!-- Botón de Menú (visible en móviles) -->
        <button @click="toggleMenu" class="boton-icono" aria-label="Menú">
          <list-icon class="w-11 h-11 text-white-500" />
        </button>

        <!-- Menú Desplegable (visible en móviles) -->
        <div v-if="showMenu" class="absolute top-16 right-4 shadow-md rounded-md z-50">
          <ul class="py-2">
            <li v-if="usuario">
              <button @click="handleNavigation('/contenidos'); showMenu = false" class="block w-full text-left px-4 py-2 ">
                <book-icon class="w-11 h-11 inline-block mr-2 text-white-500" />
                Contenidos
              </button>
            </li>
            <li v-if="usuario">
              <button @click="handleNavigation('/perfil'); showMenu = false" class="block w-full text-left px-4 py-2 ">
                <user-icon class="w-11 h-11 inline-block mr-2 text-white-500" />
                Perfil
              </button>
            </li>
            <li v-if="esAdmin">
              <button @click="handleNavigation('/administrar'); showMenu = false" class="block w-full text-left px-4 py-2 ">
                <list-icon class="w-11 h-11 inline-block mr-2 text-white-500" />
                Administrar
              </button>
            </li>
            <li v-if="!usuario">
              <button @click="handleNavigation('/iniciar'); showMenu = false" class="block w-full text-left px-4 py-2 ">
                <login-icon class="w-11 h-11 inline-block mr-2 text-white-500" />
                Iniciar sesión
              </button>
            </li>
            <li v-if="usuario">
              <button @click="() => { handleLogout(); showMenu = false }" class="block w-full text-left px-4 py-2 ">
                <logout-icon class="w-11 h-11 inline-block mr-2 text-white-500" />
                Salir
              </button>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  </header>
</template>

<script>
import { ref, onMounted } from "vue";
import { useRouter } from "vue-router"; // Importar el enrutador
import { obtenerUsuario, logout } from "@/services/authService";
import { soundEnabled, playSound } from "@/services/soundService";
import SoundIcon from "@/assets/sound.svg?component";
// ... (Importaciones de iconos)
import SearchIcon from "@/assets/search.svg?component"; // Agrega `?component`
import NewIcon from "@/assets/new.svg?component";
import EditIcon from "@/assets/edit.svg?component";
import DeleteIcon from "@/assets/delete.svg?component";
import ImportIcon from "@/assets/import.svg?component";
import ExportIcon from "@/assets/export.svg?component";
import UpIcon from "@/assets/up.svg?component";
import DownIcon from "@/assets/down.svg?component";
import PrintIcon from "@/assets/print.svg?component";
import RightIcon from "@/assets/right.svg?component";
import LeftIcon from "@/assets/left.svg?component";
import BookIcon from "@/assets/book.svg?component";
import ListIcon from "@/assets/list.svg?component";
import UserIcon from "@/assets/user.svg?component";
import UserBookIcon from "@/assets/user-book.svg?component";
import UserCreateIcon from "@/assets/user-create.svg?component";
import UserEditIcon from "@/assets/user-edit.svg?component";
import UserDeleteIcon from "@/assets/user-delete.svg?component";
import LoginIcon from "@/assets/login.svg?component";
import LogoutIcon from "@/assets/logout.svg?component";
import PlayIcon from "@/assets/play.svg?component";
import PauseIcon from "@/assets/pause.svg?component";
import StopIcon from "@/assets/stop.svg?component";
import ColorsIcon from "@/assets/colors.svg?component";
import CerrarIcon from "@/assets/cerrar.svg?component";

export default {
  components: { SearchIcon, NewIcon, EditIcon, DeleteIcon, ImportIcon, ExportIcon, UpIcon, DownIcon, PrintIcon, RightIcon, LeftIcon, BookIcon, ListIcon, UserIcon, UserBookIcon, UserCreateIcon, UserEditIcon, UserDeleteIcon, LoginIcon, LogoutIcon, PlayIcon, PauseIcon, StopIcon, ColorsIcon, CerrarIcon, SoundIcon },
  
  setup() {
    const router = useRouter(); // Usar el enrutador
    const usuario = ref(null);
    const esAdmin = ref(false);
    const showMenu = ref(false);

    onMounted(() => {
      usuario.value = obtenerUsuario();
      esAdmin.value = usuario.value && usuario.value.rol === "administrador";
    });

    const toggleMenu = () => {
      showMenu.value = !showMenu.value;
    };

    const toggleSound = () => {
      soundEnabled.value = !soundEnabled.value;
      if (soundEnabled.value) {
        playSound('state.confirm.up');
      }
    };

    const handleNavigation = async (route) => {
      try {
        await playSound('navigation.forward');
        router.push(route); // Navegar después de reproducir el sonido
      } catch (error) {
        console.error("Error durante la navegación:", error);
        router.push(route); // Asegurar la navegación incluso si hay un error
      }
    };

    const handleLogout = async () => {
      try {
        await playSound('state.confirm.down');
      } catch (error) {
        console.error("Error reproduciendo sonido:", error);
      } finally {
        await logout();
      }
    };

    return { usuario, esAdmin, logout, showMenu, toggleMenu, soundEnabled, toggleSound, handleNavigation, handleLogout };
  },
  data() {
    return {
      showDropdown: false,
      paletas: [
        { name: "Arcilla", class: "arcilla" },
        { name: "Bosque", class: "bosque" },
        { name: "Índigo", class: "indigo" },
        { name: "Raíces", class: "raices" },
        { name: "Carbón", class: "carbon" },
        { name: "Sumi-e", class: "light-mode" },
        { name: "Conocimiento 2030", class: "conocimiento" },
        { name: "Noche", class: "dark-mode" },
      ]
    };
  },
  methods: {
    togglePaletasDropdown() {
      this.showDropdown = !this.showDropdown;
    },
    applyPalette(paletteClass) {
      // Remueve todas las clases de paleta previamente aplicadas al elemento raíz
      const classesParaRemover = this.paletas.map(p => p.class);
      document.documentElement.classList.remove(...classesParaRemover);
      // Agrega la clase de la paleta seleccionada
      document.documentElement.classList.add(paletteClass);
      // Oculta el menú
      this.showDropdown = false;
    }
  },
  mounted() {
    const buttons = document.querySelectorAll('.boton-icono');
    buttons.forEach(button => {
      button.addEventListener('mouseenter', () => playSound('navigation.hover'));
    });
  }
};
</script>

<style scoped>
.barra-superior-desktop {
  background-color: var(--primary-bg);
  color: var(--text-color);
}
.barra-superior-mobile {
  background-color: var(--primary-bg);
  color: var(--text-color);
}
.boton-icono {
  background-color: transparent;
  border: none;
  cursor: pointer;
  padding: 0;
  color: var(--text-color);
}
.logo{
  color: var(--text-color);
}
.palettes-dropdown {
  position: absolute;
  top: 100%;
  right: 0;
  min-width: 150px;
  padding: 8px;
  background: var(--primary-bg);
  border: 1px solid var(--accent-color);
  border-radius: 0 0 5px 5px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
  z-index: 100;
}
.palettes-dropdown ul {
  list-style: none;
  margin: 0;
  padding: 0;
}
.palettes-dropdown li button {
  width: 100%;
  padding: 8px 12px;
  border: none;
  background: transparent;
  cursor: pointer;
  text-align: left;
}
.palettes-dropdown li button:hover {
  background: var(--accent-color-tra);
}
</style>
