FROM centos:7.5.1804
maintainer yehui 1750371836@qq.com

ENV JAVA_HOME=/usr/java/jdk
ENV CLASSPATH=$CLASSPATH:$JAVA_HOME/lib:$JAVA_HOME/jre/lib
ENV PATH=$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH:$HOMR/bin

ENV ZK_HOME /usr/local/fn/zookeeper

RUN mkdir -p /usr/java/
RUN cd /tmp && \
    curl -L -O -H "Cookie: oraclelicense=accept-securebackup-cookie" -k "http://download.oracle.com/otn-pub/java/jdk/8u141-b15/336fa29ff2bb4ef291e347e091f7f4a7/jdk-8u141-linux-x64.tar.gz" && \
    tar zvxf jdk-8u141-linux-x64.tar.gz -C /usr/java/ && \
    rm -f jdk-8u141-linux-x64.tar.gz && \
    ln -s /usr/java/jdk* /usr/java/jdk && \
    ln -s /usr/java/jdk /usr/java/jvm && 
   

# Define commonly used JAVA_HOME variable
# Add /srv/java and jdk on PATH variable
ENV JAVA_HOME=/usr/java/jdk \
    PATH=${PATH}:/usr/java/jdk/bin:/srv/java
RUN cd /usr/java/ && mv jdk1.8.0_141 jdk && \
    cd /usr/local/fn/ && \
    wget https://archive.apache.org/dist/zookeeper/zookeeper-3.4.9/zookeeper-3.4.9.tar.gz 
    
ADD zookeeper-3.4.9.tar.gz /usr/local/fn/
RUN ln -s /usr/local/fn/zookeeper-3.4.9 ${ZK_HOME}

EXPOSE 2181

ENTRYPOINT ["/usr/local/fn/zookeeper/bin/zkServer.sh","start-foreground","/etc/fn/zookeeper/zoo.cfg"]
