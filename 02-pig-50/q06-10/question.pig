-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
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


B = FOREACH A GENERATE FLATTEN(c3) AS letra;
C = FOREACH B GENERATE FLATTEN(letra) as llave;
D = GROUP C BY llave;
E = FOREACH D GENERATE group, COUNT(C);
STORE E INTO './output' USING PigStorage(',');