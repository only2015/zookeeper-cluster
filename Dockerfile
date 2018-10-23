FROM centos:7.5.1804
maintainer yehui 1750371836@qq.com

ENV JAVA_HOME=/usr/java/jdk
ENV CLASSPATH=$CLASSPATH:$JAVA_HOME/lib:$JAVA_HOME/jre/lib
ENV PATH=$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH:$HOMR/bin

ENV ZK_HOME /usr/local/fn/zookeeper

RUN mkdir -p /usr/java/
ADD jdk-8u121-linux-x64.tar.gz /usr/java/
RUN cd /usr/java/ && mv jdk1.8.0_121 jdk

ADD zookeeper-3.4.9.tar.gz /usr/local/fn/
RUN ln -s /usr/local/fn/zookeeper-3.4.9 ${ZK_HOME}

EXPOSE 2181

ENTRYPOINT ["/usr/local/fn/zookeeper/bin/zkServer.sh","start-foreground","/etc/fn/zookeeper/zoo.cfg"]
