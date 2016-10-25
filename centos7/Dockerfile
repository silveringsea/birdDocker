from centos:7
MAINTAINER silveringsea@gmail.com
RUN yum -y install wget
RUN wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo

#install java8
#ADD jdk-8u51-linux-x64.gz /usr/local
#RUN ln -s /usr/local/jdk1.8.0_51 /usr/local/java
#ENV JAVA_HOME /usr/local/java
#ENV PATH $PATH:$JAVA_HOME/bin
RUN yum -y install java-1.8.0-openjdk

#install tomcat
ADD apache-tomcat-8.5.6.tar.gz /usr/local
RUN ln -s /usr/local/apache-tomcat-7.0.67 /usr/local/tomcat

#install mysql
#ADD mariadb-5.5.36-linux-x86_64.tar.gz /usr/local
#RUN groupadd  -r  mysql && useradd -g mysql -r mysql
#RUN ln -s /usr/local/mariadb-5.5.36-linux-x86_64 /usr/local/mysql
#RUN chown -R mysql:mysql /usr/local/mysql/data
#RUN /usr/local/mysql/scripts/mysql_install_db --user=mysql --datadir=/usr/local/mysql/data --basedir=/usr/local/mysql
RUN yum -y install mariadb-server mariadb
RUN /usr/bin/mysql_install_db --user=mysql --datadir=/var/lib/mysql

#install mycat
# Run wget http://dl.mycat.io/1.6-RELEASE/Mycat-server-1.6-RELEASE-20161019160041-linux.tar.gz
ADD Mycat-server-1.6-RELEASE-20161019160041-linux.tar.gz /opt
COPY ./schema.xml /opt/mycat/conf
ENV MYCAT_USER mycatuser
ENV MYCAT_PASS mycatpass
RUN cp /opt/mycat/conf/server.xml /opt/mycat/conf/server.xml_bak
RUN sed -i 's/user name="test"/user name=\"'"$MYCAT_USER"'"/' /opt/mycat/conf/server.xml && sed -i 's/name="password">test/name="password">'"$MYCAT_PASS"'/' /opt/mycat/conf/server.xml

## 8066 which is mycat 
EXPOSE 8080 8066 9066
COPY ./startup.sh .
ENTRYPOINT ./startup.sh