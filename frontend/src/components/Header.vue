<template>
  <nav class="barra-superior shadow-md w-full top-0 left-0 fixed">
    <div class="max-w-5xl mx-auto flex justify-between p-4">
      <router-link to="/" class="text-xl font-bold">
        <button class="logo align-middle boton-icono" aria-label="Inicio">
          <user-book-icon class="w-10 h-10 text-white-500" />
        </button>
        Co-Libri Learning
      </router-link>

      <div class="space-x-4 flex items-center">
        <button v-if="usuario" @click="$router.push('/contenidos')" class="boton-icono" aria-label="Contenidos">
          <book-icon class="w-6 h-6 text-white-500" />
          <span class="tooltip">Contenidos</span>
        </button>

        <button v-if="usuario" @click="$router.push('/perfil')" class="boton-icono" aria-label="Perfil de usuario">
          <user-icon class="w-6 h-6 text-white-500" />
          <span class="tooltip">Perfil</span>
        </button>

        <button v-if="esAdmin" @click="$router.push('/administrar')" class="boton-icono" aria-label="Administrar contenidos">
          <list-icon class="w-6 h-6 text-white-500" />
          <span class="tooltip">Administrar</span>
        </button>

        <button v-if="!usuario" @click="$router.push('/iniciar')" class="boton-icono" aria-label="Iniciar sesión">
          <login-icon class="w-6 h-6 text-white-500" />
          <span class="tooltip">Iniciar sesión</span>
        </button>

        <button v-if="usuario" @click="logout" class="boton-icono" aria-label="Salir">
          <logout-icon class="w-6 h-6 text-white-500" />
          <span class="tooltip">Salir</span>
        </button>

        <button @click="togglePaletasDropdown" class="boton-icono" aria-label="Selector de colores">
          <colors-icon class="w-6 h-6 text-white-500" />
          <span class="tooltip">Colores</span>
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
</template>

<script>
import { ref, onMounted } from "vue";
import { obtenerUsuario, logout } from "@/services/authService";
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
  components: { SearchIcon, NewIcon, EditIcon, DeleteIcon, ImportIcon, ExportIcon, UpIcon, DownIcon, PrintIcon, RightIcon, LeftIcon, BookIcon, ListIcon, UserIcon, UserBookIcon, UserCreateIcon, UserEditIcon, UserDeleteIcon, LoginIcon, LogoutIcon, PlayIcon, PauseIcon, StopIcon, ColorsIcon, CerrarIcon },
  
  setup() {
    const usuario = ref(null);
    const esAdmin = ref(false);

    onMounted(() => {
      usuario.value = obtenerUsuario();
      esAdmin.value = usuario.value && usuario.value.rol === "administrador";
    });

    return { usuario, esAdmin, logout };
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
  }
};
</script>

<style scoped>
.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  /* ...existing styles... */
}
.menu {
  position: relative;
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