############################################
# version : silveringsea/kibana:v1
# desc : 当前版本安装的kibana
############################################
# 设置继承自我们创建的 tools 镜像
FROM silveringsea/tools:v1

# 下面是一些创建者的基本信息
MAINTAINER silveringsea (silveringsea@gmail.com)

# 设置环境变量，所有操作都是非交互式的
ENV DEBIAN_FRONTEND noninteractive

# 添加 supervisord 的配置文件，并复制配置文件到对应目录下面。（supervisord.conf文件和Dockerfile文件在同一路径）
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# 设置 KIBANA 的环境变量，若读者有其他的环境变量需要设置，也可以在这里添加。
ENV KIBANA_HOME /software/kibana-4.1.2

# 复制 kibana-4.1.2 文件到镜像中（kibana-4.1.2文件夹要和Dockerfile文件在同一路径）
ADD kibana-4.1.2 /software/kibana-4.1.2

# 容器需要开放Kibana的5601端口
EXPOSE 5601

# 执行supervisord来同时执行多个命令，使用 supervisord 的可执行路径启动服务。
CMD ["/usr/bin/supervisord"]