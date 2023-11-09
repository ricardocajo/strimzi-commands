### Run producer from inside a pod (inside bin directory)

Get inside a pod (interactive):
```
kubectl exec -it <pod-name> -n <namespace> -- /bin/sh
```

In the brokers, inside the "bin" folder are the default Kafka scripts including the "kafka-console-producer.sh"
```
./kafka-console-producer.sh --property "parse.key=true" --property "key.separator=:" --bootstrap-server=kafka-certs-kafka-bootstrap:9092 --topic=<topic-name>
```

In the kafka-cli, run:
```
kafka-console-producer --topic teste2 --bootstrap-server kafka-certs-kafka-bootstrap:9093 --producer.config /tmp/client.properties
```
