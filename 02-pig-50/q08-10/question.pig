-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
-- columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
-- columna 3 es:
-- 
--   ((b,jjj), 216)
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
datos = LOAD 'data.tsv' using PigStorage('\t') AS (letra:CHARARRAY, bolsa:bag{(a:CHARARRAY)},mapa:map[]);
datos1 = FOREACH datos GENERATE bolsa, mapa;
datos2 = FOREACH datos1 GENERATE FLATTEN($0),FLATTEN($1);
datos3 =  FOREACH datos2 GENERATE $0,$1;
datos4 = GROUP datos3 BY ($0, $1);
conteo = FOREACH datos4 GENERATE group, COUNT(datos3);
STORE conteo INTO './output' using PigStorage('\t');