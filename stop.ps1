# Stop Zookeeper
cd $Env:KAFKA_HOME\bin\windows; .\zookeeper-server-stop.bat
# Stop Kafka Broker
cd $Env:KAFKA_HOME\bin\windows; .\kafka-server-stop.bat

cd $Env:KAFKA_HOME