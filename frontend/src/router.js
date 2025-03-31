import { createRouter, createWebHistory } from "vue-router";
import Iniciar from './views/Iniciar.vue';
import Dashboard from "@/views/Dashboard.vue";
import Contenidos from "@/views/Contenidos.vue";
import ArticuloDetail from "@/views/ArticuloDetail.vue";
import Perfil from "@/views/Perfil.vue";
import Grados from "@/views/Grados.vue";
import Areas from "@/views/Areas.vue";
import Temas from "@/views/Temas.vue";
import { obtenerUsuario } from "@/services/authService"; // 🔹 Importamos la función para obtener el usuario
import Administrar from "@/views/Administrar.vue"; // 🔹 Importar la vista Administrar
import GradoDetail from "@/views/GradoDetail.vue"; // 🔹 Importar la vista para detalles de grados
import AreaDetail from "@/views/AreaDetail.vue";   // 🔹 Importar la vista para detalles de áreas
import ContentView from "@/views/ContentView.vue"; // 🔹 Importar la vista para contenido estático

const routes = [
  { path: "/", component: Dashboard },
  { path: "/iniciar", component: Iniciar },
  { path: "/contenidos", component: Contenidos },
  { 
    path: "/articulo/:id",
    name: "articuloDetail",
    component: ArticuloDetail,
    props: true,
  },
  { path: "/perfil", component: Perfil },
  { path: "/grados", component: Grados },
  { path: "/areas", component: Areas },
  { path: "/temas", component: Temas },
  { 
    path: "/administrar", 
    name: "Administrar", 
    component: Administrar,
    beforeEnter: (to, from, next) => { // 🔹 Protección de ruta
      const usuario = obtenerUsuario();
      if (!usuario || usuario.rol !== "administrador") {
        next("/"); // 🔹 Redirige si no es administrador
      } else {
        next();
      }
    }
  },
  { 
    path: "/grados/:id", 
    name: "GradoDetail", 
    component: GradoDetail, 
    props: true // 🔹 Permitir pasar el parámetro `id` como prop
  },
  { 
    path: "/areas/:id", 
    name: "AreaDetail", 
    component: AreaDetail, 
    props: true // 🔹 Permitir pasar el parámetro `id` como prop
  },
  { 
    path: "/contenido-estatico", 
    name: "ContentView",
    component: ContentView
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

// Añadir guardia global para redirigir a la página de inicio de sesión si no hay usuario autenticado
router.beforeEach((to, from, next) => {
  const usuario = obtenerUsuario();
  if (!usuario && to.path !== "/iniciar") {
    next("/iniciar");
  } else {
    next();
  }
});

export default router;
