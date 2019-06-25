#!/bin/bash

#capture logs of script
exec &> /var/log/phoenix_hotfix.log

wget  http://private-repo-1.hortonworks.com/HDP/centos7/2.x/updates/2.6.1.125-6/HDP-2.6.1.125-6-centos7-tars-tarball.tar.gz
tar xzf HDP-2.6.1.125-6-centos7-tars-tarball.tar.gz
cd /root/HDP/centos7/2.6.1.125-6/tars/phoenix
tar xzf phoenix-4.7.0.2.6.1.125-6.tar.gz

NEW_PHOENIX='/root/HDP/centos7/2.6.1.125-6/tars/phoenix/phoenix-4.7.0.2.6.1.125-6'

#CUR_PHOENIX='/usr/hdp/3.0.1.0-187/phoenix'
CUR_PHOENIX='/usr/hdp/2.6.1.0-129/phoenix'
PHOENIX_BACKUP = '/usr/hdp/2.6.1.0-129/phoenix-bk'
mkdir -p $PHOENIX_BACKUP

cp -R $CUR_PHOENIX/*  $PHOENIX_BACKUP/


#copy jars from new phoenix to current phoenix
cd $NEW_PHOENIX
##check versions
cp phoenix-4.7.0.2.6.1.125-6-client.jar phoenix-4.7.0.2.6.1.125-6-hive.jar  phoenix-4.7.0.2.6.1.125-6-queryserver.jar phoenix-4.7.0.2.6.1.125-6-server.jar phoenix-4.7.0.2.6.1.125-6-thin-client.jar $CUR_PHOENIX/
rm -f $CUR_PHOENIX/phoenix-4.7.0.2.6.1.0-129-client.jar $CUR_PHOENIX/phoenix-4.7.0.2.6.1.0-129-hive.jar $CUR_PHOENIX/phoenix-4.7.0.2.6.1.0-129-queryserver.jar $CUR_PHOENIX/phoenix-4.7.0.2.6.1.0-129-server.jar $CUR_PHOENIX/phoenix-4.7.0.2.6.1.0-129-thin-client.jar


cd = $CUR_PHOENIX
rm -f phoenix-client.jar phoenix-hive.jar phoenix-server.jar phoenix-thin-client.jar


ln -s phoenix-4.7.0.2.6.1.125-6-client.jar phoenix-client.jar
ln -s phoenix-4.7.0.2.6.1.125-6-hive.jar phoenix-hive.jar
ln -s phoenix-4.7.0.2.6.1.125-6-server.jar phoenix-server.jar
ln -s phoenix-4.7.0.2.6.1.125-6-thin-client.jar phoenix-thin-client.jar


cd $CUR_PHOENIX/
#before removing these take a backup 
rm -f phoenix*129*jar


cd $NEW_PHOENIX/lib

cp phoenix-core-4.7.0.2.6.1.125-6.jar phoenix-core-4.7.0.2.6.1.125-6-sources.jar phoenix-flume-4.7.0.2.6.1.125-6.jar phoenix-hive-4.7.0.2.6.1.125-6.jar phoenix-hive-4.7.0.2.6.1.125-6-sources.jar phoenix-pherf-4.7.0.2.6.1.125-6.jar phoenix-pherf-4.7.0.2.6.1.125-6-minimal.jar phoenix-pherf-4.7.0.2.6.1.125-6-sources.jar phoenix-pig-4.7.0.2.6.1.125-6.jar phoenix-queryserver-4.7.0.2.6.1.125-6.jar phoenix-queryserver-4.7.0.2.6.1.125-6-sources.jar phoenix-queryserver-client-4.7.0.2.6.1.125-6.jar phoenix-spark-4.7.0.2.6.1.125-6.jar phoenix-spark-4.7.0.2.6.1.125-6-sources.jar $CUR_PHOENIX/lib



cd $CUR_PHOENIX/bin/
rm -f end2endTest.py performance.py pherf-cluster.py pherf-standalone.py pherf-standalone.py phoenix_utils.pyc queryserver.py sqlline.py sqlline-thin.py traceserver.py

cd $NEW_PHOENIX/bin
cp end2endTest.py performance.py pherf-cluster.py pherf-standalone.py queryserver.py sqlline.py sqlline-thin.py traceserver.py $CUR_PHOENIX/bin/
