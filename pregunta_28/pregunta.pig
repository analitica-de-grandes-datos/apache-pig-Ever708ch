/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       birthday, 
       DATE_FORMAT(birthday, "yyyy"),
       DATE_FORMAT(birthday, "yy"),
   FROM 
       persons
   LIMIT
       5;

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.csv' USING PigStorage(',') AS (item:INT, firstname:CHARARRAY, lastname:CHARARRAY, date:CHARARRAY, color:CHARARRAY, num:INT);
data2 = FOREACH data GENERATE date;
data3 = FOREACH data2 GENERATE FLATTEN(STRSPLIT(date, '-'));
data4 = FOREACH data3 GENERATE $0 AS (year:CHARARRAY);
data5 = FOREACH data4 GENERATE year, SUBSTRING(year, 2, 4);
STORE data5 INTO 'output' USING PigStorage(',');
dump data5;