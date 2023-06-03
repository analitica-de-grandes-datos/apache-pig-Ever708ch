/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' USING PigStorage('\t') AS (letra:CHARARRAY, fecha:CHARARRAY, cantidad:INT);
data = FOREACH data GENERATE cantidad;
data = ORDER data BY cantidad ASC;
data = LIMIT data 5;
STORE data INTO 'output' USING PigStorage('\t');
dump data;