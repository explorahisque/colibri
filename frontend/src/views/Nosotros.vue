<template>
  <div class="min-h-screen p-6 futuristic-bg text-futuristic-text">
    <header class="mb-12 text-center">
      <h1 class="text-6xl font-extrabold tracking-widest mt-16 futuristic-title p-8"><strong>Co-Libri</strong></h1>
      <p class="mt-4 text-xl opacity-80">Hoja de ruta y contenidos para el bachillerato en Colombia</p>
    </header>

    <section class="mb-16">
      <h2 class="text-4xl futuristic-heading">¿Qué es Co-Libri?</h2>
      <div class="mt-8 grid grid-cols-1 lg:grid-cols-2 gap-12">
        <div class="futuristic-card">
          <p class="text-lg leading-loose">
            Co-Libri es una plataforma educativa diseñada para facilitar el aprendizaje y la enseñanza de manera interactiva y accesible. Nuestro objetivo es ofrecer recursos educativos organizados por grados, áreas y temas, para que estudiantes y docentes puedan explorar y aprender de forma eficiente.
          </p>
          <p class="mt-6 text-lg leading-loose">
            La plataforma está creada para proporcionar de forma organizada y accesible el contenido requerido en Colombia para completar el bachillerato, <strong>sin limitación geográfica</strong>. Es una herramienta ideal para reforzar el aprendizaje de estudiantes desde los 9 años en adelante en las principales áreas o asignaturas núcleo de aprendizaje.
          </p>
        </div>
        <div class="futuristic-card">
          <p class="text-lg leading-loose">
            Se espera que Co-Libri se convierta en un aliado para reforzar el aprendizaje autodidacta, permitiendo a los estudiantes ir más allá de lo aprendido en clase si se tiene escuela tradicional. También puede ser una herramienta central para guiar el estudio en modalidades de <u>homeschooling</u> o <u>unschooling</u>.
          </p>
          <ul class="list-disc list-inside mt-6 text-lg">
            <li><strong>Incentivar la investigación</strong>.</li>
            <li><u>Fomentar la lectura crítica</u>.</li>
            <li>Desarrollar habilidades de análisis y síntesis.</li>
            <li>Promover la autonomía en el aprendizaje.</li>
          </ul>
        </div>
      </div>
    </section>

    <section class="mb-16">
      <h2 class="text-4xl futuristic-heading">¿Por qué Co-Libri?</h2>
      <div class="mt-8 futuristic-card">
        <p class="text-lg leading-loose">
          Creemos que la educación es la clave para un futuro mejor. Co-Libri nace de la necesidad de proporcionar una herramienta moderna y accesible que apoye a estudiantes y docentes en su camino educativo, especialmente en un mundo cada vez más digital.
        </p>
      </div>
    </section>

    <section class="mb-16">
      <h2 class="text-4xl futuristic-heading">¿Cómo funciona?</h2>
      <div class="mt-8 futuristic-card">
        <p class="text-lg leading-loose">
          La plataforma organiza los contenidos educativos en categorías claras y fáciles de navegar. Los usuarios pueden buscar temas específicos, explorar áreas de conocimiento y realizar evaluaciones interactivas para medir su progreso.
        </p>
      </div>
    </section>

    <section class="mb-16">
      <h2 class="text-4xl futuristic-heading">¿Quiénes somos?</h2>
      <div class="mt-8 futuristic-card">
        <p class="text-lg leading-loose">
          Somos HISQUE Estudio, un equipo apasionado por la educación y la tecnología. Nuestro objetivo es crear herramientas innovadoras que hagan la educación más accesible y efectiva para todos.
        </p>
      </div>
    </section>

    <section class="mb-16">
      <h2 class="text-4xl futuristic-heading">Estado actual</h2>
      <div class="mt-8 futuristic-card">
        <p class="text-lg leading-loose">
          Co-Libri se encuentra actualmente en fase beta. Estamos trabajando constantemente para mejorar la plataforma y agradecemos cualquier comentario o reporte de errores que nos ayude a crecer.
        </p>
      </div>
    </section>

    <div class="text-center mt-16">
      <button class="futuristic-button">
        Ayuda y Reporte de Errores
      </button>
    </div>
  </div>
</template>

<script>
export default {
  name: "Nosotros",
};
</script>

<style scoped>
/* Fondo futurista */
.futuristic-bg {
  background: linear-gradient(135deg, var(--primary-bg), var(--accent-color));
  color: var(--primary-text);
}

/* Tipografía futurista */
.futuristic-title {
  font-family: 'Oxanium', sans-serif;
  color: var(--light-text);
  text-shadow: 0 0 2px var(--light-text), 0 0 2px var(--light-text);
}

.futuristic-heading {
  font-family: 'Oxanium', sans-serif;
  color: var(--light-text);
  text-shadow: 0 0 5px var(--light-text);
  border-bottom: 2px solid var(--light-text);
  padding-bottom: 0.5rem;
  padding: 1.5rem;
}

/* Tarjetas futuristas */
.futuristic-card {
  background: rgba(255, 255, 255, 0.1);
  border: 1px solid var(--card-bg);
  border-radius: 10px;
  padding: 2rem;
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
  backdrop-filter: blur(10px);
}

/* Botón futurista */
.futuristic-button {
  background: linear-gradient(90deg, var(--secondary-accent), var(--accent-color));
  color: var(--primary-text);
  padding: 1rem 2rem;
  font-size: 1.25rem;
  font-family: 'Orbitron', sans-serif;
  border: none;
  border-radius: 50px;
  cursor: pointer;
  transition: transform 0.3s, box-shadow 0.3s;
}

.futuristic-button:hover {
  transform: scale(1.1);
  box-shadow: 0 0 20px var(--secondary-accent);
}
</style>