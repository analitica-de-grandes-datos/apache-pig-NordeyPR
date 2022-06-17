/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
u = LOAD 'data.tsv' AS (f1:chararray ,f2: chararray, f3: int);
r = FOREACH u GENERATE f3;
o = ORDER r BY f3 asc;
s = LIMIT o 5;
STORE s INTO 'output' USING PigStorage(',');