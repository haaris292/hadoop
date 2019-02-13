sudo apt-get update -y
wget https://archive.apache.org/dist/hadoop/core/hadoop-2.7.3/hadoop-2.7.3.tar.gz
tar -xvf hadoop-2.7.3.tar.gz
sudo mv hadoop-2.7.3 /usr/local/hadoop
cd /usr/local/hadoop/
cd
#nano .bashrc 
sudo apt-get install openjdk-7-jre
java --version
whereis java
source .bashrc 
java -version
hadoop version
cd /usr/local/hadoop/etc/hadoop/
nano core-site.xml 
nano hdfs-site.xml 
cp mapred-site.xml.template mapred-site.xml
mapred-site.xml
nano yarn-site.xml 
nano hadoop-env.
nano hadoop-env.sh 
#cd bin/
hadoop namenode -format
#cd sbin/
./start-all.sh
apt-get install openjdk-7-jdk 
jps
ssh-keygen
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
bash start-all.sh 
jps
