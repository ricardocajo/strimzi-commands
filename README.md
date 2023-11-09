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

Install the Strimzi Custom Resource Definitions (CRDs) for Kafka (using Helm):
```
helm repo add strimzi https://strimzi.io/charts/
```
```
helm install strimzi-operator strimzi/strimzi-kafka-operator -n <namespace>
```

List all Strimzi custom resources
```
kubectl get strimzi -n <namespace>
```

Delete all Strimzi custom resources
```
kubectl delete $(kubectl get strimzi -o name) -n <namespace>
```

Force certificate renewal:
```
kubectl annotate secret kafka-certs-cluster-ca-cert -n <namespace> strimzi.io/force-renew=true -n <namespace>
```
```
kubectl annotate secret kafka-certs-clients-ca-cert -n <namespace> strimzi.io/force-renew=true -n <namespace>
```

## Table of contents

Inside each dedicated folder is an extensive list of commands and some useful files.

* [Cluster](https://github.com/ricardocajo/strimzi-commands/tree/main/cluster)
* [Topic](https://github.com/ricardocajo/strimzi-commands/tree/main/topic)
* [User](https://github.com/ricardocajo/strimzi-commands/tree/main/user)
* [K8s Resources](https://github.com/ricardocajo/strimzi-commands/tree/main/k8s-resources)

### Documentation

[Strimzi documentation](https://strimzi.io/documentation/)