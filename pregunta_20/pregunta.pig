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
      color REGEXP '^[^b]';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data2 = FOREACH data GENERATE f2 AS firstname, f5 AS color;
data3 = FILTER data2 BY NOT (color matches '^b.*');
STORE data3 INTO 'output' USING PigStorage(',');
dump data3;
