/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       REGEX_EXTRACT(birthday, '....-..-..', 2) 
   FROM 
       u;

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.csv' USING PigStorage(',') AS (f1:CHARARRAY, f2:CHARARRAY, f3:CHARARRAY, f4:CHARARRAY, f5:CHARARRAY, f6:CHARARRAY);
data2 = FOREACH data GENERATE f4 AS birthday;
data3 = FOREACH data2 GENERATE FLATTEN(STRSPLIT (birthday, '-'));
data4 = FOREACH data3 GENERATE $1;
STORE data4 INTO 'output' USING PigStorage(',');
dump data4;

