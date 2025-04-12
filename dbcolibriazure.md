# Base de datos de Azure para Co-Libri

## user
exploracolibri
## password
fHijP7qFB99rr4V

## DB
educacionazure

## Host
colibridb.postgres.database.azure.com

## Comando para conectarse desde PowerShell Terminal a PostgreSQL
psql -h colibridb.postgres.database.azure.com -U exploracolibri -d educacionazure -p 5432

## Ver todas las tablas en la base de datos actual

\dt

Esto mostrará una lista con todas las tablas visibles en el esquema público.

## Mostrar la estructura de una tabla específica
Si ya identificaste una tabla y quieres ver su estructura (columnas y tipos de datos), usa:

\d nombre_de_la_tabla

## Mostrar los datos de una tabla
Para ver los primeros 20 registros de una tabla, usa:

SELECT * FROM nombre_de_la_tabla LIMIT 20;

Para verlos por id de forma ascendente:

SELECT * FROM nombre_de_la_tabla ORDER BY id ASC LIMIT 20;

## Para exportar una tabla.

Ejemplo con la tabla articulos:

\copy (SELECT json_agg(articulos) FROM articulos) TO 'C:\ProyectosSoftware\Co-Libri Learning\co-libri\articulos.json' WITH (FORMAT text);

