/* 
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra.
Almacene los resultados separados por comas. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
-- docker run --rm -it --name pig -p 50070:50070 -p 8088:8088 -p 8888:8888 -v "%cd%":/workspace jdvelasq/pig:0.17.0
data = LOAD 'data.tsv' USING PigStorage('\t') AS (letra:CHARARRAY, fecha:CHARARRAY, valor:INT);
grouped = GROUP data BY letra;
counted = FOREACH grouped GENERATE group, COUNT(data);
STORE counted INTO 'output' USING PigStorage(',');

dump counted;