#!/bin/bash

namespace="kafka"
cluster_secret_name="kafka-certs-cluster-ca-cert"
client_secret_name="kafka-certs-clients-ca-cert"

known_cluster_cert=$(kubectl get secret $cluster_secret_name -n $namespace -o=jsonpath='{.data.ca\.crt}' | base64 -d)
known_client_cert=$(kubectl get secret $client_secret_name -n $namespace -o=jsonpath='{.data.ca\.crt}' | base64 -d)

interval_seconds=20  # Interval between checks

clients=("kafka-cli")

while true; do

    current_cluster_cert=$(kubectl get secret $cluster_secret_name -n $namespace -o=jsonpath='{.data.ca\.crt}' | base64 -d)
    current_client_cert=$(kubectl get secret $client_secret_name -n $namespace -o=jsonpath='{.data.ca\.crt}' | base64 -d)

    if [ "$known_cluster_cert" != "$current_cluster_cert" ] || [ "$known_client_cert" != "$current_client_cert" ]; then

        echo "Certificates differ. Client restart needed."

        for client in "${clients[@]}"; do
        
            kubectl set image pod/$client $client=confluentinc/cp-kafka-connect:latest -n $namespace
            known_cluster_cert=$current_cluster_cert
            known_client_cert=$current_client_cert
        done
    else
        echo "Certificates match. No action needed."
    fi

    sleep $interval_seconds
done
