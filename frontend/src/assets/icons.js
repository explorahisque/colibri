import { defineAsyncComponent } from "vue";

export default {
  install(app) {
    const icons = [
      "search",
      "new",
      "edit",
      "delete",
      "import",
      "intro",
      "export",
      "up",
      "down",
      "print",
      "right",
      "left",
      "user",
      "user-book",
      "user-create",
      "user-edit",
      "user-delete",
      "login",
      "logout",
      "play",
      "pause",
      "stop",
    ];

    icons.forEach((icon) => {
      app.component(
        `${icon}-icon`,
        defineAsyncComponent(() => import(`@/assets/${icon}.svg?component`))
      );
    });
  },
};
