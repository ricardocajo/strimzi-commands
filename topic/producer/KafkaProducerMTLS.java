package org.example;

import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.Producer;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.common.serialization.StringSerializer;

import java.util.Properties;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;

public class KafkaProducerMTLS {

    private final Producer<String, String> producer;

    public KafkaProducerMTLS() {
        Properties props = new Properties();
        props.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, "your-bootstrap-server:9093");
        props.put(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName());
        props.put(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName());

        // Configure SSL properties for mutual TLS
        props.put("security.protocol", "SSL");
        props.put("ssl.truststore.location", "/path/to/truststore.jks");
        props.put("ssl.truststore.password", "your-truststore-password");
        props.put("ssl.keystore.location", "/path/to/client-keystore.p12");
        props.put("ssl.keystore.password", "your-client-keystore-password");
        props.put("ssl.key.password", "your-client-key-password");
        props.put("ssl.keystore.type", "PKCS12");

        producer = new KafkaProducer<>(props);
    }

    public static void main(String[] args) throws ExecutionException, InterruptedException {
        KafkaProducerMTLS myProd = new KafkaProducerMTLS();
        myProd.produce();
    }

    public void produce() throws ExecutionException, InterruptedException {
        Future future = producer.send(new ProducerRecord<>("teste", "a", "b"));
        future.get();
    }
}
