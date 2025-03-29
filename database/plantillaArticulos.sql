ALTER TABLE articulos 
ALTER COLUMN contenido SET DEFAULT '[
  {
    "titulo": "Título del primer elemento",
    "descripcion": "<h2>Título ejemplo</h2><p>Acá copiar y pegar todo el contenido incluyendo</p><a href=''https://ejemplo.com/''>",
    "link": "Por el momento dejar vacío, si hay links incluirlos en la descripción",
    "multimedia": ["https://ejemplo.com/imagen.jpg", "https://ejemplo.com/video.mp4"],
    "fuente": "Mencionar la fuente o dejar vacía"
  },
  {
    "titulo": "Título del primer elemento",
    "descripcion": "<h2>Título ejemplo</h2><p>Acá copiar y pegar todo el contenido incluyendo</p><a href=''https://ejemplo.com/''>",
    "link": "Por el momento dejar vacío, si hay links incluirlos en la descripción",
    "multimedia": ["https://ejemplo.com/imagen.jpg", "https://ejemplo.com/video.mp4"],
    "fuente": "Mencionar la fuente o dejar vacía"
  }
]'::jsonb;
