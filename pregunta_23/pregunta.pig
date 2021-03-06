/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname,
       color 
   FROM 
       u 
   WHERE 
       color REGEXP '[aeiou]$';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

lines = LOAD 'data.csv' USING PigStorage (',') AS (f1:INT, f2:CHARARRAY, f3:CHARARRAY, f4:DATETIME, f5:CHARARRAY);
extraer = FOREACH lines GENERATE f2,f5;
b = FILTER extraer BY ENDSWITH (f5 ,'a') OR ENDSWITH (f5 ,'a') OR ENDSWITH (f5 ,'e') OR ENDSWITH (f5 ,'i') OR ENDSWITH (f5 ,'o') OR ENDSWITH (f5 ,'u');
STORE b INTO 'output' USING PigStorage (',');
