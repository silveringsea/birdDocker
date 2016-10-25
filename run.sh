continerid=`sudo docker images|grep silveringsea/elasticsearch|grep v1|awk '{print $3}'`
uid=`whoami`
#sudo docker run -itd -p 9999:22 -p 9200:9200 -p 9300:9300 --name elasticsearch-${uid} ${continerid} /bin/bash
sudo docker run -itd -p 9999:22 -p 9200:9200 -p 9300:9300 --name elasticsearch-${uid} ${continerid}


docker run -p 9999:22 -p 3306:3306 -t -i -v /docker/mysql/data:/software/mysql-5.6.22/data silveringsea/mysql:v1