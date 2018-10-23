#!/bin/bash
docker run -d --restart always -h zookeeper-server2 --name zookeeper-server2 -v /server/image/zookeeper/zk/conf/:/etc/fn/zookeeper/:rw -v /server/image/zookeeper/zk/server_id2:/var/lib/zookeeper/ 192.168.1.30/fn_base_images/zookeeper:v1

