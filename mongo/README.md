## 默认的run
docker run -p 27017:30000 -t -i -v /docker/mongodb:/mongodb "silveringsea/mongodb:v1"


    docker run -it -p 27017:27017 -v $PWD/db:/data/db  mongo