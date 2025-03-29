import { createApp } from "vue";
import App from "./App.vue";
import router from "./router";
import "./index.css"; // Para Tailwind
import icons from "./assets/icons"; // Importamos el plugin de íconos

// Asegúrate de que las imágenes estén en "src/assets/img" para que puedan ser usadas dinámicamente.
// Ejemplo de uso: :style="{ backgroundImage: `url(assets/img/${area.nombre}.webp)` }"

createApp(App).use(router).use(icons).mount("#app");
