FROM silveringsea/ubuntu:tools

ARG MIRROR=http://mirrors.aliyun.com/
ARG SCALA_VERSION=2.11
ARG KAFKA_VERSION=0.10.1.0

LABEL name="kafka" version=$VERSION

RUN apk update && apk add ca-certificates && \
    apk add tzdata && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone

RUN apk add --no-cache wget bash \
    && mkdir /opt \
    && wget -q -O - $MIRROR/apache/kafka/$KAFKA_VERSION/kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz | tar -xzf - -C /opt \
    && mv /opt/kafka_$SCALA_VERSION-$KAFKA_VERSION /opt/kafka \
	&& sed -i 's/num.partitions.*$/num.partitions=3/g' /opt/kafka/config/server.properties \
	&& sed -i 's%zookeeper.connect=.*$%zookeeper.connect=zookeeper:2181%g'  /opt/kafka/config/server.properties 
	
EXPOSE 9092

ENTRYPOINT ["/opt/kafka/bin/kafka-server-start.sh"]
CMD ["/opt/kafka/config/server.properties"]