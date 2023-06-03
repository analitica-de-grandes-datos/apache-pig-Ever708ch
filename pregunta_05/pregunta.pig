/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' AS (f1:CHARARRAY, f2:CHARARRAY, f3:CHARARRAY);
data2 = FOREACH data GENERATE FLATTEN(TOKENIZE(f2)) AS letra;
data3 = FILTER data2 BY letra MATCHES '[a-z]';
data4 = GROUP data3 BY letra;
data5 = FOREACH data4 GENERATE group, COUNT(data3);
STORE data5 INTO 'output' USING PigStorage(',');
dump data5;

