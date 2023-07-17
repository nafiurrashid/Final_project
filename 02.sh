mysql -h localhost -P 3306 -u root -e "create database sparklmsdb"
git clone https://github.com/nafiursan/YSD_B02_DevOps_Library_Management_System.git
cd YSD_B02_DevOps_Library_Management_System/
mvn clean install
cd target/
java -jar spark-lms-0.0.1-SNAPSHOT.jar --server.port=8090

