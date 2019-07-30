FROM centos:7
RUN curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
RUN sed -i -e '/mirrors.cloud.aliyuncs.com/d' -e '/mirrors.aliyuncs.com/d' /etc/yum.repos.d/CentOS-Base.repo
RUN yum makecache
RUN yum install -y yum-utils device-mapper-persistent-data lvm2
RUN yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
RUN yum makecache fast
RUN yum -y install docker-ce
COPY ./docker-compose-1.24.1 /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose
#RUN yum -y install openssh-clients
#COPY ./id_rsa /root/.ssh/id_rsa
#RUN chmod 600 /root/.ssh/id_rsa
#COPY ./ssh_config /root/.ssh/config
#RUN chmod 600 /root/.ssh/config