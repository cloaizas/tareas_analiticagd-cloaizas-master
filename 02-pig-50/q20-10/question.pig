-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT
--        firstname,
--        color
--    FROM 
--        u 
--    WHERE 
--       color REGEXP '^[^b]';
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
datos = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
datos1 = FOREACH datos GENERATE firstname, color, SUBSTRING($4, 0, 1) AS letra;
datos2 = FILTER datos1 BY letra != 'b';
datos3 = FOREACH datos2 GENERATE firstname, color;
STORE datos3 INTO './output' using PigStorage(',');
