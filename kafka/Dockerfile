# 设置继承自我们创建的 tools 镜像
FROM silveringsea/ubuntu:tools

# 下面是一些创建者的基本信息
MAINTAINER silveringsea (silveringsea@gmail.com)

# 设置环境变量，所有操作都是非交互式的
ENV DEBIAN_FRONTEND noninteractive

#RUN mkdir /opt \
# wget -q -O - $MIRROR/apache/kafka/$KAFKA_VERSION/kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz | tar -xzf - -C /opt \
# mv /opt/kafka_$SCALA_VERSION-$KAFKA_VERSION /opt/kafka \
# sed -i 's/num.partitions.*$/num.partitions=3/g' /opt/kafka/config/server.properties \
# sed -i 's%zookeeper.connect=.*$%zookeeper.connect=zookeeper:2181%g'  /opt/kafka/config/server.properties 

ADD kafka_2.11-0.10.1.0 /software/kafka

RUN sed -i 's/num.partitions.*$/num.partitions=3/g' /software/kafka/config/server.properties
RUN sed -i 's%zookeeper.connect=.*$%zookeeper.connect=zookeeper:2181%g'  /software/kafka/config/server.properties

EXPOSE 9092

ENTRYPOINT ["/software/kafka/bin/kafka-server-start.sh"]
CMD ["/software/kafka/config/server.properties"]