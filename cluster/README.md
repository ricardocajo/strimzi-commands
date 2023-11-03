List kafka clusters:
``` 
kubectl get kafka -n <namespace>
```

Edit cluster:
```
kubectl edit kafka <kafka-cluster-name> -n <namespace>
```

Create cluster:
```
kubectl apply -f <kafka-cluster.yaml> -n <namespace>
```

Delete cluster:
```
kubectl delete kafka <my-kafka-cluster> -n <namespace>
```

Get kafka cluster information:
```
kubectl get kafka <my-kafka-cluster> -n <namespace>
```

Describe a kafka cluster:
```
kubectl describe kafka <my-kafka-cluster> -n <namespace>
```

Retrieve cluster yaml:
```
kubectl get kafka <my-kafka-cluster> -n <namespace> -o yaml > kafka-cluster.yaml
```
