-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
datos = LOAD 'data.tsv' USING PigStorage('\t') 
        AS (id:CHARARRAY,
           date:CHARARRAY,
           value:int);
datos1 = ORDER datos BY value ASC;
datos2 = LIMIT datos1 5;
datos3 = FOREACH datos2 GENERATE value; 
STORE datos3 INTO './output' USING PigStorage(' ');