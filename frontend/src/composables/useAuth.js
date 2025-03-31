import { reactive } from 'vue';
import axios from 'axios';

const authState = reactive({
  user: {}, // Inicializa como un objeto vacío para evitar errores de acceso
  isAuthenticated: false,
  isAdmin: false,
});

export async function checkAuth() {
  const token = localStorage.getItem('token');
  const usuarioGuardado = JSON.parse(localStorage.getItem('usuario') || '{}');

  if (!token) {
    authState.user = null;
    authState.isAuthenticated = false;
    authState.isAdmin = false;
    return false;
  }

  try {
    const response = await fetch('https://colibriback.onrender.com/api/auth/perfil', {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    });

    if (!response.ok) {
      throw new Error(`Error al obtener el perfil: ${response.statusText}`);
    }

    const perfilResponse = await response.json();
    const perfilCompleto = {
      ...perfilResponse,
      ...usuarioGuardado,
      id: perfilResponse.id
    };
    
    authState.user = perfilCompleto;
    authState.isAuthenticated = true;
    authState.isAdmin = perfilCompleto.rol === 'administrador';
    
    return true;
  } catch (error) {
    console.error("Error en checkAuth:", error);
    authState.user = null;
    authState.isAuthenticated = false;
    authState.isAdmin = false;
    return false;
  }
}

export function useAuth() {
  return { authState, checkAuth }; // Devuelve el objeto completo
}
