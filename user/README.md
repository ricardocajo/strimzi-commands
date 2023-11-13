| Resource  | Long name | Short name |
| ------------- | ------------- | ------------- |
| Kafka User | kafkauser | ku |

List all Kafka users:
```
kubectl get kafkauser -n <namespace>
```

Create a Kafka user:
```
kubectl apply -f <kafka-user.yaml> -n <namespace>
```

Delete a Kafka user:
```
kubectl delete kafkauser <my-user> -n <namespace>
```

Get a kafka user information:
```
kubectl get kafkauser <user-name> -n <namespace>
```

Describe a Kafka user:
```
kubectl describe kafkauser <my-user> -n <namespace>
```

Edit a Kafka user:
```
kubectl edit kafkauser <user-name> -n <namespace>
```

Retrieve a Kafka user yaml:
```
kubectl get kafkauser <user-name> -n <namespace> -o yaml > kafka-user.yaml
```
