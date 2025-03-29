import { ref } from 'vue'
import axios from 'axios'

export function useAuth() {
  const isAdmin = ref(false)
  const isAuthenticated = ref(false) // Estado de autenticación
  const user = ref(null)

  const checkAuth = async () => {
    try {
      const token = localStorage.getItem('token')
      if (!token) {
        console.log('No token found')
        return false
      }

      // Configurar el token en los headers
      const config = {
        headers: { Authorization: `Bearer ${token}` }
      }

      // Se cambia la URL a /api/auth/perfil
      const response = await axios.get('http://localhost:3000/api/auth/perfil', config)
      console.log('Perfil response:', response.data)
      
      user.value = response.data
      isAdmin.value = response.data.rol === 'administrador'
      isAuthenticated.value = true
      
      return true
    } catch (error) {
      console.error('Error de autenticación:', error.response?.data || error.message)
      localStorage.removeItem('token')
      return false
    }
  }

  return {
    isAdmin,
    isAuthenticated, // Exportar el estado de autenticación
    user,
    checkAuth
  }
}
