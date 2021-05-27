-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
A = LOAD 'data.tsv' USING PigStorage('\t') 
        AS (id:CHARARRAY,
           date:CHARARRAY,
           value:int);
B = GROUP A BY id;
C = FOREACH B GENERATE group, COUNT(A);
STORE C INTO './output' USING PigStorage(' ');