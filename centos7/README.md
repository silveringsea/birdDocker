说明如下：

1. 以下用于构建yum源，由于公司网络有所限制，安装依赖包的过程让人泪奔…故果断利用宿主机的中的系统光盘搭建http yum源。

RUN rm -f /etc/yum.repos.d/*
RUN  echo '[BASE]' > /etc/yum.repos.d/base.repo
RUN  echo 'name=base' >> /etc/yum.repos.d/base.repo
RUN  echo 'baseurl=http://192.168.244.132/yum/mnt' >> /etc/yum.repos.d/base.repo
RUN  echo 'enabled=1' >> /etc/yum.repos.d/base.repo
RUN  echo 'gpgcheck=0' >> /etc/yum.repos.d/base.repo

2. 因为centos 7 的系统光盘中没有自带mysql-server，故需要自己下载，正好，mysql社区也提供了基于mysql-serve的yum源，只需在/etc/yum.repos.d/目录下添加以下文件mysql-community.repo文件，内容如下：

[mysql56-community]
name=MySQL 5.6 Community Server
baseurl=http://repo.mysql.com/yum/mysql-5.6-community/el/5/$basearch/
enabled=1
gpgcheck=0

即便是这种方式，下载过程同样让人极度崩溃，无奈，只好自己下载了相关的rpm包，放到本地mysql目录下，通过ADD命令将该目录下的文件COPY到镜像中。注意：/mysql是相对于Dockerfile的相对路径，因为我的Dockerfile的绝对路径为/root/Dockerfile,所以，下面中/mysql中绝对路径实际上也是/root/mysql/。

ADD /mysql /mysql

/root/mysql中的文件如下：

[root@localhost ~]# ls /root/mysql/
mysql-5.6.26-2.el5.x86_64.rpm                   mysql-community-libs-5.6.26-2.el5.x86_64.rpm
mysql-community-client-5.6.26-2.el5.x86_64.rpm  mysql-community-libs-compat-5.6.26-2.el5.x86_64.rpm
mysql-community-common-5.6.26-2.el5.x86_64.rpm  mysql-community-server-5.6.26-2.el5.x86_64.rpm

3. 最后一步实际上用脚本进行启动

脚本内容如下：

[root@localhost ~]# cat /root/startup.sh 
#!/bin/bash
sed -i 's/user name="test"/user name=\"'"$MYCAT_USER"'"/' /usr/local/mycat/conf/server.xml
sed -i 's/name="password">test/name="password">'"$MYCAT_PASS"'/' /usr/local/mycat/conf/server.xml
mysqld_safe & /usr/local/mycat/bin/mycat start & httpd & /usr/local/tomcat/bin/catalina.sh run

在该启动脚本中，利用参数的方式设定mycat的用户名和密码，用户名和密码有Dockerfile中的以下变量指定：

ENV MYCAT_USER mycat
ENV MYCAT_PASS mycat

注意：在创建基于该镜像的容器时，也可通过-e参数显性指定以上两个参数的值，如果没有指定，则用户名和密码的默认值均为Dockerfile中指定的mycat。

验证如下：

1. 基于Docker生成镜像

# docker build -t victor/mycat:v1 .

建议：在利用Dockerfile构建镜像时，可带上--rm=false参数，即 docker build -rm=false -t victor/mycat:v1 .意思是不删除build镜像过程中产生的中间容器，这样的话，即便这次构建失败了，再次构建的时候会直接利用cache容器，会方便快捷很多。

2. 查看生成的镜像

[root@localhost ~]# docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
victor/mycat        v1                  5091cdf7b73a        2 hours ago         1.058 GB

3. 运行容器

# docker run -p 8080:8080 -p 9066:9066 -p 8066:8066 -p 81:80 victor/mycat:v1

首先验证tomcat是否启动

 

再次验证apache是否正常启动，为了避免和本地的http yum源冲突，我这边用的是宿主机的81端口映射容器的80端口

 

验证mycat是否能正常使用

不难看出，基于mycat的默认用户名和密码登陆被拒，必须用指定的用户名和密码.

参考资料：

1> MyCat_安装指南(linux).doc https://github.com/MyCATApache/Mycat-doc/tree/master/%E5%85%A5%E9%97%A8%E6%8C%87%E5%8D%97

2> Mysql yum源地址 http://repo.mysql.com/yum/mysql-5.6-community/el/5/x86_64/

3> CentOS yum安装Apache + PHP + Tomcat7 + MySQL http://www.cnblogs.com/jifeng/p/4074591.html