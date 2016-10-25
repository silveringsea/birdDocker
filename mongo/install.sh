# 下载Mongo
curl -O https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-ubuntu1404-3.0.7.tgz

# 解压Mongo压缩包
tar -zxvf mongodb-linux-x86_64-ubuntu1404-3.0.7.tgz

# 重命名一下Mongo的安装目录
mv mongodb-linux-x86_64-ubuntu1404-3.0.7/ mongodb-3.0.7

# （不推荐下面的路径直接建立在Docker虚拟机上，推荐使用volume挂载方式）
# 在宿主机上创建一个数据库目录存储Mongo的数据文件
sudo mkdir -p /docker/mongo/data

# 在宿主机上创建一个日志目录存储Mongo的Log文件
sudo mkdir -p /docker/mongo/log

# 在{MONGO_HOME}下创建一个Mongo启动的配置文件
sudo touch mongodb.conf

############# mongodb.conf ################
# port=30000
# dbpath=/mongo/data
# logpath=/mongo/log/mongodb.log
# logappend=true
############# mongodb.conf ################

# 启动mongo时，指定config配置文件
# sudo ./mongod -f ../mongodb.conf

# # 参考：
# https://docs.mongodb.org/master/tutorial/install-mongodb-on-linux/
# http://my.oschina.net/aarongo/blog/349061