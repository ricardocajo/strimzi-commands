| Resource  | Long name | Short name |
| ------------- | ------------- | ------------- |
| Kafka Topic  | kafkatopic  | kt |

List kafka topics:
```
kubectl get kafkatopic -n <namespace>
```

Create a kafka topic:
```
kubectl apply -f <topic-definition-file.yaml> -n <namespace>
```

Delete a kafka topic:
```
kubectl delete kafkatopic <topic-name> -n <namespace>
```

Describe a kafka topic:
```
kubectl describe kafkatopic <my-topic> -n <namespace>
```

Edit a kafka topic:
```
kubectl edit kafkatopic <topic-name> -n <namespace>
```

Retrieve a kafka topic yaml:
```
kubectl get kafkatopic <topic-name> -n <namespace> -o yaml > kafka-topic.yaml
```

List kafka topics (inside client pod):
```
kafka-topics --list --bootstrap-server kafka-certs-kafka-bootstrap:9093 --command-config /tmp/client.properties
```
