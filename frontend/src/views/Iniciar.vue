<template>
  <div class="login-container flex items-center justify-center h-screen">
    <div class="login-box flex flex-col items-center text-center p-6">
      <button class="logo align-middle cursor-none">
        <user-book-icon class="w-20 h-20 text-white-500" />
      </button>
      <h2 class="text-2xl font-light mb-4">
        {{ step === 1 
          ? 'Hola Usuari@, por favor identifícate con tu correo.' 
          : step === 2 && !emailExists 
            ? 'No encontramos tu usuario, confirma tu correo para registrarte.' 
            : step === 3 
              ? emailExists 
                ? 'Introduce tu contraseña para ingresar.' 
                : 'Crea una contraseña segura para registrarte.' 
              : step === 4 
                ? 'Confirma la contraseña para registrarte.' 
                : step === 5 
                  ? 'Introduce tu nombre para completar el registro.' 
                  : '' }}
      </h2>
      <div class="w-full flex items-center justify-center">
        <input 
          :type="step === 1 || step === 2 ? 'email' : step === 3 || step === 4 ? 'password' : 'text'" 
          v-model="inputValue" 
          :placeholder="step === 1 || step === 2 ? 'Correo electrónico' : step === 5 ? 'Nombre completo' : 'Contraseña'"
          @keyup.enter="nextStep"
          class="w-1/2 p-3"
        />
        <button @click="nextStep" class="enter-button">
          <right-icon class="w-7 h-7 text-white-500" />
        </button>
      </div>
    </div>
  </div>
</template>

<script>
import { ref } from 'vue';
import { useRouter, useRoute } from 'vue-router';
import { login, checkEmail, createUser } from '@/services/authService';
import { useAuth } from '@/composables/useAuth'; // Importar el estado de autenticación
import { soundMixin } from '@/plugins/sound';

export default {
  mixins: [soundMixin],
  setup() {
    const step = ref(1);
    const inputValue = ref('');
    const email = ref('');
    const password = ref('');
    const confirmPassword = ref('');
    const nombre = ref('');
    const emailExists = ref(false);
    const router = useRouter();
    const route = useRoute();
    const { checkAuth } = useAuth(); // Obtener la función para verificar autenticación

    // Extract sound methods from mixin
    const { playUISound, playAlertSound, playCelebrationSound } = soundMixin.methods;

    const nextStep = async () => {
      try {
        playUISound('ui.tap');
        console.log("Paso actual:", step.value);

        if (step.value === 1) {
          email.value = inputValue.value.trim();
          inputValue.value = '';
          emailExists.value = await checkEmail(email.value);

          if (emailExists.value) {
            step.value = 3; // Pedir contraseña para ingresar
          } else {
            step.value = 2; // Mostrar mensaje de correo no encontrado y avanzar al registro
          }
        } else if (step.value === 2) {
          // Confirmar el correo y avanzar al paso de crear contraseña
          step.value = 3;
        } else if (step.value === 3) {
          password.value = inputValue.value.trim();
          inputValue.value = '';
          if (emailExists.value) {
            // Intentar iniciar sesión
            try {
              await login(email.value, password.value);
              playCelebrationSound('simple');
              await checkAuth(); // Actualizar el estado de autenticación global
              const redirectPath = route.query.redirect || '/';
              window.location.href = redirectPath; // Redirigir al contenido
            } catch (error) {
              playAlertSound('error');
              alert('Credenciales incorrectas');
              inputValue.value = '';
            }
          } else {
            step.value = 4; // Pedir confirmación de contraseña para registrarse
          }
        } else if (step.value === 4) {
          confirmPassword.value = inputValue.value.trim();
          inputValue.value = '';
          if (password.value === confirmPassword.value) {
            step.value = 5; // Pedir el nombre del usuario
          } else {
            alert('Las contraseñas no coinciden. Intenta nuevamente.');
          }
        } else if (step.value === 5) {
          nombre.value = inputValue.value.trim();
          if (!nombre.value) {
            alert('El nombre es obligatorio.');
            return;
          }
          try {
            await createUser(email.value, password.value, nombre.value);
            // Iniciar sesión automáticamente tras el registro exitoso
            await login(email.value, password.value);
            await checkAuth();
            const redirectPath = route.query.redirect || '/';
            window.location.href = redirectPath;
          } catch (error) {
            alert(error.message); // Mostrar mensaje de error específico
          }
        }
      } catch (error) {
        playAlertSound('error');
        alert(error.message);
      }
    };

    return { 
      step, 
      inputValue, 
      nextStep, 
      emailExists,
      playUISound,
      playAlertSound,
      playCelebrationSound 
    };
  }
};
</script>