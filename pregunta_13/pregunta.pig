/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta en SQL.

   SELECT
       color
   FROM 
       u 
   WHERE 
       color 
   LIKE 'b%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

u = LOAD 'data.csv' USING PigStorage(',') AS (f1:INT , f2: CHARARRAY , f3: CHARARRAY , f4: CHARARRAY , f5: CHARARRAY );
r = FOREACH u GENERATE f5;
m = filter r by f5 matches '.*(b).*';
STORE m INTO 'output' USING PigStorage(',');
