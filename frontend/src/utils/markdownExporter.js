export function generateMarkdown(articles, exportGrado, exportArea) {
  // Filtra los artículos por grado y área
  const filtered = articles.filter(a => a.gradoNombre === exportGrado && a.areaNombre === exportArea);
  if (!filtered.length) return null;
  // Agrupa los artículos por tema
  const temasMap = {};
  filtered.forEach(article => {
    const tema = article.temaNombre || "Sin Tema";
    if (!temasMap[tema]) temasMap[tema] = [];
    temasMap[tema].push(article);
  });
  // Construir el contenido Markdown
  let mdContent = `---\ngrado: ${exportGrado}\narea: ${exportArea}\n---\n\n`;
  mdContent += `## Área\n${exportArea}\n\n`;
  for (const tema in temasMap) {
    mdContent += `### Tema\n${tema}\n`;
    temasMap[tema].forEach(article => {
      mdContent += `#### Artículo (Subtema)\n${article.nombre}\n\n---articulo---\n\n${article.contenido}\n\n---articulo---\n\n`;
    });
  }
  return mdContent;
}

function normalizeString(str) {
  return str
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "") // Remove accents
    .replace(/[()]/g, "") // Remove parentheses
    .replace(/\s+/g, '_') // Replace spaces with underscores
    .toLowerCase();
}

export function generateAllMarkdowns(articles) {
  // Obtener todos los grados y áreas únicos
  const gradosAreas = new Map();
  articles.forEach(article => {
    if (!gradosAreas.has(article.gradoNombre)) {
      gradosAreas.set(article.gradoNombre, new Set());
    }
    gradosAreas.get(article.gradoNombre).add(article.areaNombre);
  });

  // Generar un archivo markdown para cada combinación
  const files = [];
  for (const [grado, areas] of gradosAreas.entries()) {
    for (const area of areas) {
      const mdContent = generateMarkdown(articles, grado, area);
      if (mdContent) {
        files.push({
          filename: `grado_${normalizeString(grado)}-${normalizeString(area)}.md`,
          content: mdContent
        });
      }
    }
  }
  return files;
}
