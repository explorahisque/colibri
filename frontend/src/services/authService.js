import axios from "axios";

const API_URL = "https://colibrifront.onrender.com/api/";

export const login = async (email, password) => {
  const { data } = await axios.post(API_URL + "auth/login", { email, password });
  localStorage.setItem("token", data.token);
  localStorage.setItem("usuario", JSON.stringify(data.usuario));
  return data.usuario;
};

export const logout = () => {
  localStorage.removeItem("token");
  localStorage.removeItem("usuario");
  window.location.reload();
};

export const obtenerUsuario = () => {
  return JSON.parse(localStorage.getItem("usuario"));
};

export const checkEmail = async (email) => {
  try {
    const { data } = await axios.get(API_URL + "check-email", { params: { email } });
    return data.exists;
  } catch (error) {
    console.error("Error en checkEmail:", error);
    throw new Error("No se pudo verificar el correo. Intenta nuevamente.");
  }
};

export const createUser = async (email, password, nombre) => {
  try {
    // Validar que los datos no estén vacíos antes de enviarlos
    if (!email || !password || !nombre) {
      throw new Error("El correo, la contraseña y el nombre son obligatorios.");
    }

    console.log("Datos enviados al backend:", { email, password, nombre, rol: 'estudiante' });

    const { data } = await axios.post(API_URL + "auth/register", { email, password, nombre, rol: 'estudiante' });
    return data;
  } catch (error) {
    console.error("Error en createUser:", error);

    // Manejar errores específicos del backend
    if (error.response) {
      console.error("Respuesta del backend:", error.response.data);
      if (error.response.data && error.response.data.error) {
        throw new Error(error.response.data.error);
      }
    }

    throw new Error("No se pudo crear el usuario. Intenta nuevamente.");
  }
};
