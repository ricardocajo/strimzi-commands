docker-compose up

docker-compose exec ksqldb-cli ksql http://primary-ksqldb-server:8088


CREATE STREAM TESTE_STREAM (ID INTEGER, VALUE STRING) 
  WITH (KAFKA_TOPIC='teste', KEY_FORMAT='KAFKA', PARTITIONS=2, VALUE_FORMAT='JSON');


SELECT * FROM teste_stream EMIT CHANGES;

SELECT * FROM KSQL_PROCESSING_LOG EMIT CHANGES;



echo '{"id": 1, "value": "message1"}' | docker exec -i processing-log-kafka-1 kafka-console-producer --topic teste --broker-list localhost:9092
