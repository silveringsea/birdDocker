docker run -p 3680:3680 -t -i -v $PWD/conf:/conf "silveringsea/redis:orig" redis-server /conf/3680.conf

docker run -p 6379:6379 -v $PWD/data:/data  -d redis:3.2 redis-server --appendonly yes