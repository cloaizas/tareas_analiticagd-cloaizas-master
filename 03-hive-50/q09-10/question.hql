-- 
-- Pregunta
-- ===========================================================================
--
-- Escriba una consulta que retorne la columna `tbl0.c1` y el valor 
-- correspondiente de la columna `tbl1.c4` para la columna `tbl0.c2`.
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
DROP TABLE IF EXISTS tbl0;
CREATE TABLE tbl0 (
    c1 INT,
    c2 STRING,
    c3 INT,
    c4 DATE,
    c5 ARRAY<CHAR(1)>, 
    c6 MAP<STRING, INT>
)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY ':'
MAP KEYS TERMINATED BY '#'
LINES TERMINATED BY '\n';
LOAD DATA LOCAL INPATH 'tbl0.csv' INTO TABLE tbl0;
--
DROP TABLE IF EXISTS tbl1;
CREATE TABLE tbl1 (
    c1 INT,
    c2 INT,
    c3 STRING,
    c4 MAP<STRING, INT>
)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY ':'
MAP KEYS TERMINATED BY '#'
LINES TERMINATED BY '\n';
LOAD DATA LOCAL INPATH 'tbl1.csv' INTO TABLE tbl1;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
DROP TABLE IF EXISTS consulta;
CREATE TABLE consulta
    AS  
        select t0.c1, t0.c2, t1.c4 from tbl0 t0 join tbl1 t1
        on (t0.c1 = t1.c1);

DROP TABLE IF EXISTS consulta2;
CREATE TABLE consulta2
    AS
        select c1, c2, myValue from consulta
        lateral view explode(c4) table1 AS myKey,myValue
        where myKey=c2;
        
            
INSERT OVERWRITE DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM consulta2;