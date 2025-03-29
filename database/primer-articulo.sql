INSERT INTO articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id)
VALUES (
    1,
    'Artículo de ejemplo',
    '[
      {
        "titulo": "Título del primer elemento",
        "descripcion": "<h2>Título ejemplo</h2><p>Acá copiar y pegar todo el contenido incluyendo</p><a href=\"https://ejemplo.com/\">",
        "link": "Por el momento dejar vacío, si hay links incluirlos en la descripción",
        "multimedia": ["https://ejemplo.com/imagen.jpg", "https://ejemplo.com/video.mp4"],
        "fuente": "Mencionar la fuente o dejar vacía"
      },
      {
        "titulo": "Título del segundo elemento",
        "descripcion": "<h2>Título ejemplo</h2><p>Acá copiar y pegar todo el contenido incluyendo</p><a href=\"https://ejemplo.com/\">",
        "link": "Por el momento dejar vacío, si hay links incluirlos en la descripción",
        "multimedia": ["https://ejemplo.com/imagen.jpg", "https://ejemplo.com/video.mp4"],
        "fuente": "Mencionar la fuente o dejar vacía"
      }
    ]'::jsonb,
    1,  -- grado_id
    1,  -- area_id
    1,  -- tema_id
    1   -- usuario_id
);
