-- Pregunta
-- ===========================================================================
-- 
-- Ordene el archivo `data.tsv`  por letra y valor (3ra columna).
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
--  >>> Escriba el codigo del mapper a partir de este punto <<<
-- 

A = LOAD 'data.tsv' USING PigStorage('\t') 
        AS (id:CHARARRAY,
           date:CHARARRAY,
           value:int);
B = ORDER A BY $0,$2;
STORE B INTO './output' USING PigStorage(' ');