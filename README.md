# Strimzi commands
A collection of command lines for Strimzi Kafka, as well as some helpful files.

## Resources

| Resource  | Long name | Short name |
| ------------- | ------------- | ------------- |
| Kafka | kafka | k |
| Kafka Topic  | kafkatopic | kt |
| Kafka User | kafkauser | ku |
| Kafka Connect | kafkaconnect  | kc |
| Kafka Connect S2I | kafkaconnects2i  | kcs2i |
| Kafka Connector | kafkaconnector | kctr |
| Kafka Mirror Maker | kafkamirrormaker | kmm |
| Kafka Mirror Maker 2 | kafkamirrormaker2 | kmm2 |
| Kafka Bridge | kafkabridge | kb |
| Kafka Rebalance | kafkarebalance | kr |

[Source](https://strimzi.io/blog/2020/07/22/tips-and-tricks-for-running-strimzi-with-kubectl/)

The commands will usually follow the syntax:
```
kubectl <kubernetes-operator> <strimzi-operator> <args>
```

Example of describing a Kafka topic:
```
kubectl describe kafkatopic <my-topic> -n <namespace>
```

## Commands

List all Strimzi custom resources
```
kubectl get strimzi -n <namespace>
```

Delete all Strimzi custom resources
```
kubectl delete $(kubectl get strimzi -o name) -n <namespace>
```

Inside each dedicated folder is an extensive list of commands and some useful files.

## Table of contents
* [Cluster](https://github.com/ricardocajo/strimzi-commands/tree/main/cluster)
* [Topic](https://github.com/ricardocajo/strimzi-commands/tree/main/topic)
* [User](https://github.com/ricardocajo/strimzi-commands/tree/main/user)
* [K8s Resources](https://github.com/ricardocajo/strimzi-commands/tree/main/k8s-resources)

### Documentation

[Strimzi documentation](https://strimzi.io/documentation/)