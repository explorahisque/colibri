const fs = require('fs');
const path = require('path');

// Rutas de los archivos
const temasPath = path.join(__dirname, '../scraper/temas.json');
const areasPath = path.join(__dirname, 'areas.json');
const temasBdPath = path.join(__dirname, 'temas.json');

// Leer y parsear temas.json
const temasData = JSON.parse(fs.readFileSync(temasPath, 'utf8'));

// Generar lista de áreas únicas
const areas = [...new Set(temasData.map(item => item.Area))]
  .map(area => ({ nombre: area }));

// Generar lista de temas únicos
const temas = [...new Set(temasData.map(item => {
  let tema = item.Tema;
  if (item.Area.toLowerCase().includes('inglés')) {
    tema += ' (Inglés)';
  }
  return tema;
}))]
  .map(tema => ({ nombre: tema }));

// Guardar áreas en areas.json
fs.writeFileSync(areasPath, JSON.stringify(areas, null, 2), 'utf8');

// Guardar temas en temas_bd.json
fs.writeFileSync(temasBdPath, JSON.stringify(temas, null, 2), 'utf8');

console.log('Archivos areas.json y temas_bd.json generados correctamente.');
