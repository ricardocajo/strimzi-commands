#!/bin/bash

namespace="kafka"
label_selector="strimzi.io/kind=Kafka"
max_wait_time=1000
poll_interval=15
desired_pod_count=$(kubectl get pods -n $namespace -l $label_selector --no-headers | wc -l) && \

kubectl annotate secret kafka-certs-clients-ca-cert -n $namespace strimzi.io/force-renew=true -n $namespace && \
kubectl annotate secret kafka-certs-cluster-ca-cert -n $namespace strimzi.io/force-renew=true -n $namespace && \
echo "waiting for reconciliation" && sleep 90 && \

# Initialize variables
wait_time=0

while [ $wait_time -lt $max_wait_time ]; do
  ready_pod_count=$(kubectl get pods -n $namespace -l $label_selector --field-selector=status.phase=Running --no-headers | wc -l) && \

  if [ $ready_pod_count -eq $desired_pod_count ]; then
    echo "All Kafka pods are ready. Rolling restart is complete." && \
    break
  fi

  echo "Ready Pods: $ready_pod_count / $desired_pod_count" && \
  sleep $poll_interval && \
  wait_time=$((wait_time + poll_interval))
done

if [ $wait_time -ge $max_wait_time ]; then
  echo "Rolling restart has not completed within the time limit."
fi

kubectl set image pod/kafka-cli kafka-cli=confluentinc/cp-kafka-connect:latest -n $namespace
