#!/bin/bash

# Function to install Java
install_java() {
    echo "Updating package index..."
    sudo apt update

    echo "Installing Java Development Kit (JDK)..."
    sudo apt install -y openjdk-17-jdk

    echo "Verifying Java installation..."
    java -version

    echo "Setting JAVA_HOME environment variable..."
    JAVA_HOME_PATH=$(sudo update-alternatives --config java | grep -oP '(?<=/usr/lib/jvm/)[^ ]+')
    echo "export JAVA_HOME=/usr/lib/jvm/$JAVA_HOME_PATH" >> ~/.bashrc
    echo "export PATH=\$PATH:\$JAVA_HOME/bin" >> ~/.bashrc

    echo "Applying changes..."
    source ~/.bashrc

    echo "Java installation completed."
}

# Function to install Apache Tomcat
install_tomcat() {
    echo "Creating Tomcat user and group..."
    sudo groupadd tomcat
    sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat

    echo "Downloading Apache Tomcat..."
    wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.95/bin/apache-tomcat-9.0.95.tar.gz

    echo "Installing Apache Tomcat..."
    sudo mkdir /opt/tomcat
    sudo tar xzvf apache-tomcat-9.0.95.tar.gz -C /opt/tomcat --strip-components=1

    echo "Updating permissions..."
    sudo chown -R tomcat: /opt/tomcat
    sudo chmod -R 755 /opt/tomcat

    echo "Creating systemd service file for Tomcat..."
    sudo bash -c 'cat <<EOF > /etc/systemd/system/tomcat.service
[Unit]
Description=Apache Tomcat Web Application Container
After=network.target

[Service]
Type=forking

User=tomcat
Group=tomcat

Environment="JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64"
Environment="CATALINA_PID=/opt/tomcat/temp/tomcat.pid"
Environment="CATALINA_HOME=/opt/tomcat"
Environment="CATALINA_BASE=/opt/tomcat"
Environment="CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC"
Environment="JAVA_OPTS=-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom"

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh

[Install]
WantedBy=multi-user.target
EOF'

    echo "Reloading systemd daemon and starting Tomcat..."
    sudo systemctl daemon-reload
    sudo systemctl start tomcat
    sudo systemctl enable tomcat

    echo "Verifying Tomcat installation..."
    sudo systemctl status tomcat

    echo "Apache Tomcat installation completed."
}

# Function to install Maven
install_maven() {
    echo "Updating package index..."
    sudo apt update

    echo "Installing Maven..."
    sudo apt install -y maven

    echo "Verifying Maven installation..."
    mvn -version

    echo "Maven installation completed."
}

# Main script execution
install_java
install_tomcat
install_maven

echo "Java, Apache Tomcat, and Maven have been successfully installed on your Ubuntu machine."