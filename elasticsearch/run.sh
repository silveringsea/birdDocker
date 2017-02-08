docker run -p 9999:22 -p 9200:9200 -p 9300:9300 -t -i 'silveringsea/elasticsearch:v1'

docker run -p 9999:22 -p 9200:9200 -p 9300:9300 -t -i 'silveringsea/elasticsearch:v1'

docker run -d -p 9999:22 -p 9200:9200 -p 9300:9300 -t -i 'itzg/elasticsearch'


# https://hub.docker.com/r/itzg/elasticsearch/

docker run -d -p 9999:22 -p 9200:9200 -p 9300:9300 -t -i -v $PWD/elasticsearch/data/:/data --name silsearch 'itzg/elasticsearch'


docker run -d -p 9999:22 -p 9200:9200 -p 9100:9100 -p 9300:9300 -t -i -v $PWD/elasticsearch/data/:/data -e PLUGINS=mobz/elasticsearch-head,jprante/elasticsearch-jdbc --name silsearch 'itzg/elasticsearch'