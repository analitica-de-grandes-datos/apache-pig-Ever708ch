/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' AS (f1:CHARARRAY, f2:CHARARRAY, f3:CHARARRAY);
data2 = FOREACH data GENERATE FLATTEN(TOKENIZE(f3, '[],#')) AS f3;
data3 = FILTER data2 BY (f3 MATCHES '[a-z][a-z][a-z]');
data4 = GROUP data3 BY f3;
data5 = FOREACH data4 GENERATE group, COUNT(data3);
STORE data5 INTO 'output' USING PigStorage(',');
dump data5;
