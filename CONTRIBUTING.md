# Guía de Contribución

## Configuración del Entorno

1. **Requisitos Previos**
   - Node.js (v16 o superior)
   - npm (v8 o superior)
   - Git

2. **Clonar el Repositorio**
   ```bash
   git clone https://github.com/tu-usuario/co-libri.git
   cd co-libri
   ```

3. **Instalar Dependencias**
   ```bash
   cd frontend
   npm install
   ```

## Flujo de Trabajo Git

### Ramas
- `main`: Producción
- `develop`: Desarrollo principal
- `feature/*`: Nuevas características
- `bugfix/*`: Correcciones de errores
- `hotfix/*`: Correcciones urgentes para producción

### Proceso de Desarrollo
1. Crear rama desde `develop`:
   ```bash
   git checkout develop
   git pull origin develop
   git checkout -b feature/nombre-caracteristica
   ```

2. Realizar cambios siguiendo las convenciones
3. Commit de cambios usando mensajes semánticos
4. Push y crear Pull Request

### Convenciones de Commits
Seguimos [Conventional Commits](https://www.conventionalcommits.org/):

## Guías de Sonido

### Jerarquía y Relaciones
1. **Niveles de Jerarquía:**
   - Brand sounds: Identificación de marca
   - Hero sounds: Logros importantes
   - Alertas: Notificaciones críticas
   - UX primario: Interacciones principales
   - UX secundario: Feedback funcional

2. **Relaciones Sonoras:**
   - Usar firmas tonales complementarias
   - Mantener coherencia entre estados relacionados
   - Implementar variaciones sutiles en sonidos repetitivos

### Implementación Técnica

1. **Formatos de Archivo:**
   ```javascript
   const soundConfig = {
     format: ['mp3', 'ogg'],
     sampleRate: 44100,
     channels: 2,
     quality: 0.8
   };
   ```

2. **Optimización:**
   - Comprimir sin artefactos audibles
   - Recortar silencios innecesarios
   - Ajustar bit-depth y sample rate

3. **Casos de Uso:**
   ```vue
   <button @click="playFeedback('success')">
     Acción Exitosa
   </button>

   <script>
   export default {
     methods: {
       playFeedback(type) {
         const sound = new Audio(`/sounds/${type}.mp3`);
         sound.volume = this.calculateLogVolume(0.7);
         await sound.play();
       },
       calculateLogVolume(level) {
         return Math.log10(level * 9 + 1);
       }
     }
   }
   </script>
   ```

### Mejores Prácticas

1. **Cuándo Usar Sonido:**
   - Momentos de celebración
   - Confirmaciones importantes
   - Alertas críticas
   - Feedback de interacción

2. **Cuándo Evitar Sonido:**
   - UIs que requieren privacidad
   - Acciones muy frecuentes
   - Modo no molestar activo

3. **Control de Volumen:**
   - Implementar escala logarítmica
   - Respetar preferencias del sistema
   - Permitir silencio total

