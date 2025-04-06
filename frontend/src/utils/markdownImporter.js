export function parseMarkdownFile(content) {
  console.log("[Parseo] Iniciando parseo del contenido Markdown.");
  const lines = content.split('\n');
  const parsedData = [];
  let currentTema = null;
  let currentArticulo = null;
  let inArticuloContent = false;
  let currentContent = "";

  for (let i = 0; i < lines.length; i++) {
    const line = lines[i].trim();

    // Ignorar bloques de encabezado o separadores generales
    if(line === "---") {
      inArticuloContent = false;
      continue;
    }

    if (line.startsWith("### Tema")) {
      if (i + 1 < lines.length) {
        currentTema = lines[++i].trim();
        console.log(`[Parseo] Tema encontrado: "${currentTema}"`);
      }
      continue;
    }
    
    if (line.startsWith("#### Artículo")) {
      if (i + 1 < lines.length) {
        currentArticulo = lines[++i].trim();
        console.log(`[Parseo] Artículo encontrado: "${currentArticulo}" under tema "${currentTema}"`);
      }
      // Buscar el primer separador ---articulo--- para iniciar el contenido
      while (i < lines.length && lines[i].trim() !== "---articulo---") {
        i++;
      }
      inArticuloContent = true;
      currentContent = "";
      continue;
    }
    
    if (inArticuloContent) {
      if (line === "---articulo---") {
        console.log(`[Parseo] Contenido extraído para el artículo "${currentArticulo}".`);
        parsedData.push({ tema: currentTema, articulo: currentArticulo, contenido: currentContent.trim() });
        inArticuloContent = false;
        currentArticulo = null;
        currentContent = "";
      } else {
        currentContent += line + "\n";
      }
    }
  }

  console.log("[Parseo] Finalizado parseo. Total de registros:", parsedData.length);
  return parsedData;
}
