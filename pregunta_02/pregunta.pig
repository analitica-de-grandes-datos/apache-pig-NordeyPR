/*
Pregunta
===========================================================================

Ordene el archivo `data.tsv`  por letra y valor (3ra columna). Escriba el
resultado separado por comas.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

     >>> Escriba el codigo del mapper a partir de este punto <<<
*/
u = LOAD 'data.tsv' AS (f1:CHARARRAY,f2:CHARARRAY, f3: INT);
orden = ORDER u BY f1, f3 asc;
STORE orden INTO 'output' USING PigStorage(',');