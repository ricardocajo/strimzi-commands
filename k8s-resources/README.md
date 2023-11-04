Scale a Kafka broker (ReplicaSet, Deployment, StatefulSet):
```
kubectl scale <resource> <my-kafka-cluster>-kafka -n <namespace> —replicas=<n>
```
