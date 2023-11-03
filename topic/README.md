List kafka topics:
```
kubectl get kafkatopic -n <namespace>
```

Create Kafka topic:
```
kubectl apply -f <topic-definition-file.yaml> -n <namespace>
```

Delete Kafka topic:
```
kubectl delete kafkatopic <topic-name> -n <namespace>
```

Describe a kafka topic:
```
kubectl describe kafkatopic <my-topic> -n <namespace>
```