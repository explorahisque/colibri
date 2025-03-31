<template>
  <div class="cuerpo" @click="handleFirstInteraction">
    <Header />
    <router-view />
  </div>
</template>

<script>
import Header from "@/components/Header.vue";
import { enableSounds } from "@/services/soundService";

export default {
  components: { Header },
  methods: {
    handleFirstInteraction() {
      enableSounds();
    }
  }
};
</script>
