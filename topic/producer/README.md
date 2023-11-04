### Run producer from inside a pod (inside bin directory)

Get inside a pod (interactive):
```
kubectl exec -it <pod-name> -n <namespace> -- /bin/sh
```

Inside the "bin" folder are the default Kafka scripts including the "kafka-console-producer.sh"
```
./kafka-console-producer.sh --property "parse.key=true" --property "key.separator=:" --bootstrap-server=kafka-certs-kafka-bootstrap:9092 --topic=<topic-name>
```
