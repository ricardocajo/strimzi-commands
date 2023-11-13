#!/bin/bash

namespace="kafka"
cluster_secret_name="kafka-certs-cluster-ca-cert"

known_cluster_cert=$(kubectl get secret $cluster_secret_name -n $namespace -o=jsonpath='{.data.ca\.crt}' | base64 -d)
known_ent_op_cert_gen=$(kubectl get pods -n $namespace -l strimzi.io/component-type=entity-operator -o jsonpath='{.items[0].metadata.annotations.strimzi\.io/cluster-ca-cert-generation}')

interval_seconds=30  # Interval between checks

clients=("kafka-cli")

while true; do

    current_cluster_cert=$(kubectl get secret $cluster_secret_name -n $namespace -o=jsonpath='{.data.ca\.crt}' | base64 -d)
    
    if [ "$known_cluster_cert" != "$current_cluster_cert" ]; then

        echo "Certificates differ. Waiting for Entity operator to restart..."

        current_ent_op_cert_gen=$(kubectl get pods -n $namespace -l strimzi.io/component-type=entity-operator -o jsonpath='{.items[0].metadata.annotations.strimzi\.io/cluster-ca-cert-generation}')

        if [ "$known_ent_op_cert_gen" != "$current_ent_op_cert_gen" ]; then

            echo "Entity operator restarted. Restarting clients."

            for client in "${clients[@]}"; do
        
                kubectl delete pod -l app=$client -n $namespace

            done

            known_cluster_cert=$current_cluster_cert
            known_ent_op_cert_gen=$current_ent_op_cert_gen

        fi

    else
        echo "Certificates match. No action needed."
    fi

    sleep $interval_seconds
done
