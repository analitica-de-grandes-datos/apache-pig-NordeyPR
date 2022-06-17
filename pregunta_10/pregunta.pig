/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Genere una relación con el apellido y su longitud. Ordene por longitud y 
por apellido. Obtenga la siguiente salida.

  Hamilton,8
  Garrett,7
  Holcomb,7
  Coffey,6
  Conway,6

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
u = LOAD 'data.csv' USING PigStorage(',') AS (f1:INT , f2: CHARARRAY , f3: CHARARRAY);
r = FOREACH u GENERATE f3 , SIZE(f3) As len;
s = ORDER r BY len desc , f3;
m = LIMIT s 5;
STORE m INTO 'output' USING PigStorage(',');
