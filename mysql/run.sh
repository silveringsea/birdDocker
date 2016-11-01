使用mysql镜像
运行容器

runoob@runoob:~/mysql$ docker run -p 3306:3306 --name mymysql -v $PWD/conf/my.cnf:/etc/mysql/my.cnf -v $PWD/logs:/logs -v $PWD/data:/mysql_data -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.6


docker run -p 3306:3306 --name mymysql -v $PWD/my.cnf:/etc/mysql/my.cnf -v $PWD/logs:/logs -v $PWD/data:/mysql_data -e MYSQL_ROOT_PASSWORD=123456 -d mysql

21cb89213c93d805c5bacf1028a0da7b5c5852761ba81327e6b99bb3ea89930e
runoob@runoob:~/mysql$ 


### 稀奇古怪的报错：
D:\DockerToolbox\docker.exe: Error response from daemon: invalid header field value "oci runtime error: container_linux.go:247: starting container process cause
d \"process_linux.go:359: container init caused \\\"rootfs_linux.go:53: mounting
 \\\\\\\"/f/javaprj/birdDocker/centos7/conf/my.cnf\\\\\\\" to rootfs \\\\\\\"/mn
t/sda1/var/lib/docker/aufs/mnt/36e6f5dc95e539c90c0e608026431e9088613085526c53efa
7e6479344327884\\\\\\\" at \\\\\\\"/mnt/sda1/var/lib/docker/aufs/mnt/36e6f5dc95e
539c90c0e608026431e9088613085526c53efa7e6479344327884/etc/mysql/mysql.cnf\\\\\\\
" caused \\\\\\\"not a directory\\\\\\\"\\\"\"\n".
 --name mymysql  
 -v $PWD/logs:/logs -v $PWD/data:/mysql_data 


docker run -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 mysql

docker run -p 3306:3306 --name mymysql  -e MYSQL_ROOT_PASSWORD=123456 -d mysql -v $PWD/conf/my.cnf:/etc/mysql/my.cnf  -v $PWD/logs:/logs -v $PWD/data:/mysql_data -e MYSQL_ROOT_PASSWORD=123456  mysql

 -e MYSQL_ROOT_PASSWORD=123456
命令说明：

    -p 3306:3306：将容器的3306端口映射到主机的3306端口

    -v $PWD/conf/my.cnf:/etc/mysql/my.cnf：将主机当前目录下的conf/my.cnf挂载到容器的/etc/mysql/my.cnf

    -v $PWD/logs:/logs：将主机当前目录下的logs目录挂载到容器的/logs

    -v $PWD/data:/mysql_data：将主机当前目录下的data目录挂载到容器的/mysql_data

    -e MYSQL_ROOT_PASSWORD=123456：初始化root用户的密码

查看容器启动情况

runoob@runoob:~/mysql$ docker ps 
CONTAINER ID    IMAGE         COMMAND                  ...  PORTS                    NAMES
21cb89213c93    mysql:5.6    "docker-entrypoint.sh"    ...  0.0.0.0:3306->3306/tcp   mymysql