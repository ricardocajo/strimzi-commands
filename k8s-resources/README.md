Scale a Kafka broker (ReplicaSet, Deployment, StatefulSet):
```
kubectl scale <resource> <my-kafka-cluster>-kafka -n <namespace> —replicas=<n>
```
Restart client pod:
```
kubectl set image pod/<kafka-cli> <kafka-cli>=confluentinc/cp-kafka-connect:latest -n $namespace
```
