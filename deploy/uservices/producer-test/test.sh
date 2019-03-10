# Producer Throughput: Single producer thread, no replication, no compression
HOSTNAMEC=`docker info | grep ^Name: | cut -d' ' -f 2`
HOSTNAMEC=192.168.1.66
echo "ZOOKEEPER =" $HOSTNAMEC:2181
echo "SERVERS =" $HOSTNAMEC:9094
echo "Starting to get things started"
cd /opt/kafka
echo "Creating Topics"
bin/kafka-topics.sh --create \
--zookeeper $KAFKA_ZOOKEEPER_CONNECT \
--replication-factor 1 \
--partitions 10 \
--topic test


echo "Running Tests"
bin/kafka-producer-perf-test.sh --topic test \
--num-records 20000 \
--record-size 240000 \
--throughput 15000000 \
--producer-props \
acks=1 \
bootstrap.servers=$KAFKA_ADVERTISED_LISTENERS\
buffer.memory=67108864 \
compression.type=none \
batch.size=1000000
