/*
Pregunta
===========================================================================

El archivo `data.csv` tiene la siguiente estructura:

  driverId       INT
  truckId        INT
  eventTime      STRING
  eventType      STRING
  longitude      DOUBLE
  latitude       DOUBLE
  eventKey       STRING
  correlationId  STRING
  driverName     STRING
  routeId        BIGINT
  routeName      STRING
  eventDate      STRING

Escriba un script en Pig que carge los datos y obtenga los primeros 10 
registros del archivo para las primeras tres columnas, y luego, ordenados 
por driverId, truckId, y eventTime. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

         >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.csv' USING PigStorage(',') AS (
  driverId:INT,
  truckId:INT,
  eventTime:CHARARRAY,
  eventType:CHARARRAY,
  longitude:DOUBLE,
  latitude:DOUBLE,
  eventKey:CHARARRAY,
  correlationId:CHARARRAY,
  driverName:CHARARRAY,
  routeId:INT,
  routeName:CHARARRAY,
  eventDate:CHARARRAY
);
data2 = FOREACH data GENERATE driverId, truckId, eventTime;
data2 = LIMIT data2 10;
data3 = ORDER data2 BY driverId;
STORE data3 INTO 'output' USING PigStorage(',');
dump data3;