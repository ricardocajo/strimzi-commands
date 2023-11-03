# Strimzi commands
A collection of command lines for strimzi kafka, as well as some helpful files.

List all strimzi custom resources
```
kubectl get strimzi -n <namespace>
```

Delete all strimzi custom resources
```
kubectl delete $(kubectl get strimzi -o name) -n <namespace>
```


Resources:

Resource	Long name	Short name
Kafka	kafka	k
Kafka Topic	kafkatopic	kt
Kafka User	kafkauser	ku
Kafka Connect	kafkaconnect	kc
Kafka Connect S2I	kafkaconnects2i	kcs2i
Kafka Connector	kafkaconnector	kctr
Kafka Mirror Maker	kafkamirrormaker	kmm
Kafka Mirror Maker 2	kafkamirrormaker2	kmm2
Kafka Bridge	kafkabridge	kb
Kafka Rebalance	kafkarebalance	kr

The commands will usually follow the syntax
```
kubectl <kubernetes-operator> <strimzi-operator> <args>
```

Example, describe a kafka topic:
```
kubectl describe kafkatopic <my-topic> -n <namespace>
```

Inside each folder are an extensive list of commands and some useful files
