| Resource  | Long name | Short name |
| ------------- | ------------- | ------------- |
| Kafka | kafka  | k |

List kafka clusters:
``` 
kubectl get kafka -n <namespace>
```

Create a kafka cluster:
```
kubectl apply -f <kafka-cluster.yaml> -n <namespace>
```

Delete a kafka cluster:
```
kubectl delete kafka <my-kafka-cluster> -n <namespace>
```

Get a kafka cluster information:
```
kubectl get kafka <my-kafka-cluster> -n <namespace>
```

Describe a kafka cluster:
```
kubectl describe kafka <my-kafka-cluster> -n <namespace>
```

Edit a kafka cluster:
```
kubectl edit kafka <kafka-cluster-name> -n <namespace>
```

Retrieve a kafka cluster yaml:
```
kubectl get kafka <my-kafka-cluster> -n <namespace> -o yaml > kafka-cluster.yaml
```
