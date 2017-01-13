## 使用

Couln't start Elasticsearch. Exiting.


sudo docker run -p 5601:5601 -p 9200:9200 -p 9300:9300 -p 5044:5044 -it -e LOGSTASH_START=0 -e KIBANA_START=0 --name elk sebp/elk

### 端口
5601 kibana
5044 logstash 

docker run -p 5601:5601 -p 9200:9200 -p 9300:9300 -p 5044:5044 -it  -e LOGSTASH_START=0 -e ELASTICSEARCH_START=0 -e KIBANA_START=0 -e ES_HEAP_SIZE="2g" -e LS_HEAP_SIZE="1g" -e LS_OPTS="--no-auto-reload" --name elk sebp/elk

docker run -p 5601:5601 -p 9200:9200 -p 9300:9300 -p 5044:5044 -it  -e LOGSTASH_START=0 -e ELASTICSEARCH_START=0  -e ES_HEAP_SIZE="2g" -e LS_HEAP_SIZE="1g" -e LS_OPTS="--no-auto-reload" --name elk sebp/elk

### 参考
http://elk-docker.readthedocs.io/#running-with-kitematic
http://blog.csdn.net/birdben/article/details/50361557




