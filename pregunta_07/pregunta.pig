/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
u = LOAD 'data.tsv' 
    AS (f1:CHARARRAY, f2:BAG{t:TUPLE(p:INT)}, f3:map[]);
 
r = foreach u generate f1 , SIZE(f2) AS len_1 , SIZE(f3) AS len_2;
s = ORDER r BY f1, len_1 asc , len_2 asc ;
STORE s INTO 'output' USING PigStorage(',');