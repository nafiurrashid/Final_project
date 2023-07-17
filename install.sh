
#!/bin/bash

sudo sed -c -i "s/\SELINUX=.*/SELINUX=disabled/" /etc/selinux/config
systemctl stop firewalld
systemctl disable firewalld
yum update -y
yum install -y vim curl wget open-vm-tools bash-completion git mariadb-server java-11-openjdk
systemctl start mariadb
systemctl enable mariadb
export JAVA_HOME=/usr/lib/jvm/jre-openjdk
echo $JAVA_HOME
export PATH=$JAVA_HOME/bin:$PATH
echo $PATH
# Download Apache Maven with certificate verification disabled
wget --no-check-certificate https://dlcdn.apache.org/maven/maven-3/3.9.3/binaries/apache-maven-3.9.3-bin.tar.gz -P /tmp

# Extract Maven archive if it was downloaded successfully
if [ -f "/tmp/apache-maven-3.9.3-bin.tar.gz" ]; then
    tar xf /tmp/apache-maven-3.9.3-bin.tar.gz -C /opt/
    ln -s /opt/apache-maven-3.9.3 /opt/maven
    export M2_HOME=/opt/maven
    echo $M2_HOME
    export MAVEN_HOME=/opt/maven
    echo $MAVEN_HOME
    export PATH=$M2_HOME/bin:$PATH
else
    echo "Failed to download Apache Maven. Check the URL or try again later."
fi

# Append environment variable settings to .bashrc
echo "export JAVA_HOME=/usr/lib/jvm/jre-openjdk" >> ~/.bashrc
echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> ~/.bashrc
echo "export M2_HOME=/opt/maven" >> ~/.bashrc
echo "export MAVEN_HOME=/opt/maven" >> ~/.bashrc
echo "export PATH=\$M2_HOME/bin:\$PATH" >> ~/.bashrc



