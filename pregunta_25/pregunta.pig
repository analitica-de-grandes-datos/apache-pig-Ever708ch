/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT  
       firstname,
       SUBSTRING_INDEX(firstname, 'a', 1)
   FROM 
       u;

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.csv' USING PigStorage(',') AS (id: int, firstname: chararray, lastname: chararray, birthday: chararray, color: chararray, num: int);
data2 = FOREACH data GENERATE firstname AS firstname;
data3 = FOREACH data2 GENERATE FLATTEN(SUBSTRING(firstname, 0, INDEXOF(firstname, 'a'))) AS AA;
result = FOREACH data3 GENERATE (AA IS NULL ? -1 :SIZE(AA));
STORE result INTO 'output' USING PigStorage(',');
dump result;
