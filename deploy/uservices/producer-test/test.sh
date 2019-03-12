# Producer Throughput: Single producer thread, no replication, no compression
echo "Listing on :" $KAFKA_ADVERTISED_LISTENERS
cd /opt/kafka
echo "Running Tests"
bin/kafka-producer-perf-test.sh --topic test \
--num-records 20000 \
--record-size 240000 \
--throughput 15000000 \
--producer-props \
acks=1 \
bootstrap.servers=$KAFKA_ADVERTISED_LISTENERS \
buffer.memory=67108864 \
compression.type=none \
batch.size=1000000
