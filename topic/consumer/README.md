### Run consumer from inside a pod (inside bin directory)

Get inside a pod (interactive):
```
kubectl exec -it <pod-name> -n <namespace> -- /bin/sh
```

In the brokers, inside the "bin" folder are the default Kafka scripts including the "kafka-console-consumer.sh"
```
./kafka-console-consumer.sh --property=print.key=true --property=print.partition=true --property=print.offset=true --bootstrap-server=kafka-certs-kafka-bootstrap:9092 --topic=<topic-name> --from-beginning
```

In the kafka-cli, run:
```
kafka-console-consumer --topic <topic-name> --bootstrap-server kafka-certs-kafka-bootstrap:9093 --consumer.config /tmp/client.properties --from-beginning
```
