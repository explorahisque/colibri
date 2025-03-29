import MarkdownIt from 'markdown-it';
import yaml from 'js-yaml';

const md = new MarkdownIt();

function parseMdWithFrontmatter(text) {
  const parts = text.split('---');
  if (parts.length >= 3) {
    try {
      const metadata = yaml.load(parts[1]);
      const content = parts.slice(2).join('---').trim();
      return { metadata, content };
    } catch (error) {
      console.error('Error parsing frontmatter:', error);
      return null;
    }
  }
  return null;
}

export async function getContent(grade, area) {
  try {
    const response = await fetch(`/src/content/${grade}_${area}.md`);
    if (!response.ok) throw new Error('Content not found');
    
    const text = await response.text();
    const parsed = parseMdWithFrontmatter(text);
    
    if (!parsed) throw new Error('Invalid content format');
    
    return {
      metadata: parsed.metadata,
      content: md.render(parsed.content)
    };
  } catch (error) {
    console.error(`Error loading content for ${grade}_${area}:`, error);
    return null;
  }
}

export async function getAllContent() {
  const modules = import.meta.glob('../content/*.md');
  const allContent = [];

  for (const path in modules) {
    const module = await modules[path]();
    const { data, content } = matter(module.default);
    allContent.push({
      path: path.replace('../content/', '').replace('.md', ''),
      metadata: data,
      content: content
    });
  }

  return allContent;
}

export async function getGradeContent(gradeName) {
  try {
    const response = await fetch(`/src/content/${gradeName}.md`);
    if (!response.ok) throw new Error('Content not found');
    
    const text = await response.text();
    const sections = parseContent(text);
    
    return sections;
  } catch (error) {
    console.error(`Error loading content for ${gradeName}:`, error);
    return null;
  }
}

function parseContent(text) {
  // Divide el contenido por secciones principales (##)
  const sections = [];
  const lines = text.split('\n');
  let currentSection = null;

  lines.forEach(line => {
    if (line.startsWith('## ')) {
      if (currentSection) {
        sections.push(currentSection);
      }
      currentSection = {
        title: line.replace('## ', '').trim(),
        content: []
      };
    } else if (currentSection && line.trim()) {
      currentSection.content.push(line);
    }
  });

  if (currentSection) {
    sections.push(currentSection);
  }

  // Procesa el contenido de cada sección
  return sections.map(section => ({
    ...section,
    content: md.render(section.content.join('\n'))
  }));
}
