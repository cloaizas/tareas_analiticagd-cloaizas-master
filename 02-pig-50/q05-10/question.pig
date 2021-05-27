-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

A = LOAD 'data.tsv' USING PigStorage('\t') 
        AS (c1:CHARARRAY,
           c2:bag {T:(t1:CHARARRAY)},
           c3:map[]);
B = FOREACH A GENERATE FLATTEN(c2) AS letra, c1;
C = GROUP B BY letra;
D = FOREACH C GENERATE group, COUNT(B);
STORE D INTO './output' USING PigStorage(' ');