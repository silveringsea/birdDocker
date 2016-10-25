# 构建镜像
$ docker build -t="silveringsea/mysql:v1" .
# 执行已经构件好的镜像
$ docker run -p 9999:22 -p 3306:3306 -t -i -v /docker/mysql/data:/software/mysql-5.6.22/data silveringsea/mysql:v1


# 可以ssh远程登录，然后登录mysql就大功告成了
$ ssh admin@10.211.55.4 -p 9999
# root账号的默认密码是空
$ cd /software/mysql-5.6.22/bin
$ mysql -u root -p

# 修改root密码（因为默认密码为空）
mysql> use mysql;
mysql> UPDATE user SET Password=PASSWORD('你想要的密码') where USER='root';
mysql> FLUSH PRIVILEGES;

# 授权root账户远程登录，然后就可以通过navicat或者其他客户端工具连接到MySQL服务器了
mysql> grant ALL PRIVILEGES ON *.* to root@"%" identified by "root" WITH GRANT OPTION;
mysql> FLUSH PRIVILEGES; 



