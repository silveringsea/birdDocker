sudo docker run --name zookeeper -itd -p2181:2181 silveringsea/zookeeper:v1


如果没有看到，你可能要使用以下命令检查容器启动的logs
sudo docker logs zookeeper
sudo docker logs kafka


.5 验证1
进入kafka容器，创建两个topics，分别叫test1，test2

sudo docker exec -it kafka bash
cd /opt/kafka
source /root/.bash_profile
bin/kafka-topics.sh --create --topic test1 --zookeeper zookeeper:2181 --partition 3 --replication-factor 1
bin/kafka-topics.sh --create --topic test2 --zookeeper zookeeper:2181 --partition 3 --replication-factor 1
bin/kafka-topics.sh --describe --topic test1 --zookeeper zookeeper:2181
bin/kafka-topics.sh --describe --topic test2 --zookeeper zookeeper:2181
bin/kafka-topics.sh --list --zookeeper zookeeper:2181

2016-09-25_7-16-28
启动consumer,以后我把这里叫做consumer端，以示区分。

bin/kafka-console-consumer.sh --zookeeper zookeeper:2181 --topic test1

另外开启一个终端(producer端)，进入kafka容器，启动producer，并发送几条消息。

sudo docker exec -it kafka bash
cd /opt/kafka
source /root/.bash_profile
bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test1

2016-09-25_7-18-07
我们看到cunsumer端，接收到了这些消息。
2016-09-25_7-18-34
2.6 验证2
接下来我们将演示消息转发的功能，将我们刚才在topic test1输入的消息转发给topic test2。
在cunsumer端，启动接收test2

bin/kafka-console-consumer.sh --zookeeper zookeeper:2181 --topic test2

在producer端，使用kafka-replay-log-producer.sh将test1的消息转发给test2

bin/kafka-replay-log-producer.sh --broker-list localhost:9092 --zookeeper zookeeper:2181 --inputtopic test1 --outputtopic test2

2016-09-25_7-20-06
2016-09-25_7-19-46
我们看到cunsumer的test2成功接收到了之前test1的消息，而我刚才并没有重发这些消息，这也验证了kafka的消息是持久化的。


0.8.2.2

http://blog.yaodataking.com/2016/09/kafka-1.html
http://www.scienjus.com/spring-boot-summary/
http://jinnianshilongnian.iteye.com/blog/2020017