# 需要提前安装ssh
#apt-get install ssh
#apt-get install openssh-server

设置免密码登录，生成私钥和公钥
ssh-keygen -t rsa -P ""
cat ~/.ssh/id_rsa.put >> ~/.ssh/authorized_keys

测试是否可以免密码登录
ssh localhost

下载Hadoop
curl -O http://mirrors.cnnic.cn/apache/hadoop/common/hadoop-2.7.1/hadoop-2.7.1.tar.gz

解压Hadoop压缩包
tar -xf hadoop-2.7.1.tar.gz