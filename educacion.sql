--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: areas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.areas (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE public.areas OWNER TO postgres;

--
-- Name: areas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.areas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.areas_id_seq OWNER TO postgres;

--
-- Name: areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.areas_id_seq OWNED BY public.areas.id;


--
-- Name: articulos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.articulos (
    id integer NOT NULL,
    titulo text NOT NULL,
    contenido text NOT NULL,
    grado_id integer NOT NULL,
    area_id integer NOT NULL,
    tema_id integer NOT NULL,
    usuario_id integer DEFAULT 1,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.articulos OWNER TO postgres;

--
-- Name: articulos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.articulos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.articulos_id_seq OWNER TO postgres;

--
-- Name: articulos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.articulos_id_seq OWNED BY public.articulos.id;


--
-- Name: grados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grados (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE public.grados OWNER TO postgres;

--
-- Name: grados_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grados_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.grados_id_seq OWNER TO postgres;

--
-- Name: grados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grados_id_seq OWNED BY public.grados.id;


--
-- Name: temas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temas (
    id integer NOT NULL,
    nombre text NOT NULL
);


ALTER TABLE public.temas OWNER TO postgres;

--
-- Name: temas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.temas_id_seq OWNER TO postgres;

--
-- Name: temas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temas_id_seq OWNED BY public.temas.id;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    email character varying(150) NOT NULL,
    password text NOT NULL,
    rol character varying(20) DEFAULT 'estudiante'::character varying,
    CONSTRAINT usuarios_rol_check CHECK (((rol)::text = ANY ((ARRAY['administrador'::character varying, 'estudiante'::character varying])::text[])))
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_seq OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- Name: areas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.areas ALTER COLUMN id SET DEFAULT nextval('public.areas_id_seq'::regclass);


--
-- Name: articulos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articulos ALTER COLUMN id SET DEFAULT nextval('public.articulos_id_seq'::regclass);


--
-- Name: grados id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grados ALTER COLUMN id SET DEFAULT nextval('public.grados_id_seq'::regclass);


--
-- Name: temas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temas ALTER COLUMN id SET DEFAULT nextval('public.temas_id_seq'::regclass);


--
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- Data for Name: areas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.areas (id, nombre) VALUES (1, 'Lengua Castellana');
INSERT INTO public.areas (id, nombre) VALUES (2, 'Matem├íticas');
INSERT INTO public.areas (id, nombre) VALUES (3, 'Ciencias Naturales');
INSERT INTO public.areas (id, nombre) VALUES (4, 'Ciencias Sociales');
INSERT INTO public.areas (id, nombre) VALUES (5, 'Ingl├®s (Nivel A1)');
INSERT INTO public.areas (id, nombre) VALUES (6, 'Educaci├│n F├¡sica');
INSERT INTO public.areas (id, nombre) VALUES (7, 'Ingl├®s (Nivel A1+)');
INSERT INTO public.areas (id, nombre) VALUES (8, 'Ingl├®s (Nivel A2)');
INSERT INTO public.areas (id, nombre) VALUES (9, 'Ingl├®s (Nivel A2+)');
INSERT INTO public.areas (id, nombre) VALUES (10, 'F├¡sica');
INSERT INTO public.areas (id, nombre) VALUES (11, 'Qu├¡mica');
INSERT INTO public.areas (id, nombre) VALUES (12, 'Filosof├¡a');
INSERT INTO public.areas (id, nombre) VALUES (13, 'Ingl├®s (Nivel B1)');
INSERT INTO public.areas (id, nombre) VALUES (14, 'Ingl├®s (Nivel B1+)');


--
-- Data for Name: articulos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (2, 'Identificaci├│n de ideas principales y secundarias', '## Identificaci├│n (sicolog├¡a)
destacados de identificaci├│n descritos por Freud son: identificaci├│n primaria, identificaci├│n narcisista (secundaria) e identificaci├│n parcial (secundaria).[1]ÔÇï
[Ver m├ís](https://es.wikipedia.org/wiki/Identificaci├│n_(sicolog├¡a))
**Fuente:** Wikipedia

## Comunicaci├│n t├®cnica
un papel, y entonces circular todas las secciones principales, conectar las secciones principales con las ideas favorables con las l├¡neas, y suprimir todo
[Ver m├ís](https://es.wikipedia.org/wiki/Comunicaci├│n_t├®cnica)
**Fuente:** Wikipedia

## Reingenier├¡a de procesos
las causas secundarias que afectan a las primarias y las espinas peque├▒as las causas terciarias que afectan a las secundarias. El fin ├║ltimo de esta herramienta
[Ver m├ís](https://es.wikipedia.org/wiki/Reingenier├¡a_de_procesos)
**Fuente:** Wikipedia

## Investigaci├│n de mercados
investigaci├│n de mercados es la herramienta para la identificaci├│n, acopio, an├ílisis, difusi├│n sistem├ítica de la informaci├│n de mercados con el fin de mejorar
[Ver m├ís](https://es.wikipedia.org/wiki/Investigaci├│n_de_mercados)
**Fuente:** Wikipedia

## John Locke
particular. Las cualidades secundarias incluyen color, olor y sabor.[25]ÔÇï Locke ha establecido pues, para este an├ílisis de las ideas, que todos nuestros conocimientos
[Ver m├ís](https://es.wikipedia.org/wiki/John_Locke)
**Fuente:** Wikipedia
', 1, 1, 2, 1, '2025-03-21 21:37:20.746-05', '2025-03-21 21:37:20.746-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (5, 'P├írrafos descriptivos', '## P├írrafo
&quot;despu├®s&quot; o &quot;entonces&quot;. Son comunes en cuentos, novelas y relatos Los p├írrafos descriptivos detallan caracter├¡sticas de personas, lugares u objetos para crear
[Ver m├ís](https://es.wikipedia.org/wiki/P├írrafo)
**Fuente:** Wikipedia

## Idea (ling├╝├¡stica)
matizar el pensamiento que se va a desarrollar. Generalmente son detalles descriptivos, ejemplos, circunstancias de tiempo, lugares o apoyos que sirven para
[Ver m├ís](https://es.wikipedia.org/wiki/Idea_(ling├╝├¡stica))
**Fuente:** Wikipedia

## Puchero (recipiente)
ejemplo en la novela La Tribuna, donde Emilia Pardo Baz├ín escribe p├írrafos descriptivos como este que ilustra el inicio de la narraci├│n:[11]ÔÇï Sali├│ con
[Ver m├ís](https://es.wikipedia.org/wiki/Puchero_(recipiente))
**Fuente:** Wikipedia

## Texto
formales de alto nivel, como los t├¡tulos y subt├¡tulos, la secuencia de p├írrafos, etc. En contraste, las ┬½microproposiciones┬╗ son los elementos coadyuvantes
[Ver m├ís](https://es.wikipedia.org/wiki/Texto)
**Fuente:** Wikipedia

## Txt2tags
numeradas o no P├írrafos Modificadores de fuentes Negrita It├ílica Subrayada Fuente no proporcional (monospaciada/verbatim) Monoespaciada en un p├írrafo L├¡nea monoespaciada
[Ver m├ís](https://es.wikipedia.org/wiki/Txt2tags)
**Fuente:** Wikipedia
', 1, 1, 5, 1, '2025-03-21 21:37:20.819-05', '2025-03-21 22:01:24.730311-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (8, 'Mitos y leyendas colombianas', '## Mitos y leyendas cundiboyacenses
Los mitos y leyendas creados en las regiones de Boyac├í y Cundinamarca, en Colombia nacen a partir de la creencia de sus habitantes sobre dioses antiguos
[Ver m├ís](https://es.wikipedia.org/wiki/Mitos_y_leyendas_cundiboyacenses)
**Fuente:** Wikipedia

## Patasola
com/folclor-colombia/mitos-y-leyendas/patasola.html https://fabulas.info/la-patasola.html Libro:&quot;Mitos y Leyendas Colombianos (Por: Alexander Castillo Morales y Agust├¼n
[Ver m├ís](https://es.wikipedia.org/wiki/Patasola)
**Fuente:** Wikipedia

## Leyenda de Yurupar├¡
matriarcales y ca├│ticas por las leyes del Sol, que son en esencia patriarcales y ordenadas. Tambi├®n trae un conjunto de ritos, cantos y mitos sobre sus ancestros
[Ver m├ís](https://es.wikipedia.org/wiki/Leyenda_de_Yurupar├¡)
**Fuente:** Wikipedia

## Llorona
Mitos y leyendas latinoamericanas. Plaza y Janes Editores Colombia S.A. p.┬á201. ISBN┬á9789581403691.┬á Ocampo L├│pez, Javier (2006). Mitos, leyendas y relatos
[Ver m├ís](https://es.wikipedia.org/wiki/Llorona)
**Fuente:** Wikipedia

## Moh├ín
diciembre de 2023.┬á ┬½Mitos colombianos y leyendas cortas para ni├▒os┬╗. www.misenal.tv. Consultado el 10 de diciembre de 2023.┬á Leyenda o mito del Moh├ín Dibujo
[Ver m├ís](https://es.wikipedia.org/wiki/Moh├ín)
**Fuente:** Wikipedia
', 1, 1, 8, 1, '2025-03-21 21:37:20.837-05', '2025-03-21 21:37:20.837-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (13, 'N├║meros naturales y sus operaciones', '## N├║mero natural
matem├íticas, un n├║mero natural es cualquiera de los n├║meros que se usan para contar los elementos de ciertos conjuntos.[1]ÔÇï[2]ÔÇï[2]ÔÇï Los n├║meros naturales se representan
[Ver m├ís](https://es.wikipedia.org/wiki/N├║mero_natural)
**Fuente:** Wikipedia

## N├║mero entero
Un n├║mero entero es un elemento del conjunto num├®rico que contiene los n├║meros naturales; que son N = { 0 , 1 , 2 , 3 , 4 , Ôï» } {\\displaystyle \\mathbb
[Ver m├ís](https://es.wikipedia.org/wiki/N├║mero_entero)
**Fuente:** Wikipedia

## N├║mero
ciencias emp├¡ricas; no solo los naturales, sino muchos otros tipos de n├║meros que contemplan las matem├íticas. El conjunto de n├║meros enteros (representados por
[Ver m├ís](https://es.wikipedia.org/wiki/N├║mero)
**Fuente:** Wikipedia

## N├║mero racional
n├║meros racionales son todos los n├║meros que pueden representarse como el cociente de dos n├║meros enteros o, m├ís exactamente, un entero y un natural positivo;[1]ÔÇï
[Ver m├ís](https://es.wikipedia.org/wiki/N├║mero_racional)
**Fuente:** Wikipedia

## Aritm├®tica
Aritm├®tico y las Operaciones Matem├íticas, espec├¡ficamente, las cuatro Operaciones B├ísicas aplicadas, ya sea a n├║meros (n├║meros naturales, n├║meros enteros
[Ver m├ís](https://es.wikipedia.org/wiki/Aritm├®tica)
**Fuente:** Wikipedia
', 1, 2, 13, 1, '2025-03-21 21:37:20.865-05', '2025-03-21 21:37:20.865-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (415, 'Lectura literal e inferencial', '### Contenido 1
literal (centr├índose en aquellos datos expuestos de forma expl├¡cita), cr├¡tica (con juicios fundamentados sobre los valores del texto) o inferencial (leyendo
[Ver m├ís](https://es.wikipedia.org/wiki/Comprensi├│n_lectora)
**Fuente:** Wikipedia

### Contenido 2
Compresi├│n literal: Consiste en combinar el significado de varias palabras de forma apropiada para formar proposiciones. * Comprensi├│n inferencial: Proporciona
[Ver m├ís](https://es.wikipedia.org/wiki/Modelo_de_procesamiento_de_la_informaci├│n)
**Fuente:** Wikipedia

### Contenido 3
lecturas ecl├®cticas tambi├®n suelen dar una impresi├│n del n├║mero de testigos de cada lectura disponible. Aunque con frecuencia se prefiere una lectura
[Ver m├ís](https://es.wikipedia.org/wiki/Cr├¡tica_textual)
**Fuente:** Wikipedia

### Contenido 4
num├®rica. Ambas ramas (descriptiva e inferencial) se utilizan en la estad├¡stica aplicada. La estad├¡stica inferencial, por su parte, se divide en estad├¡stica
[Ver m├ís](https://es.wikipedia.org/wiki/Estad├¡stica)
**Fuente:** Wikipedia

[Ver m├ís](https://masinteresantes.com/niveles-de-comprension-lectora-literal-inferencial-y-critico/)
**Fuente:** DuckDuckGo

[Ver m├ís](https://definicionwiki.com/lectura-inferencial-y-literal-definicion-que-es-diferencias-significado-usos/)
**Fuente:** DuckDuckGo

[Ver m├ís](https://www.cinconoticias.com/lectura-inferencial/)
**Fuente:** DuckDuckGo

[Ver m├ís](https://www.lifeder.com/lectura-inferencial/)
**Fuente:** DuckDuckGo

[Ver m├ís](https://www.uninunez.edu.co/lineas/lectura/896-lectura-y-sus-tipos.html)
**Fuente:** DuckDuckGo', 1, 1, 1, 1, '2025-03-22 11:32:06.195784-05', '2025-03-22 18:50:24.01943-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (17, 'Figuras planas y sus propiedades', '## Forma (figura)
dos o m├ís puntos, l├¡neas rectas, curvas, planos, figuras planas (por ejemplo, un cuadrado o un c├¡rculo), figuras s├│lidas (por ejemplo, el cubo o la esfera)
[Ver m├ís](https://es.wikipedia.org/wiki/Forma_(figura))
**Fuente:** Wikipedia

## Figura de v├®rtice
estrellados como caras y/o figuras de v├®rtices. Las figuras de v├®rtice son especialmente significativas para los politopos uniformes y para otros politopos
[Ver m├ís](https://es.wikipedia.org/wiki/Figura_de_v├®rtice)
**Fuente:** Wikipedia

## Pol├¡gono
comunes est├ín en la siguiente tabla:[12]ÔÇï Figura geom├®trica Poliedro Politopo Regla y comp├ís Anexo:Figuras geom├®tricas Triangulaci├│n de un pol├¡gono Pol├¡gono
[Ver m├ís](https://es.wikipedia.org/wiki/Pol├¡gono)
**Fuente:** Wikipedia

## Propiedad intelectual
La propiedad intelectual se refiere a un bien econ├│mico y cultural que incluye productos intangibles, al igual que productos f├¡sicos, reconocido en la
[Ver m├ís](https://es.wikipedia.org/wiki/Propiedad_intelectual)
**Fuente:** Wikipedia

## Geometr├¡a euclidiana
estudio de las propiedades geom├®tricas de los espacios eucl├¡deos. Es aquella que estudia las propiedades geom├®tricas del plano af├¡n eucl├¡deo real y del espacio
[Ver m├ís](https://es.wikipedia.org/wiki/Geometr├¡a_euclidiana)
**Fuente:** Wikipedia
', 1, 2, 17, 1, '2025-03-21 21:37:20.885-05', '2025-03-21 21:37:20.885-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (21, 'Conversiones de unidades b├ísicas', '## Sistema Internacional de Unidades
Internacional de Unidades (en franc├®s Syst├¿me international d&#039;unit├®s) o sistema internacional (SI) es un sistema constituido por siete unidades b├ísicas: metro
[Ver m├ís](https://es.wikipedia.org/wiki/Sistema_Internacional_de_Unidades)
**Fuente:** Wikipedia

## Sistema de unidades
sistemas de unidades: Sistema Internacional de Unidades (SI): la versi├│n moderna del sistema m├®trico y el m├ís usado en la actualidad. Sus unidades b├ísicas son:
[Ver m├ís](https://es.wikipedia.org/wiki/Sistema_de_unidades)
**Fuente:** Wikipedia

## Unidad de medida
partir de un patr├│n o de una composici├│n de otras unidades definidas previamente. Las primeras unidades se conocen como unidades b├ísicas o de base (fundamentales)
[Ver m├ís](https://es.wikipedia.org/wiki/Unidad_de_medida)
**Fuente:** Wikipedia

## Redefinici├│n de las unidades del SI
comisi├│n Comit├® Internacional de Pesos y Medidas (CIPM) propuso revisar las definiciones formales de las unidades b├ísicas del SI, y que fueron consideradas
[Ver m├ís](https://es.wikipedia.org/wiki/Redefinici├│n_de_las_unidades_del_SI)
**Fuente:** Wikipedia

## Gauss (unidad)
cuadrado. 1 G = 1 Mx / cm┬▓ En unidades b├ísicas cegesimales es cmÔêÆ1/2 g1/2 sÔêÆ1. La unidad del Sistema Internacional de Unidades (SI) para la densidad del campo
[Ver m├ís](https://es.wikipedia.org/wiki/Gauss_(unidad))
**Fuente:** Wikipedia
', 1, 2, 21, 1, '2025-03-21 21:37:20.908-05', '2025-03-21 21:37:20.908-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (24, 'Gr├íficas de barras y pictogramas', '## Gr├ífica
diferentes tipos de gr├íficas: Gr├ífico lineal: los valores se dividen en dos ejes cartesianos perpendiculares entre s├¡. Las gr├íficas lineales se recomiendan
[Ver m├ís](https://es.wikipedia.org/wiki/Gr├ífica)
**Fuente:** Wikipedia

## Escritura pictogr├ífica
logogr├ífico. Este tipo de escritura se compone de pictogramas, es decir, signos ic├│nicos figurativos y realistas que representan de forma dibujada m├ís o
[Ver m├ís](https://es.wikipedia.org/wiki/Escritura_pictogr├ífica)
**Fuente:** Wikipedia

## Dise├▒o gr├ífico
populares son las gr├íficas lineales: Gr├ífica lineal Gr├ífica de barras Gr├ífico circular Gr├ífica biplot El problema con la mayor├¡a de las gr├íficas es que tienden
[Ver m├ís](https://es.wikipedia.org/wiki/Dise├▒o_gr├ífico)
**Fuente:** Wikipedia

## Periodismo infogr├ífico
estad├¡stica a trav├®s de gr├íficos, es decir, represent├│ visualmente informaci├│n num├®rica abstracta (diagrama de barras y el gr├ífico de tarta, este ├║ltimo
[Ver m├ís](https://es.wikipedia.org/wiki/Periodismo_infogr├ífico)
**Fuente:** Wikipedia

## Visualizaci├│n de datos
diagrama de barras consiste en mapear la longitud de las barras a la magnitud de cierta variable. La elecci├│n del tipo de proyecci├│n y otras decisiones de estilo
[Ver m├ís](https://es.wikipedia.org/wiki/Visualizaci├│n_de_datos)
**Fuente:** Wikipedia
', 1, 2, 24, 1, '2025-03-21 21:37:20.926-05', '2025-03-21 21:37:20.926-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (1, 'Los Recursos Naturales', '# Los Recursos Naturales

**Tema:** Ciencia, Tecnolog├¡a y Sociedad **├ürea:** Ciencias Naturales **Grado:** Sexto Grado (equivalentes: 6┬║ de Primaria, 1ro de Bachillerato, 6th Grade, 6├¿me ann├®e)

## Tabla de Contenido

1. [┬┐Qu├® son los Recursos Naturales?](#que-son-los-recursos-naturales)
2. [Tipos de Recursos Naturales](#tipos-de-recursos-naturales)
    * [Recursos Renovables](#recursos-renovables)
    * [Recursos No Renovables](#recursos-no-renovables)
3. [Importancia de los Recursos Naturales](#importancia-de-los-recursos-naturales)
4. [Uso Sostenible de los Recursos Naturales](#uso-sostenible-de-los-recursos-naturales)
    * [Ejemplos en Colombia](#ejemplos-en-colombia)
5. [Recursos Adicionales](#recursos-adicionales)

## ┬┐Qu├® son los Recursos Naturales?

Los recursos naturales son elementos de la naturaleza que los seres humanos utilizamos para satisfacer nuestras necesidades. Estos recursos son esenciales para nuestra supervivencia y desarrollo, ya que nos proporcionan alimentos, agua, energ├¡a, materiales para la construcci├│n y mucho m├ís.

> "La Tierra proporciona lo suficiente para satisfacer las necesidades de cada hombre, pero no la codicia de cada hombre." - Mahatma Gandhi

## Tipos de Recursos Naturales

### Recursos Renovables

Son aquellos que se pueden regenerar naturalmente en un per├¡odo de tiempo relativamente corto. Ejemplos:

* **Agua**: R├¡os, lagos, oc├®anos.
* **Bosques**: ├ürboles y vegetaci├│n.
* **Energ├¡a solar**: Radiaci├│n del sol.
* **Viento**: Energ├¡a e├│lica.

### Recursos No Renovables

Son aquellos que existen en cantidades limitadas y no se pueden regenerar f├ícilmente. Ejemplos:

* **Petr├│leo**: Combustible f├│sil.
* **Carb├│n**: Combustible f├│sil.
* **Minerales**: Oro, plata, cobre.

## Importancia de los Recursos Naturales

Los recursos naturales son fundamentales para:

* **La vida**: Nos proporcionan alimentos, agua y aire.
* **La econom├¡a**: Son la base de muchas industrias y actividades econ├│micas.
* **El equilibrio ecol├│gico**: Mantienen la biodiversidad y los ecosistemas saludables.

## Uso Sostenible de los Recursos Naturales

Es crucial utilizar los recursos naturales de manera responsable para garantizar su disponibilidad para las generaciones futuras. Esto implica:

* Reducir el consumo.
* Reciclar y reutilizar.
* Utilizar energ├¡as renovables.
* Proteger los ecosistemas.

### Ejemplos en Colombia

* Colombia, al ser un pa├¡s con alta biodiversidad, tiene una gran riqueza de recursos naturales. Es importante proteger ecosistemas como la selva amaz├│nica, los p├íramos y los arrecifes de coral.
* El caf├® de Colombia, es un recurso natural, que genera riqueza para el pa├¡s, y es importante generar conciencia sobre su cultivo sostenible.

## Recursos Adicionales

* **Video**: [┬┐Qu├® son los Recursos Naturales?](https://www.youtube.com/watch?v=EVwqO0QqNUU)
* **Articulo de Wikipedia**: [Recursos naturales](https://es.wikipedia.org/wiki/Recurso_natural)
* **Art├¡culo acad├®mico**: [Costos de aprovechamiento del manejo forestal comunitario en Colombia: impactos, lecciones aprendidas y desaf├¡os](http://www.scielo.org.co/scielo.php?pid=S0120-07392022000200104&script=sci_arttext)
* **Podcast**: [┬┐Estamos a tiempo para recuperar el planeta? Siempre se est├í a tiempo para algo. Lo que hagamos hoy quiz├í tardemos 10 o 20 a├▒os en ver los efectos, como el cambio clim├ítico. Pero hay que confiar en hacer bien las cosas hoy, aunque no veamos resultados a corto plazoÔÇØ.Con un mensaje esperanzador y optimista, Fernando Valladares recuerda los posibles escenarios a los que se enfrenta la humanidad en su relaci├│n con la naturaleza y el que desarrolla en su reciente libro ÔÇÿLa recivilizaci├│nÔÇÖ.](https://open.spotify.com/episode/0WruFYXqniBkpp0jTH4Pxm?si=4df3Axo2TFmmcTd4v-16gw)
* **Imagen**: ![Recursos naturales en Colombia - Infograf├¡a sobre los municipios colombianos declarados Patrimonio Cultural de la Humanidad dentro del denominado ''Paisaje Cafetero Colombiano''](https://upload.wikimedia.org/wikipedia/commons/a/a2/Paisaje-Cafetero-Colombiano.png?20110707205139)

**Nota:** Este contenido ha sido creado en equipo entre humanos y la IA de Gemini para facilitarte el acceso a la informaci├│n. Sin embargo, puede contener errores. Te invitamos a revisar las fuentes adicionales de informaci├│n que incluimos para una comprensi├│n m├ís completa y precisa.', 1, 3, 37, 1, '2025-03-21 17:50:33.501966-05', '2025-03-23 17:36:31.206556-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (6, 'Normas b├ísicas de ortograf├¡a', '## Ortograf├¡a del espa├▒ol
La ortograf├¡a del espa├▒ol es el conjunto de normas prescriptivas que rigen la forma escrita de la lengua espa├▒ola o castellana. La lengua espa├▒ola emplea
[Ver m├ís](https://es.wikipedia.org/wiki/Ortograf├¡a_del_espa├▒ol)
**Fuente:** Wikipedia

## Normas ortogr├íficas y morfol├│gicas del idioma gallego
acuerdo conjunto, &quot;elevar a la Junta de Galicia cuantas mejoras estimen conveniente incorporar a las normas b├ísicas&quot;. Seg├║n la ley, se decreta que la Real
[Ver m├ís](https://es.wikipedia.org/wiki/Normas_ortogr├íficas_y_morfol├│gicas_del_idioma_gallego)
**Fuente:** Wikipedia

## Reforma de la ortograf├¡a alemana de 1996
un intento de simplificar la ortograf├¡a y hacerla m├ís f├ícil de aprender,[1]ÔÇï sin cambiar sustancialmente las reglas b├ísicas del alem├ín. Las nuevas reglas
[Ver m├ís](https://es.wikipedia.org/wiki/Reforma_de_la_ortograf├¡a_alemana_de_1996)
**Fuente:** Wikipedia

## Reforma ortogr├ífica quechua-aimara
muestra ejemplos de ortograf├¡a moderna de las expresiones aymaras y quechuas seg├║n los alfabetos normalizados, sus significados y ortograf├¡as err├│neas comunes
[Ver m├ís](https://es.wikipedia.org/wiki/Reforma_ortogr├ífica_quechua-aimara)
**Fuente:** Wikipedia

## Alfabeto quechua
lengua y la convenci├│n utilizan diferente cantidad de letras. En Per├║ y Bolivia se emplea una ortograf├¡a estandarizada con peque├▒as diferencias que se basa
[Ver m├ís](https://es.wikipedia.org/wiki/Alfabeto_quechua)
**Fuente:** Wikipedia
', 1, 1, 6, 1, '2025-03-21 21:37:20.825-05', '2025-03-21 21:37:20.825-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (7, 'G├®neros literarios b├ísicos', '## G├®nero literario
Los g├®neros literarios son los diferentes grupos o categor├¡as en las que podemos clasificar las obras literarias atendiendo a su contenido y estructura
[Ver m├ís](https://es.wikipedia.org/wiki/G├®nero_literario)
**Fuente:** Wikipedia

## Literatura
vestuario. Los g├®neros literarios son diversas categor├¡as que nos permiten clasificar de una forma f├ícil y sencilla los diferentes textos literarios. Dependiendo
[Ver m├ís](https://es.wikipedia.org/wiki/Literatura)
**Fuente:** Wikipedia

## Cr├¡tica literaria
de incorporar los g├®neros ensay├¡sticos y did├ícticos a la ense├▒anza de la literatura como paso b├ísico para una epistemolog├¡a literaria y una pedagog├¡a justa
[Ver m├ís](https://es.wikipedia.org/wiki/Cr├¡tica_literaria)
**Fuente:** Wikipedia

## G├®nero period├¡stico
subt├¡tulo (que incluyen quien y lo qu├®), la entrada (s├¡ntesis de los datos b├ísicos) y el cuerpo (exposici├│n de los datos en orden decreciente de importancia)
[Ver m├ís](https://es.wikipedia.org/wiki/G├®nero_period├¡stico)
**Fuente:** Wikipedia

## G├®nero teatral
persona y la comunicaci├│n. Se puede decir que existen cuatro g├®neros teatrales b├ísicos definidos, impl├¡citos o derivados de Arist├│teles: tragedia, comedia
[Ver m├ís](https://es.wikipedia.org/wiki/G├®nero_teatral)
**Fuente:** Wikipedia
', 1, 1, 7, 1, '2025-03-21 21:37:20.831-05', '2025-03-21 21:37:20.831-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (174, 'Derechos humanos fundamentales', '# Derechos y deberes fundamentales

## Tabla de contenido
* [Introducci├│n](#introduccion)
* [┬┐Qu├® son los derechos fundamentales?](#que-son-los-derechos-fundamentales)
* [┬┐Qu├® son los deberes fundamentales?](#que-son-los-deberes-fundamentales)
* [Derechos fundamentales](#derechos-fundamentales)
    * [Derecho a la vida](#derecho-a-la-vida)
    * [Derecho a la igualdad](#derecho-a-la-igualdad)
    * [Derecho a la libertad](#derecho-a-la-libertad)
    * [Derecho a la educaci├│n](#derecho-a-la-educacion)
    * [Derecho a la salud](#derecho-a-la-salud)
    * [Derecho a la vivienda](#derecho-a-la-vivienda)
    * [Derecho a la alimentaci├│n](#derecho-a-la-alimentacion)
* [Deberes fundamentales](#deberes-fundamentales)
    * [Respetar los derechos ajenos](#respetar-los-derechos-ajenos)
    * [Cumplir la Constituci├│n y las leyes](#cumplir-la-constitucion-y-las-leyes)
    * [Proteger los recursos naturales y el medio ambiente](#proteger-los-recursos-naturales-y-el-medio-ambiente)
    * [Participar en la vida pol├¡tica, c├¡vica y comunitaria](#participar-en-la-vida-politica-civica-y-comunitaria)
    * [Contribuir al financiamiento de los gastos p├║blicos](#contribuir-al-financiamiento-de-los-gastos-publicos)
* [Relaci├│n entre derechos y deberes](#relacion-entre-derechos-y-deberes)
* [Ejemplos Regionales (Colombia) y Universales](#ejemplos-regionales-colombia-y-universales)
* [Recursos Multimedia](#recursos-multimedia)
* [Referencias](#referencias)
* [Recursos Adicionales](#recursos-adicionales)
* [Nota Aclaratoria](#nota-aclaratoria)

## Introducci├│n
Los derechos y deberes fundamentales son los pilares de una sociedad justa y democr├ítica. Los derechos son las libertades y protecciones que todos los individuos tienen garantizadas, mientras que los deberes son las responsabilidades que todos compartimos para mantener el orden y el bienestar com├║n. Conocer y ejercer nuestros derechos y cumplir con nuestros deberes es esencial para construir una sociedad mejor para todos.

## ┬┐Qu├® son los derechos fundamentales?
Los derechos fundamentales son aquellos inherentes a la dignidad humana, reconocidos en la Constituci├│n y en los tratados internacionales de derechos humanos. Son universales, inalienables, irrenunciables e imprescriptibles, lo que significa que pertenecen a todos los seres humanos desde el nacimiento, no pueden ser transferidos ni negados, no se pueden renunciar a ellos y no se pierden con el tiempo.

## ┬┐Qu├® son los deberes fundamentales?
Los deberes fundamentales son las obligaciones que todos los ciudadanos tienen para con la sociedad y el Estado. Son necesarios para garantizar el ejercicio de los derechos y el funcionamiento de la sociedad. El cumplimiento de los deberes contribuye al bienestar com├║n y al mantenimiento del orden social.

## Derechos fundamentales
### Derecho a la vida
*   Toda persona tiene derecho a la vida, a la integridad f├¡sica y moral.
*   Implica la protecci├│n contra la tortura, los tratos crueles, inhumanos o degradantes, y la pena de muerte (en pa├¡ses donde no est├í abolida).

### Derecho a la igualdad
*   Todas las personas son iguales ante la ley y tienen derecho a la misma protecci├│n y trato.
*   Implica la prohibici├│n de la discriminaci├│n por motivos de raza, color, sexo, idioma, religi├│n, opini├│n pol├¡tica, origen nacional o social, posici├│n econ├│mica, nacimiento o cualquier otra condici├│n.

### Derecho a la libertad
*   Toda persona tiene derecho a la libertad personal, de pensamiento, de expresi├│n, de reuni├│n, de asociaci├│n, de religi├│n y de movimiento.
*   Estas libertades est├ín sujetas a limitaciones razonables y necesarias para proteger los derechos de los dem├ís y el orden p├║blico.

### Derecho a la educaci├│n
*   Toda persona tiene derecho a la educaci├│n, que debe ser gratuita y obligatoria en sus niveles b├ísicos.
*   La educaci├│n debe promover el pleno desarrollo de la personalidad humana y fortalecer el respeto a los derechos humanos y las libertades fundamentales.

### Derecho a la salud
*   Toda persona tiene derecho a la protecci├│n de la salud.
*   Implica el acceso a servicios de salud de calidad, la promoci├│n de h├íbitos saludables y la prevenci├│n de enfermedades.

### Derecho a la vivienda
*   Toda persona tiene derecho a una vivienda digna y adecuada.
*   El Estado debe promover pol├¡ticas que faciliten el acceso a la vivienda, especialmente para las personas de bajos recursos.

### Derecho a la alimentaci├│n
*   Toda persona tiene derecho a una alimentaci├│n adecuada y nutritiva.
*   El Estado debe promover pol├¡ticas que garanticen la seguridad alimentaria y el acceso a alimentos suficientes y de calidad.

## Deberes fundamentales
### Respetar los derechos ajenos
*   El ejercicio de los derechos propios no puede vulnerar los derechos de los dem├ís.
*   Implica la tolerancia, la no discriminaci├│n y el respeto a la dignidad humana.

### Cumplir la Constituci├│n y las leyes
*   Todos los ciudadanos est├ín obligados a cumplir la Constituci├│n y las leyes de la Rep├║blica.
*   El cumplimiento de la ley es esencial para mantener el orden social y garantizar la convivencia pac├¡fica.

### Proteger los recursos naturales y el medio ambiente
*   Todos tienen el deber de proteger los recursos naturales, conservar el medio ambiente y promover el desarrollo sostenible.
*   Implica la adopci├│n de pr├ícticas responsables en el uso de los recursos y la prevenci├│n de la contaminaci├│n.

### Participar en la vida pol├¡tica, c├¡vica y comunitaria
*   Todos los ciudadanos tienen el deber de participar en la vida pol├¡tica, c├¡vica y comunitaria de su pa├¡s.
*   Implica el ejercicio del derecho al voto, la participaci├│n en organizaciones sociales y la colaboraci├│n con las autoridades.

### Contribuir al financiamiento de los gastos p├║blicos
*   Todos los ciudadanos tienen el deber de contribuir al financiamiento de los gastos p├║blicos a trav├®s del pago de impuestos y contribuciones.
*   El pago de impuestos es esencial para que el Estado pueda cumplir sus funciones y garantizar los derechos de todos los ciudadanos.

## Relaci├│n entre derechos y deberes
Los derechos y los deberes son dos caras de la misma moneda. Los derechos implican deberes para los dem├ís y para el Estado, mientras que el cumplimiento de los deberes garantiza el ejercicio de los derechos. No se puede concebir una sociedad justa y democr├ítica sin el respeto y la garant├¡a de los derechos, as├¡ como el cumplimiento de los deberes.

## Ejemplos Regionales (Colombia) y Universales
*   **Colombia:** La Constituci├│n Pol├¡tica de Colombia de 1991 consagra una amplia gama de derechos fundamentales y establece los deberes de los ciudadanos. La Corte Constitucional es la encargada de proteger los derechos fundamentales y garantizar su cumplimiento.
*   **Universal:** La Declaraci├│n Universal de Derechos Humanos de la ONU establece los derechos fundamentales que deben ser respetados en todos los pa├¡ses. Muchos pa├¡ses han incorporado estos derechos en sus constituciones y leyes.

## Recursos Multimedia
*   **Video Educativo:** ┬┐Qu├® son los Derechos Fundamentales en Colombia? Constituci├│n Pol├¡tica [https://www.youtube.com/watch?v=wYaUc_vtk5Q](https://www.youtube.com/watch?v=wYaUc_vtk5Q)
*   **Art├¡culo de Wikipedia:** Derechos humanos [https://es.wikipedia.org/wiki/Derechos_humanos](https://es.wikipedia.org/wiki/Derechos_humanos)
*   **Art├¡culo Acad├®mico:** Derechos Humanos y Deberes [https://www.redalyc.org/pdf/1411/141121432006.pdf](https://www.redalyc.org/pdf/1411/141121432006.pdf)
*   **Imagen:** ![La Libertad guiando al pueblo, por Eug├¿ne Delacroix (1830). Los derechos humanos fueron recogidos en las leyes ÔÇöpositivaci├│nÔÇö a ra├¡z de las revoluciones burguesas de los siglos XVII y XVIII: la Revoluci├│n inglesa, la Revoluci├│n Americana y la Revoluci├│n francesa; esta ├║ltima promovi├│ la aprobaci├│n, en la Asamblea Nacional de 26 de agosto de 1789, de la Declaraci├│n de los Derechos del Hombre y del Ciudadano. La ONU aprob├│, el 10 de diciembre de 1948, la Declaraci├│n Universal de los Derechos Humanos que recoge en sus 36 art├¡culos los derechos humanos considerados b├ísicos.](https://upload.wikimedia.org/wikipedia/commons/5/5d/Eug%C3%A8ne_Delacroix_-_Le_28_Juillet._La_Libert%C3%A9_guidant_le_peuple.jpg "La Libertad guiando al pueblo, por Eug├¿ne Delacroix (1830). Los derechos humanos fueron recogidos en las leyes ÔÇöpositivaci├│nÔÇö a ra├¡z de las revoluciones burguesas de los siglos XVII y XVIII: la Revoluci├│n inglesa, la Revoluci├│n Americana y la Revoluci├│n francesa; esta ├║ltima promovi├│ la aprobaci├│n, en la Asamblea Nacional de 26 de agosto de 1789, de la Declaraci├│n de los Derechos del Hombre y del Ciudadano. La ONU aprob├│, el 10 de diciembre de 1948, la Declaraci├│n Universal de los Derechos Humanos que recoge en sus 36 art├¡culos los derechos humanos considerados b├ísicos.") La Libertad guiando al pueblo, por Eug├¿ne Delacroix (1830). Los derechos humanos fueron recogidos en las leyes ÔÇöpositivaci├│nÔÇö a ra├¡z de las revoluciones burguesas de los siglos XVII y XVIII: la Revoluci├│n inglesa, la Revoluci├│n Americana y la Revoluci├│n francesa; esta ├║ltima promovi├│ la aprobaci├│n, en la Asamblea Nacional de 26 de agosto de 1789, de la Declaraci├│n de los Derechos del Hombre y del Ciudadano. La ONU aprob├│, el 10 de diciembre de 1948, la Declaraci├│n Universal de los Derechos Humanos que recoge en sus 36 art├¡culos los derechos humanos considerados b├ísicos.
* **Podcast:** [El ABC de los Derechos Humanos](https://open.spotify.com/embed/episode/0sRJbGlUEyU5Wz8kSIj4Kx?utm_source=generator&theme=0)', 3, 4, 174, 1, '2025-03-21 21:37:21.811-05', '2025-03-24 16:09:56.109203-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (11, 'Tiempos verbales simples', '## Tiempo verbal
definen los tiempos verbales en una lengua generalmente se les denomina categor├¡as TAM (tiempo-aspecto-modo). Cuando se afirma algo, el tiempo absoluto de
[Ver m├ís](https://es.wikipedia.org/wiki/Tiempo_verbal)
**Fuente:** Wikipedia

## Tiempos verbales en espa├▒ol
Los tiempos verbales en espa├▒ol se refieren a las confluencias de diversas categor├¡as gramaticales como tiempo gramatical y aspecto gramatical, que en
[Ver m├ís](https://es.wikipedia.org/wiki/Tiempos_verbales_en_espa├▒ol)
**Fuente:** Wikipedia

## Per├¡frasis verbal
Se llama per├¡frasis verbal a un tipo de per├¡frasis compuesta de al menos dos formas verbales: una forma finita llamada auxiliar y otra forma o &quot;verbo principal&quot;
[Ver m├ís](https://es.wikipedia.org/wiki/Per├¡frasis_verbal)
**Fuente:** Wikipedia

## Verbo
la tercera. En espa├▒ol, las formas verbales que distinguen la persona son formas personales, y las formas verbales que no la expresan son formas no personales
[Ver m├ís](https://es.wikipedia.org/wiki/Verbo)
**Fuente:** Wikipedia

## Presente simple
el tiempo verbal presente (de aspecto no perfecto). Es uno de los tiempos verbales del presente utilizados en ingl├®s, adem├ís del presente progresivo,
[Ver m├ís](https://es.wikipedia.org/wiki/Presente_simple)
**Fuente:** Wikipedia
', 1, 1, 11, 1, '2025-03-21 21:37:20.854-05', '2025-03-21 21:37:20.854-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (12, 'Concordancia gramatical', '## Concordancia gramatical
generativa la concordancia gramatical ya sea dentro de un sintagma nominal (o sintagma determinante), la concordancia sujeto-verbo o la concordancia de polaridad
[Ver m├ís](https://es.wikipedia.org/wiki/Concordancia_gramatical)
**Fuente:** Wikipedia

## Concordancia
Concordancia puede designar: En gram├ítica, a la concordancia gramatical, la regla que indica que los distintos elementos de una frase deben indicar su
[Ver m├ís](https://es.wikipedia.org/wiki/Concordancia)
**Fuente:** Wikipedia

## G├®nero gramatical en espa├▒ol
relacionados con ellos, siendo la principal manifestaci├│n del g├®nero la concordancia gramatical. En las lenguas rom├ínicas se dice que el g├®nero tiene una refracci├│n
[Ver m├ís](https://es.wikipedia.org/wiki/G├®nero_gramatical_en_espa├▒ol)
**Fuente:** Wikipedia

## G├®nero gramatical
reglas de concordancia gramatical. El g├®nero gramatical puede ser analizado como un rasgo gramatical involucrado en las relaciones de concordancia de g├®nero
[Ver m├ís](https://es.wikipedia.org/wiki/G├®nero_gramatical)
**Fuente:** Wikipedia

## Rasgo gramatical
controlador con que debe existir una relaci├│n de concordancia o de recci├│n: Concordancia gramatical, dos o m├ís elementos dentro de un sintagma o una oraci├│n
[Ver m├ís](https://es.wikipedia.org/wiki/Rasgo_gramatical)
**Fuente:** Wikipedia
', 1, 1, 12, 1, '2025-03-21 21:37:20.859-05', '2025-03-21 21:37:20.859-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (186, 'Velocidad de reacci├│n', '', 3, 6, 186, 1, '2025-03-21 21:37:21.877-05', '2025-03-21 21:37:21.877-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (15, 'M├║ltiplos y divisores', '## Divisibilidad
y entre s├¡ mismo. Los n├║meros mayores que 1 que no admiten m├ís que estos dos divisores se llaman n├║meros primos. Los que admiten m├ís de dos divisores
[Ver m├ís](https://es.wikipedia.org/wiki/Divisibilidad)
**Fuente:** Wikipedia

## M├íximo com├║n divisor
{\\displaystyle a} y b {\\displaystyle b} .[1]ÔÇï Obs├®rvese que dos n├║meros enteros cualesquiera tienen divisores comunes. Si los divisores comunes de a {\\displaystyle
[Ver m├ís](https://es.wikipedia.org/wiki/M├íximo_com├║n_divisor)
**Fuente:** Wikipedia

## As (moneda)
comercio privado, ya que no han podido reducirse a un sistema de m├║ltiplos y divisores como las monedas propias, sino que ofrecen pesos variables. Moneda
[Ver m├ís](https://es.wikipedia.org/wiki/As_(moneda))
**Fuente:** Wikipedia

## Vigintivirato
ÔÇöaureusÔÇö y en plata ÔÇödenariusÔÇö eran competencia del emperador, solamente vigilaban la acu├▒aci├│n de monedas de bronce ÔÇöases y sus m├║ltiplos y divisoresÔÇö y de
[Ver m├ís](https://es.wikipedia.org/wiki/Vigintivirato)
**Fuente:** Wikipedia

## M├║ltiplo
respectivamente. Los primeros m├║ltiplos del uno al diez se agrupan en las tablas de multiplicar. Si b es un m├║ltiplo de a, entonces a es un divisor de b. Todo n├║mero
[Ver m├ís](https://es.wikipedia.org/wiki/M├║ltiplo)
**Fuente:** Wikipedia
', 1, 2, 15, 1, '2025-03-21 21:37:20.875-05', '2025-03-21 21:37:20.875-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (14, 'N├║meros enteros y sus operaciones', '## N├║mero entero
que los &quot;n├║meros enteros&quot; se refer├¡an a los n├║meros naturaless, excluyendo los n├║meros negativos, mientras que los &quot;enteros&quot; inclu├¡an los n├║meros negativos
[Ver m├ís](https://es.wikipedia.org/wiki/N├║mero_entero)
**Fuente:** Wikipedia

## Propiedades de los n├║meros enteros
El conjunto de los n├║meros enteros, provisto de las operaciones de adici├│n y multiplicaci├│n forman lo que en ├ílgebra abstracta se conoce como una estructura
[Ver m├ís](https://es.wikipedia.org/wiki/Propiedades_de_los_n├║meros_enteros)
**Fuente:** Wikipedia

## N├║mero racional
Los n├║meros racionales son todos los n├║meros que pueden representarse como el cociente de dos n├║meros enteros o, m├ís exactamente, un entero y un natural
[Ver m├ís](https://es.wikipedia.org/wiki/N├║mero_racional)
**Fuente:** Wikipedia

## N├║mero natural
matem├íticas, un n├║mero natural es cualquiera de los n├║meros que se usan para contar los elementos de ciertos conjuntos.[1]ÔÇï[2]ÔÇï[2]ÔÇï Los n├║meros naturales se
[Ver m├ís](https://es.wikipedia.org/wiki/N├║mero_natural)
**Fuente:** Wikipedia

## Entero (tipo de dato)
positivos (enteros sin signo): del 0 al 4294967295 Positivos y negativos (enteros con signo): del -2147483648 al 2147483647 Las t├¡picas operaciones aritm├®ticas:
[Ver m├ís](https://es.wikipedia.org/wiki/Entero_(tipo_de_dato))
**Fuente:** Wikipedia
', 1, 2, 14, 1, '2025-03-21 21:37:20.87-05', '2025-03-21 21:37:20.87-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (18, 'Per├¡metro y ├írea de figuras b├ísicas', '## ├ürea
y el ├írea multiplicando el de la representaci├│n por 10┬á0002. Sin embargo, no existe un v├¡nculo directo entre el ├írea y el per├¡metro de ninguna figura
[Ver m├ís](https://es.wikipedia.org/wiki/├ürea)
**Fuente:** Wikipedia

## Pol├¡gono
consecutivamente. Per├¡metro (P): es la suma de las longitudes de todos los lados del pol├¡gono. Semiper├¡metro (SP): es la mitad del per├¡metro. Diagonales totales
[Ver m├ís](https://es.wikipedia.org/wiki/Pol├¡gono)
**Fuente:** Wikipedia

## C├¡rculo
nombre d {\\displaystyle d} en la figura. Su longitud es el doble que la del radio. El per├¡metro es el contorno del c├¡rculo y su longitud. Se├▒alado con el
[Ver m├ís](https://es.wikipedia.org/wiki/C├¡rculo)
**Fuente:** Wikipedia

## Per├¡metro de Exclusi├│n del Gran Concepci├│n
El Per├¡metro de Exclusi├│n del Gran Concepci├│n es la regulaci├│n de los taxibuses del transporte p├║blico urbano en el ├írea metropolitana del Gran Concepci├│n
[Ver m├ís](https://es.wikipedia.org/wiki/Per├¡metro_de_Exclusi├│n_del_Gran_Concepci├│n)
**Fuente:** Wikipedia

## Organizaci├│n territorial de Colombia
com├║nmente el mismo nombre del municipio y funge como su capital. El ├írea geogr├ífica delimitada por el per├¡metro censal, a su interior se localiza el centro
[Ver m├ís](https://es.wikipedia.org/wiki/Organizaci├│n_territorial_de_Colombia)
**Fuente:** Wikipedia
', 1, 2, 18, 1, '2025-03-21 21:37:20.891-05', '2025-03-21 21:37:20.891-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (231, 'Independencias latinoamericanas', '', 4, 4, 231, 1, '2025-03-21 21:37:22.116-05', '2025-03-21 21:37:22.116-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (22, 'Recolecci├│n y organizaci├│n de datos', '## Caza y recolecci├│n
y recolecci├│n al sistema de sustento que implica cazar animales para consumirlo, as├¡ como utilizarlos para la fabricaci├│n de ropa y herramientas de caza
[Ver m├ís](https://es.wikipedia.org/wiki/Caza_y_recolecci├│n)
**Fuente:** Wikipedia

## Miner├¡a de datos
referirse a cualquier forma de datos a gran escala o procesamiento de la informaci├│n (recolecci├│n, extracci├│n, almacenamiento, an├ílisis y estad├¡sticas), pero
[Ver m├ís](https://es.wikipedia.org/wiki/Miner├¡a_de_datos)
**Fuente:** Wikipedia

## An├ílisis de datos
recopilaci├│n, organizaci├│n, interpretaci├│n y visualizaci├│n de conjuntos de datos con el objetivo de extraer informaci├│n significativa y relevante. Este
[Ver m├ís](https://es.wikipedia.org/wiki/An├ílisis_de_datos)
**Fuente:** Wikipedia

## Impacto ambiental de la basura
implemente m├®todos de relleno sanitario (incluyendo la recolecci├│n y ventilaci├│n de gases). Al dise├▒ar un sistema de recolecci├│n de desechos s├│lidos, se
[Ver m├ís](https://es.wikipedia.org/wiki/Impacto_ambiental_de_la_basura)
**Fuente:** Wikipedia

## Base de conocimiento
base de conocimiento es un tipo especial de base de datos para la gesti├│n del conocimiento. Provee los medios para la recolecci├│n, organizaci├│n y recuperaci├│n
[Ver m├ís](https://es.wikipedia.org/wiki/Base_de_conocimiento)
**Fuente:** Wikipedia
', 1, 2, 22, 1, '2025-03-21 21:37:20.914-05', '2025-03-21 21:37:20.914-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (23, 'Tablas de frecuencia simples', '## Frecuencia modulada
La frecuencia modulada (FM),[1]ÔÇï o modulaci├│n de frecuencia,[2]ÔÇï[3]ÔÇï es una t├®cnica de modulaci├│n angular[4]ÔÇï[n 1]ÔÇï que permite transmitir informaci├│n
[Ver m├ís](https://es.wikipedia.org/wiki/Frecuencia_modulada)
**Fuente:** Wikipedia

## Tablas Eugubinas
Las tablas eugubinas (en lat├¡n: Tabul├ª Iguvin├ª) son siete tablas de bronce de la antigua Eugubina (actual Gubbio, Umbr├¡a, Italia) escritas en idioma umbro
[Ver m├ís](https://es.wikipedia.org/wiki/Tablas_Eugubinas)
**Fuente:** Wikipedia

## Tabla de consulta
con m├ís frecuencia. A pesar de la introducci├│n del almacenamiento en cach├® en todo el sistema que ahora automatiza este proceso, las tablas de b├║squeda
[Ver m├ís](https://es.wikipedia.org/wiki/Tabla_de_consulta)
**Fuente:** Wikipedia

## Tabla de contingencia
estad├¡stica las tablas de contingencia se emplean para registrar y analizar la asociaci├│n entre dos o m├ís variables, habitualmente de naturaleza cualitativa
[Ver m├ís](https://es.wikipedia.org/wiki/Tabla_de_contingencia)
**Fuente:** Wikipedia

## Tabla hash
tama├▒o del vector de las tablas hash es con frecuencia un n├║mero primo. Esto se hace con el objetivo de evitar la tendencia de que los hash de enteros grandes
[Ver m├ís](https://es.wikipedia.org/wiki/Tabla_hash)
**Fuente:** Wikipedia
', 1, 2, 23, 1, '2025-03-21 21:37:20.919-05', '2025-03-21 21:37:20.919-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (28, 'Estructura celular b├ísica', '## Biolog├¡a celular
considerando su estructura interior. Es en este siglo, cuando se desarrolla la teor├¡a celular , que reconoce la c├®lula como la unidad b├ísica de estructura y funci├│n
[Ver m├ís](https://es.wikipedia.org/wiki/Biolog├¡a_celular)
**Fuente:** Wikipedia

## Teor├¡a celular
estructural b├ísica de todos los organismos, y que todas las c├®lulas provienen de c├®lulas preexistentes. Las c├®lulas son la unidad b├ísica de estructura en todos
[Ver m├ís](https://es.wikipedia.org/wiki/Teor├¡a_celular)
**Fuente:** Wikipedia

## Aut├│mata celular
Un aut├│mata celular (A.C.) es un modelo matem├ítico y computacional para un sistema din├ímico que evoluciona en pasos discretos. Es adecuado para modelar
[Ver m├ís](https://es.wikipedia.org/wiki/Aut├│mata_celular)
**Fuente:** Wikipedia

## Membrana plasm├ítica
acuerdo con su estructura b├ísica, son dos tipos de membrana lip├¡dica, una de ├ícidos grasos y la otra de isoprenoides: Es la estructura m├ís extendida entre
[Ver m├ís](https://es.wikipedia.org/wiki/Membrana_plasm├ítica)
**Fuente:** Wikipedia

## Estructura
Los ├ítomos de un cristal tienen una estructura que implica la repetici├│n de una unidad b├ísica llamada unidad celular. Los ├ítomos pueden ser modelados como
[Ver m├ís](https://es.wikipedia.org/wiki/Estructura)
**Fuente:** Wikipedia
', 1, 3, 28, 1, '2025-03-21 21:37:20.948-05', '2025-03-21 21:37:20.948-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (26, 'Patrones num├®ricos', '## Reconocimiento de patrones
de patrones ÔÇötambi├®n llamado lectura de patrones, identificaci├│n de figuras y reconocimiento de formasÔÇö[1]ÔÇï consiste en el reconocimiento de patrones de
[Ver m├ís](https://es.wikipedia.org/wiki/Reconocimiento_de_patrones)
**Fuente:** Wikipedia

## C├│digo Universal de Producto
las tiendas. UPC (t├®cnicamente se refiere a UPC-A) consta de 12 d├¡gitos num├®ricos, que se asignan de forma ├║nica a cada art├¡culo comercial. Junto con el
[Ver m├ís](https://es.wikipedia.org/wiki/C├│digo_Universal_de_Producto)
**Fuente:** Wikipedia

## Formato de n├║mero de computadora
valores num├®ricos en hardware y software de dispositivos digitales, como en computadoras y calculadoras electr├│nicas.[1]ÔÇï Los valores num├®ricos se almacenan
[Ver m├ís](https://es.wikipedia.org/wiki/Formato_de_n├║mero_de_computadora)
**Fuente:** Wikipedia

## Teom├ítica
demostrada postulan que el an├ílisis num├®rico de la Biblia revela patrones num├®ricos no explicables por la casualidad ni el azar.[2]ÔÇï Los postulados de
[Ver m├ís](https://es.wikipedia.org/wiki/Teom├ítica)
**Fuente:** Wikipedia

## B├║squeda de patrones (optimizaci├│n)
patrones (conocida tambi├®n como b├║squeda directa, b├║squeda sin derivados o b├║squeda de caja negra) es una familia de m├®todos de optimizaci├│n num├®rica
[Ver m├ís](https://es.wikipedia.org/wiki/B├║squeda_de_patrones_(optimizaci├│n))
**Fuente:** Wikipedia
', 1, 2, 26, 1, '2025-03-21 21:37:20.937-05', '2025-03-21 21:37:20.937-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (27, 'Clasificaci├│n de los seres vivos', '## Taxonom├¡a
constituyen los sistemas de clasificaci├│n de los organismos. Los sistemas de clasificaci├│n pueden ser ┬½arbitrarios┬╗, si solo tratan de agrupar los organismos
[Ver m├ís](https://es.wikipedia.org/wiki/Taxonom├¡a)
**Fuente:** Wikipedia

## Ser vivo
de tal manera que los seres vivos funcionan por s├¡ mismos sin perder su nivel estructural hasta su muerte.[2]ÔÇï La materia que compone los seres vivos
[Ver m├ís](https://es.wikipedia.org/wiki/Ser_vivo)
**Fuente:** Wikipedia

## Sistema natural de clasificaci├│n
que son de vital importancia para dar un estudio m├ís detallado y completo acerca de la clasificaci├│n de los seres vivos. Una taxonom├¡a puede ser considerada
[Ver m├ís](https://es.wikipedia.org/wiki/Sistema_natural_de_clasificaci├│n)
**Fuente:** Wikipedia

## Nomenclatura binominal
diferentes especies de organismos (vivos o extintos). A veces se hace referencia a la nomenclatura binominal como sistema de clasificaci├│n binominal.[1]ÔÇï Como
[Ver m├ís](https://es.wikipedia.org/wiki/Nomenclatura_binominal)
**Fuente:** Wikipedia

## Clasificaci├│n de los virus
utilizados para los seres vivos. Los virus se clasifican principalmente por caracter├¡sticas fenot├¡picas, como c├ípside, tipo de ├ícido nucleico, tipo de prote├¡nas
[Ver m├ís](https://es.wikipedia.org/wiki/Clasificaci├│n_de_los_virus)
**Fuente:** Wikipedia
', 1, 3, 27, 1, '2025-03-21 21:37:20.943-05', '2025-03-21 21:37:20.943-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (321, 'Presente perfecto continuo', '', 5, 13, 321, 1, '2025-03-21 21:37:22.611-05', '2025-03-21 21:37:22.611-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (33, 'M├íquinas simples', '## M├íquina simple
las m├íquinas simples se combinan para formar m├íquinas m├ís complejas. Un enfoque consiste en adjuntar m├íquinas simples en serie para obtener m├íquinas compuestas
[Ver m├ís](https://es.wikipedia.org/wiki/M├íquina_simple)
**Fuente:** Wikipedia

## M├íquina
machinar─¡us) al conjunto de m├íquinas que se aplican para un mismo fin y al mecanismo que da movimiento a un dispositivo. las m├íquinas pueden clasificarse en
[Ver m├ís](https://es.wikipedia.org/wiki/M├íquina)
**Fuente:** Wikipedia

## M├íquina (tecnolog├¡a)
una m├íquina puede descomponerse en elementos m├│viles simples llev├│ a Arqu├¡medes a definir la palanca, la polea y el tornillo como m├íquinas simples. En
[Ver m├ís](https://es.wikipedia.org/wiki/M├íquina_(tecnolog├¡a))
**Fuente:** Wikipedia

## Elemento de m├íquina
de m├íquinas (1979) Autor: Decker, Karl Editor: Urmo, S.A. de Ediciones ISBN 84-314-0340-3 Contribuci├│n al estudio del calentamiento de las m├íquinas el├®ctricas
[Ver m├ís](https://es.wikipedia.org/wiki/Elemento_de_m├íquina)
**Fuente:** Wikipedia

## M├íquina el├®ctrica
conjunto de la m├íquina. Desde una visi├│n mec├ínica, las m├íquinas el├®ctricas se pueden clasificar en rotativas y est├íticas. Las m├íquinas rotativas est├ín
[Ver m├ís](https://es.wikipedia.org/wiki/M├íquina_el├®ctrica)
**Fuente:** Wikipedia
', 1, 3, 33, 1, '2025-03-21 21:37:20.975-05', '2025-03-21 21:37:20.975-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (34, 'Estados de la materia', '## Estado de agregaci├│n de la materia
pueden obtenerse distintos estados o fases, denominados estados de agregaci├│n de la materia, en relaci├│n con las fuerzas de uni├│n de las part├¡culas (mol├®culas
[Ver m├ís](https://es.wikipedia.org/wiki/Estado_de_agregaci├│n_de_la_materia)
**Fuente:** Wikipedia

## Materia
es materia; en esa acepci├│n la materia incluir├¡a a los fotones e incluso a la materia oscura. La materia formada por ├ítomos existe en varios estados (tambi├®n
[Ver m├ís](https://es.wikipedia.org/wiki/Materia)
**Fuente:** Wikipedia

## Materia extra├▒a
en materia indestructible), resultando as├¡ materia de quarks (probablemente materia extra├▒a). El significado m├ís estricto se refiere a la materia de quarks
[Ver m├ís](https://es.wikipedia.org/wiki/Materia_extra├▒a)
**Fuente:** Wikipedia

## Materia oscura
denomina materia oscura a un tipo de materia que se estima aproximadamente al 85% de la materia del universo,[1]ÔÇï y que no es energ├¡a oscura, materia bari├│nica
[Ver m├ís](https://es.wikipedia.org/wiki/Materia_oscura)
**Fuente:** Wikipedia

## Materia bari├│nica
cosmolog├¡a, materia bari├│nica es toda forma de materia constituida por bariones y leptones (a excepci├│n de determinados tipos de neutrinos). Es decir, es la materia
[Ver m├ís](https://es.wikipedia.org/wiki/Materia_bari├│nica)
**Fuente:** Wikipedia
', 1, 3, 34, 1, '2025-03-21 21:37:20.981-05', '2025-03-21 21:37:20.981-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (366, 'Ondas electromagn├®ticas', '', 6, 10, 366, 1, '2025-03-21 21:37:22.849-05', '2025-03-21 21:37:22.849-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (36, 'Mezclas y sustancias', '## Mezcla
Heterog├®neas. Los componentes de una mezcla pueden ser:[6]ÔÇï S├│lidos L├¡quidos Gaseosos Las mezclas homog├®neas son mezclas cuyos componentes se encuentran distribuidos
[Ver m├ís](https://es.wikipedia.org/wiki/Mezcla)
**Fuente:** Wikipedia

## Agencia Europea de Sustancias y Mezclas Qu├¡micas
La Agencia Europea de Sustancias y Mezclas Qu├¡micas (en ingl├®s, European Chemicals Agency, ECHA) es una agencia de la Uni├│n Europea, que gestiona los aspectos
[Ver m├ís](https://es.wikipedia.org/wiki/Agencia_Europea_de_Sustancias_y_Mezclas_Qu├¡micas)
**Fuente:** Wikipedia

## Sustancia qu├¡mica
Una sustancia no puede separarse en otras por ning├║n medio f├¡sico.[9]ÔÇï Estas sustancias pueden clasificarse en dos grupos: sustancias simples y sustancias
[Ver m├ís](https://es.wikipedia.org/wiki/Sustancia_qu├¡mica)
**Fuente:** Wikipedia

## M├®todos de separaci├│n de fases
Los m├®todos de separaci├│n de mezclas son aquellos procesos f├¡sicos por los cuales se pueden separar las mezclas.[1]ÔÇï Por lo general, el m├®todo a utilizar
[Ver m├ís](https://es.wikipedia.org/wiki/M├®todos_de_separaci├│n_de_fases)
**Fuente:** Wikipedia

## Sustancia peligrosa
clasificaci├│n, etiquetado y envasado de sustancias y mezclas, que deroga y/o modifica las Directivas 67/548/CEE y 1999/45/CE y le Reglamento (CE) n.┬║ 1907/2006
[Ver m├ís](https://es.wikipedia.org/wiki/Sustancia_peligrosa)
**Fuente:** Wikipedia
', 1, 3, 36, 1, '2025-03-21 21:37:20.993-05', '2025-03-21 21:37:20.993-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (37, 'Recursos naturales', '## Recurso natural
que rigen la distribuci├│n de esos recursos entre los distintos fines posibles. Bajo esta ├│ptica, los recursos naturales se refieren a los factores de producci├│n
[Ver m├ís](https://es.wikipedia.org/wiki/Recurso_natural)
**Fuente:** Wikipedia

## Gesti├│n de los recursos naturales
recursos naturales, o administraci├│n de los recursos naturales ÔÇöcomo agua, suelos, plantas, animales, minerales o gasÔÇö es el manejo de estos recursos:
[Ver m├ís](https://es.wikipedia.org/wiki/Gesti├│n_de_los_recursos_naturales)
**Fuente:** Wikipedia

## Secretar├¡a de Medio Ambiente y Recursos Naturales
La Secretar├¡a de Medio Ambiente y Recursos Naturales (SEMARNAT) es una de las veinti├║n secretar├¡as de Estado que, junto con la Consejer├¡a Jur├¡dica del
[Ver m├ís](https://es.wikipedia.org/wiki/Secretar├¡a_de_Medio_Ambiente_y_Recursos_Naturales)
**Fuente:** Wikipedia

## Econom├¡a de recursos naturales
ambientes naturales y la biodiversidad. Los &quot;recursos naturales&quot; se clasifican en recursos renovables y no renovables. Un recurso natural renovable presenta
[Ver m├ís](https://es.wikipedia.org/wiki/Econom├¡a_de_recursos_naturales)
**Fuente:** Wikipedia

## Plan de Ordenaci├│n de los Recursos Naturales
Un Plan de Ordenaci├│n de los Recursos Naturales (PORN) es un instrumento de planeamiento territorial y de protecci├│n ambiental, recogido en el ordenamiento
[Ver m├ís](https://es.wikipedia.org/wiki/Plan_de_Ordenaci├│n_de_los_Recursos_Naturales)
**Fuente:** Wikipedia
', 1, 3, 37, 1, '2025-03-21 21:37:20.999-05', '2025-03-21 21:37:20.999-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (35, 'Cambios f├¡sicos y qu├¡micos', '## Sustancia qu├¡mica
tipos de cambios: f├¡sicos, fisicoqu├¡micos y qu├¡micos. En los cambios f├¡sicos no hay ninguna transformaci├│n qu├¡mica de las sustancias, solo de su forma, por
[Ver m├ís](https://es.wikipedia.org/wiki/Sustancia_qu├¡mica)
**Fuente:** Wikipedia

## Cambio f├¡sico
que cambian sus posiciones, como ocurre en un cambio de estado. Los cambios f├¡sicos o m├®todos f├¡sicos pueden usarse para separar los componentes de una
[Ver m├ís](https://es.wikipedia.org/wiki/Cambio_f├¡sico)
**Fuente:** Wikipedia

## Fisicoqu├¡mica
fisicoqu├¡mica, tambi├®n llamada qu├¡mica f├¡sica, es una subdisciplina de la qu├¡mica que estudia la materia empleando conceptos f├¡sicos y qu├¡micos. Seg├║n Gilbert N. Lewis
[Ver m├ís](https://es.wikipedia.org/wiki/Fisicoqu├¡mica)
**Fuente:** Wikipedia

## Real Sociedad Espa├▒ola de F├¡sica y Qu├¡mica
espa├▒oles becados, la visita a Espa├▒a de numerosos f├¡sicos y qu├¡micos punteros procedentes de otros pa├¡ses, y la incorporaci├│n a sociedades internacionales
[Ver m├ís](https://es.wikipedia.org/wiki/Real_Sociedad_Espa├▒ola_de_F├¡sica_y_Qu├¡mica)
**Fuente:** Wikipedia

## F├¡sica o qu├¡mica
F├¡sica o qu├¡mica es una serie juvenil espa├▒ola producida por Ida y Vuelta emitida por Antena 3 que se estren├│ el 4 de febrero de 2008 y finaliz├│ el 13
[Ver m├ís](https://es.wikipedia.org/wiki/F├¡sica_o_qu├¡mica)
**Fuente:** Wikipedia
', 1, 3, 35, 1, '2025-03-21 21:37:20.986-05', '2025-03-21 21:37:20.986-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (42, 'El planeta Tierra (estructura y movimientos)', '# El planeta Tierra (estructura y movimientos)

## Tabla de contenido
* [Introducci├│n](#introduccion)
* [Estructura de la Tierra](#estructura-de-la-tierra)
    * [Corteza](#corteza)
    * [Manto](#manto)
    * [N├║cleo](#nucleo)
* [Movimientos de la Tierra](#movimientos-de-la-tierra)
    * [Rotaci├│n](#rotacion)
    * [Traslaci├│n](#traslacion)
* [Consecuencias de los Movimientos](#consecuencias-de-los-movimientos)
    * [D├¡a y Noche](#dia-y-noche)
    * [Las Estaciones](#las-estaciones)
* [Husos Horarios](#husos-horarios)
* [Ejemplos Regionales (Colombia) y Universales](#ejemplos-regionales-colombia-y-universales)
* [Recursos Multimedia](#recursos-multimedia)
* [Referencias](#referencias)
* [Recursos Adicionales](#recursos-adicionales)
* [Nota Aclaratoria](#nota-aclaratoria)

## Introducci├│n
El planeta Tierra es nuestro hogar y un lugar fascinante. Para entender mejor c├│mo funciona, es importante conocer su estructura interna y los movimientos que realiza en el espacio. Estos aspectos influyen directamente en nuestra vida cotidiana, desde el d├¡a y la noche hasta las estaciones del a├▒o.

## Estructura de la Tierra
La Tierra est├í compuesta por tres capas principales: la corteza, el manto y el n├║cleo.

### Corteza
*   Es la capa m├ís externa y delgada de la Tierra.
*   Est├í formada por rocas s├│lidas y se divide en corteza oce├ínica (m├ís delgada y densa) y corteza continental (m├ís gruesa y menos densa).
*   Es la capa en la que vivimos y donde se encuentran los continentes y los oc├®anos.

### Manto
*   Es la capa intermedia, ubicada entre la corteza y el n├║cleo.
*   Es la capa m├ís gruesa de la Tierra y representa aproximadamente el 84% de su volumen.
*   Est├í compuesto principalmente por rocas silicatadas en estado s├│lido y semis├│lido.

### N├║cleo
*   Es la capa m├ís interna y central de la Tierra.
*   Est├í dividido en n├║cleo externo (l├¡quido) y n├║cleo interno (s├│lido).
*   Est├í compuesto principalmente por hierro y n├¡quel.
*   El movimiento del hierro l├¡quido en el n├║cleo externo genera el campo magn├®tico terrestre.

## Movimientos de la Tierra
La Tierra realiza dos movimientos principales: rotaci├│n y traslaci├│n.

### Rotaci├│n
*   Es el movimiento que realiza la Tierra sobre su propio eje, que es una l├¡nea imaginaria que atraviesa los polos.
*   Tarda aproximadamente 24 horas en completar una rotaci├│n (un d├¡a).
*   La rotaci├│n es la causa del d├¡a y la noche.

### Traslaci├│n
*   Es el movimiento que realiza la Tierra alrededor del Sol, siguiendo una ├│rbita el├¡ptica.
*   Tarda aproximadamente 365 d├¡as y 6 horas en completar una traslaci├│n (un a├▒o).
*   La traslaci├│n y la inclinaci├│n del eje terrestre son la causa de las estaciones del a├▒o.

## Consecuencias de los Movimientos
### D├¡a y Noche
*   La rotaci├│n de la Tierra hace que diferentes partes del planeta se expongan a la luz del Sol, causando el d├¡a, mientras que la parte opuesta permanece en la oscuridad, causando la noche.

### Las Estaciones
*   La inclinaci├│n del eje terrestre (23.5 grados) y la traslaci├│n de la Tierra alrededor del Sol hacen que diferentes hemisferios reciban m├ís o menos luz solar en diferentes momentos del a├▒o. Esto causa las estaciones: primavera, verano, oto├▒o e invierno.

## Husos Horarios
*   Los husos horarios son divisiones longitudinales de la Tierra que establecen una hora est├índar para cada regi├│n.
*   La Tierra se divide en 24 husos horarios, cada uno de 15 grados de longitud.
*   El meridiano de Greenwich (0 grados de longitud) es la referencia para establecer los husos horarios.

## Ejemplos Regionales (Colombia) y Universales
*   **Colombia:** Colombia se encuentra en la zona horaria UTC-5. Debido a su ubicaci├│n cerca del ecuador, las estaciones no son tan marcadas como en otros pa├¡ses.
*   **Universal:** Los husos horarios facilitan la comunicaci├│n y la coordinaci├│n de actividades a nivel mundial.

## Recursos Multimedia
*   **Video Educativo:** La Tierra: Rotaci├│n y Traslaci├│n para ni├▒os [https://www.youtube.com/watch?v=q6jxaxf_m8I](https://www.youtube.com/watch?v=q6jxaxf_m8I)
*   **Art├¡culo de Wikipedia:** Tierra [https://es.wikipedia.org/wiki/Tierra](https://es.wikipedia.org/wiki/Tierra)
*   **Art├¡culo Acad├®mico:**  "Estructura interna de la Tierra: Modelos y M├®todos de Estudio" (Buscar en Google Acad├®mico o Scielo)
*   **Imagen:** Estructura de la Tierra ![Estructura de la Tierra](https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Corte_esquematico_de_la_tierra-es.svg/2560px-Corte_esquematico_de_la_tierra-es.svg.png) (Descripci├│n alt: Diagrama que muestra las capas internas de la Tierra: corteza, manto y n├║cleo)

## Referencias
1.  Tarbuck, E. J., Lutgens, F. K., & Tasa, D. (2005). *Earth Science*. Pearson Prentice Hall.
2.  Skinner, B. J., & Porter, S. C. (2000). *Dynamic Earth: An Introduction to Physical Geology*. John Wiley & Sons.
3.  "La Tierra" - National Geographic en Espa├▒ol. nationalgeographicla.com
4.  "Movimientos de la Tierra" - Khan Academy. khanacademy.org

## Recursos Adicionales
*   USGS (United States Geological Survey): Earthquakes.
*   NASA: Earth Observatory.
*   BBC Earth.

## Nota Aclaratoria
Este contenido ha sido creado en equipo entre humanos y la IA de Perplexity para facilitarte el acceso a la informaci├│n. Sin embargo, puede contener errores. Te invitamos a revisar las fuentes adicionales de informaci├│n que incluimos para una comprensi├│n m├ís completa y precisa.

## Estructura de la Tierra
solar y puede acomodar 1.321 planetas del tama├▒o de la Tierra. Saturno es tambi├®n el segundo planeta m├ís grande del sistema solar, con 764 planetas del
[Ver m├ís](https://es.wikipedia.org/wiki/Estructura_de_la_Tierra)
**Fuente:** Wikipedia

## Tierra
La Tierra (del lat├¡n Terra,[18]ÔÇï deidad romana equivalente a Gea, diosa griega de la feminidad y la fecundidad) es un planeta del sistema solar que gira
[Ver m├ís](https://es.wikipedia.org/wiki/Tierra)
**Fuente:** Wikipedia

## Planeta interior
Los planetas interiores son los cuatro planetas m├ís cercanos al Sol, es decir: Mercurio, Venus, la Tierra y Marte. Son peque├▒os y de densidad elevada
[Ver m├ís](https://es.wikipedia.org/wiki/Planeta_interior)
**Fuente:** Wikipedia

## Planeta
medidas de la Tierra, los dem├ís planetas del sistema solar y el Sol. Planeta enano Planeta terrestre Planeta gaseoso Definici├│n de planeta Habitabilidad
[Ver m├ís](https://es.wikipedia.org/wiki/Planeta)
**Fuente:** Wikipedia

## Saturno (planeta)
Saturno es el sexto planeta del sistema solar contando desde el Sol, el segundo en tama├▒o y masa despu├®s de J├║piter y el ├║nico con un sistema de anillos
[Ver m├ís](https://es.wikipedia.org/wiki/Saturno_(planeta))
**Fuente:** Wikipedia
', 1, 4, 42, 1, '2025-03-21 21:37:21.029-05', '2025-03-23 22:15:55.353617-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (43, 'Coordenadas geogr├íficas', '# Coordenadas geogr├íficas

## Tabla de contenido
* [Introducci├│n](#introduccion)
* [┬┐Qu├® son las coordenadas geogr├íficas?](#que-son-las-coordenadas-geograficas)
* [Latitud](#latitud)
* [Longitud](#longitud)
* [Paralelos y Meridianos](#paralelos-y-meridianos)
* [C├│mo se miden las Coordenadas](#como-se-miden-las-coordenadas)
* [Usos de las Coordenadas Geogr├íficas](#usos-de-las-coordenadas-geograficas)
* [Ejemplos Regionales (Colombia) y Universales](#ejemplos-regionales-colombia-y-universales)
* [Recursos Multimedia](#recursos-multimedia)
* [Referencias](#referencias)
* [Recursos Adicionales](#recursos-adicionales)
* [Nota Aclaratoria](#nota-aclaratoria)

## Introducci├│n
Las coordenadas geogr├íficas son un sistema de referencia que permite ubicar cualquier punto en la superficie de la Tierra.  Son esenciales para la navegaci├│n, la cartograf├¡a y la geolocalizaci├│n.  Comprender c├│mo funcionan te ayudar├í a entender mejor los mapas y c├│mo se orientan las personas en el mundo.

## ┬┐Qu├® son las coordenadas geogr├íficas?
Las coordenadas geogr├íficas son un conjunto de l├¡neas imaginarias (paralelos y meridianos) que se utilizan para determinar la ubicaci├│n exacta de un lugar en la Tierra. Estas coordenadas se expresan en grados, minutos y segundos.  Los dos componentes principales de este sistema son la latitud y la longitud.

## Latitud
*   La latitud es la distancia angular entre un punto de la superficie terrestre y el Ecuador.
*   Se mide en grados (┬░), minutos ('') y segundos (").
*   Var├¡a de 0┬░ en el Ecuador a 90┬░ en los polos (Norte y Sur).
*   Las latitudes al norte del Ecuador se consideran latitud norte (N), y las latitudes al sur del Ecuador se consideran latitud sur (S).

## Longitud
*   La longitud es la distancia angular entre un punto de la superficie terrestre y el Meridiano de Greenwich.
*   Se mide en grados (┬░), minutos ('') y segundos (").
*   Var├¡a de 0┬░ en el Meridiano de Greenwich a 180┬░ al este (E) y al oeste (W).
*   Las longitudes al este del Meridiano de Greenwich se consideran longitud este (E), y las longitudes al oeste del Meridiano de Greenwich se consideran longitud oeste (W).

## Paralelos y Meridianos
*   **Paralelos:** Son c├¡rculos imaginarios paralelos al Ecuador. El Ecuador es el paralelo de referencia (0┬░ de latitud). Otros paralelos importantes son los tr├│picos de C├íncer y Capricornio (23.5┬░ N y S, respectivamente) y los c├¡rculos polares ├ürtico y Ant├írtico (66.5┬░ N y S, respectivamente).
*   **Meridianos:** Son semic├¡rculos imaginarios que van de polo a polo, convergiendo en los polos. El Meridiano de Greenwich es el meridiano de referencia (0┬░ de longitud).

## C├│mo se miden las Coordenadas
Las coordenadas geogr├íficas se expresan en el siguiente formato:
*   **Latitud:** grados (┬░), minutos (''), segundos (") y la letra N (norte) o S (sur). Ejemplo: 4┬░36''35" N
*   **Longitud:** grados (┬░), minutos (''), segundos (") y la letra E (este) o W (oeste). Ejemplo: 74┬░04''30" W
Para encontrar un lugar en un mapa o globo terr├íqueo, primero se busca la latitud y luego la longitud. La intersecci├│n de estos dos valores indica la ubicaci├│n exacta.

## Usos de las Coordenadas Geogr├íficas
*   **Navegaci├│n:** Los sistemas de navegaci├│n mar├¡tima y a├®rea utilizan coordenadas geogr├íficas para determinar la posici├│n y la ruta.
*   **Cartograf├¡a:** Las coordenadas geogr├íficas son la base para la creaci├│n de mapas precisos.
*   **Geolocalizaci├│n:** Los sistemas de posicionamiento global (GPS) utilizan coordenadas geogr├íficas para determinar la ubicaci├│n de dispositivos m├│viles y veh├¡culos.
*   **Investigaci├│n cient├¡fica:** Los ge├│grafos, ge├│logos y otros cient├¡ficos utilizan coordenadas geogr├íficas para ubicar lugares de inter├®s y realizar estudios.

## Ejemplos Regionales (Colombia) y Universales
*   **Colombia:** Bogot├í, la capital de Colombia, tiene las siguientes coordenadas aproximadas: 4┬░36'' N, 74┬░05'' W.
*   **Universal:** El Polo Norte tiene las coordenadas 90┬░ N, cualquier longitud. El Polo Sur tiene las coordenadas 90┬░ S, cualquier longitud.

## Recursos Multimedia
*   **Video Educativo:** Coordenadas Geogr├íficas [https://www.youtube.com/watch?v=-nffntdtfrY](https://www.youtube.com/watch?v=-nffntdtfrY)
*   **Art├¡culo de Wikipedia:** Coordenadas geogr├íficas [https://es.wikipedia.org/wiki/Coordenadas_geogr%C3%A1ficas](https://es.wikipedia.org/wiki/Coordenadas_geogr%C3%A1ficas)
*   **Art├¡culo Acad├®mico:** "Sistemas de referencia geod├®sicos y coordenadas geogr├íficas: aplicaciones en la cartograf├¡a moderna" [https://d1wqtxts1xzle7.cloudfront.net/56591048/astronomiaT2-libre.pdf?1526574517=&response-content-disposition=inline%3B+filename%3DSISTEMA_Y_MARCO_DE_REFERENCIA_TERRESTRE.pdf&Expires=1742842555&Signature=I7B9VqPZ6566kSNhWS9q-nsj7Ag9kAAHwD0IwzrSNuWEFOcUbH~E0spfIdBjw92a7Fbw6GyjOeURUCF07XU1LBYIH2B-lfCq0EvdTvvR6LphqiaWsxSKJLODEE7rQJCmzery6ZOwpcF2DIZ3AZdzC2d930tLIJPAL9pZZLneB2F3HMddGGCNeaynumtKln3O1snNwFLlGwnxaiuFN0g1MdQSE9vjIBNpp~SuD3DNpMAI5UW90W4LOYk6cLEgyXr0NhhMh7cbmhmW08oUgTzC4jZZRqqj9lL925GWdDAAUgZTkffCDN~2TqReJYT0WM~Brvl4jjs3irVy19~B4HJAtw__&Key-Pair-Id=APKAJLOHF5GGSLRBV4ZA](SISTEMA Y MARCO DE REFERENCIA TERRESTRE. SISTEMAS DE COORDENADAS)
*   **Imagen:** Mapa del mundo con coordenadas geogr├íficas ![Mapa del mundo con coordenadas](https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/Equator_and_Prime_Meridian.svg/853px-Equator_and_Prime_Meridian.svg.png) (Descripci├│n alt: Mapa mundial que muestra el ecuador y el meridiano de Greenwich como referencia para las coordenadas geogr├íficas)

## Referencias
1.  Monmonier, M. (1996). *How to Lie with Maps*. University of Chicago Press.
2.  Robinson, A. H., Morrison, J. L., Muehrcke, P. C., Kimerling, A. J., & Guptill, S. C. (1995). *Elements of Cartography*. John Wiley & Sons.
3.  "Coordenadas Geogr├íficas" - Instituto Geogr├ífico Agust├¡n Codazzi (IGAC). igac.gov.co (sitio web oficial del IGAC en Colombia).
4.  "Latitud y Longitud" - National Geographic Society. nationalgeographic.org

## Recursos Adicionales
*   Google Earth: Explora el mundo usando im├ígenes de sat├®lite y coordenadas geogr├íficas.
*   Instituto Geogr├ífico Agust├¡n Codazzi (IGAC): Informaci├│n cartogr├ífica y geogr├ífica de Colombia.
*   GPS Visualizer: Herramienta online para convertir coordenadas geogr├íficas.

## Nota Aclaratoria
Este contenido ha sido creado en equipo entre humanos y la IA de Perplexity para facilitarte el acceso a la informaci├│n. Sin embargo, puede contener errores. Te invitamos a revisar las fuentes adicionales de informaci├│n que incluimos para una comprensi├│n m├ís completa y precisa.', 1, 4, 43, 1, '2025-03-21 21:37:21.034-05', '2025-03-24 13:01:39.723807-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (47, 'Derechos y deberes fundamentales', '
# Derechos y deberes fundamentales

## Tabla de contenido
* [Introducci├│n](#introduccion)
* [┬┐Qu├® son los derechos fundamentales?](#que-son-los-derechos-fundamentales)
* [┬┐Qu├® son los deberes fundamentales?](#que-son-los-deberes-fundamentales)
* [Derechos fundamentales](#derechos-fundamentales)
    * [Derecho a la vida](#derecho-a-la-vida)
    * [Derecho a la igualdad](#derecho-a-la-igualdad)
    * [Derecho a la libertad](#derecho-a-la-libertad)
    * [Derecho a la educaci├│n](#derecho-a-la-educacion)
    * [Derecho a la salud](#derecho-a-la-salud)
    * [Derecho a la vivienda](#derecho-a-la-vivienda)
    * [Derecho a la alimentaci├│n](#derecho-a-la-alimentacion)
* [Deberes fundamentales](#deberes-fundamentales)
    * [Respetar los derechos ajenos](#respetar-los-derechos-ajenos)
    * [Cumplir la Constituci├│n y las leyes](#cumplir-la-constitucion-y-las-leyes)
    * [Proteger los recursos naturales y el medio ambiente](#proteger-los-recursos-naturales-y-el-medio-ambiente)
    * [Participar en la vida pol├¡tica, c├¡vica y comunitaria](#participar-en-la-vida-politica-civica-y-comunitaria)
    * [Contribuir al financiamiento de los gastos p├║blicos](#contribuir-al-financiamiento-de-los-gastos-publicos)
* [Relaci├│n entre derechos y deberes](#relacion-entre-derechos-y-deberes)
* [Ejemplos Regionales (Colombia) y Universales](#ejemplos-regionales-colombia-y-universales)
* [Recursos Multimedia](#recursos-multimedia)
* [Referencias](#referencias)
* [Recursos Adicionales](#recursos-adicionales)
* [Nota Aclaratoria](#nota-aclaratoria)

## Introducci├│n
Los derechos y deberes fundamentales son los pilares de una sociedad justa y democr├ítica. Los derechos son las libertades y protecciones que todos los individuos tienen garantizadas, mientras que los deberes son las responsabilidades que todos compartimos para mantener el orden y el bienestar com├║n. Conocer y ejercer nuestros derechos y cumplir con nuestros deberes es esencial para construir una sociedad mejor para todos.

## ┬┐Qu├® son los derechos fundamentales?
Los derechos fundamentales son aquellos inherentes a la dignidad humana, reconocidos en la Constituci├│n y en los tratados internacionales de derechos humanos. Son universales, inalienables, irrenunciables e imprescriptibles, lo que significa que pertenecen a todos los seres humanos desde el nacimiento, no pueden ser transferidos ni negados, no se pueden renunciar a ellos y no se pierden con el tiempo.

## ┬┐Qu├® son los deberes fundamentales?
Los deberes fundamentales son las obligaciones que todos los ciudadanos tienen para con la sociedad y el Estado. Son necesarios para garantizar el ejercicio de los derechos y el funcionamiento de la sociedad. El cumplimiento de los deberes contribuye al bienestar com├║n y al mantenimiento del orden social.

## Derechos fundamentales
### Derecho a la vida
*   Toda persona tiene derecho a la vida, a la integridad f├¡sica y moral.
*   Implica la protecci├│n contra la tortura, los tratos crueles, inhumanos o degradantes, y la pena de muerte (en pa├¡ses donde no est├í abolida).

### Derecho a la igualdad
*   Todas las personas son iguales ante la ley y tienen derecho a la misma protecci├│n y trato.
*   Implica la prohibici├│n de la discriminaci├│n por motivos de raza, color, sexo, idioma, religi├│n, opini├│n pol├¡tica, origen nacional o social, posici├│n econ├│mica, nacimiento o cualquier otra condici├│n.

### Derecho a la libertad
*   Toda persona tiene derecho a la libertad personal, de pensamiento, de expresi├│n, de reuni├│n, de asociaci├│n, de religi├│n y de movimiento.
*   Estas libertades est├ín sujetas a limitaciones razonables y necesarias para proteger los derechos de los dem├ís y el orden p├║blico.

### Derecho a la educaci├│n
*   Toda persona tiene derecho a la educaci├│n, que debe ser gratuita y obligatoria en sus niveles b├ísicos.
*   La educaci├│n debe promover el pleno desarrollo de la personalidad humana y fortalecer el respeto a los derechos humanos y las libertades fundamentales.

### Derecho a la salud
*   Toda persona tiene derecho a la protecci├│n de la salud.
*   Implica el acceso a servicios de salud de calidad, la promoci├│n de h├íbitos saludables y la prevenci├│n de enfermedades.

### Derecho a la vivienda
*   Toda persona tiene derecho a una vivienda digna y adecuada.
*   El Estado debe promover pol├¡ticas que faciliten el acceso a la vivienda, especialmente para las personas de bajos recursos.

### Derecho a la alimentaci├│n
*   Toda persona tiene derecho a una alimentaci├│n adecuada y nutritiva.
*   El Estado debe promover pol├¡ticas que garanticen la seguridad alimentaria y el acceso a alimentos suficientes y de calidad.

## Deberes fundamentales
### Respetar los derechos ajenos
*   El ejercicio de los derechos propios no puede vulnerar los derechos de los dem├ís.
*   Implica la tolerancia, la no discriminaci├│n y el respeto a la dignidad humana.

### Cumplir la Constituci├│n y las leyes
*   Todos los ciudadanos est├ín obligados a cumplir la Constituci├│n y las leyes de la Rep├║blica.
*   El cumplimiento de la ley es esencial para mantener el orden social y garantizar la convivencia pac├¡fica.

### Proteger los recursos naturales y el medio ambiente
*   Todos tienen el deber de proteger los recursos naturales, conservar el medio ambiente y promover el desarrollo sostenible.
*   Implica la adopci├│n de pr├ícticas responsables en el uso de los recursos y la prevenci├│n de la contaminaci├│n.

### Participar en la vida pol├¡tica, c├¡vica y comunitaria
*   Todos los ciudadanos tienen el deber de participar en la vida pol├¡tica, c├¡vica y comunitaria de su pa├¡s.
*   Implica el ejercicio del derecho al voto, la participaci├│n en organizaciones sociales y la colaboraci├│n con las autoridades.

### Contribuir al financiamiento de los gastos p├║blicos
*   Todos los ciudadanos tienen el deber de contribuir al financiamiento de los gastos p├║blicos a trav├®s del pago de impuestos y contribuciones.
*   El pago de impuestos es esencial para que el Estado pueda cumplir sus funciones y garantizar los derechos de todos los ciudadanos.

## Relaci├│n entre derechos y deberes
Los derechos y los deberes son dos caras de la misma moneda. Los derechos implican deberes para los dem├ís y para el Estado, mientras que el cumplimiento de los deberes garantiza el ejercicio de los derechos. No se puede concebir una sociedad justa y democr├ítica sin el respeto y la garant├¡a de los derechos, as├¡ como el cumplimiento de los deberes.

## Ejemplos Regionales (Colombia) y Universales
*   **Colombia:** La Constituci├│n Pol├¡tica de Colombia de 1991 consagra una amplia gama de derechos fundamentales y establece los deberes de los ciudadanos. La Corte Constitucional es la encargada de proteger los derechos fundamentales y garantizar su cumplimiento.
*   **Universal:** La Declaraci├│n Universal de Derechos Humanos de la ONU establece los derechos fundamentales que deben ser respetados en todos los pa├¡ses. Muchos pa├¡ses han incorporado estos derechos en sus constituciones y leyes.

## Recursos Multimedia
*   **Video Educativo:** ┬┐Qu├® son los Derechos Fundamentales en Colombia? Constituci├│n Pol├¡tica [https://www.youtube.com/watch?v=wYaUc_vtk5Q](https://www.youtube.com/watch?v=wYaUc_vtk5Q)
*   **Art├¡culo de Wikipedia:** Derechos humanos [https://es.wikipedia.org/wiki/Derechos_humanos](https://es.wikipedia.org/wiki/Derechos_humanos)
*   **Art├¡culo Acad├®mico:** Derechos Humanos y Deberes [https://www.redalyc.org/pdf/1411/141121432006.pdf](https://www.redalyc.org/pdf/1411/141121432006.pdf)
*   **Imagen:** ![La Libertad guiando al pueblo, por Eug├¿ne Delacroix (1830). Los derechos humanos fueron recogidos en las leyes ÔÇöpositivaci├│nÔÇö a ra├¡z de las revoluciones burguesas de los siglos XVII y XVIII: la Revoluci├│n inglesa, la Revoluci├│n Americana y la Revoluci├│n francesa; esta ├║ltima promovi├│ la aprobaci├│n, en la Asamblea Nacional de 26 de agosto de 1789, de la Declaraci├│n de los Derechos del Hombre y del Ciudadano. La ONU aprob├│, el 10 de diciembre de 1948, la Declaraci├│n Universal de los Derechos Humanos que recoge en sus 36 art├¡culos los derechos humanos considerados b├ísicos.](https://upload.wikimedia.org/wikipedia/commons/5/5d/Eug%C3%A8ne_Delacroix_-_Le_28_Juillet._La_Libert%C3%A9_guidant_le_peuple.jpg "La Libertad guiando al pueblo, por Eug├¿ne Delacroix (1830). Los derechos humanos fueron recogidos en las leyes ÔÇöpositivaci├│nÔÇö a ra├¡z de las revoluciones burguesas de los siglos XVII y XVIII: la Revoluci├│n inglesa, la Revoluci├│n Americana y la Revoluci├│n francesa; esta ├║ltima promovi├│ la aprobaci├│n, en la Asamblea Nacional de 26 de agosto de 1789, de la Declaraci├│n de los Derechos del Hombre y del Ciudadano. La ONU aprob├│, el 10 de diciembre de 1948, la Declaraci├│n Universal de los Derechos Humanos que recoge en sus 36 art├¡culos los derechos humanos considerados b├ísicos.") La Libertad guiando al pueblo, por Eug├¿ne Delacroix (1830). Los derechos humanos fueron recogidos en las leyes ÔÇöpositivaci├│nÔÇö a ra├¡z de las revoluciones burguesas de los siglos XVII y XVIII: la Revoluci├│n inglesa, la Revoluci├│n Americana y la Revoluci├│n francesa; esta ├║ltima promovi├│ la aprobaci├│n, en la Asamblea Nacional de 26 de agosto de 1789, de la Declaraci├│n de los Derechos del Hombre y del Ciudadano. La ONU aprob├│, el 10 de diciembre de 1948, la Declaraci├│n Universal de los Derechos Humanos que recoge en sus 36 art├¡culos los derechos humanos considerados b├ísicos.
* **Podcast:** [El ABC de los Derechos Humanos](https://open.spotify.com/embed/episode/0sRJbGlUEyU5Wz8kSIj4Kx?utm_source=generator&theme=0)', 1, 4, 47, 1, '2025-03-21 21:37:21.055-05', '2025-03-24 16:08:56.371072-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (48, 'Gobierno escolar', '## Cheque escolar
ensayo ÔÇ£El papel del gobierno en la educaci├│nÔÇØ de 1955. Desde entonces diversos autores han retomado el tema del cheque escolar. Hay distinciones importantes
[Ver m├ís](https://es.wikipedia.org/wiki/Cheque_escolar)
**Fuente:** Wikipedia

## Hip├│lito Escolar
Hip├│lito Escolar Sobrino (Navalmanzano, 29 de mayo de 1919-Madrid, 6 de mayo de 2009) fue un bibliotecario y escritor espa├▒ol. Fue director de la Biblioteca
[Ver m├ís](https://es.wikipedia.org/wiki/Hip├│lito_Escolar)
**Fuente:** Wikipedia

## A├▒o escolar
El a├▒o escolar (tambi├®n, a├▒o acad├®mico o ciclo escolar, en Hispanoam├®rica) es el per├¡odo del a├▒o durante el cual los estudiantes acuden a sus centros
[Ver m├ís](https://es.wikipedia.org/wiki/A├▒o_escolar)
**Fuente:** Wikipedia

## Distrito Escolar Independiente de Houston
El Distrito Escolar Independiente de Houston (Houston Independent School District o HISD en ingl├®s) es el distrito escolar p├║blico m├ís grande del estado
[Ver m├ís](https://es.wikipedia.org/wiki/Distrito_Escolar_Independiente_de_Houston)
**Fuente:** Wikipedia

## Fracaso escolar
fracaso escolar es el hecho de no alcanzar el t├¡tulo acad├®mico m├¡nimo obligatorio de un sistema educativo. No debe confundirse con el abandono escolar temprano
[Ver m├ís](https://es.wikipedia.org/wiki/Fracaso_escolar)
**Fuente:** Wikipedia
', 1, 4, 48, 1, '2025-03-21 21:37:21.06-05', '2025-03-21 21:37:21.06-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (52, 'Verbo "to be" en presente', '## Presente simple
verdad.[3]ÔÇï El presente simple es el primer tiempo verbal que se ense├▒a en las clases de ingl├®s, normalmente en la conjugaci├│n del verbo to be (ser o estar)
[Ver m├ís](https://es.wikipedia.org/wiki/Presente_simple)
**Fuente:** Wikipedia

## Presente continuo
presente continuo, no se usa el verbo to be como con el presente simple, en vez de eso, se intercambia la posici├│n de la conjugaci├│n del verbo to be y
[Ver m├ís](https://es.wikipedia.org/wiki/Presente_continuo)
**Fuente:** Wikipedia

## Gram├ítica del ingl├®s
del verbo (sin to): You would eat spaghetti. (&quot;Comer├¡as espaguetis&quot;). El tiempo progresivo del ingl├®s, en el presente y el pasado, usa el verbo to be seguido
[Ver m├ís](https://es.wikipedia.org/wiki/Gram├ítica_del_ingl├®s)
**Fuente:** Wikipedia

## Modo subjuntivo
este sufijo se han perdido en el ingl├®s moderno, el cambio de was a were en el subjuntivo actual del verbo to be (ser) en frases condicionales (If I were
[Ver m├ís](https://es.wikipedia.org/wiki/Modo_subjuntivo)
**Fuente:** Wikipedia

## N├║mero gramatical
esta oposici├│n: en ingl├®s, solo el verbo to be cuenta con una flexi├│n completa en cuanto al n├║mero, mientras que en la mayor├¡a de los verbos la oposici├│n
[Ver m├ís](https://es.wikipedia.org/wiki/N├║mero_gramatical)
**Fuente:** Wikipedia
', 1, 5, 52, 1, '2025-03-21 21:37:21.083-05', '2025-03-21 21:37:21.083-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (53, 'Pronombres personales', '## Pronombre personal
Los pronombres personales son pronombres asociados primariamente a una persona gramatical; son por tanto morfemas sin contenido l├®xico, cuya referencia
[Ver m├ís](https://es.wikipedia.org/wiki/Pronombre_personal)
**Fuente:** Wikipedia

## Pronombre
mucho). Todas las lenguas humanas tienen pronombres; [cita┬árequerida] adem├ís, todas ellas tienen pronombres personales y posesivos [cita┬árequerida] que obligatoriamente
[Ver m├ís](https://es.wikipedia.org/wiki/Pronombre)
**Fuente:** Wikipedia

## Pronombres en espa├▒ol
tienen referencia fija sino contextual. Los pronombres del espa├▒ol pueden clasificarse en: Pronombres personales T├│nicos o independientes (de casos nominativo-vocativo
[Ver m├ís](https://es.wikipedia.org/wiki/Pronombres_en_espa├▒ol)
**Fuente:** Wikipedia

## Posici├│n de pronombres cl├¡ticos en espa├▒ol
Los idiomas romances han desarrollado un grupo de pronombres personales que son cl├¡ticos verbales. Esto significa que no pueden usarse independientemente
[Ver m├ís](https://es.wikipedia.org/wiki/Posici├│n_de_pronombres_cl├¡ticos_en_espa├▒ol)
**Fuente:** Wikipedia

## Pronombres japoneses
al igual que en castellano, los pronombres como &quot;yo&quot; y &quot;t├║&quot;, son omitidos a veces en japon├®s. Los pronombres personales pueden ser dejados de lado cuando
[Ver m├ís](https://es.wikipedia.org/wiki/Pronombres_japoneses)
**Fuente:** Wikipedia
', 1, 5, 53, 1, '2025-03-21 21:37:21.089-05', '2025-03-21 21:37:21.089-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (58, 'Habilidades motrices b├ísicas', '## Habilidades sociales
Las habilidades sociales (algunas veces designadas como competencias sociales o habilidades interpersonales) no tienen una definici├│n ├║nica y determinada
[Ver m├ís](https://es.wikipedia.org/wiki/Habilidades_sociales)
**Fuente:** Wikipedia

## Habilidad
Habilidades son destrezas que una persona tiene para realizar varias acciones. Incluyen habilidades comunes, como caminar, y habilidades raras, como hacer
[Ver m├ís](https://es.wikipedia.org/wiki/Habilidad)
**Fuente:** Wikipedia

## Destreza
acad├®mico, el concepto de destreza cada vez se centra m├ís en las habilidades motrices.[2]ÔÇï El origen de la palabra est├í en el lat├¡n dextra, que significa
[Ver m├ís](https://es.wikipedia.org/wiki/Destreza)
**Fuente:** Wikipedia

## Juegos tradicionales
servirse de habilidades motrices b├ísicas como saltar, correr o caminar, entre otros. Por su relaci├│n con la denominada fase de la expresividad motriz de la
[Ver m├ís](https://es.wikipedia.org/wiki/Juegos_tradicionales)
**Fuente:** Wikipedia

## Educaci├│n primaria
capacidades y habilidades individuales motrices, de equilibrio personal; de relaci├│n y de actuaci├│n social con la adquisici├│n de los elementos b├ísicos culturales;
[Ver m├ís](https://es.wikipedia.org/wiki/Educaci├│n_primaria)
**Fuente:** Wikipedia
', 1, 6, 58, 1, '2025-03-21 21:37:21.115-05', '2025-03-21 21:37:21.115-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (59, 'Coordinaci├│n din├ímica general', '## Coordinaci├│n muscular
percepci├│n visual.[1]ÔÇï Podemos observar varios tipos de coordinaci├│n como la din├ímica general (por ejemplo andar a 4 patas), la oculomanual (lanzar un
[Ver m├ís](https://es.wikipedia.org/wiki/Coordinaci├│n_muscular)
**Fuente:** Wikipedia

## Procurador general de la Naci├│n (Argentina)
los intereses generales de la sociedad, en coordinaci├│n con las dem├ís autoridades de la Rep├║blica. Est├í integrado por un procurador general de la Naci├│n
[Ver m├ís](https://es.wikipedia.org/wiki/Procurador_general_de_la_Naci├│n_(Argentina))
**Fuente:** Wikipedia

## Agilidad
deportistas en general. Requiere la integraci├│n de habilidades referidas a movimientos individuales usando una combinaci├│n de equilibrio, coordinaci├│n, velocidad
[Ver m├ís](https://es.wikipedia.org/wiki/Agilidad)
**Fuente:** Wikipedia

## Ley General del Ambiente (Argentina)
condiciones necesarias para garantizar la din├ímica de los sistemas ecol├│gicos, mantener su capacidad de carga y, en general, asegurar la preservaci├│n ambiental
[Ver m├ís](https://es.wikipedia.org/wiki/Ley_General_del_Ambiente_(Argentina))
**Fuente:** Wikipedia

## Sinergia (f├¡sica)
propiedades que emergen de la din├ímica natural del sistema que sostiene al objeto. El resultado es una optimizaci├│n en la din├ímica del sistema, en el que, si
[Ver m├ís](https://es.wikipedia.org/wiki/Sinergia_(f├¡sica))
**Fuente:** Wikipedia
', 1, 6, 59, 1, '2025-03-21 21:37:21.12-05', '2025-03-21 21:37:21.12-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (63, 'Normas b├ísicas de juegos', '## Juego
de reaccionar ante las situaciones que se nos presentan. Juego de apuestas Juegos Juegos infantiles Juguete Teor├¡a de juegos Videojuego F├│rmulas de echar
[Ver m├ís](https://es.wikipedia.org/wiki/Juego)
**Fuente:** Wikipedia

## Juego de la botifarra
de Arag├│n.[1]ÔÇï Es un juego para cuatro jugadores (en la modalidad normal), que van en parejas. Las normas b├ísicas del juego de la botifarra son las siguientes:
[Ver m├ís](https://es.wikipedia.org/wiki/Juego_de_la_botifarra)
**Fuente:** Wikipedia

## Joystick Atari
parte b├ísica┬á: conector DE-9 hembra para el Joystick, macho en el ordenador/videoconsola, con los conectores 1 a 4 para las 4 direcciones b├ísicas y el
[Ver m├ís](https://es.wikipedia.org/wiki/Joystick_Atari)
**Fuente:** Wikipedia

## Juego de persecuci├│n
Los juegos de persecuci├│n son juegos infantiles que gozan de alta popularidad entre los ni├▒os de todo el mundo, especialmente durante el recreo (tiempo
[Ver m├ís](https://es.wikipedia.org/wiki/Juego_de_persecuci├│n)
**Fuente:** Wikipedia

## Teor├¡a de juegos
relevantes para la teor├¡a combinatoria de juegos, es la forma extensiva del juego. La teor├¡a clasifica los juegos en muchas categor├¡as que determinan qu├®
[Ver m├ís](https://es.wikipedia.org/wiki/Teor├¡a_de_juegos)
**Fuente:** Wikipedia
', 1, 6, 63, 1, '2025-03-21 21:37:21.142-05', '2025-03-21 21:37:21.142-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (65, 'Juegos tradicionales', '## Juegos tradicionales
Los juegos tradicionales son los juegos infantiles cl├ísicos, que se realizan sin ayuda de juguetes tecnol├│gicamente complejos, sino con el propio cuerpo
[Ver m├ís](https://es.wikipedia.org/wiki/Juegos_tradicionales)
**Fuente:** Wikipedia

## Videojuego tradicional
Un videojuego tradicional es una adaptaci├│n a videojuego de un juego no perteneciente a las computadoras (como un juego de mesa o juego de cartas). La
[Ver m├ís](https://es.wikipedia.org/wiki/Videojuego_tradicional)
**Fuente:** Wikipedia

## Juego
menos regladas. Algunos de estos juegos tradicionales con el tiempo se convirtieron en deportes, denominados tradicionales, de modo que la popularidad que
[Ver m├ís](https://es.wikipedia.org/wiki/Juego)
**Fuente:** Wikipedia

## Dise├▒ador de juegos
Un dise├▒ador de juegos es una persona que se encarga de dise├▒ar videojuegos o juegos tradicionales, como juegos de mesa. Un dise├▒ador de videojuegos se
[Ver m├ís](https://es.wikipedia.org/wiki/Dise├▒ador_de_juegos)
**Fuente:** Wikipedia

## Juego multijugador
equipo contra el juego. Los juegos con muchos jugadores individuales son dif├¡ciles de analizar formalmente sobre la base de la teor├¡a de juegos ya que los jugadores
[Ver m├ís](https://es.wikipedia.org/wiki/Juego_multijugador)
**Fuente:** Wikipedia
', 1, 6, 65, 1, '2025-03-21 21:37:21.153-05', '2025-03-21 21:37:21.153-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (61, 'Juegos predeportivos', '## Variaciones del baloncesto
propuestas para minibasket┬╗.┬á ┬½10 Juegos de baloncesto para competir individualmente┬╗.┬á ┬½Incidencia de los juegos predeportivos en el desarrollo de la t├®cnica
[Ver m├ís](https://es.wikipedia.org/wiki/Variaciones_del_baloncesto)
**Fuente:** Wikipedia

## Tap├│n corona
filat├®lico.[cita┬árequerida] En Espa├▒a existe el juego infantil de las chapas. En Venezuela existe un juego predeportivo llamado &quot;chapitas&quot;, el cual est├í basado
[Ver m├ís](https://es.wikipedia.org/wiki/Tap├│n_corona)
**Fuente:** Wikipedia

## Vitilla
los ni├▒os y j├│venes de esos tiempos no pose├¡an los juegos que existen hoy en d├¡a, antes los juegos y juguetes estaban orientados a juntar las personas
[Ver m├ís](https://es.wikipedia.org/wiki/Vitilla)
**Fuente:** Wikipedia

## Tomares
art├¡stico, tenis, p├ídel, esgrima, escalada y equitaci├│n, adem├ís de juegos predeportivos. Muchas de estas escuelas participan a nivel provincial y nacional
[Ver m├ís](https://es.wikipedia.org/wiki/Tomares)
**Fuente:** Wikipedia
', 1, 6, 61, 1, '2025-03-21 21:37:21.131-05', '2025-03-21 21:37:21.131-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (64, 'Ritmo y movimiento', '## Ritmo
directa con el movimiento. En efecto, podemos encontrar m├║ltiples definiciones que a├║nan movimiento, orden y periodicidad con relaci├│n al ritmo musical. Sin
[Ver m├ís](https://es.wikipedia.org/wiki/Ritmo)
**Fuente:** Wikipedia

## Ritmo biol├│gico
Dentro de la cronobiolog├¡a, un ritmo biol├│gico es una onda de un par├ímetro biol├│gico dependiente de un reloj end├│geno y de sincronizadores ambientales
[Ver m├ís](https://es.wikipedia.org/wiki/Ritmo_biol├│gico)
**Fuente:** Wikipedia

## Ritmo arm├│nico
El ritmo arm├│nico, tambi├®n conocido como tempo arm├│nico, en teor├¡a musical es el ritmo con el que se suceden los diferentes acordes en una determinada
[Ver m├ís](https://es.wikipedia.org/wiki/Ritmo_arm├│nico)
**Fuente:** Wikipedia

## Ritmo circadiano
la Luna sobre los ritmos fisiol├│gicos durante el sue├▒o Ritmo biol├│gico Ritmo infradiano Ritmo ultradiano OMS,OPS,BIREME (ed.). ┬½Ritmo circadiano┬╗. Descriptores
[Ver m├ís](https://es.wikipedia.org/wiki/Ritmo_circadiano)
**Fuente:** Wikipedia

## Ritmo card├¡aco
conductor ocasionan trastornos del ritmo card├¡aco como extras├¡stoles, taquicardias o bradicardias.[2]ÔÇï El estudio del ritmo card├¡aco reconoce antecedentes
[Ver m├ís](https://es.wikipedia.org/wiki/Ritmo_card├¡aco)
**Fuente:** Wikipedia
', 1, 6, 64, 1, '2025-03-21 21:37:21.147-05', '2025-03-21 21:37:21.147-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (41, 'Llegada de europeos a Am├®rica', '# Llegada de europeos a Am├®rica

## Tabla de contenido
* [Introducci├│n](#introduccion)
* [Contexto Europeo](#contexto-europeo)
* [Viajes de Exploraci├│n](#viajes-de-exploracion)
* [Impacto en Am├®rica](#impacto-en-america)
* [Consecuencias Demogr├íficas y Sociales](#consecuencias-demograficas-y-sociales)
* [El Caso de Colombia](#el-caso-de-colombia)
* [Ejemplos Regionales (Colombia) y Universales](#ejemplos-regionales-colombia-y-universales)
* [Recursos Multimedia](#recursos-multimedia)
* [Referencias](#referencias)
* [Recursos Adicionales](#recursos-adicionales)
* [Nota Aclaratoria](#nota-aclaratoria)

## Introducci├│n
La llegada de los europeos a Am├®rica en 1492, liderada por Crist├│bal Col├│n, marc├│ un punto de inflexi├│n en la historia mundial. Este encuentro entre dos mundos tuvo profundas consecuencias demogr├íficas, sociales, econ├│micas y culturales, transformando tanto Am├®rica como Europa.

## Contexto Europeo
### Motivos de la Exploraci├│n
*   **B├║squeda de nuevas rutas comerciales:** Los europeos buscaban rutas alternativas a las Indias (Asia) para acceder a especias, seda y otros productos valiosos.
*   **Expansi├│n territorial y religiosa:** Las potencias europeas quer├¡an expandir sus territorios y difundir el cristianismo.
*   **Avances tecnol├│gicos:** La invenci├│n de la br├║jula, el astrolabio y la carabela facilitaron los viajes de larga distancia.

### Potencias Europeas
*   **Espa├▒a:** Financiada por los Reyes Cat├│licos, lider├│ la exploraci├│n y colonizaci├│n inicial de Am├®rica.
*   **Portugal:** Explor├│ la costa de ├üfrica y lleg├│ a Brasil.
*   **Inglaterra, Francia y Holanda:** Se sumaron m├ís tarde a la colonizaci├│n de Am├®rica del Norte y el Caribe.

## Viajes de Exploraci├│n
### Crist├│bal Col├│n
*   **Primer viaje (1492):** Lleg├│ a las islas del Caribe (Guanahani, Cuba, La Espa├▒ola) creyendo haber alcanzado las Indias.
*   **Viajes posteriores:** Explor├│ otras islas del Caribe y la costa de Am├®rica Central.

### Otros Exploradores
*   **Am├®rico Vespucio:** Reconoci├│ que las tierras descubiertas por Col├│n eran un nuevo continente.
*   **Vasco N├║├▒ez de Balboa:** Cruz├│ el istmo de Panam├í y descubri├│ el Oc├®ano Pac├¡fico.
*   **Hern├ín Cort├®s:** Conquist├│ el Imperio Azteca.
*   **Francisco Pizarro:** Conquist├│ el Imperio Inca.

## Impacto en Am├®rica
### Intercambio Colombino
*   **De Europa a Am├®rica:** Animales (caballos, cerdos, vacas), plantas (trigo, vid), enfermedades (viruela, sarampi├│n).
*   **De Am├®rica a Europa:** Plantas (ma├¡z, papa, tomate, cacao), animales (pavo).

### Conquista y Colonizaci├│n
*   **Dominio pol├¡tico y econ├│mico:** Los europeos establecieron colonias y controlaron los recursos naturales de Am├®rica.
*   **Imposici├│n cultural:** Se impuso la religi├│n, el idioma y las costumbres europeas.
*   **Explotaci├│n de la mano de obra:** Se utiliz├│ mano de obra ind├¡gena y africana en la agricultura y la miner├¡a.

## Consecuencias Demogr├íficas y Sociales
### Disminuci├│n de la Poblaci├│n Ind├¡gena
*   **Enfermedades:** La viruela, el sarampi├│n y otras enfermedades europeas causaron una gran mortandad entre los ind├¡genas.
*   **Guerra y violencia:** La conquista y la colonizaci├│n fueron violentas y causaron la muerte de muchos ind├¡genas.
*   **Explotaci├│n laboral:** Las condiciones de trabajo en las minas y las plantaciones eran inhumanas y causaron muchas muertes.

### Mestizaje
*   **Mezcla racial y cultural:** La uni├│n entre europeos, ind├¡genas y africanos dio origen a una nueva sociedad mestiza.
### Sistema de Castas
*   **Jerarqu├¡a social basada en la raza:** La sociedad colonial se organiz├│ en un sistema de castas que privilegiaba a los blancos europeos y discriminaba a los ind├¡genas y africanos.

## El Caso de Colombia
### Exploraci├│n y Conquista
*   **Alonso de Ojeda:** Explor├│ la costa del Caribe en 1499.
*   **Rodrigo de Bastidas:** Fund├│ Santa Marta en 1525, la primera ciudad espa├▒ola en Colombia.
*   **Gonzalo Jim├®nez de Quesada:** Conquist├│ el territorio de los Muiscas y fund├│ Bogot├í en 1538.

### Impacto en las Comunidades Ind├¡genas
*   **P├®rdida de territorio y autonom├¡a:** Los ind├¡genas fueron despojados de sus tierras y sometidos al dominio espa├▒ol.
*   **Imposici├│n de la religi├│n cat├│lica:** Se destruyeron los lugares sagrados ind├¡genas y se impuso la religi├│n cat├│lica.
*   **Explotaci├│n laboral:** Los ind├¡genas fueron obligados a trabajar en las minas y las haciendas.

## Ejemplos Regionales (Colombia) y Universales
*   **Colombia:** La resistencia ind├¡gena liderada por personajes como Gaitana y Calarc├í.
*   **Universal:** La colonizaci├│n de Am├®rica por los europeos es comparable con otros procesos de colonizaci├│n en la historia, como la colonizaci├│n de ├üfrica y Asia.

## Recursos Multimedia
*   **Video Educativo:** El Descubrimiento de Am├®rica para ni├▒os [https://www.youtube.com/watch?v=TD26j2c2wLw](https://www.youtube.com/watch?v=TD26j2c2wLw)
*   **Art├¡culo de Wikipedia:** Descubrimiento de Am├®rica [https://es.wikipedia.org/wiki/Descubrimiento_de_Am%C3%A9rica](https://es.wikipedia.org/wiki/Descubrimiento_de_Am%C3%A9rica)
*   **Art├¡culo Acad├®mico:**  "Impacto demogr├ífico de la conquista en Am├®rica Latina" (Buscar en Google Acad├®mico o Scielo)
*   **Imagen:** Llegada de Col├│n a Am├®rica ![Llegada de Col├│n a Am├®rica](https://upload.wikimedia.org/wikipedia/commons/b/b4/Landing_of_Columbus_%282%29.jpg) (Descripci├│n alt: Representaci├│n art├¡stica de la llegada de Crist├│bal Col├│n a Am├®rica)

## Referencias
1.  Col├│n, C. (1493). *Diario de a bordo*.
2.  Todorov, T. (1982). *La conquista de Am├®rica: el problema del otro*. Siglo XXI Editores.
3.  Diamond, J. (1997). *Guns, Germs, and Steel: The Fates of Human Societies*. W. W. Norton & Company.
4.  Galeano, E. (1971). *Las venas abiertas de Am├®rica Latina*. Siglo XXI Editores.
5.  "Conquista de Am├®rica" - Historia National Geographic. historicanationalgeographic.com

## Recursos Adicionales
*   National Geographic: La Era de la Exploraci├│n.
*   Khan Academy: Historia del Mundo.
*   BBC History: The Age of Exploration.

## Nota Aclaratoria
Este contenido ha sido creado en equipo entre humanos y la IA de Perplexity para facilitarte el acceso a la informaci├│n. Sin embargo, puede contener errores. Te invitamos a revisar las fuentes adicionales de informaci├│n que incluimos para una comprensi├│n m├ís completa y precisa.', 1, 4, 41, 1, '2025-03-21 21:37:21.023-05', '2025-03-23 21:11:39.341696-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (66, 'Lectura cr├¡tica inicial', '', 2, 1, 66, 1, '2025-03-21 21:37:21.159-05', '2025-03-21 21:37:21.159-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (67, 'Identificaci├│n de argumentos', '', 2, 1, 67, 1, '2025-03-21 21:37:21.164-05', '2025-03-21 21:37:21.164-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (68, 'Relaciones intertextuales b├ísicas', '', 2, 1, 68, 1, '2025-03-21 21:37:21.169-05', '2025-03-21 21:37:21.169-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (69, 'Textos expositivos simples', '', 2, 1, 69, 1, '2025-03-21 21:37:21.175-05', '2025-03-21 21:37:21.175-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (70, 'Descripciones detalladas', '', 2, 1, 70, 1, '2025-03-21 21:37:21.18-05', '2025-03-21 21:37:21.18-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (71, 'Uso de conectores b├ísicos', '', 2, 1, 71, 1, '2025-03-21 21:37:21.185-05', '2025-03-21 21:37:21.185-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (72, 'Literatura colonial americana', '', 2, 1, 72, 1, '2025-03-21 21:37:21.191-05', '2025-03-21 21:37:21.191-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (73, 'Narrativa de aventuras', '', 2, 1, 73, 1, '2025-03-21 21:37:21.196-05', '2025-03-21 21:37:21.196-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (74, 'Poes├¡a tradicional', '', 2, 1, 74, 1, '2025-03-21 21:37:21.201-05', '2025-03-21 21:37:21.201-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (75, 'Estructura de la oraci├│n simple', '', 2, 1, 75, 1, '2025-03-21 21:37:21.207-05', '2025-03-21 21:37:21.207-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (76, 'Modos verbales', '', 2, 1, 76, 1, '2025-03-21 21:37:21.213-05', '2025-03-21 21:37:21.213-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (77, 'Complementos del verbo', '', 2, 1, 77, 1, '2025-03-21 21:37:21.219-05', '2025-03-21 21:37:21.219-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (78, 'N├║meros racionales (fracciones y decimales)', '', 2, 2, 78, 1, '2025-03-21 21:37:21.225-05', '2025-03-21 21:37:21.225-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (79, 'Proporcionalidad directa e inversa', '', 2, 2, 79, 1, '2025-03-21 21:37:21.231-05', '2025-03-21 21:37:21.231-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (80, 'Porcentajes', '', 2, 2, 80, 1, '2025-03-21 21:37:21.237-05', '2025-03-21 21:37:21.237-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (81, 'Transformaciones en el plano', '', 2, 2, 81, 1, '2025-03-21 21:37:21.243-05', '2025-03-21 21:37:21.243-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (82, '├üngulos (complementarios, suplementarios)', '', 2, 2, 82, 1, '2025-03-21 21:37:21.248-05', '2025-03-21 21:37:21.248-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (83, 'Pol├¡gonos regulares e irregulares', '', 2, 2, 83, 1, '2025-03-21 21:37:21.253-05', '2025-03-21 21:37:21.253-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (84, 'Unidades de superficie y volumen', '', 2, 2, 84, 1, '2025-03-21 21:37:21.258-05', '2025-03-21 21:37:21.258-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (85, 'Estimaci├│n de medidas', '', 2, 2, 85, 1, '2025-03-21 21:37:21.262-05', '2025-03-21 21:37:21.262-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (86, 'Medidas de tendencia central', '', 2, 2, 86, 1, '2025-03-21 21:37:21.268-05', '2025-03-21 21:37:21.268-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (16, 'Teor├¡a b├ísica de n├║meros (MCM y MCD)', '## M├¡nimo com├║n m├║ltiplo
(mcm o m.┬ác.┬ám.) de dos o m├ís n├║meros naturales es el menor m├║ltiplo com├║n de todos ellos. Este concepto est├í ligado con las fracciones de n├║meros naturales
[Ver m├ís](https://es.wikipedia.org/wiki/M├¡nimo_com├║n_m├║ltiplo)
**Fuente:** Wikipedia

## Divisibilidad
n=n\\cdot 1} . 1 Ôêú mcd Ôüí ( a , b ) Ôêú a Ôêú mcm Ôüí ( a , b ) Ôêú 0 {\\displaystyle 1\\mid \\operatorname {mcd} (a,b)\\mid a\\mid \\operatorname {mcm} (a,b)\\mid 0} .
[Ver m├ís](https://es.wikipedia.org/wiki/Divisibilidad)
**Fuente:** Wikipedia
', 1, 2, 16, 1, '2025-03-21 21:37:20.88-05', '2025-03-21 21:37:20.88-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (87, 'Probabilidad de eventos simples', '', 2, 2, 87, 1, '2025-03-21 21:37:21.273-05', '2025-03-21 21:37:21.273-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (88, 'Ecuaciones lineales con una inc├│gnita', '', 2, 2, 88, 1, '2025-03-21 21:37:21.279-05', '2025-03-21 21:37:21.279-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (89, 'Gr├íficas en el plano cartesiano', '', 2, 2, 89, 1, '2025-03-21 21:37:21.284-05', '2025-03-21 21:37:21.284-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (90, 'Ecosistemas terrestres y acu├íticos', '', 2, 3, 90, 1, '2025-03-21 21:37:21.289-05', '2025-03-21 21:37:21.289-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (91, 'Cadenas y redes tr├│ficas', '', 2, 3, 91, 1, '2025-03-21 21:37:21.295-05', '2025-03-21 21:37:21.295-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (92, 'Adaptaciones de los seres vivos', '', 2, 3, 92, 1, '2025-03-21 21:37:21.3-05', '2025-03-21 21:37:21.3-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (93, 'Taxonom├¡a b├ísica', '', 2, 3, 93, 1, '2025-03-21 21:37:21.305-05', '2025-03-21 21:37:21.305-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (94, 'Energ├¡a y sus transformaciones', '', 2, 3, 94, 1, '2025-03-21 21:37:21.31-05', '2025-03-21 21:37:21.31-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (95, 'Calor y temperatura', '', 2, 3, 95, 1, '2025-03-21 21:37:21.315-05', '2025-03-21 21:37:21.315-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (96, 'Ondas b├ísicas', '', 2, 3, 96, 1, '2025-03-21 21:37:21.321-05', '2025-03-21 21:37:21.321-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (97, 'Tabla peri├│dica introductoria', '', 2, 3, 97, 1, '2025-03-21 21:37:21.326-05', '2025-03-21 21:37:21.326-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (98, '├ütomo y mol├®culas b├ísicas', '', 2, 3, 98, 1, '2025-03-21 21:37:21.332-05', '2025-03-21 21:37:21.332-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (99, 'Soluciones qu├¡micas simples', '', 2, 3, 99, 1, '2025-03-21 21:37:21.341-05', '2025-03-21 21:37:21.341-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (100, 'Conservaci├│n ambiental', '', 2, 3, 100, 1, '2025-03-21 21:37:21.354-05', '2025-03-21 21:37:21.354-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (101, 'Uso sostenible de recursos', '', 2, 3, 101, 1, '2025-03-21 21:37:21.362-05', '2025-03-21 21:37:21.362-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (102, 'Colonizaci├│n europea en Am├®rica', '', 2, 4, 102, 1, '2025-03-21 21:37:21.369-05', '2025-03-21 21:37:21.369-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (103, 'Sistema colonial', '', 2, 4, 103, 1, '2025-03-21 21:37:21.385-05', '2025-03-21 21:37:21.385-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (104, 'Econom├¡a colonial', '', 2, 4, 104, 1, '2025-03-21 21:37:21.394-05', '2025-03-21 21:37:21.394-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (105, 'Regiones geogr├íficas de Colombia', '', 2, 4, 105, 1, '2025-03-21 21:37:21.401-05', '2025-03-21 21:37:21.401-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (106, 'Demograf├¡a b├ísica', '', 2, 4, 106, 1, '2025-03-21 21:37:21.409-05', '2025-03-21 21:37:21.409-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (107, 'Geograf├¡a econ├│mica introductoria', '', 2, 4, 107, 1, '2025-03-21 21:37:21.416-05', '2025-03-21 21:37:21.416-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (108, 'Organizaci├│n del Estado colombiano', '', 2, 4, 108, 1, '2025-03-21 21:37:21.43-05', '2025-03-21 21:37:21.43-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (109, 'Participaci├│n ciudadana', '', 2, 4, 109, 1, '2025-03-21 21:37:21.438-05', '2025-03-21 21:37:21.438-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (110, 'Mecanismos de participaci├│n democr├ítica', '', 2, 4, 110, 1, '2025-03-21 21:37:21.445-05', '2025-03-21 21:37:21.445-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (111, 'Actividades cotidianas y rutinas', '', 2, 7, 111, 1, '2025-03-21 21:37:21.452-05', '2025-03-21 21:37:21.452-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (112, 'Adjetivos descriptivos', '', 2, 7, 112, 1, '2025-03-21 21:37:21.459-05', '2025-03-21 21:37:21.459-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (113, 'Expresiones de tiempo', '', 2, 7, 113, 1, '2025-03-21 21:37:21.466-05', '2025-03-21 21:37:21.466-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (114, 'Presente simple y continuo', '', 2, 7, 114, 1, '2025-03-21 21:37:21.474-05', '2025-03-21 21:37:21.474-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (115, 'Adverbios de frecuencia', '', 2, 7, 115, 1, '2025-03-21 21:37:21.482-05', '2025-03-21 21:37:21.482-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (116, 'Preposiciones de lugar y tiempo', '', 2, 7, 116, 1, '2025-03-21 21:37:21.489-05', '2025-03-21 21:37:21.489-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (117, 'Descripci├│n de personas y lugares', '', 2, 7, 117, 1, '2025-03-21 21:37:21.495-05', '2025-03-21 21:37:21.495-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (118, 'Expresi├│n de gustos y preferencias', '', 2, 7, 118, 1, '2025-03-21 21:37:21.501-05', '2025-03-21 21:37:21.501-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (119, 'Redacci├│n de p├írrafos cortos', '', 2, 7, 119, 1, '2025-03-21 21:37:21.508-05', '2025-03-21 21:37:21.508-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (120, 'Capacidades f├¡sicas b├ísicas', '', 2, 6, 120, 1, '2025-03-21 21:37:21.515-05', '2025-03-21 21:37:21.515-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (121, 'Resistencia aer├│bica', '', 2, 6, 121, 1, '2025-03-21 21:37:21.521-05', '2025-03-21 21:37:21.521-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (122, 'Flexibilidad', '', 2, 6, 122, 1, '2025-03-21 21:37:21.527-05', '2025-03-21 21:37:21.527-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (123, 'Deportes colectivos (f├║tbol, baloncesto, voleibol)', '', 2, 6, 123, 1, '2025-03-21 21:37:21.532-05', '2025-03-21 21:37:21.532-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (124, 'T├®cnicas b├ísicas deportivas', '', 2, 6, 124, 1, '2025-03-21 21:37:21.538-05', '2025-03-21 21:37:21.538-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (125, 'Reglamento b├ísico deportivo', '', 2, 6, 125, 1, '2025-03-21 21:37:21.545-05', '2025-03-21 21:37:21.545-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (126, 'Danzas folcl├│ricas sencillas', '', 2, 6, 126, 1, '2025-03-21 21:37:21.55-05', '2025-03-21 21:37:21.55-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (127, 'Representaciones esc├®nicas simples', '', 2, 6, 127, 1, '2025-03-21 21:37:21.556-05', '2025-03-21 21:37:21.556-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (128, 'An├ílisis de textos informativos', '', 3, 1, 128, 1, '2025-03-21 21:37:21.562-05', '2025-03-21 21:37:21.562-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (129, 'Identificaci├│n de tesis y argumentos', '', 3, 1, 129, 1, '2025-03-21 21:37:21.568-05', '2025-03-21 21:37:21.568-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (130, 'Contexto hist├│rico de textos', '', 3, 1, 130, 1, '2025-03-21 21:37:21.575-05', '2025-03-21 21:37:21.575-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (131, 'Textos argumentativos b├ísicos', '', 3, 1, 131, 1, '2025-03-21 21:37:21.581-05', '2025-03-21 21:37:21.581-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (132, 'Informes y rese├▒as sencillas', '', 3, 1, 132, 1, '2025-03-21 21:37:21.587-05', '2025-03-21 21:37:21.587-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (133, 'Coherencia y cohesi├│n textual', '', 3, 1, 133, 1, '2025-03-21 21:37:21.593-05', '2025-03-21 21:37:21.593-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (134, 'Literatura universal cl├ísica', '', 3, 1, 134, 1, '2025-03-21 21:37:21.598-05', '2025-03-21 21:37:21.598-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (135, 'Mitolog├¡a griega y romana', '', 3, 1, 135, 1, '2025-03-21 21:37:21.603-05', '2025-03-21 21:37:21.603-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (136, 'G├®neros dram├íticos', '', 3, 1, 136, 1, '2025-03-21 21:37:21.608-05', '2025-03-21 21:37:21.608-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (137, 'Oraciones compuestas coordinadas', '', 3, 1, 137, 1, '2025-03-21 21:37:21.613-05', '2025-03-21 21:37:21.613-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (138, 'Uso de pronombres relativos', '', 3, 1, 138, 1, '2025-03-21 21:37:21.617-05', '2025-03-21 21:37:21.617-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (139, 'Signos de puntuaci├│n avanzados', '', 3, 1, 139, 1, '2025-03-21 21:37:21.622-05', '2025-03-21 21:37:21.622-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (140, 'N├║meros reales', '', 3, 2, 140, 1, '2025-03-21 21:37:21.628-05', '2025-03-21 21:37:21.628-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (141, 'Potenciaci├│n y radicaci├│n', '', 3, 2, 141, 1, '2025-03-21 21:37:21.633-05', '2025-03-21 21:37:21.633-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (142, 'Notaci├│n cient├¡fica', '', 3, 2, 142, 1, '2025-03-21 21:37:21.639-05', '2025-03-21 21:37:21.639-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (143, 'Teorema de Pit├ígoras', '', 3, 2, 143, 1, '2025-03-21 21:37:21.644-05', '2025-03-21 21:37:21.644-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (144, 'Semejanza y congruencia de tri├íngulos', '', 3, 2, 144, 1, '2025-03-21 21:37:21.649-05', '2025-03-21 21:37:21.649-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (145, 'Volumen de cuerpos geom├®tricos', '', 3, 2, 145, 1, '2025-03-21 21:37:21.654-05', '2025-03-21 21:37:21.654-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (146, 'Conversiones entre sistemas de medidas', '', 3, 2, 146, 1, '2025-03-21 21:37:21.66-05', '2025-03-21 21:37:21.66-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (147, '├ürea de figuras compuestas', '', 3, 2, 147, 1, '2025-03-21 21:37:21.665-05', '2025-03-21 21:37:21.665-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (148, 'T├®cnicas de conteo', '', 3, 2, 148, 1, '2025-03-21 21:37:21.67-05', '2025-03-21 21:37:21.67-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (149, 'Probabilidad de eventos compuestos', '', 3, 2, 149, 1, '2025-03-21 21:37:21.675-05', '2025-03-21 21:37:21.675-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (150, 'Tablas de frecuencia con datos agrupados', '', 3, 2, 150, 1, '2025-03-21 21:37:21.68-05', '2025-03-21 21:37:21.68-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (151, 'Funciones lineales', '', 3, 2, 151, 1, '2025-03-21 21:37:21.685-05', '2025-03-21 21:37:21.685-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (152, 'Sistemas de ecuaciones lineales 2x2', '', 3, 2, 152, 1, '2025-03-21 21:37:21.691-05', '2025-03-21 21:37:21.691-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (153, 'Pendiente e interceptos', '', 3, 2, 153, 1, '2025-03-21 21:37:21.696-05', '2025-03-21 21:37:21.696-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (154, 'Estructura y funci├│n celular', '', 3, 3, 154, 1, '2025-03-21 21:37:21.701-05', '2025-03-21 21:37:21.701-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (155, 'Reproducci├│n celular (mitosis y meiosis)', '', 3, 3, 155, 1, '2025-03-21 21:37:21.707-05', '2025-03-21 21:37:21.707-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (156, 'Sistemas del cuerpo humano (digestivo, respiratorio)', '', 3, 3, 156, 1, '2025-03-21 21:37:21.713-05', '2025-03-21 21:37:21.713-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (157, 'Gen├®tica mendeliana b├ísica', '', 3, 3, 157, 1, '2025-03-21 21:37:21.72-05', '2025-03-21 21:37:21.72-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (158, 'Cinem├ítica unidimensional', '', 3, 3, 158, 1, '2025-03-21 21:37:21.725-05', '2025-03-21 21:37:21.725-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (159, 'Leyes de Newton b├ísicas', '', 3, 3, 159, 1, '2025-03-21 21:37:21.732-05', '2025-03-21 21:37:21.732-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (160, 'Trabajo, potencia y energ├¡a', '', 3, 3, 160, 1, '2025-03-21 21:37:21.737-05', '2025-03-21 21:37:21.737-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (161, 'Estructura at├│mica', '', 3, 3, 161, 1, '2025-03-21 21:37:21.742-05', '2025-03-21 21:37:21.742-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (162, 'Tabla peri├│dica (propiedades peri├│dicas)', '', 3, 3, 162, 1, '2025-03-21 21:37:21.747-05', '2025-03-21 21:37:21.747-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (163, 'Enlaces qu├¡micos b├ísicos', '', 3, 3, 163, 1, '2025-03-21 21:37:21.752-05', '2025-03-21 21:37:21.752-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (164, 'Reacciones qu├¡micas sencillas', '', 3, 3, 164, 1, '2025-03-21 21:37:21.757-05', '2025-03-21 21:37:21.757-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (165, 'Avances cient├¡ficos y su impacto', '', 3, 3, 165, 1, '2025-03-21 21:37:21.763-05', '2025-03-21 21:37:21.763-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (166, 'Historia medieval europea', '', 3, 4, 166, 1, '2025-03-21 21:37:21.768-05', '2025-03-21 21:37:21.768-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (167, 'Renacimiento y Humanismo', '', 3, 4, 167, 1, '2025-03-21 21:37:21.774-05', '2025-03-21 21:37:21.774-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (168, 'Reformas religiosas', '', 3, 4, 168, 1, '2025-03-21 21:37:21.78-05', '2025-03-21 21:37:21.78-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (169, 'Desarrollo econ├│mico y social mundial', '', 3, 4, 169, 1, '2025-03-21 21:37:21.785-05', '2025-03-21 21:37:21.785-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (170, 'Sectores econ├│micos', '', 3, 4, 170, 1, '2025-03-21 21:37:21.79-05', '2025-03-21 21:37:21.79-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (171, 'Geograf├¡a poblacional', '', 3, 4, 171, 1, '2025-03-21 21:37:21.796-05', '2025-03-21 21:37:21.796-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (172, 'Constituci├│n Pol├¡tica de Colombia', '', 3, 4, 172, 1, '2025-03-21 21:37:21.801-05', '2025-03-21 21:37:21.801-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (173, 'Ramas del poder p├║blico', '', 3, 4, 173, 1, '2025-03-21 21:37:21.806-05', '2025-03-21 21:37:21.806-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (175, 'Alimentos y comidas', '', 3, 8, 175, 1, '2025-03-21 21:37:21.817-05', '2025-03-21 21:37:21.817-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (176, 'Lugares y ubicaciones', '', 3, 8, 176, 1, '2025-03-21 21:37:21.822-05', '2025-03-21 21:37:21.822-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (177, 'Ocupaciones y oficios', '', 3, 8, 177, 1, '2025-03-21 21:37:21.829-05', '2025-03-21 21:37:21.829-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (178, 'Pasado simple y continuo', '', 3, 8, 178, 1, '2025-03-21 21:37:21.834-05', '2025-03-21 21:37:21.834-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (179, 'Comparativos y superlativos', '', 3, 8, 179, 1, '2025-03-21 21:37:21.84-05', '2025-03-21 21:37:21.84-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (180, 'Futuro con "going to" y "will"', '', 3, 8, 180, 1, '2025-03-21 21:37:21.845-05', '2025-03-21 21:37:21.845-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (181, 'Narraci├│n de hechos pasados', '', 3, 8, 181, 1, '2025-03-21 21:37:21.85-05', '2025-03-21 21:37:21.85-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (182, 'Elaboraci├│n de planes futuros', '', 3, 8, 182, 1, '2025-03-21 21:37:21.855-05', '2025-03-21 21:37:21.855-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (183, 'Comprensi├│n de textos cortos', '', 3, 8, 183, 1, '2025-03-21 21:37:21.861-05', '2025-03-21 21:37:21.861-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (184, 'Entrenamiento de resistencia', '', 3, 6, 184, 1, '2025-03-21 21:37:21.866-05', '2025-03-21 21:37:21.866-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (185, 'Desarrollo de la fuerza', '', 3, 6, 185, 1, '2025-03-21 21:37:21.871-05', '2025-03-21 21:37:21.871-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (187, 'Deportes individuales (atletismo b├ísico)', '', 3, 6, 187, 1, '2025-03-21 21:37:21.882-05', '2025-03-21 21:37:21.882-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (188, 'Estrategias b├ísicas de juego', '', 3, 6, 188, 1, '2025-03-21 21:37:21.887-05', '2025-03-21 21:37:21.887-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (189, 'Arbitraje elemental', '', 3, 6, 189, 1, '2025-03-21 21:37:21.893-05', '2025-03-21 21:37:21.893-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (190, 'Coreograf├¡as simples', '', 3, 6, 190, 1, '2025-03-21 21:37:21.898-05', '2025-03-21 21:37:21.898-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (191, 'Composiciones gimn├ísticas b├ísicas', '', 3, 6, 191, 1, '2025-03-21 21:37:21.902-05', '2025-03-21 21:37:21.902-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (192, 'An├ílisis de textos cient├¡ficos y period├¡sticos', '', 4, 1, 192, 1, '2025-03-21 21:37:21.908-05', '2025-03-21 21:37:21.908-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (193, 'Identificaci├│n de posturas ideol├│gicas', '', 4, 1, 193, 1, '2025-03-21 21:37:21.914-05', '2025-03-21 21:37:21.914-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (194, 'Intertextualidad y contexto', '', 4, 1, 194, 1, '2025-03-21 21:37:21.919-05', '2025-03-21 21:37:21.919-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (195, 'Ensayo argumentativo estructurado', '', 4, 1, 195, 1, '2025-03-21 21:37:21.924-05', '2025-03-21 21:37:21.924-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (196, 'Textos period├¡sticos b├ísicos', '', 4, 1, 196, 1, '2025-03-21 21:37:21.93-05', '2025-03-21 21:37:21.93-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (197, 'Protocolos de presentaci├│n de trabajos', '', 4, 1, 197, 1, '2025-03-21 21:37:21.935-05', '2025-03-21 21:37:21.935-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (198, 'Literatura del Romanticismo y Realismo', '', 4, 1, 198, 1, '2025-03-21 21:37:21.941-05', '2025-03-21 21:37:21.941-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (199, 'Novela latinoamericana del siglo XIX', '', 4, 1, 199, 1, '2025-03-21 21:37:21.946-05', '2025-03-21 21:37:21.946-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (200, 'An├ílisis de obras representativas', '', 4, 1, 200, 1, '2025-03-21 21:37:21.951-05', '2025-03-21 21:37:21.951-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (201, 'Oraciones subordinadas', '', 4, 1, 201, 1, '2025-03-21 21:37:21.956-05', '2025-03-21 21:37:21.956-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (202, 'An├ílisis sint├íctico completo', '', 4, 1, 202, 1, '2025-03-21 21:37:21.962-05', '2025-03-21 21:37:21.962-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (203, 'Marcadores textuales', '', 4, 1, 203, 1, '2025-03-21 21:37:21.967-05', '2025-03-21 21:37:21.967-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (204, 'N├║meros reales (operaciones avanzadas)', '', 4, 2, 204, 1, '2025-03-21 21:37:21.973-05', '2025-03-21 21:37:21.973-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (205, 'Sucesiones y series', '', 4, 2, 205, 1, '2025-03-21 21:37:21.98-05', '2025-03-21 21:37:21.98-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (206, 'Progresiones aritm├®ticas y geom├®tricas', '', 4, 2, 206, 1, '2025-03-21 21:37:21.985-05', '2025-03-21 21:37:21.985-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (207, 'Transformaciones geom├®tricas', '', 4, 2, 207, 1, '2025-03-21 21:37:21.991-05', '2025-03-21 21:37:21.991-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (208, 'C├¡rculo y circunferencia (propiedades)', '', 4, 2, 208, 1, '2025-03-21 21:37:21.996-05', '2025-03-21 21:37:21.996-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (209, 'Geometr├¡a anal├¡tica b├ísica', '', 4, 2, 209, 1, '2025-03-21 21:37:22.001-05', '2025-03-21 21:37:22.001-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (210, 'Proporcionalidad geom├®trica', '', 4, 2, 210, 1, '2025-03-21 21:37:22.007-05', '2025-03-21 21:37:22.007-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (211, 'Teorema de Thales', '', 4, 2, 211, 1, '2025-03-21 21:37:22.012-05', '2025-03-21 21:37:22.012-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (212, 'Medidas de dispersi├│n', '', 4, 2, 212, 1, '2025-03-21 21:37:22.017-05', '2025-03-21 21:37:22.017-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (213, 'Intervalos de confianza b├ísicos', '', 4, 2, 213, 1, '2025-03-21 21:37:22.023-05', '2025-03-21 21:37:22.023-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (214, 'An├ílisis estad├¡stico de datos', '', 4, 2, 214, 1, '2025-03-21 21:37:22.028-05', '2025-03-21 21:37:22.028-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (215, 'Funciones cuadr├íticas', '', 4, 2, 215, 1, '2025-03-21 21:37:22.034-05', '2025-03-21 21:37:22.034-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (216, 'Sistemas de ecuaciones 3x3', '', 4, 2, 216, 1, '2025-03-21 21:37:22.038-05', '2025-03-21 21:37:22.038-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (217, 'Inecuaciones lineales', '', 4, 2, 217, 1, '2025-03-21 21:37:22.045-05', '2025-03-21 21:37:22.045-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (218, 'Teor├¡as de la evoluci├│n', '', 4, 3, 218, 1, '2025-03-21 21:37:22.05-05', '2025-03-21 21:37:22.05-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (219, 'Selecci├│n natural y adaptaci├│n', '', 4, 3, 219, 1, '2025-03-21 21:37:22.055-05', '2025-03-21 21:37:22.055-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (220, 'Sistemas del cuerpo humano (circulatorio, nervioso, endocrino)', '', 4, 3, 220, 1, '2025-03-21 21:37:22.06-05', '2025-03-21 21:37:22.06-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (221, 'Din├ímica', '', 4, 3, 221, 1, '2025-03-21 21:37:22.066-05', '2025-03-21 21:37:22.066-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (222, 'Est├ítica b├ísica', '', 4, 3, 222, 1, '2025-03-21 21:37:22.071-05', '2025-03-21 21:37:22.071-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (223, 'Fundamentos de hidrost├ítica', '', 4, 3, 223, 1, '2025-03-21 21:37:22.075-05', '2025-03-21 21:37:22.075-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (224, 'Estequiometr├¡a b├ísica', '', 4, 3, 224, 1, '2025-03-21 21:37:22.08-05', '2025-03-21 21:37:22.08-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (225, 'Soluciones qu├¡micas (concentraciones)', '', 4, 3, 225, 1, '2025-03-21 21:37:22.085-05', '2025-03-21 21:37:22.085-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (226, 'Equilibrio qu├¡mico introductorio', '', 4, 3, 226, 1, '2025-03-21 21:37:22.091-05', '2025-03-21 21:37:22.091-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (227, 'Biotecnolog├¡a b├ísica', '', 4, 3, 227, 1, '2025-03-21 21:37:22.096-05', '2025-03-21 21:37:22.096-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (228, 'Problemas ambientales globales', '', 4, 3, 228, 1, '2025-03-21 21:37:22.101-05', '2025-03-21 21:37:22.101-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (229, 'Revoluciones burguesas (Americana, Francesa)', '', 4, 4, 229, 1, '2025-03-21 21:37:22.105-05', '2025-03-21 21:37:22.105-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (230, 'Revoluci├│n Industrial', '', 4, 4, 230, 1, '2025-03-21 21:37:22.111-05', '2025-03-21 21:37:22.111-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (232, 'Geograf├¡a pol├¡tica mundial', '', 4, 4, 232, 1, '2025-03-21 21:37:22.121-05', '2025-03-21 21:37:22.121-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (233, 'Geopol├¡tica b├ísica', '', 4, 4, 233, 1, '2025-03-21 21:37:22.126-05', '2025-03-21 21:37:22.126-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (234, 'Recursos naturales y desarrollo', '', 4, 4, 234, 1, '2025-03-21 21:37:22.132-05', '2025-03-21 21:37:22.132-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (235, 'Sistemas pol├¡ticos comparados', '', 4, 4, 235, 1, '2025-03-21 21:37:22.137-05', '2025-03-21 21:37:22.137-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (236, 'Estado social de derecho', '', 4, 4, 236, 1, '2025-03-21 21:37:22.142-05', '2025-03-21 21:37:22.142-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (237, 'Mecanismos de protecci├│n de derechos', '', 4, 4, 237, 1, '2025-03-21 21:37:22.148-05', '2025-03-21 21:37:22.148-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (238, 'Viajes y turismo', '', 4, 9, 238, 1, '2025-03-21 21:37:22.153-05', '2025-03-21 21:37:22.153-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (239, 'Medios de comunicaci├│n', '', 4, 9, 239, 1, '2025-03-21 21:37:22.159-05', '2025-03-21 21:37:22.159-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (240, 'Medio ambiente', '', 4, 9, 240, 1, '2025-03-21 21:37:22.165-05', '2025-03-21 21:37:22.165-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (241, 'Presente perfecto', '', 4, 9, 241, 1, '2025-03-21 21:37:22.17-05', '2025-03-21 21:37:22.17-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (242, 'Modales b├ísicos (can, should, must)', '', 4, 9, 242, 1, '2025-03-21 21:37:22.176-05', '2025-03-21 21:37:22.176-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (243, 'Voz pasiva simple', '', 4, 9, 243, 1, '2025-03-21 21:37:22.182-05', '2025-03-21 21:37:22.182-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (244, 'Expresi├│n de opiniones', '', 4, 9, 244, 1, '2025-03-21 21:37:22.187-05', '2025-03-21 21:37:22.187-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (245, 'Redacci├│n de cartas informales', '', 4, 9, 245, 1, '2025-03-21 21:37:22.193-05', '2025-03-21 21:37:22.193-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (246, 'Exposiciones orales cortas', '', 4, 9, 246, 1, '2025-03-21 21:37:22.198-05', '2025-03-21 21:37:22.198-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (247, 'Sistemas de entrenamiento', '', 4, 6, 247, 1, '2025-03-21 21:37:22.202-05', '2025-03-21 21:37:22.202-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (248, 'Planificaci├│n de actividad f├¡sica', '', 4, 6, 248, 1, '2025-03-21 21:37:22.208-05', '2025-03-21 21:37:22.208-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (249, 'Evaluaci├│n de condici├│n f├¡sica', '', 4, 6, 249, 1, '2025-03-21 21:37:22.213-05', '2025-03-21 21:37:22.213-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (250, 'Deportes de conjunto avanzados', '', 4, 6, 250, 1, '2025-03-21 21:37:22.218-05', '2025-03-21 21:37:22.218-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (251, 'Deportes alternativos', '', 4, 6, 251, 1, '2025-03-21 21:37:22.224-05', '2025-03-21 21:37:22.224-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (252, 'Programaci├│n deportiva', '', 4, 6, 252, 1, '2025-03-21 21:37:22.229-05', '2025-03-21 21:37:22.229-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (253, 'Montajes coreogr├íficos', '', 4, 6, 253, 1, '2025-03-21 21:37:22.235-05', '2025-03-21 21:37:22.235-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (254, 'Expresi├│n r├¡tmica avanzada', '', 4, 6, 254, 1, '2025-03-21 21:37:22.241-05', '2025-03-21 21:37:22.241-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (255, 'An├ílisis del discurso', '', 5, 1, 255, 1, '2025-03-21 21:37:22.246-05', '2025-03-21 21:37:22.246-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (256, 'Textos filos├│ficos y cient├¡ficos', '', 5, 1, 256, 1, '2025-03-21 21:37:22.252-05', '2025-03-21 21:37:22.252-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (257, 'Macroestructuras textuales', '', 5, 1, 257, 1, '2025-03-21 21:37:22.257-05', '2025-03-21 21:37:22.257-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (258, 'Ensayo de car├ícter cr├¡tico', '', 5, 1, 258, 1, '2025-03-21 21:37:22.262-05', '2025-03-21 21:37:22.262-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (259, 'Textos argumentativos complejos', '', 5, 1, 259, 1, '2025-03-21 21:37:22.267-05', '2025-03-21 21:37:22.267-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (260, 'Rese├▒as cr├¡ticas', '', 5, 1, 260, 1, '2025-03-21 21:37:22.273-05', '2025-03-21 21:37:22.273-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (261, 'Literatura colombiana (desde la Colonia hasta el siglo XX)', '', 5, 1, 261, 1, '2025-03-21 21:37:22.278-05', '2025-03-21 21:37:22.278-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (262, 'Movimientos literarios colombianos', '', 5, 1, 262, 1, '2025-03-21 21:37:22.283-05', '2025-03-21 21:37:22.283-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (263, 'An├ílisis de autores representativos', '', 5, 1, 263, 1, '2025-03-21 21:37:22.288-05', '2025-03-21 21:37:22.288-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (264, 'Sem├íntica y pragm├ítica', '', 5, 1, 264, 1, '2025-03-21 21:37:22.293-05', '2025-03-21 21:37:22.293-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (265, 'An├ílisis del discurso', '', 5, 1, 265, 1, '2025-03-21 21:37:22.298-05', '2025-03-21 21:37:22.298-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (266, 'Variantes ling├╝├¡sticas', '', 5, 1, 266, 1, '2025-03-21 21:37:22.303-05', '2025-03-21 21:37:22.303-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (267, '├üngulos y tri├íngulos - Sistemas de medici├│n angular', '', 5, 2, 267, 1, '2025-03-21 21:37:22.309-05', '2025-03-21 21:37:22.309-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (268, '├üngulos y tri├íngulos - Teorema del seno y coseno', '', 5, 2, 268, 1, '2025-03-21 21:37:22.314-05', '2025-03-21 21:37:22.314-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (269, '├üngulos y tri├íngulos - Soluci├│n de tri├íngulos', '', 5, 2, 269, 1, '2025-03-21 21:37:22.32-05', '2025-03-21 21:37:22.32-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (270, 'Funciones trigonom├®tricas - Funciones seno, coseno, tangente', '', 5, 2, 270, 1, '2025-03-21 21:37:22.326-05', '2025-03-21 21:37:22.326-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (271, 'Funciones trigonom├®tricas - Gr├íficas de funciones trigonom├®tricas', '', 5, 2, 271, 1, '2025-03-21 21:37:22.331-05', '2025-03-21 21:37:22.331-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (272, 'Funciones trigonom├®tricas - Ecuaciones trigonom├®tricas b├ísicas', '', 5, 2, 272, 1, '2025-03-21 21:37:22.336-05', '2025-03-21 21:37:22.336-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (273, 'Identidades trigonom├®tricas - Identidades fundamentales', '', 5, 2, 273, 1, '2025-03-21 21:37:22.342-05', '2025-03-21 21:37:22.342-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (274, 'Identidades trigonom├®tricas - Identidades de suma y diferencia', '', 5, 2, 274, 1, '2025-03-21 21:37:22.347-05', '2025-03-21 21:37:22.347-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (275, 'Identidades trigonom├®tricas - Identidades de ├íngulo doble', '', 5, 2, 275, 1, '2025-03-21 21:37:22.352-05', '2025-03-21 21:37:22.352-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (276, 'Geometr├¡a anal├¡tica b├ísica - La recta en el plano', '', 5, 2, 276, 1, '2025-03-21 21:37:22.358-05', '2025-03-21 21:37:22.358-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (277, 'Geometr├¡a anal├¡tica b├ísica - La circunferencia', '', 5, 2, 277, 1, '2025-03-21 21:37:22.363-05', '2025-03-21 21:37:22.363-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (278, 'Geometr├¡a anal├¡tica b├ísica - Secciones c├│nicas (par├íbola)', '', 5, 2, 278, 1, '2025-03-21 21:37:22.368-05', '2025-03-21 21:37:22.368-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (279, 'Movimiento rectil├¡neo uniforme', '', 5, 10, 279, 1, '2025-03-21 21:37:22.374-05', '2025-03-21 21:37:22.374-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (280, 'Movimiento rectil├¡neo uniformemente acelerado', '', 5, 10, 280, 1, '2025-03-21 21:37:22.379-05', '2025-03-21 21:37:22.379-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (281, 'Movimiento circular uniforme', '', 5, 10, 281, 1, '2025-03-21 21:37:22.384-05', '2025-03-21 21:37:22.384-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (282, 'Movimiento parab├│lico', '', 5, 10, 282, 1, '2025-03-21 21:37:22.39-05', '2025-03-21 21:37:22.39-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (283, 'Leyes de Newton (aplicaciones)', '', 5, 10, 283, 1, '2025-03-21 21:37:22.396-05', '2025-03-21 21:37:22.396-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (284, 'Fuerzas de rozamiento', '', 5, 10, 284, 1, '2025-03-21 21:37:22.402-05', '2025-03-21 21:37:22.402-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (285, 'Trabajo y energ├¡a', '', 5, 10, 285, 1, '2025-03-21 21:37:22.408-05', '2025-03-21 21:37:22.408-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (286, 'Conservaci├│n de la energ├¡a mec├ínica', '', 5, 10, 286, 1, '2025-03-21 21:37:22.414-05', '2025-03-21 21:37:22.414-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (287, 'Equilibrio de los cuerpos', '', 5, 10, 287, 1, '2025-03-21 21:37:22.419-05', '2025-03-21 21:37:22.419-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (288, 'Momento de una fuerza', '', 5, 10, 288, 1, '2025-03-21 21:37:22.425-05', '2025-03-21 21:37:22.425-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (289, 'Centro de gravedad', '', 5, 10, 289, 1, '2025-03-21 21:37:22.431-05', '2025-03-21 21:37:22.431-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (290, 'Leyes ponderales', '', 5, 11, 290, 1, '2025-03-21 21:37:22.436-05', '2025-03-21 21:37:22.436-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (291, 'C├ílculos estequiom├®tricos', '', 5, 11, 291, 1, '2025-03-21 21:37:22.442-05', '2025-03-21 21:37:22.442-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (292, 'Reactivo l├¡mite y rendimiento', '', 5, 11, 292, 1, '2025-03-21 21:37:22.447-05', '2025-03-21 21:37:22.447-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (293, 'Tipos de soluciones', '', 5, 11, 293, 1, '2025-03-21 21:37:22.452-05', '2025-03-21 21:37:22.452-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (294, 'Concentraciones f├¡sicas y qu├¡micas', '', 5, 11, 294, 1, '2025-03-21 21:37:22.457-05', '2025-03-21 21:37:22.457-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (295, 'Propiedades coligativas b├ísicas', '', 5, 11, 295, 1, '2025-03-21 21:37:22.463-05', '2025-03-21 21:37:22.463-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (296, 'Leyes de los gases', '', 5, 11, 296, 1, '2025-03-21 21:37:22.469-05', '2025-03-21 21:37:22.469-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (297, 'Teor├¡a cin├®tico-molecular', '', 5, 11, 297, 1, '2025-03-21 21:37:22.474-05', '2025-03-21 21:37:22.474-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (298, 'Ecuaci├│n de estado de gases ideales', '', 5, 11, 298, 1, '2025-03-21 21:37:22.479-05', '2025-03-21 21:37:22.479-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (299, 'Constante de equilibrio', '', 5, 11, 299, 1, '2025-03-21 21:37:22.484-05', '2025-03-21 21:37:22.484-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (300, 'Principio de Le Chatelier', '', 5, 11, 300, 1, '2025-03-21 21:37:22.491-05', '2025-03-21 21:37:22.491-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (301, 'Equilibrio ├ícido-base', '', 5, 11, 301, 1, '2025-03-21 21:37:22.496-05', '2025-03-21 21:37:22.496-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (302, 'Conceptos b├ísicos econ├│micos', '', 5, 4, 302, 1, '2025-03-21 21:37:22.501-05', '2025-03-21 21:37:22.501-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (303, 'Historia del pensamiento econ├│mico', '', 5, 4, 303, 1, '2025-03-21 21:37:22.508-05', '2025-03-21 21:37:22.508-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (304, 'Sectores econ├│micos', '', 5, 4, 304, 1, '2025-03-21 21:37:22.513-05', '2025-03-21 21:37:22.513-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (305, 'Sistema econ├│mico colombiano', '', 5, 4, 305, 1, '2025-03-21 21:37:22.518-05', '2025-03-21 21:37:22.518-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (306, 'Teor├¡as pol├¡ticas cl├ísicas', '', 5, 4, 306, 1, '2025-03-21 21:37:22.524-05', '2025-03-21 21:37:22.524-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (307, 'Estructura del Estado colombiano', '', 5, 4, 307, 1, '2025-03-21 21:37:22.529-05', '2025-03-21 21:37:22.529-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (308, 'Organismos de control', '', 5, 4, 308, 1, '2025-03-21 21:37:22.535-05', '2025-03-21 21:37:22.535-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (309, 'Pol├¡ticas p├║blicas', '', 5, 4, 309, 1, '2025-03-21 21:37:22.54-05', '2025-03-21 21:37:22.54-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (310, 'Presocr├íticos', '', 5, 12, 310, 1, '2025-03-21 21:37:22.546-05', '2025-03-21 21:37:22.546-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (311, 'S├│crates, Plat├│n y Arist├│teles', '', 5, 12, 311, 1, '2025-03-21 21:37:22.551-05', '2025-03-21 21:37:22.551-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (312, 'Filosof├¡a helen├¡stica', '', 5, 12, 312, 1, '2025-03-21 21:37:22.558-05', '2025-03-21 21:37:22.558-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (313, 'Ontolog├¡a b├ísica', '', 5, 12, 313, 1, '2025-03-21 21:37:22.567-05', '2025-03-21 21:37:22.567-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (314, 'Teor├¡a del conocimiento', '', 5, 12, 314, 1, '2025-03-21 21:37:22.574-05', '2025-03-21 21:37:22.574-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (315, 'Antropolog├¡a filos├│fica', '', 5, 12, 315, 1, '2025-03-21 21:37:22.579-05', '2025-03-21 21:37:22.579-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (316, 'Tecnolog├¡a y ciencia', '', 5, 13, 316, 1, '2025-03-21 21:37:22.584-05', '2025-03-21 21:37:22.584-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (317, 'Problem├íticas sociales', '', 5, 13, 317, 1, '2025-03-21 21:37:22.59-05', '2025-03-21 21:37:22.59-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (318, 'Cultura y sociedad', '', 5, 13, 318, 1, '2025-03-21 21:37:22.595-05', '2025-03-21 21:37:22.595-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (319, 'Condicionales (tipos 0, 1 y 2)', '', 5, 13, 319, 1, '2025-03-21 21:37:22.601-05', '2025-03-21 21:37:22.601-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (320, 'Reported Speech b├ísico', '', 5, 13, 320, 1, '2025-03-21 21:37:22.606-05', '2025-03-21 21:37:22.606-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (322, 'Redacci├│n de ensayos cortos', '', 5, 13, 322, 1, '2025-03-21 21:37:22.616-05', '2025-03-21 21:37:22.616-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (323, 'Debates estructurados', '', 5, 13, 323, 1, '2025-03-21 21:37:22.621-05', '2025-03-21 21:37:22.621-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (324, 'Comprensi├│n de textos acad├®micos', '', 5, 13, 324, 1, '2025-03-21 21:37:22.626-05', '2025-03-21 21:37:22.626-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (325, 'Principios de entrenamiento', '', 5, 6, 325, 1, '2025-03-21 21:37:22.631-05', '2025-03-21 21:37:22.631-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (326, 'Planificaci├│n deportiva', '', 5, 6, 326, 1, '2025-03-21 21:37:22.636-05', '2025-03-21 21:37:22.636-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (327, 'Evaluaci├│n de capacidades f├¡sicas', '', 5, 6, 327, 1, '2025-03-21 21:37:22.641-05', '2025-03-21 21:37:22.641-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (328, 'Reglamentaci├│n deportiva avanzada', '', 5, 6, 328, 1, '2025-03-21 21:37:22.646-05', '2025-03-21 21:37:22.646-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (329, 'Fundamentos t├ícticos', '', 5, 6, 329, 1, '2025-03-21 21:37:22.652-05', '2025-03-21 21:37:22.652-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (330, 'Organizaci├│n de eventos deportivos', '', 5, 6, 330, 1, '2025-03-21 21:37:22.658-05', '2025-03-21 21:37:22.658-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (331, 'Composiciones gimn├ísticas complejas', '', 5, 6, 331, 1, '2025-03-21 21:37:22.663-05', '2025-03-21 21:37:22.663-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (332, 'Actividades r├¡tmicas avanzadas', '', 5, 6, 332, 1, '2025-03-21 21:37:22.668-05', '2025-03-21 21:37:22.668-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (333, 'Literatura contempor├ínea mundial', '', 6, 1, 333, 1, '2025-03-21 21:37:22.672-05', '2025-03-21 21:37:22.672-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (334, 'An├ílisis cr├¡tico de medios de comunicaci├│n', '', 6, 1, 334, 1, '2025-03-21 21:37:22.678-05', '2025-03-21 21:37:22.678-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (335, 'Intertextualidad avanzada', '', 6, 1, 335, 1, '2025-03-21 21:37:22.684-05', '2025-03-21 21:37:22.684-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (336, 'Textos acad├®micos complejos', '', 6, 1, 336, 1, '2025-03-21 21:37:22.689-05', '2025-03-21 21:37:22.689-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (337, 'Protocolos de investigaci├│n', '', 6, 1, 337, 1, '2025-03-21 21:37:22.695-05', '2025-03-21 21:37:22.695-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (338, 'Escritura creativa avanzada', '', 6, 1, 338, 1, '2025-03-21 21:37:22.7-05', '2025-03-21 21:37:22.7-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (339, 'Literatura latinoamericana del siglo XX', '', 6, 1, 339, 1, '2025-03-21 21:37:22.706-05', '2025-03-21 21:37:22.706-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (340, 'Boom latinoamericano', '', 6, 1, 340, 1, '2025-03-21 21:37:22.712-05', '2025-03-21 21:37:22.712-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (341, 'Literatura contempor├ínea', '', 6, 1, 341, 1, '2025-03-21 21:37:22.717-05', '2025-03-21 21:37:22.717-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (342, 'An├ílisis del discurso avanzado', '', 6, 1, 342, 1, '2025-03-21 21:37:22.722-05', '2025-03-21 21:37:22.722-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (343, 'Psicoling├╝├¡stica b├ísica', '', 6, 1, 343, 1, '2025-03-21 21:37:22.727-05', '2025-03-21 21:37:22.727-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (344, 'Socioling├╝├¡stica', '', 6, 1, 344, 1, '2025-03-21 21:37:22.732-05', '2025-03-21 21:37:22.732-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (345, 'L├¡mites y continuidad - Concepto de l├¡mite', '', 6, 2, 345, 1, '2025-03-21 21:37:22.737-05', '2025-03-21 21:37:22.737-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (346, 'L├¡mites y continuidad - Propiedades de los l├¡mites', '', 6, 2, 346, 1, '2025-03-21 21:37:22.742-05', '2025-03-21 21:37:22.742-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (347, 'L├¡mites y continuidad - Continuidad de funciones', '', 6, 2, 347, 1, '2025-03-21 21:37:22.747-05', '2025-03-21 21:37:22.747-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (348, 'Derivadas - Concepto de derivada', '', 6, 2, 348, 1, '2025-03-21 21:37:22.752-05', '2025-03-21 21:37:22.752-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (349, 'Derivadas - Reglas de derivaci├│n', '', 6, 2, 349, 1, '2025-03-21 21:37:22.757-05', '2025-03-21 21:37:22.757-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (350, 'Derivadas - Aplicaciones de la derivada', '', 6, 2, 350, 1, '2025-03-21 21:37:22.762-05', '2025-03-21 21:37:22.762-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (351, 'Integrales - Integral indefinida', '', 6, 2, 351, 1, '2025-03-21 21:37:22.767-05', '2025-03-21 21:37:22.767-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (352, 'Integrales - M├®todos de integraci├│n b├ísicos', '', 6, 2, 352, 1, '2025-03-21 21:37:22.772-05', '2025-03-21 21:37:22.772-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (353, 'Integrales - Integral definida', '', 6, 2, 353, 1, '2025-03-21 21:37:22.779-05', '2025-03-21 21:37:22.779-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (354, 'Integrales - Aplicaciones de la integral', '', 6, 2, 354, 1, '2025-03-21 21:37:22.785-05', '2025-03-21 21:37:22.785-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (355, 'Geometr├¡a anal├¡tica avanzada - Elipse e hip├®rbola', '', 6, 2, 355, 1, '2025-03-21 21:37:22.79-05', '2025-03-21 21:37:22.79-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (356, 'Geometr├¡a anal├¡tica avanzada - Ecuaciones param├®tricas', '', 6, 2, 356, 1, '2025-03-21 21:37:22.795-05', '2025-03-21 21:37:22.795-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (357, 'Movimiento ondulatorio', '', 6, 10, 357, 1, '2025-03-21 21:37:22.801-05', '2025-03-21 21:37:22.801-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (358, 'Ondas sonoras', '', 6, 10, 358, 1, '2025-03-21 21:37:22.807-05', '2025-03-21 21:37:22.807-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (359, 'Efecto Doppler', '', 6, 10, 359, 1, '2025-03-21 21:37:22.813-05', '2025-03-21 21:37:22.813-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (360, 'Carga el├®ctrica', '', 6, 10, 360, 1, '2025-03-21 21:37:22.818-05', '2025-03-21 21:37:22.818-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (361, 'Ley de Coulomb', '', 6, 10, 361, 1, '2025-03-21 21:37:22.823-05', '2025-03-21 21:37:22.823-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (362, 'Campo el├®ctrico', '', 6, 10, 362, 1, '2025-03-21 21:37:22.828-05', '2025-03-21 21:37:22.828-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (363, 'Circuitos el├®ctricos', '', 6, 10, 363, 1, '2025-03-21 21:37:22.833-05', '2025-03-21 21:37:22.833-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (364, 'Campo magn├®tico', '', 6, 10, 364, 1, '2025-03-21 21:37:22.838-05', '2025-03-21 21:37:22.838-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (365, 'Inducci├│n electromagn├®tica', '', 6, 10, 365, 1, '2025-03-21 21:37:22.844-05', '2025-03-21 21:37:22.844-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (367, 'Teor├¡a de la relatividad especial', '', 6, 10, 367, 1, '2025-03-21 21:37:22.854-05', '2025-03-21 21:37:22.854-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (368, 'F├¡sica cu├íntica b├ísica', '', 6, 10, 368, 1, '2025-03-21 21:37:22.859-05', '2025-03-21 21:37:22.859-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (369, 'Hidrocarburos', '', 6, 11, 369, 1, '2025-03-21 21:37:22.864-05', '2025-03-21 21:37:22.864-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (370, 'Grupos funcionales', '', 6, 11, 370, 1, '2025-03-21 21:37:22.87-05', '2025-03-21 21:37:22.87-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (371, 'Nomenclatura org├ínica', '', 6, 11, 371, 1, '2025-03-21 21:37:22.875-05', '2025-03-21 21:37:22.875-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (372, 'Isomer├¡a', '', 6, 11, 372, 1, '2025-03-21 21:37:22.881-05', '2025-03-21 21:37:22.881-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (373, 'Velocidad de reacci├│n', '', 6, 11, 373, 1, '2025-03-21 21:37:22.886-05', '2025-03-21 21:37:22.886-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (374, 'Factores que afectan la velocidad', '', 6, 11, 374, 1, '2025-03-21 21:37:22.892-05', '2025-03-21 21:37:22.892-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (375, 'Teor├¡a de colisiones', '', 6, 11, 375, 1, '2025-03-21 21:37:22.896-05', '2025-03-21 21:37:22.896-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (376, 'Reacciones redox', '', 6, 11, 376, 1, '2025-03-21 21:37:22.901-05', '2025-03-21 21:37:22.901-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (377, 'Celdas galv├ínicas', '', 6, 11, 377, 1, '2025-03-21 21:37:22.907-05', '2025-03-21 21:37:22.907-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (378, 'Electr├│lisis', '', 6, 11, 378, 1, '2025-03-21 21:37:22.913-05', '2025-03-21 21:37:22.913-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (379, 'Carbohidratos, l├¡pidos, prote├¡nas', '', 6, 11, 379, 1, '2025-03-21 21:37:22.918-05', '2025-03-21 21:37:22.918-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (380, 'Enzimas y metabolismo', '', 6, 11, 380, 1, '2025-03-21 21:37:22.924-05', '2025-03-21 21:37:22.924-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (381, 'Indicadores econ├│micos', '', 6, 4, 381, 1, '2025-03-21 21:37:22.929-05', '2025-03-21 21:37:22.929-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (382, 'Globalizaci├│n', '', 6, 4, 382, 1, '2025-03-21 21:37:22.934-05', '2025-03-21 21:37:22.934-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (383, 'Desarrollo sostenible', '', 6, 4, 383, 1, '2025-03-21 21:37:22.939-05', '2025-03-21 21:37:22.939-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (384, 'Relaciones internacionales', '', 6, 4, 384, 1, '2025-03-21 21:37:22.945-05', '2025-03-21 21:37:22.945-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (385, 'Organismos multilaterales', '', 6, 4, 385, 1, '2025-03-21 21:37:22.95-05', '2025-03-21 21:37:22.95-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (386, 'Conflictos contempor├íneos', '', 6, 4, 386, 1, '2025-03-21 21:37:22.955-05', '2025-03-21 21:37:22.955-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (387, 'Racionalismo y empirismo', '', 6, 12, 387, 1, '2025-03-21 21:37:22.96-05', '2025-03-21 21:37:22.96-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (388, 'Kant y el idealismo alem├ín', '', 6, 12, 388, 1, '2025-03-21 21:37:22.966-05', '2025-03-21 21:37:22.966-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (389, 'Filosof├¡a contempor├ínea', '', 6, 12, 389, 1, '2025-03-21 21:37:22.971-05', '2025-03-21 21:37:22.971-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (390, '├ëtica y moral', '', 6, 12, 390, 1, '2025-03-21 21:37:22.977-05', '2025-03-21 21:37:22.977-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (391, 'Est├®tica', '', 6, 12, 391, 1, '2025-03-21 21:37:22.981-05', '2025-03-21 21:37:22.981-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (392, 'Filosof├¡a pol├¡tica', '', 6, 12, 392, 1, '2025-03-21 21:37:22.986-05', '2025-03-21 21:37:22.986-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (393, 'Filosof├¡a de la ciencia', '', 6, 12, 393, 1, '2025-03-21 21:37:22.992-05', '2025-03-21 21:37:22.992-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (394, 'Temas acad├®micos especializados', '', 6, 14, 394, 1, '2025-03-21 21:37:22.997-05', '2025-03-21 21:37:22.997-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (395, 'Expresiones idiom├íticas', '', 6, 14, 395, 1, '2025-03-21 21:37:23.002-05', '2025-03-21 21:37:23.002-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (396, 'Lenguaje formal e informal', '', 6, 14, 396, 1, '2025-03-21 21:37:23.007-05', '2025-03-21 21:37:23.007-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (397, 'Condicionales tipo 3', '', 6, 14, 397, 1, '2025-03-21 21:37:23.012-05', '2025-03-21 21:37:23.012-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (398, 'Reported speech avanzado', '', 6, 14, 398, 1, '2025-03-21 21:37:23.017-05', '2025-03-21 21:37:23.017-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (399, 'Estructuras pasivas complejas', '', 6, 14, 399, 1, '2025-03-21 21:37:23.022-05', '2025-03-21 21:37:23.022-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (400, 'Ensayos argumentativos', '', 6, 14, 400, 1, '2025-03-21 21:37:23.027-05', '2025-03-21 21:37:23.027-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (401, 'Presentaciones formales', '', 6, 14, 401, 1, '2025-03-21 21:37:23.034-05', '2025-03-21 21:37:23.034-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (402, 'Preparaci├│n para ex├ímenes internacionales', '', 6, 14, 402, 1, '2025-03-21 21:37:23.041-05', '2025-03-21 21:37:23.041-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (403, 'Organizaci├│n de torneos', '', 6, 6, 403, 1, '2025-03-21 21:37:23.047-05', '2025-03-21 21:37:23.047-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (404, 'Planificaci├│n de programas deportivos', '', 6, 6, 404, 1, '2025-03-21 21:37:23.054-05', '2025-03-21 21:37:23.054-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (405, 'Proyectos deportivos comunitarios', '', 6, 6, 405, 1, '2025-03-21 21:37:23.059-05', '2025-03-21 21:37:23.059-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (406, 'Estilos de vida saludables', '', 6, 6, 406, 1, '2025-03-21 21:37:23.064-05', '2025-03-21 21:37:23.064-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (407, 'Prevenci├│n de lesiones', '', 6, 6, 407, 1, '2025-03-21 21:37:23.07-05', '2025-03-21 21:37:23.07-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (408, 'Primeros auxilios b├ísicos', '', 6, 6, 408, 1, '2025-03-21 21:37:23.076-05', '2025-03-21 21:37:23.076-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (409, '├ëtica deportiva', '', 6, 6, 409, 1, '2025-03-21 21:37:23.082-05', '2025-03-21 21:37:23.082-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (410, 'Deporte y cultura', '', 6, 6, 410, 1, '2025-03-21 21:37:23.087-05', '2025-03-21 21:37:23.087-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (411, 'Liderazgo deportivo', '', 6, 6, 411, 1, '2025-03-21 21:37:23.093-05', '2025-03-21 21:37:23.093-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (30, 'Ciclos de vida', '## Ciclo biol├│gico de vida
en los ciclos de vida de los protistas.[6]ÔÇï La descripci├│n de los complejos ciclos de vida de varios organismos contribuy├│ a refutar las ideas de la generaci├│n
[Ver m├ís](https://es.wikipedia.org/wiki/Ciclo_biol├│gico_de_vida)
**Fuente:** Wikipedia

## An├ílisis de ciclo de vida
Un an├ílisis de ciclo de vida (ACV) (life cycle assessment (LCA) en ingl├®s), tambi├®n conocido como an├ílisis de la cuna a la tumba, balance ambiental, balance
[Ver m├ís](https://es.wikipedia.org/wiki/An├ílisis_de_ciclo_de_vida)
**Fuente:** Wikipedia

## Ciclo de vida haplodiplonte
El ciclo de vida haplodiplonte o diplohaplonte es un ciclo reproductor en el que se alternan una generaci├│n diploide (2n cromosomas) con otra haploide
[Ver m├ís](https://es.wikipedia.org/wiki/Ciclo_de_vida_haplodiplonte)
**Fuente:** Wikipedia

## Ciclo de vida empresarial
parte superior ilustra la interacci├│n de ciclos que se producir├ín con el tiempo en el ciclo de vida.[1]ÔÇï Antes de establecer una arquitectura empresarial
[Ver m├ís](https://es.wikipedia.org/wiki/Ciclo_de_vida_empresarial)
**Fuente:** Wikipedia

## Vida de la Virgen
Protoevangelio de Santiago.[12]ÔÇï Los ciclos de la Vida de la Virgen son menos frecuentes en Occidente que en Oriente hasta el periodo g├│tico. El ciclo de la Natividad
[Ver m├ís](https://es.wikipedia.org/wiki/Vida_de_la_Virgen)
**Fuente:** Wikipedia
', 1, 3, 30, 1, '2025-03-21 21:37:20.959-05', '2025-03-21 21:37:20.959-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (38, 'Contaminaci├│n b├ísica', '## Contaminaci├│n del suelo
contaminaci├│n puede afectar a la salud de forma directa y al entrar en contacto con fuentes de agua potable. En lo que concierne a la contaminaci├│n de
[Ver m├ís](https://es.wikipedia.org/wiki/Contaminaci├│n_del_suelo)
**Fuente:** Wikipedia

## Contaminaci├│n ac├║stica
Se llama contaminaci├│n ac├║stica o contaminaci├│n sonora al exceso de sonido que altera las condiciones normales del ambiente en una determinada zona.[1]ÔÇï[2]ÔÇï[3]ÔÇï
[Ver m├ís](https://es.wikipedia.org/wiki/Contaminaci├│n_ac├║stica)
**Fuente:** Wikipedia

## Renta b├ísica universal
La renta b├ísica universal (RBU), ingreso b├ísico universal (IBU), renta b├ísica incondicional (RBI) o ingreso ciudadano es una forma de sistema de seguridad
[Ver m├ís](https://es.wikipedia.org/wiki/Renta_b├ísica_universal)
**Fuente:** Wikipedia

## Control de contaminaci├│n
la existencia, crecimiento y proliferaci├│n de contaminaci├│n en ciertas ├íreas. El control de contaminaci├│n puede referir a la atm├│sfera, superficies, materia
[Ver m├ís](https://es.wikipedia.org/wiki/Control_de_contaminaci├│n)
**Fuente:** Wikipedia

## Contaminaci├│n de aguas subterr├íneas
la naturaleza de los contaminantes. La contaminaci├│n puede ocurrir de fugas desde sistemas de saneamiento b├ísico, aguas residuales, vertederos, estaciones
[Ver m├ís](https://es.wikipedia.org/wiki/Contaminaci├│n_de_aguas_subterr├íneas)
**Fuente:** Wikipedia
', 1, 3, 38, 1, '2025-03-21 21:37:21.005-05', '2025-03-21 21:37:21.005-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (40, 'Civilizaciones precolombinas (Mayas, Aztecas, Incas)', '# Civilizaciones precolombinas (Mayas, Aztecas, Incas)

## Tabla de contenido
* [Introducci├│n](#introduccion)
* [Civilizaci├│n Maya](#civilizacion-maya)
* [Civilizaci├│n Azteca](#civilizacion-azteca)
* [Civilizaci├│n Inca](#civilizacion-inca)
* [Comparaci├│n de las Civilizaciones](#comparacion-de-las-civilizaciones)
* [Legado de las Civilizaciones Precolombinas](#legado-de-las-civilizaciones-precolombinas)
* [Ejemplos Regionales (Colombia) y Universales](#ejemplos-regionales-colombia-y-universales)
* [Recursos Multimedia](#recursos-multimedia)
* [Referencias](#referencias)
* [Recursos Adicionales](#recursos-adicionales)
* [Nota Aclaratoria](#nota-aclaratoria)

## Introducci├│n
Las civilizaciones precolombinas fueron las sociedades que existieron en Am├®rica antes de la llegada de Crist├│bal Col├│n en 1492.  Tres de las m├ís destacadas fueron la Maya, la Azteca y la Inca, cada una con logros significativos en ├íreas como la agricultura, la arquitectura, la astronom├¡a y la organizaci├│n social.

## Civilizaci├│n Maya
### Ubicaci├│n y Periodo
La civilizaci├│n Maya se desarroll├│ en Mesoam├®rica, principalmente en lo que hoy son el sur de M├®xico, Guatemala, Belice, Honduras y El Salvador. Su periodo de mayor esplendor fue entre el 250 d.C. y el 900 d.C. (Periodo Cl├ísico).

### Logros
*   **Escritura Jerogl├¡fica:** Un sistema de escritura complejo que utilizaban para registrar su historia, conocimientos y rituales.
*   **Matem├íticas y Astronom├¡a:**  Desarrollaron un sistema num├®rico vigesimal y calendarios muy precisos, como el calendario solar de 365 d├¡as y el calendario ritual de 260 d├¡as.
*   **Arquitectura:** Construyeron grandes ciudades con pir├ímides, templos, palacios y observatorios astron├│micos, como Tikal y Chich├®n Itz├í.
*   **Agricultura:**  Implementaron t├®cnicas agr├¡colas avanzadas como terrazas y sistemas de riego para maximizar la producci├│n de alimentos.

### Organizaci├│n Social y Pol├¡tica
La sociedad maya estaba jerarquizada, con una ├®lite gobernante (reyes-sacerdotes), nobles, guerreros, comerciantes, artesanos y campesinos. Las ciudades-estado eran independientes y gobernadas por un rey.

## Civilizaci├│n Azteca
### Ubicaci├│n y Periodo
La civilizaci├│n Azteca se ubic├│ en el centro de M├®xico, en el valle de M├®xico, entre los siglos XIV y XVI.

### Logros
*   **Tenochtitl├ín:**  Fundaron la ciudad de Tenochtitl├ín (actual Ciudad de M├®xico) sobre un lago, con un sistema de chinampas (jardines flotantes) para la agricultura.
*   **Imperio Militar:** Construyeron un poderoso imperio mediante la conquista y el control de otros pueblos.
*   **Religi├│n y Sacrificios:**  Su religi├│n era polite├¡sta y realizaban sacrificios humanos para honrar a sus dioses y mantener el equilibrio c├│smico.
*   **Calendario y Escritura:** Adoptaron elementos del calendario y la escritura de otras culturas mesoamericanas.

### Organizaci├│n Social y Pol├¡tica
La sociedad azteca estaba dividida en clases sociales: nobles, sacerdotes, guerreros, comerciantes, artesanos y campesinos. El emperador (Tlatoani) era el l├¡der supremo, tanto pol├¡tico como religioso.

## Civilizaci├│n Inca
### Ubicaci├│n y Periodo
La civilizaci├│n Inca se desarroll├│ en la regi├│n de los Andes, en Am├®rica del Sur, entre los siglos XV y XVI. Su imperio se extendi├│ por lo que hoy son Per├║, Ecuador, Bolivia, Chile y Argentina.

### Logros
*   **Caminos y Puentes:**  Construyeron una extensa red de caminos y puentes (Qhapaq ├æan) que conectaba todo el imperio.
*   **Agricultura en Terrazas:**  Implementaron terrazas de cultivo en las laderas de las monta├▒as para aumentar la producci├│n agr├¡cola.
*   **Arquitectura:**  Edificaron grandes ciudades y centros ceremoniales como Machu Picchu, utilizando t├®cnicas de construcci├│n avanzadas con piedras encajadas sin argamasa.
*   **Sistema de Contabilidad (Quipu):** Utilizaban un sistema de cuerdas con nudos (quipus) para registrar datos y llevar la contabilidad del imperio.
### Organizaci├│n Social y Pol├¡tica
La sociedad inca estaba organizada de forma jer├írquica, con el emperador (Sapa Inca) como l├¡der supremo, seguido por la nobleza, los sacerdotes, los guerreros, los artesanos y los campesinos. El imperio se divid├¡a en provincias, cada una administrada por un gobernador.

## Comparaci├│n de las Civilizaciones
| Caracter├¡stica | Maya | Azteca | Inca |
| ----------- | ----------- | ----------- | ----------- |
| Ubicaci├│n | Mesoam├®rica | Valle de M├®xico | Andes |
| Organizaci├│n pol├¡tica | Ciudades-estado | Imperio | Imperio |
| Econom├¡a | Agricultura, comercio | Agricultura, tributos | Agricultura, trabajo comunitario |
| Religi├│n | Polite├¡sta | Polite├¡sta | Polite├¡sta |
| Logros | Escritura, calendario, astronom├¡a | Tenochtitl├ín, imperio militar | Caminos, terrazas, Machu Picchu |

## Legado de las Civilizaciones Precolombinas
Las civilizaciones precolombinas dejaron un legado cultural invaluable en Am├®rica Latina, que incluye:

*   Conocimientos agr├¡colas y t├®cnicas de cultivo.
*   Arquitectura y urbanismo avanzados.
*   Desarrollo de sistemas de escritura y calendarios.
*   Riqueza art├¡stica y cultural.

## Ejemplos Regionales (Colombia) y Universales
*   **Colombia:** En Colombia, culturas como la Tayrona y la Muisca tambi├®n desarrollaron sistemas agr├¡colas y orfebrer├¡a avanzada.
*   **Universal:** El concepto de agricultura en terrazas, desarrollado por los Incas, es similar a los sistemas agr├¡colas utilizados en otras partes del mundo, como en Asia.

## Recursos Multimedia
*   **Video Educativo:** Las CULTURAS PRECOLOMBINAS de Am├®rica: Aztecas, Mayas e Incas­ƒæ¿ÔÇì­ƒÅ½ [https://www.youtube.com/watch?v=gN61F17egDU](https://www.youtube.com/watch?v=gN61F17egDU)
*   **Art├¡culo de Wikipedia:** Civilizaci├│n Maya [https://es.wikipedia.org/wiki/Civilizaci%C3%B3n_maya](https://es.wikipedia.org/wiki/Civilizaci%C3%B3n_maya)
*   **Art├¡culo Acad├®mico:**  "Impactos de andenes y terrazas en el agua y los suelos: ┬┐Qu├® sabemos?" [https://www.researchgate.net/publication/349040786_Impactos_de_andenes_y_terrazas_en_el_agua_y_los_suelos_Que_sabemos](https://www.researchgate.net/publication/349040786_Impactos_de_andenes_y_terrazas_en_el_agua_y_los_suelos_Que_sabemos)
*   **Imagen:** Ruinas de Machu Picchu ![Vista panor├ímica de las ruinas de Machu Picchu en Per├║](https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Machu_Picchu%2C_Peru.jpg/1280px-Machu_Picchu%2C_Peru.jpg "Vista panor├ímica de las ruinas de Machu Picchu en Per├║")Vista panor├ímica de las ruinas de Machu Picchu en Per├║

## Referencias
1.  Diamond, J. (2005). *Collapse: How Societies Choose to Fail or Succeed*. Viking.
2.  Mann, C. C. (2005). *1491: New Revelations of the Americas Before Columbus*. Knopf.
3.  Coe, M. D. (2011). *The Maya*. Thames & Hudson.
4.  Townsend, R. F. (2009). *The Aztecs*. Thames & Hudson.
5.  Hemming, J. (1993). *The Conquest of the Incas*. Pan Macmillan.
6.  "Los Mayas" - National Geographic en Espa├▒ol. nationalgeographicla.com
7.  "Aztecas" - Historia National Geographic. historicanationalgeographic.com
8.  "Los Incas" - Enciclopedia de Historia del Mundo. worldhistory.org

## Recursos Adicionales
*   National Geographic: Civilizaciones Antiguas.
*   Khan Academy: Historia del Mundo.
*   BBC History: Ancient Civilizations.

## Nota Aclaratoria
Este contenido ha sido creado en equipo entre humanos y la IA de Perplexity para facilitarte el acceso a la informaci├│n. Sin embargo, puede contener errores. Te invitamos a revisar las fuentes adicionales de informaci├│n que incluimos para una comprensi├│n m├ís completa y precisa.', 1, 4, 40, 1, '2025-03-21 21:37:21.017-05', '2025-03-24 12:18:25.639441-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (46, 'Conceptos b├ísicos de democracia', '# Conceptos b├ísicos de democracia

## Tabla de contenido
* [Introducci├│n](#introduccion)
* [┬┐Qu├® es la democracia?](#que-es-la-democracia)
* [Principios de la democracia](#principios-de-la-democracia)
    * [Soberan├¡a Popular](#soberania-popular)
    * [Participaci├│n Ciudadana](#participacion-ciudadana)
    * [Estado de Derecho](#estado-de-derecho)
    * [Separaci├│n de Poderes](#separacion-de-poderes)
    * [Respeto a los Derechos Humanos](#respeto-a-los-derechos-humanos)
    * [Pluralismo Pol├¡tico](#pluralismo-politico)
* [Tipos de democracia](#tipos-de-democracia)
    * [Democracia Directa](#democracia-directa)
    * [Democracia Representativa](#democracia-representativa)
    * [Democracia Participativa](#democracia-participativa)
* [Importancia de la democracia](#importancia-de-la-democracia)
* [Ejemplos Regionales (Colombia) y Universales](#ejemplos-regionales-colombia-y-universales)
* [Recursos Multimedia](#recursos-multimedia)
* [Referencias](#referencias)
* [Recursos Adicionales](#recursos-adicionales)
* [Nota Aclaratoria](#nota-aclaratoria)

## Introducci├│n
La democracia es una forma de gobierno en la que el poder reside en el pueblo. Es un sistema que busca garantizar la libertad, la igualdad y la justicia para todos los ciudadanos. Entender los conceptos b├ísicos de la democracia es fundamental para participar activamente en la sociedad y construir un mundo mejor.

## ┬┐Qu├® es la democracia?
La palabra democracia proviene del griego "demos" (pueblo) y "kratos" (poder o gobierno), lo que significa "gobierno del pueblo". En una democracia, los ciudadanos tienen el derecho y la responsabilidad de participar en la toma de decisiones que afectan sus vidas.

## Principios de la democracia
La democracia se basa en una serie de principios fundamentales que garantizan su funcionamiento y protegen los derechos de los ciudadanos.

### Soberan├¡a Popular
*   El poder reside en el pueblo, que lo ejerce a trav├®s de sus representantes o directamente.
*   El gobierno debe actuar en nombre del pueblo y para el beneficio de todos los ciudadanos.

### Participaci├│n Ciudadana
*   Los ciudadanos tienen el derecho y la oportunidad de participar en la toma de decisiones a trav├®s del voto, la protesta, la participaci├│n en organizaciones de la sociedad civil y otros medios.
*   La participaci├│n ciudadana es esencial para garantizar que el gobierno responda a las necesidades y demandas del pueblo.

### Estado de Derecho
*   Todos los ciudadanos y el gobierno est├ín sujetos a la ley.
*   La ley debe ser justa, imparcial y aplicada de manera igualitaria.
*   El estado de derecho garantiza que nadie est├® por encima de la ley y protege los derechos de los ciudadanos.

### Separaci├│n de Poderes
*   El poder del gobierno se divide en diferentes ramas (ejecutivo, legislativo y judicial) para evitar la concentraci├│n de poder y proteger las libertades individuales.
*   Cada rama tiene sus propias funciones y responsabilidades, y se controlan mutuamente para evitar abusos de poder.

### Respeto a los Derechos Humanos
*   Todos los ciudadanos tienen derechos fundamentales que deben ser protegidos por el gobierno, como el derecho a la vida, la libertad, la igualdad, la justicia, la libertad de expresi├│n, la libertad de asociaci├│n y el derecho a un juicio justo.
*   El respeto a los derechos humanos es esencial para garantizar la dignidad y el bienestar de todos los ciudadanos.

### Pluralismo Pol├¡tico
*   Existen diferentes partidos pol├¡ticos y grupos de inter├®s que compiten por el poder y representan diferentes ideas y perspectivas.
*   El pluralismo pol├¡tico permite que los ciudadanos tengan una variedad de opciones y que el gobierno refleje la diversidad de la sociedad.

## Tipos de democracia
Existen diferentes tipos de democracia, cada uno con sus propias caracter├¡sticas y mecanismos de participaci├│n ciudadana.

### Democracia Directa
*   Los ciudadanos participan directamente en la toma de decisiones, votando en referendos y plebiscitos.
*   Este tipo de democracia es m├ís com├║n en comunidades peque├▒as o en decisiones espec├¡ficas.

### Democracia Representativa
*   Los ciudadanos eligen representantes para que tomen decisiones en su nombre en el gobierno.
*   Este tipo de democracia es el m├ís com├║n en los pa├¡ses modernos.

### Democracia Participativa
*   Combina elementos de la democracia directa y la democracia representativa, permitiendo que los ciudadanos participen en la toma de decisiones a trav├®s de mecanismos como presupuestos participativos, consejos ciudadanos y audiencias p├║blicas.

## Importancia de la democracia
La democracia es importante porque:
*   Protege los derechos y libertades de los ciudadanos.
*   Promueve la igualdad y la justicia.
*   Garantiza que el gobierno responda a las necesidades y demandas del pueblo.
*   Fomenta la participaci├│n ciudadana y el debate p├║blico.
*   Contribuye a la estabilidad pol├¡tica y el desarrollo econ├│mico.

## Ejemplos Regionales (Colombia) y Universales
*   **Colombia:** Colombia es una rep├║blica democr├ítica representativa, donde los ciudadanos eligen a sus representantes en el Congreso, la Presidencia y otros cargos p├║blicos. La Constituci├│n de Colombia garantiza una serie de derechos y libertades a los ciudadanos.
*   **Universal:** Ejemplos de democracias representativas incluyen Estados Unidos, Canad├í, Alemania, Francia y muchos otros pa├¡ses. Suiza es un ejemplo de democracia semidirecta, donde los ciudadanos pueden votar en referendos sobre leyes y pol├¡ticas.

## Recursos Multimedia
*   **Video Educativo:** ┬┐Qu├® es la democracia? [https://www.youtube.com/watch?v=dbHRDG49XUg](https://www.youtube.com/watch?v=dbHRDG49XUg)
*   **Art├¡culo de Wikipedia:** Democracia [https://es.wikipedia.org/wiki/Democracia](https://es.wikipedia.org/wiki/Democracia)
*   **Art├¡culo Acad├®mico:** "Participaci├│n ciudadana y gobernanza democr├ítica en Am├®rica Latina" (Buscar en Google Acad├®mico o Scielo)
*   **Imagen:** ![Acr├│polis de Atenas Mark Cartwright (CC BY-NC-SA)](https://www.worldhistory.org/uploads/images/430.jpg) Acr├│polis de Atenas Mark Cartwright (CC BY-NC-SA)


## Referencias
1.  Dahl, R. A. (1971). *Polyarchy: Participation and Opposition*. Yale University Press.
2.  Linz, J. J., & Stepan, A. (1996). *Problems of Democratic Transition and Consolidation: Southern Europe, South America, and Post-Communist Europe*. Johns Hopkins University Press.
3.  "Democracia" - Naciones Unidas. un.org
4.  "┬┐Qu├® es la Democracia?" - Instituto Nacional Dem├│crata (NDI). ndi.org

## Recursos Adicionales
*   Instituto Nacional Dem├│crata (NDI): Promueve la democracia en todo el mundo.
*   Naciones Unidas: Informaci├│n sobre la democracia y los derechos humanos.
*   Freedom House: Eval├║a la libertad pol├¡tica y los derechos civiles en los pa├¡ses del mundo.

## Nota Aclaratoria
Este contenido ha sido creado en equipo entre humanos y la IA de Perplexity para facilitarte el acceso a la informaci├│n. Sin embargo, puede contener errores. Te invitamos a revisar las fuentes adicionales de informaci├│n que incluimos para una comprensi├│n m├ís completa y precisa.', 1, 4, 46, 1, '2025-03-21 21:37:21.049-05', '2025-03-24 15:48:10.215642-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (51, 'N├║meros, colores y objetos cotidianos', '## Psicolog├¡a del color
observaciones acerca de los colores. M├ís tarde Leonardo da Vinci clasific├│ como colores b├ísicos al amarillo, verde, azul y rojo de acuerdo a aquellas categor├¡as
[Ver m├ís](https://es.wikipedia.org/wiki/Psicolog├¡a_del_color)
**Fuente:** Wikipedia

## Vida cotidiana de la Antigua Grecia
entretenimiento y las creencias religiosas. Estos detalles se conocen a trav├®s de diversas fuentes, como hallazgos arqueol├│gicos de objetos de uso cotidiano, descripciones
[Ver m├ís](https://es.wikipedia.org/wiki/Vida_cotidiana_de_la_Antigua_Grecia)
**Fuente:** Wikipedia

## Tono (color)
correlaci├│n entre longitud de onda y tono, tal como aparece en el arco├¡ris. Estos colores forman parte del grupo de colores espectrales, los relacionados con
[Ver m├ís](https://es.wikipedia.org/wiki/Tono_(color))
**Fuente:** Wikipedia

## Bodeg├│n
van Eyck y otros artistas del norte de Europa permiti├│ pintar objetos cotidianos en un estilo hiperrealista, debido a su secado m├ís lento, y la posibilidad
[Ver m├ís](https://es.wikipedia.org/wiki/Bodeg├│n)
**Fuente:** Wikipedia

## Saturaci├│n (color)
trata de una propiedad de los colores como los colores primarios. Para otras acepciones, v├®ase saturaci├│n En la teor├¡a del color, el colorido, el croma o la
[Ver m├ís](https://es.wikipedia.org/wiki/Saturaci├│n_(color))
**Fuente:** Wikipedia
', 1, 5, 51, 1, '2025-03-21 21:37:21.077-05', '2025-03-21 21:37:21.077-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (54, 'Art├¡culos y demostrativos', '## Demostrativo
observar que la relaci├│n de art├¡culos y pronombres con los demostrativos es s├│lo hist├│rica (es decir, con los demostrativos del lat├¡n), puesto que son
[Ver m├ís](https://es.wikipedia.org/wiki/Demostrativo)
**Fuente:** Wikipedia

## Determinante (ling├╝├¡stica)
(SN). En espa├▒ol, la clase de determinantes incluye el art├¡culo, los demostrativos, los posesivos y los cuantificadores (numerales e indefinidos), as├¡ como
[Ver m├ís](https://es.wikipedia.org/wiki/Determinante_(ling├╝├¡stica))
**Fuente:** Wikipedia

## Art├¡culo determinado
lenguas rom├ínicas como en lenguas germ├ínicas los art├¡culos definidos surgieron a partir de demostrativos, que se hicieron obligatorios en ciertas construcciones
[Ver m├ís](https://es.wikipedia.org/wiki/Art├¡culo_determinado)
**Fuente:** Wikipedia

## G├®nero demostrativo
y frente al g├®nero deliberativo y el g├®nero judicial, el g├®nero demostrativo o epid├¡ctico es el de los discursos que se ocupan de hechos presentes y se
[Ver m├ís](https://es.wikipedia.org/wiki/G├®nero_demostrativo)
**Fuente:** Wikipedia

## Art├¡culos alemanes
Los art├¡culos alemanes son similares a los art├¡culos en espa├▒ol, sean definidos o indefinidos. Sin embargo, estos siempre se declinan de diferente manera
[Ver m├ís](https://es.wikipedia.org/wiki/Art├¡culos_alemanes)
**Fuente:** Wikipedia
', 1, 5, 54, 1, '2025-03-21 21:37:21.094-05', '2025-03-21 21:37:21.094-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (3, 'Res├║menes y s├¡ntesis de textos', '## S├¡ntesis literaria
Una s├¡ntesis, en literatura, es un escrito donde se anotan las ideas principales de un texto. A diferencia del resumen, este presenta las ideas generales
[Ver m├ís](https://es.wikipedia.org/wiki/S├¡ntesis_literaria)
**Fuente:** Wikipedia

## Resumen
que aparecen, y la redacci├│n debe adoptar un tono objetivo, independientemente del punto de vista del autor del texto base. Los res├║menes pueden elaborarse
[Ver m├ís](https://es.wikipedia.org/wiki/Resumen)
**Fuente:** Wikipedia

## Resumen documental
autores y editores a elaborar res├║menes o abstract ya que describe los componentes de un resumen, adem├ís de los estilos m├ís apropiados. Los res├║menes pueden
[Ver m├ís](https://es.wikipedia.org/wiki/Resumen_documental)
**Fuente:** Wikipedia

## La doctrina secreta
Secreta, s├¡ntesis de ciencia, religi├│n y filosof├¡a (t├¡tulo original: The Secret Doctrine, The Synthesis of Science, Religion, and Philosophy) es una de las
[Ver m├ís](https://es.wikipedia.org/wiki/La_doctrina_secreta)
**Fuente:** Wikipedia

## Texto expositivo
Anexo:Tipos de texto Carta Discurso cient├¡fico P├írrafo S├¡ntesis literaria Texto argumentativo Texto informativo Texto instructivo Rubio, Marta Tornero (11 de junio
[Ver m├ís](https://es.wikipedia.org/wiki/Texto_expositivo)
**Fuente:** Wikipedia
', 1, 1, 3, 1, '2025-03-21 21:37:20.808-05', '2025-03-21 21:37:20.808-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (57, 'Descripci├│n b├ísica de objetos', '## L├│gica de descripci├│n
lenguaje de las l├│gicas de descripci├│n son: Nombres de concepto (concept name): asignan un nombre a un grupo de objetos. Nombres de rol (role name): asigna
[Ver m├ís](https://es.wikipedia.org/wiki/L├│gica_de_descripci├│n)
**Fuente:** Wikipedia

## Tiny BASIC
del objeto a su izquierda - excepto para el primer asterisco en la definici├│n de &quot;term&quot;, que es el operador de la multiplicaci├│n; objetos del grupo de par├®ntesis;
[Ver m├ís](https://es.wikipedia.org/wiki/Tiny_BASIC)
**Fuente:** Wikipedia

## Geometric Description Language
Lenguaje de Descripci├│n Geom├®trica) o GDL es un lenguaje de programaci├│n creado por la empresa h├║ngara Graphisoft. El mismo permite crear objetos parametricos
[Ver m├ís](https://es.wikipedia.org/wiki/Geometric_Description_Language)
**Fuente:** Wikipedia

## ISAD(G)
informaci├│n b├ísica de la unidad de descripci├│n. Los campos obligatorios de la norma son: c├│digo de referencia, t├¡tulo, fechas, nivel de descripci├│n, volumen
[Ver m├ís](https://es.wikipedia.org/wiki/ISAD(G))
**Fuente:** Wikipedia

## Reglas de codificaci├│n b├ísicas
datos ASN.1. Cada elemento de datos est├í codificado por un identificador de tipos, una descripci├│n longitud, los elementos de datos actuales, y donde sea
[Ver m├ís](https://es.wikipedia.org/wiki/Reglas_de_codificaci├│n_b├ísicas)
**Fuente:** Wikipedia
', 1, 5, 57, 1, '2025-03-21 21:37:21.109-05', '2025-03-21 21:37:21.109-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (62, 'Fundamentos de deportes colectivos', '## Psicolog├¡a del deporte
personalidad, a la motivaci├│n, a las tasas de ansiedad y de agresividad, a las din├ímicas de grupo en los deportes colectivos, porque el atleta experimenta situaciones
[Ver m├ís](https://es.wikipedia.org/wiki/Psicolog├¡a_del_deporte)
**Fuente:** Wikipedia

## Preparamiento deportivo
metodolog├¡a m├ís eficaz para aplicar los fundamentos de la psicolog├¡a del deporte, seg├║n psic├│logos deportivos de reconocido prestigio como Dan Abrahams
[Ver m├ís](https://es.wikipedia.org/wiki/Preparamiento_deportivo)
**Fuente:** Wikipedia

## Diversidad sexual en Nicaragua
ONGs y colectivos feministas. Tambi├®n trabajan en la prevenci├│n del VIH con j├│venes.[22]ÔÇï Transmen Nicaragua Transmen Nicaragua es un colectivo conformado
[Ver m├ís](https://es.wikipedia.org/wiki/Diversidad_sexual_en_Nicaragua)
**Fuente:** Wikipedia

## Minibasket
esquemas motores de base en el ni├▒o y ense├▒ar los fundamentos del baloncesto. Su pr├íctica abarca las edades comprendidas en la etapa de la escuela primaria
[Ver m├ís](https://es.wikipedia.org/wiki/Minibasket)
**Fuente:** Wikipedia

## Escuela T├®cnica Superior de Arquitectura de Madrid
responsables de distintas ├íreas. La Junta de la Escuela es el organismo formado por profesores, alumnos, colectivos de la comunidad acad├®mica y personal de administraci├│n
[Ver m├ís](https://es.wikipedia.org/wiki/Escuela_T├®cnica_Superior_de_Arquitectura_de_Madrid)
**Fuente:** Wikipedia
', 1, 6, 62, 1, '2025-03-21 21:37:21.137-05', '2025-03-21 21:37:21.137-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (4, 'Textos narrativos simples', '## Narraci├│n
si el personaje resuelve finalmente dicho problema. No todos los textos narrativos se ajustan a esta estructura, sino que en algunos casos no existe
[Ver m├ís](https://es.wikipedia.org/wiki/Narraci├│n)
**Fuente:** Wikipedia

## Texto
todo texto es h├¡brido), es como sigue: textos narrativos textos descriptivos textos argumentativos textos conmutativos textos explicativos textos expositivos
[Ver m├ís](https://es.wikipedia.org/wiki/Texto)
**Fuente:** Wikipedia

## Pret├®rito perfecto simple
perfecto simple:[4]ÔÇï[5]ÔÇï El tipo de documento es importante, porque existe evidencia estad├¡stica[┬┐cu├íl?] de que los textos de car├ícter m├ís narrativo tienen
[Ver m├ís](https://es.wikipedia.org/wiki/Pret├®rito_perfecto_simple)
**Fuente:** Wikipedia

## Ling├╝├¡stica del texto
hablantes nativos, sino tambi├®n de las relaciones entre oraciones, o sea de los textos enteros subyacentes a estas emisiones. Tambi├®n en la pragm├ítica y en la
[Ver m├ís](https://es.wikipedia.org/wiki/Ling├╝├¡stica_del_texto)
**Fuente:** Wikipedia

## Mensaje
Intenci├│n comunicativa est├®tica: textos literarios: textos l├¡ricos, textos narrativos, textos dram├íticos, etc.[1]ÔÇï Mensajero Arroyo Cant├│n, Carlos; Berlato
[Ver m├ís](https://es.wikipedia.org/wiki/Mensaje)
**Fuente:** Wikipedia
', 1, 1, 4, 1, '2025-03-21 21:37:20.814-05', '2025-03-21 21:37:20.814-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (9, 'Cuentos cortos', '## Cuento infantil
mexicanos Cuentos infantiles con valores Cuentos infantiles cortos Cuentos infantiles (leer y publicar cuentos) Cuentos, f├íbulas y obras infantiles Archivado
[Ver m├ís](https://es.wikipedia.org/wiki/Cuento_infantil)
**Fuente:** Wikipedia

## Cuento
recopil├│). Tiene cuatro subdivisiones: los cuentos de hadas, los cuentos de animales, las f├íbulas y los cuentos de costumbres. El mito y la leyenda son tambi├®n
[Ver m├ís](https://es.wikipedia.org/wiki/Cuento)
**Fuente:** Wikipedia

## Cuentos completos (Asimov)
relatos cortos: Asimov, Isaac (2019). Cuentos completos 1. Penguin Random House Grupo Editorial. ISBN 978-84-663-4839-3 Asimov, Isaac (2009). Cuentos completos
[Ver m├ís](https://es.wikipedia.org/wiki/Cuentos_completos_(Asimov))
**Fuente:** Wikipedia

## Obras completas (y otros cuentos)
completas (y otros cuentos)[1]ÔÇï (1959) es el t├¡tulo de un libro de relatos del escritor Augusto Monterroso, una colecci├│n de cuentos cortos y microrrelatos
[Ver m├ís](https://es.wikipedia.org/wiki/Obras_completas_(y_otros_cuentos))
**Fuente:** Wikipedia

## Cuentos de Don Ver├¡dico
uruguayo Julio C├®sar Castro, publicado en el a├▒o 1972. Es un conjunto de cuentos cortos que tiene como tem├ítica lo rural a trav├®s de las experiencias vividas
[Ver m├ís](https://es.wikipedia.org/wiki/Cuentos_de_Don_Ver├¡dico)
**Fuente:** Wikipedia
', 1, 1, 9, 1, '2025-03-21 21:37:20.842-05', '2025-03-21 21:37:20.842-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (10, 'Categor├¡as gramaticales (sustantivo, adjetivo, verbo)', '## Categor├¡a gramatical
oraci├│n: Sustantivo (o nombre) Adjetivo Art├¡culo Pronombre Verbo Adverbio Interjecci├│n Preposici├│n Conjunci├│n Las cinco primeras (sustantivo, adjetivo, art├¡culo
[Ver m├ís](https://es.wikipedia.org/wiki/Categor├¡a_gramatical)
**Fuente:** Wikipedia

## Sustantivo
Sint├ícticamente los sustantivos funcionan como n├║cleos de sintagma nominal, es decir, como argumentos del verbo, o a veces complementos de otro sustantivo. Modernamente
[Ver m├ís](https://es.wikipedia.org/wiki/Sustantivo)
**Fuente:** Wikipedia

## N├║mero gramatical
del lexema afectado (es decir, si se trata de un sustantivo, un complemento, un adjetivo, un verbo, etc.) y del idioma. En los ejemplos que siguen, el
[Ver m├ís](https://es.wikipedia.org/wiki/N├║mero_gramatical)
**Fuente:** Wikipedia

## Gram├ítica del maya
Verbo + sustantivo: pa╩╝ quebrar + p╩╝├║ul c├íntaro ÔåÆ pa╩╝ap╩╝├║ul pi├▒ata El adjetivo es la categor├¡a gramatical que designa las cualidades del sustantivo.
[Ver m├ís](https://es.wikipedia.org/wiki/Gram├ítica_del_maya)
**Fuente:** Wikipedia

## G├®nero gramatical
g├®nero el sustantivo, el adjetivo, el art├¡culo y algunos pronombres. Sirve para establecer concordancia entre un adjetivo y el sustantivo al que califica
[Ver m├ís](https://es.wikipedia.org/wiki/G├®nero_gramatical)
**Fuente:** Wikipedia
', 1, 1, 10, 1, '2025-03-21 21:37:20.847-05', '2025-03-21 21:37:20.847-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (19, 'Simetr├¡a y congruencia', '## Simetr├¡a central
Ci, S2 y 1├ù. El tipo del grupo es uno de los tres tipos de los grupos de simetr├¡a en 3D sin ninguna simetr├¡a rotacional pura (v├®ase simetr├¡as c├¡clicas
[Ver m├ís](https://es.wikipedia.org/wiki/Simetr├¡a_central)
**Fuente:** Wikipedia

## Relaci├│n de congruencia
En ├ílgebra abstracta, una relaci├│n de congruencia (o simplemente congruencia) es una relaci├│n de equivalencia definida sobre una estructura algebraica
[Ver m├ís](https://es.wikipedia.org/wiki/Relaci├│n_de_congruencia)
**Fuente:** Wikipedia

## Relaci├│n sim├®trica
que son sim├®tricas pero no antisim├®tricas (como la relaci├│n de congruencia m├│dulo n), y otras que son antisim├®tricas pero no sim├®tricas (como la relaci├│n
[Ver m├ís](https://es.wikipedia.org/wiki/Relaci├│n_sim├®trica)
**Fuente:** Wikipedia

## Aritm├®tica modular
Ecuaci├│n Lineal de Congruencia deben ser n├║meros enteros. ┬┐Existe alg├║n criterio para determinar cuando una Ecuaci├│n Lineal de Congruencia tiene soluciones
[Ver m├ís](https://es.wikipedia.org/wiki/Aritm├®tica_modular)
**Fuente:** Wikipedia

## Grupo modular
importantes del grupo modular ╬ô, llamados subgrupos de congruencia, se dan imponiendo una relaci├│n de congruencia en las matrices asociadas. Existe un homomorfismo
[Ver m├ís](https://es.wikipedia.org/wiki/Grupo_modular)
**Fuente:** Wikipedia
', 1, 2, 19, 1, '2025-03-21 21:37:20.896-05', '2025-03-21 21:37:20.896-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (20, 'Sistema m├®trico decimal', '## Sistema m├®trico decimal
El sistema m├®trico decimal[1]ÔÇï es un sistema de medida que tiene por unidades b├ísicas el metro y el kilogramo, en el cual los m├║ltiplos o subm├║ltiplos
[Ver m├ís](https://es.wikipedia.org/wiki/Sistema_m├®trico_decimal)
**Fuente:** Wikipedia

## Decimal
decimal, escritura de n├║meros reales como serie de potencias de 10; Separador decimal, en la escritura de un n├║mero decimal; Sistema m├®trico decimal,
[Ver m├ís](https://es.wikipedia.org/wiki/Decimal)
**Fuente:** Wikipedia

## Sistema anglosaj├│n de unidades
El sistema anglosaj├│n de unidades es un conjunto de unidades de medida diferentes a las del sistema m├®trico decimal, que se utilizan actualmente como medida
[Ver m├ís](https://es.wikipedia.org/wiki/Sistema_anglosaj├│n_de_unidades)
**Fuente:** Wikipedia

## Sistema decimal (desambiguaci├│n)
┬½parte fraccionaria┬╗. Sistema m├®trico decimal, un sistema de unidades. Sistema de Clasificaci├│n Decimal de Dewey es un sistema de clasificaci├│n de bibliotecas
[Ver m├ís](https://es.wikipedia.org/wiki/Sistema_decimal_(desambiguaci├│n))
**Fuente:** Wikipedia

## Sistema de unidades
de las dichas. Sistema m├®trico decimal: primer sistema unificado de medidas. Sus unidades b├ísicas son: el metro y el kilogramo. Sistema Cegesimal de Unidades
[Ver m├ís](https://es.wikipedia.org/wiki/Sistema_de_unidades)
**Fuente:** Wikipedia
', 1, 2, 20, 1, '2025-03-21 21:37:20.902-05', '2025-03-21 21:37:20.902-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (25, 'Expresiones algebraicas simples', '## Fenomenolog├¡a (ciencia)
deriva directamente de la misma. Por ejemplo, pueden usarse expresiones algebraicas simples para modelar observaciones o resultados experimentales acerca
[Ver m├ís](https://es.wikipedia.org/wiki/Fenomenolog├¡a_(ciencia))
**Fuente:** Wikipedia

## Fracci├│n algebraica
fracci├│n algebraica es un tipo de fracci├│n cuyo numerador y cuyo denominador son expresiones algebraicas. Dos ejemplos de fracciones algebraicas son 3 x
[Ver m├ís](https://es.wikipedia.org/wiki/Fracci├│n_algebraica)
**Fuente:** Wikipedia

## Funci├│n algebraica
en un ├ímbito m├ís general sobre variedades algebraicas, y teor├¡a de haces. Entre las funciones algebraicas se encuentran las funciones racionales y las
[Ver m├ís](https://es.wikipedia.org/wiki/Funci├│n_algebraica)
**Fuente:** Wikipedia

## Sistema algebraico computacional
simb├│licas: Simplificaci├│n de una expresi├│n a la forma m├ís simple o a una forma est├índar. Cambio en la forma de las expresiones: expansi├│n de productos y potencias
[Ver m├ís](https://es.wikipedia.org/wiki/Sistema_algebraico_computacional)
**Fuente:** Wikipedia

## F├│rmula (expresi├│n)
igualdad matem├ítica.[3]ÔÇï Las expresiones matem├íticas constan de un conjunto de s├¡mbolos del alfabeto, que en una expresi├│n matem├ítica incluyen: Constantes
[Ver m├ís](https://es.wikipedia.org/wiki/F├│rmula_(expresi├│n))
**Fuente:** Wikipedia
', 1, 2, 25, 1, '2025-03-21 21:37:20.932-05', '2025-03-21 21:37:20.932-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (29, 'Niveles de organizaci├│n biol├│gica', '## Organizaci├│n biol├│gica
La organizaci├│n biol├│gica o jerarqu├¡a de la vida, es la jerarqu├¡a de estructuras y sistemas biol├│gicos complejos que definen la vida mediante una aproximaci├│n
[Ver m├ís](https://es.wikipedia.org/wiki/Organizaci├│n_biol├│gica)
**Fuente:** Wikipedia

## Nivel de bioseguridad
realizada en los laboratorios de guerra biol├│gica, la conferencia se limit├│ a establecer los niveles de bioseguridad. A partir de 1957, estas conferencias
[Ver m├ís](https://es.wikipedia.org/wiki/Nivel_de_bioseguridad)
**Fuente:** Wikipedia

## Riesgo biol├│gico
enfermedades dentro de varios niveles de riesgo, 1 que es riesgo m├¡nimo y nivel 4 que es riesgo extremo. En Espa├▒a estos niveles se establecen en el Real
[Ver m├ís](https://es.wikipedia.org/wiki/Riesgo_biol├│gico)
**Fuente:** Wikipedia

## Estaci├│n Biol├│gica de Do├▒ana
La Estaci├│n Biol├│gica de Do├▒ana es un instituto p├║blico de investigaci├│n dependiente del Consejo Superior de Investigaciones Cient├¡ficas (CSIC), dentro
[Ver m├ís](https://es.wikipedia.org/wiki/Estaci├│n_Biol├│gica_de_Do├▒ana)
**Fuente:** Wikipedia

## Convenio sobre la Diversidad Biol├│gica
Diversidad Biol├│gica (CDB) entr├│ en vigor el 29 de diciembre de 1993 y tiene como objetivos: ┬½la conservaci├│n de la biodiversidad, el uso sostenible de sus componentes
[Ver m├ís](https://es.wikipedia.org/wiki/Convenio_sobre_la_Diversidad_Biol├│gica)
**Fuente:** Wikipedia
', 1, 3, 29, 1, '2025-03-21 21:37:20.954-05', '2025-03-21 21:37:20.954-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (31, 'Medici├│n y magnitudes f├¡sicas', '## Magnitud f├¡sica
resultado de una medici├│n o una relaci├│n de medidas. Las magnitudes f├¡sicas se miden usando un patr├│n que tenga bien definida esa magnitud, y tomando como
[Ver m├ís](https://es.wikipedia.org/wiki/Magnitud_f├¡sica)
**Fuente:** Wikipedia

## Medici├│n
medici├│n es un proceso b├ísico de la ciencia que se basa en comparar una unidad de medida seleccionada con el objeto o fen├│meno cuya magnitud f├¡sica se
[Ver m├ís](https://es.wikipedia.org/wiki/Medici├│n)
**Fuente:** Wikipedia

## Instrumento de medici├│n
de medici├│n es una herramienta que se usa para medir una magnitud f├¡sica. La medici├│n es el proceso que permite obtener y comparar cantidades f├¡sicas de
[Ver m├ís](https://es.wikipedia.org/wiki/Instrumento_de_medici├│n)
**Fuente:** Wikipedia

## Error de medici├│n
El error de medici├│n se define como la diferencia entre el valor medido y el &quot;valor verdadero&quot;. Los errores de medici├│n afectan a cualquier instrumento
[Ver m├ís](https://es.wikipedia.org/wiki/Error_de_medici├│n)
**Fuente:** Wikipedia

## Magnitud (matem├ítica)
resultado de una medici├│n; en cambio las magnitudes matem├íticas admiten definiciones abstractas, mientras que las magnitudes f├¡sicas se miden con instrumentos
[Ver m├ís](https://es.wikipedia.org/wiki/Magnitud_(matem├ítica))
**Fuente:** Wikipedia
', 1, 3, 31, 1, '2025-03-21 21:37:20.964-05', '2025-03-21 21:37:20.964-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (32, 'Conceptos de fuerza y movimiento', '## Fuerza
moderna definici├│n de fuerza, aunque tambi├®n us├│ el t├®rmino latino vis impressa (&#039;fuerza impresa&#039;) y vis motrix para otros conceptos diferentes. Adem├ís
[Ver m├ís](https://es.wikipedia.org/wiki/Fuerza)
**Fuente:** Wikipedia

## Movimiento circular
En cinem├ítica, el movimiento circular (tambi├®n llamado movimiento circunferencial) es el que se basa en un eje de giro y giro constante, por lo cual la
[Ver m├ís](https://es.wikipedia.org/wiki/Movimiento_circular)
**Fuente:** Wikipedia

## Movimiento (f├¡sica)
f├¡sica, el movimiento es un cambio de la posici├│n de un cuerpo a lo largo del tiempo respecto de un sistema de referencia. El estudio del movimiento se puede
[Ver m├ís](https://es.wikipedia.org/wiki/Movimiento_(f├¡sica))
**Fuente:** Wikipedia

## Fuerza centr├¡fuga
mec├ínica newtoniana, la fuerza centr├¡fuga es una fuerza ficticia que aparece cuando se describe el movimiento de un cuerpo en un sistema de referencia en rotaci├│n
[Ver m├ís](https://es.wikipedia.org/wiki/Fuerza_centr├¡fuga)
**Fuente:** Wikipedia

## Movimiento social
concreto, y en otras ocasiones de forma interclasista y multipartidista.[1] Algunos ejemplos de estos movimientos son el movimiento feminista, movimiento ecologista
[Ver m├ís](https://es.wikipedia.org/wiki/Movimiento_social)
**Fuente:** Wikipedia
', 1, 3, 32, 1, '2025-03-21 21:37:20.969-05', '2025-03-21 21:37:20.969-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (39, 'Culturas prehisp├ínicas americanas', '## Am├®rica precolombina
constituye la llamada Cultura Clovis. Si bien hasta mediados del siglo┬áXX fue considerada la m├ís antigua de las culturas americanas con dataciones de m├ís
[Ver m├ís](https://es.wikipedia.org/wiki/Am├®rica_precolombina)
**Fuente:** Wikipedia

## Tenochtitlan (banda)
La tem├ítica de canciones es exclusivamente sobre las culturas prehisp├ínicas latino-americanas como los mayas, aztecas, incas, su historia, mitolog├¡a
[Ver m├ís](https://es.wikipedia.org/wiki/Tenochtitlan_(banda))
**Fuente:** Wikipedia

## Dieta prehisp├ínica de Mesoam├®rica
ni gran parte de la cultura de estos pueblos de la ├®poca prehisp├ínica. Bebidas de M├®xico Entomofagia en M├®xico Fiestas prehisp├ínicas mexicas Historia de
[Ver m├ís](https://es.wikipedia.org/wiki/Dieta_prehisp├ínica_de_Mesoam├®rica)
**Fuente:** Wikipedia

## M├║sica prehisp├ínica de M├®xico
asimilando el legado de las culturas contempor├íneas de toda Mesoam├®rica.[1]ÔÇï Dependiendo del periodo hist├│rico y de las culturas, las evidencias no de la
[Ver m├ís](https://es.wikipedia.org/wiki/M├║sica_prehisp├ínica_de_M├®xico)
**Fuente:** Wikipedia

## M├®xico prehisp├ínico
los rasgos que distinguen a Mesoam├®rica del resto de las culturas y civilizaciones americanas. En segundo lugar, porque cuando se retom├│ el inter├®s en
[Ver m├ís](https://es.wikipedia.org/wiki/M├®xico_prehisp├ínico)
**Fuente:** Wikipedia
', 1, 4, 39, 1, '2025-03-21 21:37:21.011-05', '2025-03-21 21:37:21.011-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (49, 'Saludos y presentaciones', '## Presentaci├│n (sociedad)
una presentaci├│n se debe nombrar primero a la persona de menor posici├│n o edad y al hombre antes que a la mujer. Sin embargo, el orden de los saludos es
[Ver m├ís](https://es.wikipedia.org/wiki/Presentaci├│n_(sociedad))
**Fuente:** Wikipedia

## Saludo vallenato
cultural y prosigui├│. De esta manera los saludos vallenatos se convirtieron en una fuentes de ingreso adicional, adem├ís de pagos por presentaciones musicales
[Ver m├ís](https://es.wikipedia.org/wiki/Saludo_vallenato)
**Fuente:** Wikipedia

## Problema de salud
resuelto anteriormente, pero excluyendo la presentaci├│n de un primer problema evaluado por otro profesional de la salud. Conocido: un problema previamente evaluado
[Ver m├ís](https://es.wikipedia.org/wiki/Problema_de_salud)
**Fuente:** Wikipedia

## Atenci├│n primaria de salud
tanto del sistema nacional de salud, del que constituye la funci├│n central y el n├║cleo principal, como del desarrollo social y econ├│mico global de la comunidad
[Ver m├ís](https://es.wikipedia.org/wiki/Atenci├│n_primaria_de_salud)
**Fuente:** Wikipedia

## Mercadotecnia en salud
en salud, mercadotecnia sanitaria o mercadotecnia de servicios de salud es una especializaci├│n de la administraci├│n en salud y enfoque de la salud p├║blica
[Ver m├ís](https://es.wikipedia.org/wiki/Mercadotecnia_en_salud)
**Fuente:** Wikipedia
', 1, 5, 49, 1, '2025-03-21 21:37:21.066-05', '2025-03-21 21:37:21.066-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (50, 'La familia y el entorno escolar', '## Acoso escolar
f├¡sicos y psicol├│gicos por parte de uno o m├ís compa├▒eros en el entorno escolar. El agresor suele aprovechar un desequilibrio de poder entre ├®l y la v├¡ctima
[Ver m├ís](https://es.wikipedia.org/wiki/Acoso_escolar)
**Fuente:** Wikipedia

## Fracaso escolar
de g├®nero, a c├│mo chicas y chicos se desenvuelven en el entorno escolar, siendo las chicas m├ís obedientes con el orden escolar, mientras que los chicos
[Ver m├ís](https://es.wikipedia.org/wiki/Fracaso_escolar)
**Fuente:** Wikipedia

## Organizaci├│n escolar
El t├®rmino organizaci├│n escolar hace referencia a las normas, procedimiento administrativo y sistema de control necesarios para su funcionamiento y que
[Ver m├ís](https://es.wikipedia.org/wiki/Organizaci├│n_escolar)
**Fuente:** Wikipedia

## Deserci├│n escolar
Deserci├│n escolar es un t├®rmino com├║nmente utilizado en todo el mundo para referirse al abandono escolar. Se trata de aquella situaci├│n en la que el alumno
[Ver m├ís](https://es.wikipedia.org/wiki/Deserci├│n_escolar)
**Fuente:** Wikipedia

## D├¡a Internacional contra la Violencia y el Acoso en la Escuela, incluido el Ciberacoso
la UNESCO en la 40┬¬ reuni├│n de su Conferencia General el 12 de noviembre de 2019,[1]ÔÇï reconociendo que la violencia en el entorno escolar, en todas sus
[Ver m├ís](https://es.wikipedia.org/wiki/D├¡a_Internacional_contra_la_Violencia_y_el_Acoso_en_la_Escuela,_incluido_el_Ciberacoso)
**Fuente:** Wikipedia
', 1, 5, 50, 1, '2025-03-21 21:37:21.071-05', '2025-03-21 21:37:21.071-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (55, 'Comprensi├│n de instrucciones b├ísicas', '## Comprensi├│n por dise├▒o
Grant Wiggins en su Comprensi├│n por Dise├▒o (1998), publicado por la Asociaci├│n de Supervisi├│n y Desarrollo Curricular. La comprensi├│n por dise├▒o y CpD son
[Ver m├ís](https://es.wikipedia.org/wiki/Comprensi├│n_por_dise├▒o)
**Fuente:** Wikipedia

## BASIC
BASIC, siglas de Beginners&#039; All-purpose Symbolic Instruction Code[1]ÔÇï (en castellano: ÔÇÿC├│digo simb├│lico de instrucciones de prop├│sito general para principiantesÔÇÖ)
[Ver m├ís](https://es.wikipedia.org/wiki/BASIC)
**Fuente:** Wikipedia

## Sociedad de Instrucci├│n Primaria
de Instrucci├│n Primaria de Santiago (SIP) es una corporaci├│n educacional chilena de derecho privado sin fines de lucro. Fue fundada el 17 de julio de
[Ver m├ís](https://es.wikipedia.org/wiki/Sociedad_de_Instrucci├│n_Primaria)
**Fuente:** Wikipedia

## Educaci├│n primaria
escribir, c├ílculo b├ísico[1]ÔÇï y algunos de los conceptos culturales considerados imprescindibles, denominadas competencias b├ísicas y competencias clave
[Ver m├ís](https://es.wikipedia.org/wiki/Educaci├│n_primaria)
**Fuente:** Wikipedia

## Bater├¡a de Aptitudes Diferenciales y Generales
la memoria y la atenci├│n. Consta de nueve pruebas:[2]ÔÇï Comprensi├│n Verbal (CV) Razonamiento Verbal (RV) Comprensi├│n Num├®rica (CN) Razonamiento Num├®rico
[Ver m├ís](https://es.wikipedia.org/wiki/Bater├¡a_de_Aptitudes_Diferenciales_y_Generales)
**Fuente:** Wikipedia
', 1, 5, 55, 1, '2025-03-21 21:37:21.099-05', '2025-03-21 21:37:21.099-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (44, 'Continentes y oc├®anos', '# Continentes y oc├®anos

## Tabla de contenido
* [Introducci├│n](#introduccion)
* [┬┐Qu├® son los continentes?](#que-son-los-continentes)
* [Los continentes del mundo](#los-continentes-del-mundo)
    * [Asia](#asia)
    * [├üfrica](#africa)
    * [Am├®rica del Norte](#america-del-norte)
    * [Am├®rica del Sur](#america-del-sur)
    * [Ant├írtida](#antartida)
    * [Europa](#europa)
    * [Ocean├¡a](#oceania)
* [┬┐Qu├® son los oc├®anos?](#que-son-los-oceanos)
* [Los oc├®anos del mundo](#los-oceanos-del-mundo)
    * [Oc├®ano Pac├¡fico](#oceano-pacifico)
    * [Oc├®ano Atl├íntico](#oceano-atlantico)
    * [Oc├®ano ├ìndico](#oceano-indico)
    * [Oc├®ano Glacial ├ürtico](#oceano-glacial-artico)
    * [Oc├®ano Glacial Ant├írtico (o Austral)](#oceano-glacial-antartico-o-austral)
* [Importancia de los continentes y oc├®anos](#importancia-de-los-continentes-y-oceanos)
* [Ejemplos Regionales (Colombia) y Universales](#ejemplos-regionales-colombia-y-universales)
* [Recursos Multimedia](#recursos-multimedia)
* [Referencias](#referencias)
* [Recursos Adicionales](#recursos-adicionales)
* [Nota Aclaratoria](#nota-aclaratoria)

## Introducci├│n
Los continentes y los oc├®anos son las principales divisiones geogr├íficas de nuestro planeta. Los continentes son grandes extensiones de tierra emergida, mientras que los oc├®anos son vastas masas de agua salada que cubren la mayor parte de la superficie terrestre.  Comprender su distribuci├│n, caracter├¡sticas e importancia es fundamental para estudiar la geograf├¡a del mundo.

## ┬┐Qu├® son los continentes?
Los continentes son grandes extensiones de tierra separadas por oc├®anos y otros accidentes geogr├íficos. La mayor├¡a de los ge├│grafos reconocen siete continentes, aunque existen diferentes modelos de clasificaci├│n.

## Los continentes del mundo
### Asia
*   Es el continente m├ís grande y poblado del mundo.
*   Se extiende desde el Oc├®ano ├ürtico hasta el Oc├®ano ├ìndico.
*   Alberga una gran diversidad de culturas, climas y paisajes.

### ├üfrica
*   Es el segundo continente m├ís grande del mundo.
*   Se extiende desde el Mar Mediterr├íneo hasta el Oc├®ano ├ìndico y el Oc├®ano Atl├íntico.
*   Es conocido por su rica fauna, sus vastas sabanas y el desierto del Sahara.

### Am├®rica del Norte
*   Se extiende desde el Oc├®ano ├ürtico hasta el istmo de Panam├í.
*   Incluye pa├¡ses como Canad├í, Estados Unidos y M├®xico.
*   Tiene una gran diversidad de climas y paisajes, desde las monta├▒as rocosas hasta las llanuras costeras.

### Am├®rica del Sur
*   Se extiende desde el istmo de Panam├í hasta el Cabo de Hornos.
*   Incluye pa├¡ses como Brasil, Argentina, Colombia y Per├║.
*   Alberga la selva amaz├│nica, la cordillera de los Andes y las pampas.

### Ant├írtida
*   Es un continente cubierto de hielo que se encuentra en el Polo Sur.
*   Es el continente m├ís fr├¡o, seco y ventoso del mundo.
*   Es un importante centro de investigaci├│n cient├¡fica.

### Europa
*   Es un continente relativamente peque├▒o, pero con una gran influencia hist├│rica y cultural.
*   Se extiende desde el Oc├®ano Atl├íntico hasta los Montes Urales.
*   Incluye pa├¡ses como Espa├▒a, Francia, Alemania e Italia.

### Ocean├¡a
*   Es el continente m├ís peque├▒o del mundo.
*   Est├í compuesto por Australia, Nueva Zelanda y miles de islas en el Oc├®ano Pac├¡fico.
*   Es conocido por su fauna ├║nica, como los canguros y los koalas.

## ┬┐Qu├® son los oc├®anos?
Los oc├®anos son grandes masas de agua salada que cubren la mayor parte de la superficie terrestre. Son fundamentales para el clima, la biodiversidad y la econom├¡a global.

## Los oc├®anos del mundo
### Oc├®ano Pac├¡fico
*   Es el oc├®ano m├ís grande y profundo del mundo.
*   Se extiende desde el ├ürtico hasta la Ant├írtida.
*   Alberga una gran cantidad de islas y fosas oce├ínicas.

### Oc├®ano Atl├íntico
*   Es el segundo oc├®ano m├ís grande del mundo.
*   Se extiende entre Am├®rica, Europa y ├üfrica.
*   Es importante para el comercio y la navegaci├│n.

### Oc├®ano ├ìndico
*   Es el tercer oc├®ano m├ís grande del mundo.
*   Se encuentra al sur de Asia, entre ├üfrica y Australia.
*   Es importante para el comercio y la pesca.

### Oc├®ano Glacial ├ürtico
*   Es el oc├®ano m├ís peque├▒o y menos profundo del mundo.
*   Se encuentra alrededor del Polo Norte.
*   Est├í cubierto de hielo durante gran parte del a├▒o.

### Oc├®ano Glacial Ant├írtico (o Austral)
*   Rodea el continente Ant├írtico.
*   Es el oc├®ano m├ís fr├¡o y tormentoso del mundo.
*   Es importante para la regulaci├│n del clima global.

## Importancia de los continentes y oc├®anos
*   **Clima:** Los oc├®anos influyen en el clima global mediante la transferencia de calor y la regulaci├│n de las corrientes marinas.
*   **Biodiversidad:** Los continentes y oc├®anos albergan una gran diversidad de vida vegetal y animal.
*   **Recursos:** Los continentes proporcionan recursos naturales como minerales, petr├│leo y bosques, mientras que los oc├®anos ofrecen recursos pesqueros y energ├®ticos.
*   **Econom├¡a:** Los continentes y oc├®anos son fundamentales para el comercio, la navegaci├│n y el turismo.

## Ejemplos Regionales (Colombia) y Universales
*   **Colombia:** Colombia tiene costas en dos oc├®anos: el Oc├®ano Pac├¡fico y el Mar Caribe (parte del Oc├®ano Atl├íntico). Esto le da una gran diversidad de ecosistemas marinos y terrestres.
*   **Universal:** La importancia de los oc├®anos para la regulaci├│n del clima es un tema de preocupaci├│n mundial, debido al cambio clim├ítico y sus efectos en el aumento del nivel del mar y la acidificaci├│n de los oc├®anos.

## Recursos Multimedia
*   **Video Educativo:** ┬┐Cu├íntos continentes y oc├®anos hay? [https://www.youtube.com/watch?v=OwXB65-Au_8](https://www.youtube.com/watch?v=OwXB65-Au_8)
*   **Art├¡culo de Wikipedia:** Continente [https://es.wikipedia.org/wiki/Continente](https://es.wikipedia.org/wiki/Continente)
*   **Art├¡culo de Wikipedia:** Oc├®ano [https://es.wikipedia.org/wiki/Oc%C3%A9ano](https://es.wikipedia.org/wiki/Oc%C3%A9ano)
*   **Art├¡culo Acad├®mico:** La influencia de los oc├®anos en el clima global [La influencia de los oc├®anos en el clima global](https://www.icmyl.unam.mx/CulturaOceanica/assets/imgs/pupitre/ClimaImpactoCC.pdf)
*   **Imagen:** Mapa del mundo con continentes y oc├®anos ![Mapa mundial que muestra los continentes y oc├®anos](https://i.pinimg.com/736x/6e/50/6a/6e506a3ebb35dfc88bc7fa3eebc6462b.jpg) Mapa mundial que muestra los continentes y oc├®anos

## Referencias
1.  Strahler, A. N., & Strahler, A. H. (1987). *Modern Physical Geography*. John Wiley & Sons.
2.  Pidwirny, M. (2006). "Introduction to the Oceans". *PhysicalGeography.net*.
3.  "Continentes" - National Geographic en Espa├▒ol. nationalgeographicla.com
4.  "Oc├®anos" - NOAA (National Oceanic and Atmospheric Administration). noaa.gov

## Recursos Adicionales
*   Google Earth: Explora los continentes y oc├®anos con im├ígenes de sat├®lite.
*   NOAA (National Oceanic and Atmospheric Administration): Informaci├│n sobre los oc├®anos.
*   National Geographic: Informaci├│n sobre continentes y oc├®anos.

## Nota Aclaratoria
Este contenido ha sido creado en equipo entre humanos y la IA de Perplexity para facilitarte el acceso a la informaci├│n. Sin embargo, puede contener errores. Te invitamos a revisar las fuentes adicionales de informaci├│n que incluimos para una comprensi├│n m├ís completa y precisa.', 1, 4, 44, 1, '2025-03-21 21:37:21.039-05', '2025-03-24 13:15:30.209053-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (45, 'Relieve y climas de Am├®rica', '# Relieve y climas de Am├®rica

## Tabla de contenido
* [Introducci├│n](#introduccion)
* [Relieve de Am├®rica](#relieve-de-america)
    * [Principales Sistemas Monta├▒osos](#principales-sistemas-montanosos)
    * [Llanuras](#llanuras)
    * [Mesetas](#mesetas)
* [Climas de Am├®rica](#climas-de-america)
    * [Factores que influyen en el clima](#factores-que-influyen-en-el-clima)
    * [Tipos de climas](#tipos-de-climas)
* [Relaci├│n entre relieve y clima](#relacion-entre-relieve-y-clima)
* [Ejemplos Regionales (Colombia) y Universales](#ejemplos-regionales-colombia-y-universales)
* [Recursos Multimedia](#recursos-multimedia)
* [Referencias](#referencias)
* [Recursos Adicionales](#recursos-adicionales)
* [Nota Aclaratoria](#nota-aclaratoria)

## Introducci├│n
El continente americano presenta una gran diversidad de relieves y climas debido a su extensi├│n latitudinal y a la presencia de importantes sistemas monta├▒osos. Estos factores influyen en la distribuci├│n de la poblaci├│n, las actividades econ├│micas y los ecosistemas del continente.

## Relieve de Am├®rica
El relieve de Am├®rica es muy variado, desde las altas monta├▒as de los Andes y las Rocosas hasta las extensas llanuras del centro del continente.

### Principales Sistemas Monta├▒osos
*   **Monta├▒as Rocosas (Am├®rica del Norte):** Se extienden desde Alaska hasta M├®xico, con picos elevados y valles profundos.
*   **Sierra Madre (M├®xico):** Se divide en Sierra Madre Occidental y Sierra Madre Oriental, con importantes yacimientos minerales.
*   **Cordillera de los Andes (Am├®rica del Sur):** Es la cordillera m├ís larga del mundo, que se extiende desde Venezuela hasta Chile, con picos como el Aconcagua.

### Llanuras
*   **Grandes Llanuras (Am├®rica del Norte):** Se ubican en el centro de Estados Unidos y Canad├í, con suelos f├®rtiles para la agricultura.
*   **Llanura Amaz├│nica (Am├®rica del Sur):** Es la selva tropical m├ís grande del mundo, con una gran biodiversidad y el r├¡o Amazonas.
*   **Llanura Pampeana (Am├®rica del Sur):** Se ubica en Argentina y Uruguay, con suelos f├®rtiles para la ganader├¡a y la agricultura.

### Mesetas
*   **Meseta Mexicana:** Se ubica en el centro de M├®xico, con importantes ciudades y centros agr├¡colas.
*   **Macizo de Guayana (Am├®rica del Sur):** Se ubica en Venezuela, Guyana, Surinam y Brasil, con elevaciones tabulares llamadas tepuyes.
*   **Meseta Patag├│nica (Am├®rica del Sur):** Se ubica en Argentina y Chile, con clima seco y vegetaci├│n adaptada a la aridez.

## Climas de Am├®rica
Los climas de Am├®rica var├¡an desde los climas polares en el norte de Canad├í y Alaska hasta los climas tropicales en el Caribe y la Amazon├¡a.

### Factores que influyen en el clima
*   **Latitud:** La distancia al Ecuador influye en la cantidad de radiaci├│n solar que recibe una regi├│n.
*   **Altitud:** La temperatura disminuye con la altitud, por lo que las monta├▒as tienen climas m├ís fr├¡os.
*   **Corrientes marinas:** Las corrientes marinas c├ílidas y fr├¡as influyen en la temperatura y la humedad de las zonas costeras.
*   **Vientos:** Los vientos transportan calor y humedad, influyendo en el clima de las regiones.
*   **Relieve:** Las monta├▒as act├║an como barreras que modifican los patrones de viento y precipitaci├│n.

### Tipos de climas
*   **Clima Polar:** Se ubica en el norte de Canad├í y Alaska, con temperaturas muy bajas y precipitaciones escasas.
*   **Clima Fr├¡o/Continental:** Se ubica en el centro de Canad├í y el norte de Estados Unidos, con inviernos fr├¡os y veranos c├ílidos.
*   **Clima Templado:** Se ubica en las costas de Estados Unidos y Chile, con temperaturas moderadas y precipitaciones abundantes.
*   **Clima Seco/├ürido:** Se ubica en el suroeste de Estados Unidos y el norte de M├®xico, con precipitaciones escasas y temperaturas elevadas.
*   **Clima Tropical:** Se ubica en el Caribe, Am├®rica Central y la Amazon├¡a, con temperaturas elevadas y precipitaciones abundantes durante todo el a├▒o.
*   **Clima de Monta├▒a:** Se ubica en las altas monta├▒as de los Andes y las Rocosas, con temperaturas bajas y precipitaciones variables seg├║n la altitud.

## Relaci├│n entre relieve y clima
El relieve influye en el clima al modificar los patrones de viento y precipitaci├│n. Las monta├▒as act├║an como barreras que obligan al aire h├║medo a ascender, enfriarse y precipitar, generando climas h├║medos en las laderas orientadas al viento y climas secos en las laderas opuestas (efecto Foehn). La altitud tambi├®n influye en la temperatura, generando climas m├ís fr├¡os en las monta├▒as.

## Ejemplos Regionales (Colombia) y Universales
*   **Colombia:** Colombia presenta una gran diversidad de climas debido a su ubicaci├│n en la zona tropical y a la presencia de la cordillera de los Andes. Se encuentran climas c├ílidos y h├║medos en la costa Pac├¡fica y la Amazon├¡a, climas templados en los valles interandinos y climas fr├¡os en las altas monta├▒as.
*   **Universal:** El efecto de las monta├▒as en la distribuci├│n de las precipitaciones es un fen├│meno global que se observa en muchas cordilleras del mundo, como los Himalayas en Asia y los Alpes en Europa.

## Recursos Multimedia
*   **Video Educativo:** ┬┐C├│mo es el RELIEVE de AM├ëRICA? Ô£àÔ£àÔ£àMapa f├¡sico de Am├®rica - Geograf├¡a b├ísica de Am├®rica [httpshttps://www.youtube.com/watch?v=1hl2C4Jvjvg](httpshttps://www.youtube.com/watch?v=1hl2C4Jvjvg)
*   **Video Educativo:** Climas de Am├®rica [https://www.youtube.com/watch?v=rrhfty9GHJk&pp=ygURY2xpbWFzIGRlIGFtZXJpY2E%3D](https://www.youtube.com/watch?v=rrhfty9GHJk&pp=ygURY2xpbWFzIGRlIGFtZXJpY2E%3D)
*   **Video Educativo:** Climas de Am├®rica [https://www.youtube.com/watch?v=rrhfty9GHJk&pp=ygURY2xpbWFzIGRlIGFtZXJpY2E%3D](https://www.youtube.com/watch?v=rrhfty9GHJk&pp=ygURY2xpbWFzIGRlIGFtZXJpY2E%3D)
*   **Art├¡culo de Wikipedia:** Relieve Terrestre [https://es.wikipedia.org/wiki/Relieve_terrestre](https://es.wikipedia.org/wiki/Relieve_terrestre)
*   **Art├¡culo de Wikipedia:** Clima [https://es.wikipedia.org/wiki/Clima](https://es.wikipedia.org/wiki/Clima)
*   **Art├¡culo Acad├®mico:** "Influencia del relieve en la distribuci├│n de los climas en Am├®rica del Sur" (Buscar en Google Acad├®mico o Scielo)
*   **Imagen:** Ejemplo de relieve con el Ca├▒├│n del Chicamocha en Santander, Colombia. ![Fotograf├¡a del Ca├▒├│n del Chicamocha](https://upload.wikimedia.org/wikipedia/commons/5/5b/Ca%C3%B1on_del_Chicamocha.jpeg) Fotograf├¡a del Ca├▒├│n del Chicamocha.
*   **Imagen:** Mapa de climas de Am├®rica del Sur ![Mapa clim├ítico de Sudam├®rica seg├║n el sistema K├Âppen-Geiger para el periodo de 1980 a 2016](https://upload.wikimedia.org/wikipedia/commons/6/6e/Mapa_clim%C3%A1tico_de_Sudam%C3%A9rica_%28K%C3%B6ppen-Geiger%29.png) Mapa clim├ítico de Sudam├®rica seg├║n el sistema K├Âppen-Geiger para el periodo de 1980 a 2016

## Referencias
1.  Christopherson, R. W. (2011). *Geosystems', 1, 4, 45, 1, '2025-03-21 21:37:21.045-05', '2025-03-24 15:37:03.994212-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (56, 'Di├ílogos simples de presentaci├│n', '## Pol├¡tico (di├ílogo)
Pol├¡tico (en griego ╬á╬┐╬╗╬╣¤ä╬╣╬║¤î¤é[1]ÔÇï) es el ├║ltimo de un conjunto de cuatro di├ílogos de Plat├│n. Es precedido por Parm├®nides, Teeteto y el Sofista. En el texto
[Ver m├ís](https://es.wikipedia.org/wiki/Pol├¡tico_(di├ílogo))
**Fuente:** Wikipedia

## Raya (puntuaci├│n)
conocemos de mucho tiempo. LongtempsÔÇª ÔÇöSusana hizo una pausaÔÇö. T├║ sabes hablar franc├®s, ┬┐no? Un primer ejemplo de di├ílogo en presentaci├│n compacta: ÔÇö┬íS├¡
[Ver m├ís](https://es.wikipedia.org/wiki/Raya_(puntuaci├│n))
**Fuente:** Wikipedia

## Sincron├¡a de labios
Esto es inevitable en las adaptaciones de musicales donde las canciones suponen casi el 100% de los di├ílogos y resulta imposible combinar canci├│n y actuaci├│n
[Ver m├ís](https://es.wikipedia.org/wiki/Sincron├¡a_de_labios)
**Fuente:** Wikipedia

## Reservoir Dogs
situaci├│n l├¡mite. La mayor parte de lo anterior no se muestra en la pel├¡cula sino que el espectador lo deduce de los di├ílogos y de flash-backs parciales que
[Ver m├ís](https://es.wikipedia.org/wiki/Reservoir_Dogs)
**Fuente:** Wikipedia

## Teor├¡a de la argumentaci├│n
creencias o propios intereses en un di├ílogo racional, en simples coloquios o durante el proceso de argumentaci├│n o defensa de ideas. La argumentaci├│n es usada
[Ver m├ís](https://es.wikipedia.org/wiki/Teor├¡a_de_la_argumentaci├│n)
**Fuente:** Wikipedia
', 1, 5, 56, 1, '2025-03-21 21:37:21.104-05', '2025-03-21 21:37:21.104-05');
INSERT INTO public.articulos (id, titulo, contenido, grado_id, area_id, tema_id, usuario_id, created_at, updated_at) VALUES (60, 'Esquema corporal', '## Esquema corporal
El esquema corporal es una t├®cnica utilizada en el dibujo de personas o seres vivos. El esquema corporal es una idea que tenemos sobre nuestro cuerpo
[Ver m├ís](https://es.wikipedia.org/wiki/Esquema_corporal)
**Fuente:** Wikipedia

## Esquema
Bosquejo Croquis Esquema corporal, t├®cnica utilizada en el dibujo Figuraci├│n esquem├ítica o Neocubismo Esquema (psicolog├¡a) Esquema gr├ífico, estructura
[Ver m├ís](https://es.wikipedia.org/wiki/Esquema)
**Fuente:** Wikipedia

## Expresi├│n corporal
la expresi├│n corporal se refiere al movimiento, con el prop├│sito de favorecer los procesos de aprendizaje, estructurar el esquema corporal, construir una
[Ver m├ís](https://es.wikipedia.org/wiki/Expresi├│n_corporal)
**Fuente:** Wikipedia

## Imagen corporal
diferentes segmentos y de las relaciones que tenemos entre estos. El esquema corporal se constituye muy lentamente en el ni├▒o. Esta evoluci├│n se dirige bajo
[Ver m├ís](https://es.wikipedia.org/wiki/Imagen_corporal)
**Fuente:** Wikipedia

## Plan corporal
El plan corporal, patr├│n corporal, arquetipo o Bauplan (del alem├ín) de un animal se refiere, b├ísicamente, a la configuraci├│n general de su estructura
[Ver m├ís](https://es.wikipedia.org/wiki/Plan_corporal)
**Fuente:** Wikipedia
', 1, 6, 60, 1, '2025-03-21 21:37:21.126-05', '2025-03-21 21:37:21.126-05');


--
-- Data for Name: grados; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.grados (id, nombre) VALUES (1, 'Grado Sexto');
INSERT INTO public.grados (id, nombre) VALUES (2, 'Grado S├®ptimo');
INSERT INTO public.grados (id, nombre) VALUES (3, 'Grado Octavo');
INSERT INTO public.grados (id, nombre) VALUES (4, 'Grado Noveno');
INSERT INTO public.grados (id, nombre) VALUES (5, 'Grado D├®cimo');
INSERT INTO public.grados (id, nombre) VALUES (6, 'Grado Once');


--
-- Data for Name: temas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.temas (id, nombre) VALUES (1, 'Comprensi├│n e interpretaci├│n textual - Lectura literal e inferencial');
INSERT INTO public.temas (id, nombre) VALUES (2, 'Comprensi├│n e interpretaci├│n textual - Identificaci├│n de ideas principales y secundarias');
INSERT INTO public.temas (id, nombre) VALUES (3, 'Comprensi├│n e interpretaci├│n textual - Res├║menes y s├¡ntesis de textos');
INSERT INTO public.temas (id, nombre) VALUES (4, 'Producci├│n textual - Textos narrativos simples');
INSERT INTO public.temas (id, nombre) VALUES (5, 'Producci├│n textual - P├írrafos descriptivos');
INSERT INTO public.temas (id, nombre) VALUES (6, 'Producci├│n textual - Normas b├ísicas de ortograf├¡a');
INSERT INTO public.temas (id, nombre) VALUES (7, 'Literatura - G├®neros literarios b├ísicos');
INSERT INTO public.temas (id, nombre) VALUES (8, 'Literatura - Mitos y leyendas colombianas');
INSERT INTO public.temas (id, nombre) VALUES (9, 'Literatura - Cuentos cortos');
INSERT INTO public.temas (id, nombre) VALUES (10, 'Gram├ítica - Categor├¡as gramaticales (sustantivo, adjetivo, verbo)');
INSERT INTO public.temas (id, nombre) VALUES (11, 'Gram├ítica - Tiempos verbales simples');
INSERT INTO public.temas (id, nombre) VALUES (12, 'Gram├ítica - Concordancia gramatical');
INSERT INTO public.temas (id, nombre) VALUES (13, 'Pensamiento num├®rico - N├║meros naturales y sus operaciones');
INSERT INTO public.temas (id, nombre) VALUES (14, 'Pensamiento num├®rico - N├║meros enteros y sus operaciones');
INSERT INTO public.temas (id, nombre) VALUES (15, 'Pensamiento num├®rico - M├║ltiplos y divisores');
INSERT INTO public.temas (id, nombre) VALUES (16, 'Pensamiento num├®rico - Teor├¡a b├ísica de n├║meros (MCM y MCD)');
INSERT INTO public.temas (id, nombre) VALUES (17, 'Pensamiento espacial y geom├®trico - Figuras planas y sus propiedades');
INSERT INTO public.temas (id, nombre) VALUES (18, 'Pensamiento espacial y geom├®trico - Per├¡metro y ├írea de figuras b├ísicas');
INSERT INTO public.temas (id, nombre) VALUES (19, 'Pensamiento espacial y geom├®trico - Simetr├¡a y congruencia');
INSERT INTO public.temas (id, nombre) VALUES (20, 'Pensamiento m├®trico - Sistema m├®trico decimal');
INSERT INTO public.temas (id, nombre) VALUES (21, 'Pensamiento m├®trico - Conversiones de unidades b├ísicas');
INSERT INTO public.temas (id, nombre) VALUES (22, 'Pensamiento aleatorio - Recolecci├│n y organizaci├│n de datos');
INSERT INTO public.temas (id, nombre) VALUES (23, 'Pensamiento aleatorio - Tablas de frecuencia simples');
INSERT INTO public.temas (id, nombre) VALUES (24, 'Pensamiento aleatorio - Gr├íficas de barras y pictogramas');
INSERT INTO public.temas (id, nombre) VALUES (25, 'Pensamiento variacional - Expresiones algebraicas simples');
INSERT INTO public.temas (id, nombre) VALUES (26, 'Pensamiento variacional - Patrones num├®ricos');
INSERT INTO public.temas (id, nombre) VALUES (27, 'Entorno vivo (Biolog├¡a) - Clasificaci├│n de los seres vivos');
INSERT INTO public.temas (id, nombre) VALUES (28, 'Entorno vivo (Biolog├¡a) - Estructura celular b├ísica');
INSERT INTO public.temas (id, nombre) VALUES (29, 'Entorno vivo (Biolog├¡a) - Niveles de organizaci├│n biol├│gica');
INSERT INTO public.temas (id, nombre) VALUES (30, 'Entorno vivo (Biolog├¡a) - Ciclos de vida');
INSERT INTO public.temas (id, nombre) VALUES (31, 'Entorno f├¡sico (F├¡sica b├ísica) - Medici├│n y magnitudes f├¡sicas');
INSERT INTO public.temas (id, nombre) VALUES (32, 'Entorno f├¡sico (F├¡sica b├ísica) - Conceptos de fuerza y movimiento');
INSERT INTO public.temas (id, nombre) VALUES (33, 'Entorno f├¡sico (F├¡sica b├ísica) - M├íquinas simples');
INSERT INTO public.temas (id, nombre) VALUES (34, 'Entorno qu├¡mico (Qu├¡mica b├ísica) - Estados de la materia');
INSERT INTO public.temas (id, nombre) VALUES (35, 'Entorno qu├¡mico (Qu├¡mica b├ísica) - Cambios f├¡sicos y qu├¡micos');
INSERT INTO public.temas (id, nombre) VALUES (36, 'Entorno qu├¡mico (Qu├¡mica b├ísica) - Mezclas y sustancias');
INSERT INTO public.temas (id, nombre) VALUES (37, 'Ciencia, tecnolog├¡a y sociedad - Recursos naturales');
INSERT INTO public.temas (id, nombre) VALUES (38, 'Ciencia, tecnolog├¡a y sociedad - Contaminaci├│n b├ísica');
INSERT INTO public.temas (id, nombre) VALUES (39, 'Historia - Culturas prehisp├ínicas americanas');
INSERT INTO public.temas (id, nombre) VALUES (40, 'Historia - Civilizaciones precolombinas (Mayas, Aztecas, Incas)');
INSERT INTO public.temas (id, nombre) VALUES (41, 'Historia - Llegada de europeos a Am├®rica');
INSERT INTO public.temas (id, nombre) VALUES (42, 'Geograf├¡a - El planeta Tierra (estructura y movimientos)');
INSERT INTO public.temas (id, nombre) VALUES (43, 'Geograf├¡a - Coordenadas geogr├íficas');
INSERT INTO public.temas (id, nombre) VALUES (44, 'Geograf├¡a - Continentes y oc├®anos');
INSERT INTO public.temas (id, nombre) VALUES (45, 'Geograf├¡a - Relieve y climas de Am├®rica');
INSERT INTO public.temas (id, nombre) VALUES (46, 'Democracia - Conceptos b├ísicos de democracia');
INSERT INTO public.temas (id, nombre) VALUES (47, 'Democracia - Derechos y deberes fundamentales');
INSERT INTO public.temas (id, nombre) VALUES (48, 'Democracia - Gobierno escolar');
INSERT INTO public.temas (id, nombre) VALUES (49, 'Vocabulario - Saludos y presentaciones (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (50, 'Vocabulario - La familia y el entorno escolar (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (51, 'Vocabulario - N├║meros, colores y objetos cotidianos (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (52, 'Gram├ítica b├ísica - Verbo "to be" en presente (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (53, 'Gram├ítica b├ísica - Pronombres personales (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (54, 'Gram├ítica b├ísica - Art├¡culos y demostrativos (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (55, 'Habilidades comunicativas - Comprensi├│n de instrucciones b├ísicas (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (56, 'Habilidades comunicativas - Di├ílogos simples de presentaci├│n (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (57, 'Habilidades comunicativas - Descripci├│n b├ísica de objetos (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (58, 'Desarrollo motor - Habilidades motrices b├ísicas');
INSERT INTO public.temas (id, nombre) VALUES (59, 'Desarrollo motor - Coordinaci├│n din├ímica general');
INSERT INTO public.temas (id, nombre) VALUES (60, 'Desarrollo motor - Esquema corporal');
INSERT INTO public.temas (id, nombre) VALUES (61, 'Formaci├│n deportiva inicial - Juegos predeportivos');
INSERT INTO public.temas (id, nombre) VALUES (62, 'Formaci├│n deportiva inicial - Fundamentos de deportes colectivos');
INSERT INTO public.temas (id, nombre) VALUES (63, 'Formaci├│n deportiva inicial - Normas b├ísicas de juegos');
INSERT INTO public.temas (id, nombre) VALUES (64, 'Expresi├│n corporal - Ritmo y movimiento');
INSERT INTO public.temas (id, nombre) VALUES (65, 'Expresi├│n corporal - Juegos tradicionales');
INSERT INTO public.temas (id, nombre) VALUES (66, 'Comprensi├│n e interpretaci├│n textual - Lectura cr├¡tica inicial');
INSERT INTO public.temas (id, nombre) VALUES (67, 'Comprensi├│n e interpretaci├│n textual - Identificaci├│n de argumentos');
INSERT INTO public.temas (id, nombre) VALUES (68, 'Comprensi├│n e interpretaci├│n textual - Relaciones intertextuales b├ísicas');
INSERT INTO public.temas (id, nombre) VALUES (69, 'Producci├│n textual - Textos expositivos simples');
INSERT INTO public.temas (id, nombre) VALUES (70, 'Producci├│n textual - Descripciones detalladas');
INSERT INTO public.temas (id, nombre) VALUES (71, 'Producci├│n textual - Uso de conectores b├ísicos');
INSERT INTO public.temas (id, nombre) VALUES (72, 'Literatura - Literatura colonial americana');
INSERT INTO public.temas (id, nombre) VALUES (73, 'Literatura - Narrativa de aventuras');
INSERT INTO public.temas (id, nombre) VALUES (74, 'Literatura - Poes├¡a tradicional');
INSERT INTO public.temas (id, nombre) VALUES (75, 'Gram├ítica - Estructura de la oraci├│n simple');
INSERT INTO public.temas (id, nombre) VALUES (76, 'Gram├ítica - Modos verbales');
INSERT INTO public.temas (id, nombre) VALUES (77, 'Gram├ítica - Complementos del verbo');
INSERT INTO public.temas (id, nombre) VALUES (78, 'Pensamiento num├®rico - N├║meros racionales (fracciones y decimales)');
INSERT INTO public.temas (id, nombre) VALUES (79, 'Pensamiento num├®rico - Proporcionalidad directa e inversa');
INSERT INTO public.temas (id, nombre) VALUES (80, 'Pensamiento num├®rico - Porcentajes');
INSERT INTO public.temas (id, nombre) VALUES (81, 'Pensamiento espacial y geom├®trico - Transformaciones en el plano');
INSERT INTO public.temas (id, nombre) VALUES (82, 'Pensamiento espacial y geom├®trico - ├üngulos (complementarios, suplementarios)');
INSERT INTO public.temas (id, nombre) VALUES (83, 'Pensamiento espacial y geom├®trico - Pol├¡gonos regulares e irregulares');
INSERT INTO public.temas (id, nombre) VALUES (84, 'Pensamiento m├®trico - Unidades de superficie y volumen');
INSERT INTO public.temas (id, nombre) VALUES (85, 'Pensamiento m├®trico - Estimaci├│n de medidas');
INSERT INTO public.temas (id, nombre) VALUES (86, 'Pensamiento aleatorio - Medidas de tendencia central');
INSERT INTO public.temas (id, nombre) VALUES (87, 'Pensamiento aleatorio - Probabilidad de eventos simples');
INSERT INTO public.temas (id, nombre) VALUES (88, 'Pensamiento variacional - Ecuaciones lineales con una inc├│gnita');
INSERT INTO public.temas (id, nombre) VALUES (89, 'Pensamiento variacional - Gr├íficas en el plano cartesiano');
INSERT INTO public.temas (id, nombre) VALUES (90, 'Entorno vivo (Biolog├¡a) - Ecosistemas terrestres y acu├íticos');
INSERT INTO public.temas (id, nombre) VALUES (91, 'Entorno vivo (Biolog├¡a) - Cadenas y redes tr├│ficas');
INSERT INTO public.temas (id, nombre) VALUES (92, 'Entorno vivo (Biolog├¡a) - Adaptaciones de los seres vivos');
INSERT INTO public.temas (id, nombre) VALUES (93, 'Entorno vivo (Biolog├¡a) - Taxonom├¡a b├ísica');
INSERT INTO public.temas (id, nombre) VALUES (94, 'Entorno f├¡sico (F├¡sica b├ísica) - Energ├¡a y sus transformaciones');
INSERT INTO public.temas (id, nombre) VALUES (95, 'Entorno f├¡sico (F├¡sica b├ísica) - Calor y temperatura');
INSERT INTO public.temas (id, nombre) VALUES (96, 'Entorno f├¡sico (F├¡sica b├ísica) - Ondas b├ísicas');
INSERT INTO public.temas (id, nombre) VALUES (97, 'Entorno qu├¡mico (Qu├¡mica b├ísica) - Tabla peri├│dica introductoria');
INSERT INTO public.temas (id, nombre) VALUES (98, 'Entorno qu├¡mico (Qu├¡mica b├ísica) - ├ütomo y mol├®culas b├ísicas');
INSERT INTO public.temas (id, nombre) VALUES (99, 'Entorno qu├¡mico (Qu├¡mica b├ísica) - Soluciones qu├¡micas simples');
INSERT INTO public.temas (id, nombre) VALUES (100, 'Ciencia, tecnolog├¡a y sociedad - Conservaci├│n ambiental');
INSERT INTO public.temas (id, nombre) VALUES (101, 'Ciencia, tecnolog├¡a y sociedad - Uso sostenible de recursos');
INSERT INTO public.temas (id, nombre) VALUES (102, 'Historia - Colonizaci├│n europea en Am├®rica');
INSERT INTO public.temas (id, nombre) VALUES (103, 'Historia - Sistema colonial');
INSERT INTO public.temas (id, nombre) VALUES (104, 'Historia - Econom├¡a colonial');
INSERT INTO public.temas (id, nombre) VALUES (105, 'Geograf├¡a - Regiones geogr├íficas de Colombia');
INSERT INTO public.temas (id, nombre) VALUES (106, 'Geograf├¡a - Demograf├¡a b├ísica');
INSERT INTO public.temas (id, nombre) VALUES (107, 'Geograf├¡a - Geograf├¡a econ├│mica introductoria');
INSERT INTO public.temas (id, nombre) VALUES (108, 'Democracia - Organizaci├│n del Estado colombiano');
INSERT INTO public.temas (id, nombre) VALUES (109, 'Democracia - Participaci├│n ciudadana');
INSERT INTO public.temas (id, nombre) VALUES (110, 'Democracia - Mecanismos de participaci├│n democr├ítica');
INSERT INTO public.temas (id, nombre) VALUES (111, 'Vocabulario - Actividades cotidianas y rutinas (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (112, 'Vocabulario - Adjetivos descriptivos (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (113, 'Vocabulario - Expresiones de tiempo (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (114, 'Gram├ítica - Presente simple y continuo (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (115, 'Gram├ítica - Adverbios de frecuencia (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (116, 'Gram├ítica - Preposiciones de lugar y tiempo (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (117, 'Habilidades comunicativas - Descripci├│n de personas y lugares (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (118, 'Habilidades comunicativas - Expresi├│n de gustos y preferencias (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (119, 'Habilidades comunicativas - Redacci├│n de p├írrafos cortos (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (120, 'Desarrollo f├¡sico - Capacidades f├¡sicas b├ísicas');
INSERT INTO public.temas (id, nombre) VALUES (121, 'Desarrollo f├¡sico - Resistencia aer├│bica');
INSERT INTO public.temas (id, nombre) VALUES (122, 'Desarrollo f├¡sico - Flexibilidad');
INSERT INTO public.temas (id, nombre) VALUES (123, 'Formaci├│n deportiva - Deportes colectivos (f├║tbol, baloncesto, voleibol)');
INSERT INTO public.temas (id, nombre) VALUES (124, 'Formaci├│n deportiva - T├®cnicas b├ísicas deportivas');
INSERT INTO public.temas (id, nombre) VALUES (125, 'Formaci├│n deportiva - Reglamento b├ísico deportivo');
INSERT INTO public.temas (id, nombre) VALUES (126, 'Expresi├│n corporal - Danzas folcl├│ricas sencillas');
INSERT INTO public.temas (id, nombre) VALUES (127, 'Expresi├│n corporal - Representaciones esc├®nicas simples');
INSERT INTO public.temas (id, nombre) VALUES (128, 'Comprensi├│n e interpretaci├│n textual - An├ílisis de textos informativos');
INSERT INTO public.temas (id, nombre) VALUES (129, 'Comprensi├│n e interpretaci├│n textual - Identificaci├│n de tesis y argumentos');
INSERT INTO public.temas (id, nombre) VALUES (130, 'Comprensi├│n e interpretaci├│n textual - Contexto hist├│rico de textos');
INSERT INTO public.temas (id, nombre) VALUES (131, 'Producci├│n textual - Textos argumentativos b├ísicos');
INSERT INTO public.temas (id, nombre) VALUES (132, 'Producci├│n textual - Informes y rese├▒as sencillas');
INSERT INTO public.temas (id, nombre) VALUES (133, 'Producci├│n textual - Coherencia y cohesi├│n textual');
INSERT INTO public.temas (id, nombre) VALUES (134, 'Literatura - Literatura universal cl├ísica');
INSERT INTO public.temas (id, nombre) VALUES (135, 'Literatura - Mitolog├¡a griega y romana');
INSERT INTO public.temas (id, nombre) VALUES (136, 'Literatura - G├®neros dram├íticos');
INSERT INTO public.temas (id, nombre) VALUES (137, 'Gram├ítica - Oraciones compuestas coordinadas');
INSERT INTO public.temas (id, nombre) VALUES (138, 'Gram├ítica - Uso de pronombres relativos');
INSERT INTO public.temas (id, nombre) VALUES (139, 'Gram├ítica - Signos de puntuaci├│n avanzados');
INSERT INTO public.temas (id, nombre) VALUES (140, 'Pensamiento num├®rico - N├║meros reales');
INSERT INTO public.temas (id, nombre) VALUES (141, 'Pensamiento num├®rico - Potenciaci├│n y radicaci├│n');
INSERT INTO public.temas (id, nombre) VALUES (142, 'Pensamiento num├®rico - Notaci├│n cient├¡fica');
INSERT INTO public.temas (id, nombre) VALUES (143, 'Pensamiento espacial y geom├®trico - Teorema de Pit├ígoras');
INSERT INTO public.temas (id, nombre) VALUES (144, 'Pensamiento espacial y geom├®trico - Semejanza y congruencia de tri├íngulos');
INSERT INTO public.temas (id, nombre) VALUES (145, 'Pensamiento espacial y geom├®trico - Volumen de cuerpos geom├®tricos');
INSERT INTO public.temas (id, nombre) VALUES (146, 'Pensamiento m├®trico - Conversiones entre sistemas de medidas');
INSERT INTO public.temas (id, nombre) VALUES (147, 'Pensamiento m├®trico - ├ürea de figuras compuestas');
INSERT INTO public.temas (id, nombre) VALUES (148, 'Pensamiento aleatorio - T├®cnicas de conteo');
INSERT INTO public.temas (id, nombre) VALUES (149, 'Pensamiento aleatorio - Probabilidad de eventos compuestos');
INSERT INTO public.temas (id, nombre) VALUES (150, 'Pensamiento aleatorio - Tablas de frecuencia con datos agrupados');
INSERT INTO public.temas (id, nombre) VALUES (151, 'Pensamiento variacional - Funciones lineales');
INSERT INTO public.temas (id, nombre) VALUES (152, 'Pensamiento variacional - Sistemas de ecuaciones lineales 2x2');
INSERT INTO public.temas (id, nombre) VALUES (153, 'Pensamiento variacional - Pendiente e interceptos');
INSERT INTO public.temas (id, nombre) VALUES (154, 'Entorno vivo (Biolog├¡a) - Estructura y funci├│n celular');
INSERT INTO public.temas (id, nombre) VALUES (155, 'Entorno vivo (Biolog├¡a) - Reproducci├│n celular (mitosis y meiosis)');
INSERT INTO public.temas (id, nombre) VALUES (156, 'Entorno vivo (Biolog├¡a) - Sistemas del cuerpo humano (digestivo, respiratorio)');
INSERT INTO public.temas (id, nombre) VALUES (157, 'Entorno vivo (Biolog├¡a) - Gen├®tica mendeliana b├ísica');
INSERT INTO public.temas (id, nombre) VALUES (158, 'Entorno f├¡sico (F├¡sica b├ísica) - Cinem├ítica unidimensional');
INSERT INTO public.temas (id, nombre) VALUES (159, 'Entorno f├¡sico (F├¡sica b├ísica) - Leyes de Newton b├ísicas');
INSERT INTO public.temas (id, nombre) VALUES (160, 'Entorno f├¡sico (F├¡sica b├ísica) - Trabajo, potencia y energ├¡a');
INSERT INTO public.temas (id, nombre) VALUES (161, 'Entorno qu├¡mico (Qu├¡mica b├ísica) - Estructura at├│mica');
INSERT INTO public.temas (id, nombre) VALUES (162, 'Entorno qu├¡mico (Qu├¡mica b├ísica) - Tabla peri├│dica (propiedades peri├│dicas)');
INSERT INTO public.temas (id, nombre) VALUES (163, 'Entorno qu├¡mico (Qu├¡mica b├ísica) - Enlaces qu├¡micos b├ísicos');
INSERT INTO public.temas (id, nombre) VALUES (164, 'Entorno qu├¡mico (Qu├¡mica b├ísica) - Reacciones qu├¡micas sencillas');
INSERT INTO public.temas (id, nombre) VALUES (165, 'Ciencia, tecnolog├¡a y sociedad - Avances cient├¡ficos y su impacto');
INSERT INTO public.temas (id, nombre) VALUES (166, 'Historia - Historia medieval europea');
INSERT INTO public.temas (id, nombre) VALUES (167, 'Historia - Renacimiento y Humanismo');
INSERT INTO public.temas (id, nombre) VALUES (168, 'Historia - Reformas religiosas');
INSERT INTO public.temas (id, nombre) VALUES (169, 'Geograf├¡a - Desarrollo econ├│mico y social mundial');
INSERT INTO public.temas (id, nombre) VALUES (170, 'Geograf├¡a - Sectores econ├│micos');
INSERT INTO public.temas (id, nombre) VALUES (171, 'Geograf├¡a - Geograf├¡a poblacional');
INSERT INTO public.temas (id, nombre) VALUES (172, 'Democracia - Constituci├│n Pol├¡tica de Colombia');
INSERT INTO public.temas (id, nombre) VALUES (173, 'Democracia - Ramas del poder p├║blico');
INSERT INTO public.temas (id, nombre) VALUES (174, 'Democracia - Derechos humanos fundamentales');
INSERT INTO public.temas (id, nombre) VALUES (175, 'Vocabulario - Alimentos y comidas (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (176, 'Vocabulario - Lugares y ubicaciones (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (177, 'Vocabulario - Ocupaciones y oficios (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (178, 'Gram├ítica - Pasado simple y continuo (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (179, 'Gram├ítica - Comparativos y superlativos (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (180, 'Gram├ítica - Futuro con "going to" y "will" (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (181, 'Habilidades comunicativas - Narraci├│n de hechos pasados (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (182, 'Habilidades comunicativas - Elaboraci├│n de planes futuros (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (183, 'Habilidades comunicativas - Comprensi├│n de textos cortos (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (184, 'Desarrollo f├¡sico - Entrenamiento de resistencia');
INSERT INTO public.temas (id, nombre) VALUES (185, 'Desarrollo f├¡sico - Desarrollo de la fuerza');
INSERT INTO public.temas (id, nombre) VALUES (186, 'Desarrollo f├¡sico - Velocidad de reacci├│n');
INSERT INTO public.temas (id, nombre) VALUES (187, 'Formaci├│n deportiva - Deportes individuales (atletismo b├ísico)');
INSERT INTO public.temas (id, nombre) VALUES (188, 'Formaci├│n deportiva - Estrategias b├ísicas de juego');
INSERT INTO public.temas (id, nombre) VALUES (189, 'Formaci├│n deportiva - Arbitraje elemental');
INSERT INTO public.temas (id, nombre) VALUES (190, 'Expresi├│n corporal - Coreograf├¡as simples');
INSERT INTO public.temas (id, nombre) VALUES (191, 'Expresi├│n corporal - Composiciones gimn├ísticas b├ísicas');
INSERT INTO public.temas (id, nombre) VALUES (192, 'Comprensi├│n e interpretaci├│n textual - An├ílisis de textos cient├¡ficos y period├¡sticos');
INSERT INTO public.temas (id, nombre) VALUES (193, 'Comprensi├│n e interpretaci├│n textual - Identificaci├│n de posturas ideol├│gicas');
INSERT INTO public.temas (id, nombre) VALUES (194, 'Comprensi├│n e interpretaci├│n textual - Intertextualidad y contexto');
INSERT INTO public.temas (id, nombre) VALUES (195, 'Producci├│n textual - Ensayo argumentativo estructurado');
INSERT INTO public.temas (id, nombre) VALUES (196, 'Producci├│n textual - Textos period├¡sticos b├ísicos');
INSERT INTO public.temas (id, nombre) VALUES (197, 'Producci├│n textual - Protocolos de presentaci├│n de trabajos');
INSERT INTO public.temas (id, nombre) VALUES (198, 'Literatura - Literatura del Romanticismo y Realismo');
INSERT INTO public.temas (id, nombre) VALUES (199, 'Literatura - Novela latinoamericana del siglo XIX');
INSERT INTO public.temas (id, nombre) VALUES (200, 'Literatura - An├ílisis de obras representativas');
INSERT INTO public.temas (id, nombre) VALUES (201, 'Gram├ítica - Oraciones subordinadas');
INSERT INTO public.temas (id, nombre) VALUES (202, 'Gram├ítica - An├ílisis sint├íctico completo');
INSERT INTO public.temas (id, nombre) VALUES (203, 'Gram├ítica - Marcadores textuales');
INSERT INTO public.temas (id, nombre) VALUES (204, 'Pensamiento num├®rico - N├║meros reales (operaciones avanzadas)');
INSERT INTO public.temas (id, nombre) VALUES (205, 'Pensamiento num├®rico - Sucesiones y series');
INSERT INTO public.temas (id, nombre) VALUES (206, 'Pensamiento num├®rico - Progresiones aritm├®ticas y geom├®tricas');
INSERT INTO public.temas (id, nombre) VALUES (207, 'Pensamiento espacial y geom├®trico - Transformaciones geom├®tricas');
INSERT INTO public.temas (id, nombre) VALUES (208, 'Pensamiento espacial y geom├®trico - C├¡rculo y circunferencia (propiedades)');
INSERT INTO public.temas (id, nombre) VALUES (209, 'Pensamiento espacial y geom├®trico - Geometr├¡a anal├¡tica b├ísica');
INSERT INTO public.temas (id, nombre) VALUES (210, 'Pensamiento m├®trico - Proporcionalidad geom├®trica');
INSERT INTO public.temas (id, nombre) VALUES (211, 'Pensamiento m├®trico - Teorema de Thales');
INSERT INTO public.temas (id, nombre) VALUES (212, 'Pensamiento aleatorio - Medidas de dispersi├│n');
INSERT INTO public.temas (id, nombre) VALUES (213, 'Pensamiento aleatorio - Intervalos de confianza b├ísicos');
INSERT INTO public.temas (id, nombre) VALUES (214, 'Pensamiento aleatorio - An├ílisis estad├¡stico de datos');
INSERT INTO public.temas (id, nombre) VALUES (215, 'Pensamiento variacional - Funciones cuadr├íticas');
INSERT INTO public.temas (id, nombre) VALUES (216, 'Pensamiento variacional - Sistemas de ecuaciones 3x3');
INSERT INTO public.temas (id, nombre) VALUES (217, 'Pensamiento variacional - Inecuaciones lineales');
INSERT INTO public.temas (id, nombre) VALUES (218, 'Entorno vivo (Biolog├¡a) - Teor├¡as de la evoluci├│n');
INSERT INTO public.temas (id, nombre) VALUES (219, 'Entorno vivo (Biolog├¡a) - Selecci├│n natural y adaptaci├│n');
INSERT INTO public.temas (id, nombre) VALUES (220, 'Entorno vivo (Biolog├¡a) - Sistemas del cuerpo humano (circulatorio, nervioso, endocrino)');
INSERT INTO public.temas (id, nombre) VALUES (221, 'Entorno f├¡sico (F├¡sica) - Din├ímica');
INSERT INTO public.temas (id, nombre) VALUES (222, 'Entorno f├¡sico (F├¡sica) - Est├ítica b├ísica');
INSERT INTO public.temas (id, nombre) VALUES (223, 'Entorno f├¡sico (F├¡sica) - Fundamentos de hidrost├ítica');
INSERT INTO public.temas (id, nombre) VALUES (224, 'Entorno qu├¡mico (Qu├¡mica) - Estequiometr├¡a b├ísica');
INSERT INTO public.temas (id, nombre) VALUES (225, 'Entorno qu├¡mico (Qu├¡mica) - Soluciones qu├¡micas (concentraciones)');
INSERT INTO public.temas (id, nombre) VALUES (226, 'Entorno qu├¡mico (Qu├¡mica) - Equilibrio qu├¡mico introductorio');
INSERT INTO public.temas (id, nombre) VALUES (227, 'Ciencia, tecnolog├¡a y sociedad - Biotecnolog├¡a b├ísica');
INSERT INTO public.temas (id, nombre) VALUES (228, 'Ciencia, tecnolog├¡a y sociedad - Problemas ambientales globales');
INSERT INTO public.temas (id, nombre) VALUES (229, 'Historia - Revoluciones burguesas (Americana, Francesa)');
INSERT INTO public.temas (id, nombre) VALUES (230, 'Historia - Revoluci├│n Industrial');
INSERT INTO public.temas (id, nombre) VALUES (231, 'Historia - Independencias latinoamericanas');
INSERT INTO public.temas (id, nombre) VALUES (232, 'Geograf├¡a - Geograf├¡a pol├¡tica mundial');
INSERT INTO public.temas (id, nombre) VALUES (233, 'Geograf├¡a - Geopol├¡tica b├ísica');
INSERT INTO public.temas (id, nombre) VALUES (234, 'Geograf├¡a - Recursos naturales y desarrollo');
INSERT INTO public.temas (id, nombre) VALUES (235, 'Democracia - Sistemas pol├¡ticos comparados');
INSERT INTO public.temas (id, nombre) VALUES (236, 'Democracia - Estado social de derecho');
INSERT INTO public.temas (id, nombre) VALUES (237, 'Democracia - Mecanismos de protecci├│n de derechos');
INSERT INTO public.temas (id, nombre) VALUES (238, 'Vocabulario - Viajes y turismo (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (239, 'Vocabulario - Medios de comunicaci├│n (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (240, 'Vocabulario - Medio ambiente (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (241, 'Gram├ítica - Presente perfecto (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (242, 'Gram├ítica - Modales b├ísicos (can, should, must) (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (243, 'Gram├ítica - Voz pasiva simple (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (244, 'Habilidades comunicativas - Expresi├│n de opiniones (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (245, 'Habilidades comunicativas - Redacci├│n de cartas informales (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (246, 'Habilidades comunicativas - Exposiciones orales cortas (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (247, 'Desarrollo f├¡sico - Sistemas de entrenamiento');
INSERT INTO public.temas (id, nombre) VALUES (248, 'Desarrollo f├¡sico - Planificaci├│n de actividad f├¡sica');
INSERT INTO public.temas (id, nombre) VALUES (249, 'Desarrollo f├¡sico - Evaluaci├│n de condici├│n f├¡sica');
INSERT INTO public.temas (id, nombre) VALUES (250, 'Formaci├│n deportiva - Deportes de conjunto avanzados');
INSERT INTO public.temas (id, nombre) VALUES (251, 'Formaci├│n deportiva - Deportes alternativos');
INSERT INTO public.temas (id, nombre) VALUES (252, 'Formaci├│n deportiva - Programaci├│n deportiva');
INSERT INTO public.temas (id, nombre) VALUES (253, 'Expresi├│n corporal - Montajes coreogr├íficos');
INSERT INTO public.temas (id, nombre) VALUES (254, 'Expresi├│n corporal - Expresi├│n r├¡tmica avanzada');
INSERT INTO public.temas (id, nombre) VALUES (255, 'Comprensi├│n e interpretaci├│n textual - An├ílisis del discurso');
INSERT INTO public.temas (id, nombre) VALUES (256, 'Comprensi├│n e interpretaci├│n textual - Textos filos├│ficos y cient├¡ficos');
INSERT INTO public.temas (id, nombre) VALUES (257, 'Comprensi├│n e interpretaci├│n textual - Macroestructuras textuales');
INSERT INTO public.temas (id, nombre) VALUES (258, 'Producci├│n textual - Ensayo de car├ícter cr├¡tico');
INSERT INTO public.temas (id, nombre) VALUES (259, 'Producci├│n textual - Textos argumentativos complejos');
INSERT INTO public.temas (id, nombre) VALUES (260, 'Producci├│n textual - Rese├▒as cr├¡ticas');
INSERT INTO public.temas (id, nombre) VALUES (261, 'Literatura - Literatura colombiana (desde la Colonia hasta el siglo XX)');
INSERT INTO public.temas (id, nombre) VALUES (262, 'Literatura - Movimientos literarios colombianos');
INSERT INTO public.temas (id, nombre) VALUES (263, 'Literatura - An├ílisis de autores representativos');
INSERT INTO public.temas (id, nombre) VALUES (264, 'Gram├ítica y ling├╝├¡stica - Sem├íntica y pragm├ítica');
INSERT INTO public.temas (id, nombre) VALUES (265, 'Gram├ítica y ling├╝├¡stica - An├ílisis del discurso');
INSERT INTO public.temas (id, nombre) VALUES (266, 'Gram├ítica y ling├╝├¡stica - Variantes ling├╝├¡sticas');
INSERT INTO public.temas (id, nombre) VALUES (267, 'Trigonometr├¡a - ├üngulos y tri├íngulos - Sistemas de medici├│n angular');
INSERT INTO public.temas (id, nombre) VALUES (268, 'Trigonometr├¡a - ├üngulos y tri├íngulos - Teorema del seno y coseno');
INSERT INTO public.temas (id, nombre) VALUES (269, 'Trigonometr├¡a - ├üngulos y tri├íngulos - Soluci├│n de tri├íngulos');
INSERT INTO public.temas (id, nombre) VALUES (270, 'Trigonometr├¡a - Funciones trigonom├®tricas - Funciones seno, coseno, tangente');
INSERT INTO public.temas (id, nombre) VALUES (271, 'Trigonometr├¡a - Funciones trigonom├®tricas - Gr├íficas de funciones trigonom├®tricas');
INSERT INTO public.temas (id, nombre) VALUES (272, 'Trigonometr├¡a - Funciones trigonom├®tricas - Ecuaciones trigonom├®tricas b├ísicas');
INSERT INTO public.temas (id, nombre) VALUES (273, 'Trigonometr├¡a - Identidades trigonom├®tricas - Identidades fundamentales');
INSERT INTO public.temas (id, nombre) VALUES (274, 'Trigonometr├¡a - Identidades trigonom├®tricas - Identidades de suma y diferencia');
INSERT INTO public.temas (id, nombre) VALUES (275, 'Trigonometr├¡a - Identidades trigonom├®tricas - Identidades de ├íngulo doble');
INSERT INTO public.temas (id, nombre) VALUES (276, 'Trigonometr├¡a - Geometr├¡a anal├¡tica b├ísica - La recta en el plano');
INSERT INTO public.temas (id, nombre) VALUES (277, 'Trigonometr├¡a - Geometr├¡a anal├¡tica b├ísica - La circunferencia');
INSERT INTO public.temas (id, nombre) VALUES (278, 'Trigonometr├¡a - Geometr├¡a anal├¡tica b├ísica - Secciones c├│nicas (par├íbola)');
INSERT INTO public.temas (id, nombre) VALUES (279, 'Cinem├ítica - Movimiento rectil├¡neo uniforme');
INSERT INTO public.temas (id, nombre) VALUES (280, 'Cinem├ítica - Movimiento rectil├¡neo uniformemente acelerado');
INSERT INTO public.temas (id, nombre) VALUES (281, 'Cinem├ítica - Movimiento circular uniforme');
INSERT INTO public.temas (id, nombre) VALUES (282, 'Cinem├ítica - Movimiento parab├│lico');
INSERT INTO public.temas (id, nombre) VALUES (283, 'Din├ímica - Leyes de Newton (aplicaciones)');
INSERT INTO public.temas (id, nombre) VALUES (284, 'Din├ímica - Fuerzas de rozamiento');
INSERT INTO public.temas (id, nombre) VALUES (285, 'Din├ímica - Trabajo y energ├¡a');
INSERT INTO public.temas (id, nombre) VALUES (286, 'Din├ímica - Conservaci├│n de la energ├¡a mec├ínica');
INSERT INTO public.temas (id, nombre) VALUES (287, 'Est├ítica - Equilibrio de los cuerpos');
INSERT INTO public.temas (id, nombre) VALUES (288, 'Est├ítica - Momento de una fuerza');
INSERT INTO public.temas (id, nombre) VALUES (289, 'Est├ítica - Centro de gravedad');
INSERT INTO public.temas (id, nombre) VALUES (290, 'Estequiometr├¡a - Leyes ponderales');
INSERT INTO public.temas (id, nombre) VALUES (291, 'Estequiometr├¡a - C├ílculos estequiom├®tricos');
INSERT INTO public.temas (id, nombre) VALUES (292, 'Estequiometr├¡a - Reactivo l├¡mite y rendimiento');
INSERT INTO public.temas (id, nombre) VALUES (293, 'Soluciones - Tipos de soluciones');
INSERT INTO public.temas (id, nombre) VALUES (294, 'Soluciones - Concentraciones f├¡sicas y qu├¡micas');
INSERT INTO public.temas (id, nombre) VALUES (295, 'Soluciones - Propiedades coligativas b├ísicas');
INSERT INTO public.temas (id, nombre) VALUES (296, 'Gases - Leyes de los gases');
INSERT INTO public.temas (id, nombre) VALUES (297, 'Gases - Teor├¡a cin├®tico-molecular');
INSERT INTO public.temas (id, nombre) VALUES (298, 'Gases - Ecuaci├│n de estado de gases ideales');
INSERT INTO public.temas (id, nombre) VALUES (299, 'Equilibrio qu├¡mico - Constante de equilibrio');
INSERT INTO public.temas (id, nombre) VALUES (300, 'Equilibrio qu├¡mico - Principio de Le Chatelier');
INSERT INTO public.temas (id, nombre) VALUES (301, 'Equilibrio qu├¡mico - Equilibrio ├ícido-base');
INSERT INTO public.temas (id, nombre) VALUES (302, 'Econom├¡a - Conceptos b├ísicos econ├│micos');
INSERT INTO public.temas (id, nombre) VALUES (303, 'Econom├¡a - Historia del pensamiento econ├│mico');
INSERT INTO public.temas (id, nombre) VALUES (304, 'Econom├¡a - Sectores econ├│micos');
INSERT INTO public.temas (id, nombre) VALUES (305, 'Econom├¡a - Sistema econ├│mico colombiano');
INSERT INTO public.temas (id, nombre) VALUES (306, 'Ciencias Pol├¡ticas - Teor├¡as pol├¡ticas cl├ísicas');
INSERT INTO public.temas (id, nombre) VALUES (307, 'Ciencias Pol├¡ticas - Estructura del Estado colombiano');
INSERT INTO public.temas (id, nombre) VALUES (308, 'Ciencias Pol├¡ticas - Organismos de control');
INSERT INTO public.temas (id, nombre) VALUES (309, 'Ciencias Pol├¡ticas - Pol├¡ticas p├║blicas');
INSERT INTO public.temas (id, nombre) VALUES (310, 'Historia de la filosof├¡a antigua - Presocr├íticos');
INSERT INTO public.temas (id, nombre) VALUES (311, 'Historia de la filosof├¡a antigua - S├│crates, Plat├│n y Arist├│teles');
INSERT INTO public.temas (id, nombre) VALUES (312, 'Historia de la filosof├¡a antigua - Filosof├¡a helen├¡stica');
INSERT INTO public.temas (id, nombre) VALUES (313, 'Problemas filos├│ficos - Ontolog├¡a b├ísica');
INSERT INTO public.temas (id, nombre) VALUES (314, 'Problemas filos├│ficos - Teor├¡a del conocimiento');
INSERT INTO public.temas (id, nombre) VALUES (315, 'Problemas filos├│ficos - Antropolog├¡a filos├│fica');
INSERT INTO public.temas (id, nombre) VALUES (316, 'Vocabulario - Tecnolog├¡a y ciencia (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (317, 'Vocabulario - Problem├íticas sociales (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (318, 'Vocabulario - Cultura y sociedad (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (319, 'Gram├ítica - Condicionales (tipos 0, 1 y 2) (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (320, 'Gram├ítica - Reported Speech b├ísico (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (321, 'Gram├ítica - Presente perfecto continuo (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (322, 'Habilidades comunicativas - Redacci├│n de ensayos cortos (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (323, 'Habilidades comunicativas - Debates estructurados (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (324, 'Habilidades comunicativas - Comprensi├│n de textos acad├®micos (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (325, 'Entrenamiento avanzado - Principios de entrenamiento');
INSERT INTO public.temas (id, nombre) VALUES (326, 'Entrenamiento avanzado - Planificaci├│n deportiva');
INSERT INTO public.temas (id, nombre) VALUES (327, 'Entrenamiento avanzado - Evaluaci├│n de capacidades f├¡sicas');
INSERT INTO public.temas (id, nombre) VALUES (328, 'Deportes - Reglamentaci├│n deportiva avanzada');
INSERT INTO public.temas (id, nombre) VALUES (329, 'Deportes - Fundamentos t├ícticos');
INSERT INTO public.temas (id, nombre) VALUES (330, 'Deportes - Organizaci├│n de eventos deportivos');
INSERT INTO public.temas (id, nombre) VALUES (331, 'Expresi├│n corporal - Composiciones gimn├ísticas complejas');
INSERT INTO public.temas (id, nombre) VALUES (332, 'Expresi├│n corporal - Actividades r├¡tmicas avanzadas');
INSERT INTO public.temas (id, nombre) VALUES (333, 'Comprensi├│n e interpretaci├│n textual - Literatura contempor├ínea mundial');
INSERT INTO public.temas (id, nombre) VALUES (334, 'Comprensi├│n e interpretaci├│n textual - An├ílisis cr├¡tico de medios de comunicaci├│n');
INSERT INTO public.temas (id, nombre) VALUES (335, 'Comprensi├│n e interpretaci├│n textual - Intertextualidad avanzada');
INSERT INTO public.temas (id, nombre) VALUES (336, 'Producci├│n textual - Textos acad├®micos complejos');
INSERT INTO public.temas (id, nombre) VALUES (337, 'Producci├│n textual - Protocolos de investigaci├│n');
INSERT INTO public.temas (id, nombre) VALUES (338, 'Producci├│n textual - Escritura creativa avanzada');
INSERT INTO public.temas (id, nombre) VALUES (339, 'Literatura - Literatura latinoamericana del siglo XX');
INSERT INTO public.temas (id, nombre) VALUES (340, 'Literatura - Boom latinoamericano');
INSERT INTO public.temas (id, nombre) VALUES (341, 'Literatura - Literatura contempor├ínea');
INSERT INTO public.temas (id, nombre) VALUES (342, 'Ling├╝├¡stica - An├ílisis del discurso avanzado');
INSERT INTO public.temas (id, nombre) VALUES (343, 'Ling├╝├¡stica - Psicoling├╝├¡stica b├ísica');
INSERT INTO public.temas (id, nombre) VALUES (344, 'Ling├╝├¡stica - Socioling├╝├¡stica');
INSERT INTO public.temas (id, nombre) VALUES (345, 'C├ílculo - L├¡mites y continuidad - Concepto de l├¡mite');
INSERT INTO public.temas (id, nombre) VALUES (346, 'C├ílculo - L├¡mites y continuidad - Propiedades de los l├¡mites');
INSERT INTO public.temas (id, nombre) VALUES (347, 'C├ílculo - L├¡mites y continuidad - Continuidad de funciones');
INSERT INTO public.temas (id, nombre) VALUES (348, 'C├ílculo - Derivadas - Concepto de derivada');
INSERT INTO public.temas (id, nombre) VALUES (349, 'C├ílculo - Derivadas - Reglas de derivaci├│n');
INSERT INTO public.temas (id, nombre) VALUES (350, 'C├ílculo - Derivadas - Aplicaciones de la derivada');
INSERT INTO public.temas (id, nombre) VALUES (351, 'C├ílculo - Integrales - Integral indefinida');
INSERT INTO public.temas (id, nombre) VALUES (352, 'C├ílculo - Integrales - M├®todos de integraci├│n b├ísicos');
INSERT INTO public.temas (id, nombre) VALUES (353, 'C├ílculo - Integrales - Integral definida');
INSERT INTO public.temas (id, nombre) VALUES (354, 'C├ílculo - Integrales - Aplicaciones de la integral');
INSERT INTO public.temas (id, nombre) VALUES (355, 'C├ílculo - Geometr├¡a anal├¡tica avanzada - Elipse e hip├®rbola');
INSERT INTO public.temas (id, nombre) VALUES (356, 'C├ílculo - Geometr├¡a anal├¡tica avanzada - Ecuaciones param├®tricas');
INSERT INTO public.temas (id, nombre) VALUES (357, 'Ondas - Movimiento ondulatorio');
INSERT INTO public.temas (id, nombre) VALUES (358, 'Ondas - Ondas sonoras');
INSERT INTO public.temas (id, nombre) VALUES (359, 'Ondas - Efecto Doppler');
INSERT INTO public.temas (id, nombre) VALUES (360, 'Electricidad - Carga el├®ctrica');
INSERT INTO public.temas (id, nombre) VALUES (361, 'Electricidad - Ley de Coulomb');
INSERT INTO public.temas (id, nombre) VALUES (362, 'Electricidad - Campo el├®ctrico');
INSERT INTO public.temas (id, nombre) VALUES (363, 'Electricidad - Circuitos el├®ctricos');
INSERT INTO public.temas (id, nombre) VALUES (364, 'Magnetismo - Campo magn├®tico');
INSERT INTO public.temas (id, nombre) VALUES (365, 'Magnetismo - Inducci├│n electromagn├®tica');
INSERT INTO public.temas (id, nombre) VALUES (366, 'Magnetismo - Ondas electromagn├®ticas');
INSERT INTO public.temas (id, nombre) VALUES (367, 'F├¡sica moderna (introductoria) - Teor├¡a de la relatividad especial');
INSERT INTO public.temas (id, nombre) VALUES (368, 'F├¡sica moderna (introductoria) - F├¡sica cu├íntica b├ísica');
INSERT INTO public.temas (id, nombre) VALUES (369, 'Qu├¡mica org├ínica - Hidrocarburos');
INSERT INTO public.temas (id, nombre) VALUES (370, 'Qu├¡mica org├ínica - Grupos funcionales');
INSERT INTO public.temas (id, nombre) VALUES (371, 'Qu├¡mica org├ínica - Nomenclatura org├ínica');
INSERT INTO public.temas (id, nombre) VALUES (372, 'Qu├¡mica org├ínica - Isomer├¡a');
INSERT INTO public.temas (id, nombre) VALUES (373, 'Cin├®tica qu├¡mica - Velocidad de reacci├│n');
INSERT INTO public.temas (id, nombre) VALUES (374, 'Cin├®tica qu├¡mica - Factores que afectan la velocidad');
INSERT INTO public.temas (id, nombre) VALUES (375, 'Cin├®tica qu├¡mica - Teor├¡a de colisiones');
INSERT INTO public.temas (id, nombre) VALUES (376, 'Electroqu├¡mica - Reacciones redox');
INSERT INTO public.temas (id, nombre) VALUES (377, 'Electroqu├¡mica - Celdas galv├ínicas');
INSERT INTO public.temas (id, nombre) VALUES (378, 'Electroqu├¡mica - Electr├│lisis');
INSERT INTO public.temas (id, nombre) VALUES (379, 'Bioqu├¡mica b├ísica - Carbohidratos, l├¡pidos, prote├¡nas');
INSERT INTO public.temas (id, nombre) VALUES (380, 'Bioqu├¡mica b├ísica - Enzimas y metabolismo');
INSERT INTO public.temas (id, nombre) VALUES (381, 'Econom├¡a - Indicadores econ├│micos');
INSERT INTO public.temas (id, nombre) VALUES (382, 'Econom├¡a - Globalizaci├│n');
INSERT INTO public.temas (id, nombre) VALUES (383, 'Econom├¡a - Desarrollo sostenible');
INSERT INTO public.temas (id, nombre) VALUES (384, 'Ciencias Pol├¡ticas - Relaciones internacionales');
INSERT INTO public.temas (id, nombre) VALUES (385, 'Ciencias Pol├¡ticas - Organismos multilaterales');
INSERT INTO public.temas (id, nombre) VALUES (386, 'Ciencias Pol├¡ticas - Conflictos contempor├íneos');
INSERT INTO public.temas (id, nombre) VALUES (387, 'Historia de la filosof├¡a moderna - Racionalismo y empirismo');
INSERT INTO public.temas (id, nombre) VALUES (388, 'Historia de la filosof├¡a moderna - Kant y el idealismo alem├ín');
INSERT INTO public.temas (id, nombre) VALUES (389, 'Historia de la filosof├¡a moderna - Filosof├¡a contempor├ínea');
INSERT INTO public.temas (id, nombre) VALUES (390, 'Problemas filos├│ficos avanzados - ├ëtica y moral');
INSERT INTO public.temas (id, nombre) VALUES (391, 'Problemas filos├│ficos avanzados - Est├®tica');
INSERT INTO public.temas (id, nombre) VALUES (392, 'Problemas filos├│ficos avanzados - Filosof├¡a pol├¡tica');
INSERT INTO public.temas (id, nombre) VALUES (393, 'Problemas filos├│ficos avanzados - Filosof├¡a de la ciencia');
INSERT INTO public.temas (id, nombre) VALUES (394, 'Vocabulario - Temas acad├®micos especializados (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (395, 'Vocabulario - Expresiones idiom├íticas (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (396, 'Vocabulario - Lenguaje formal e informal (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (397, 'Gram├ítica - Condicionales tipo 3 (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (398, 'Gram├ítica - Reported speech avanzado (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (399, 'Gram├ítica - Estructuras pasivas complejas (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (400, 'Habilidades comunicativas - Ensayos argumentativos (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (401, 'Habilidades comunicativas - Presentaciones formales (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (402, 'Habilidades comunicativas - Preparaci├│n para ex├ímenes internacionales (Ingl├®s)');
INSERT INTO public.temas (id, nombre) VALUES (403, 'Administraci├│n deportiva - Organizaci├│n de torneos');
INSERT INTO public.temas (id, nombre) VALUES (404, 'Administraci├│n deportiva - Planificaci├│n de programas deportivos');
INSERT INTO public.temas (id, nombre) VALUES (405, 'Administraci├│n deportiva - Proyectos deportivos comunitarios');
INSERT INTO public.temas (id, nombre) VALUES (406, 'Salud y bienestar - Estilos de vida saludables');
INSERT INTO public.temas (id, nombre) VALUES (407, 'Salud y bienestar - Prevenci├│n de lesiones');
INSERT INTO public.temas (id, nombre) VALUES (408, 'Salud y bienestar - Primeros auxilios b├ísicos');
INSERT INTO public.temas (id, nombre) VALUES (409, 'Deporte y sociedad - ├ëtica deportiva');
INSERT INTO public.temas (id, nombre) VALUES (410, 'Deporte y sociedad - Deporte y cultura');
INSERT INTO public.temas (id, nombre) VALUES (411, 'Deporte y sociedad - Liderazgo deportivo');


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuarios (id, nombre, email, password, rol) VALUES (1, 'Admin', 'explora@hisque.com.co', '$2b$10$hQmocYT36YnpBozLNrJyoOyEDnoBUHnvlxFliZzyWCBxGms6ALxfW', 'administrador');
INSERT INTO public.usuarios (id, nombre, email, password, rol) VALUES (3, 'Nuevo Usuario', 'nuevo@ejemplo.com', '$2b$10$xi9iZisi18ZKMBKHWqPA6.FLCNBj9/J0bHTW8FZoXguxLLQWa3MO.', 'estudiante');
INSERT INTO public.usuarios (id, nombre, email, password, rol) VALUES (4, 'Juan', 'mira@hisque.com.co', '$2b$10$MWX4kP/tn9T5srfhjCtm.u7nNSCRA0DAmi.WPo.j5Ai2DQC00Tfbi', 'estudiante');


--
-- Name: areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.areas_id_seq', 14, true);


--
-- Name: articulos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.articulos_id_seq', 416, true);


--
-- Name: grados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grados_id_seq', 6, true);


--
-- Name: temas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temas_id_seq', 411, true);


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 4, true);


--
-- Name: areas areas_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.areas
    ADD CONSTRAINT areas_nombre_key UNIQUE (nombre);


--
-- Name: areas areas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id);


--
-- Name: articulos articulos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articulos
    ADD CONSTRAINT articulos_pkey PRIMARY KEY (id);


--
-- Name: grados grados_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grados
    ADD CONSTRAINT grados_nombre_key UNIQUE (nombre);


--
-- Name: grados grados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grados
    ADD CONSTRAINT grados_pkey PRIMARY KEY (id);


--
-- Name: temas temas_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temas
    ADD CONSTRAINT temas_nombre_key UNIQUE (nombre);


--
-- Name: temas temas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temas
    ADD CONSTRAINT temas_pkey PRIMARY KEY (id);


--
-- Name: usuarios usuarios_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: articulos articulos_area_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articulos
    ADD CONSTRAINT articulos_area_id_fkey FOREIGN KEY (area_id) REFERENCES public.areas(id) ON DELETE CASCADE;


--
-- Name: articulos articulos_grado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articulos
    ADD CONSTRAINT articulos_grado_id_fkey FOREIGN KEY (grado_id) REFERENCES public.grados(id) ON DELETE CASCADE;


--
-- Name: articulos articulos_tema_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articulos
    ADD CONSTRAINT articulos_tema_id_fkey FOREIGN KEY (tema_id) REFERENCES public.temas(id) ON DELETE CASCADE;


--
-- Name: articulos articulos_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articulos
    ADD CONSTRAINT articulos_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id) ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

