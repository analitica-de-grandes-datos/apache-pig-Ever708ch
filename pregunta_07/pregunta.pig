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
data = LOAD 'data.tsv' AS (f1:CHARARRAY, f2:BAG{t: TUPLE()}, f3:MAP[]);
data2 = FOREACH data GENERATE f1, COUNT(f2), SIZE(f3);
data3 = ORDER data2 BY f1, $1, $2;
STORE data3 INTO 'output' USING PigStorage(',');
dump data3;