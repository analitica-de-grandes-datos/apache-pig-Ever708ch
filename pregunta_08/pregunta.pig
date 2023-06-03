/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' AS (f1:CHARARRAY, f2:BAG{t: TUPLE()}, f3:MAP[]);
data2 = FOREACH data GENERATE FLATTEN(f2), FLATTEN(f3);
data3 = FOREACH data2 GENERATE FLATTEN($0), FLATTEN($1);
data4 = group data3 BY ($0, $1);
data5 = FOREACH data4 GENERATE group, COUNT(data3);
STORE data4 INTO 'output' USING PigStorage('\t');
dump data5;
