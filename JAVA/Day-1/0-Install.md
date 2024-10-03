# How to Install Java, Tomcat and Maven on Ubuntu

## Index

- [Install Java](#install-java-on-ubuntu)
- [Install Apache Tomcat](#install-apache-tomcat-on-ubuntu)
- [Install Maven](#install-maven-on-ubuntu)

## Install Java on Ubuntu

Follow these steps to install Java on your Ubuntu machine:

1. **Update Package Index:**
    Open a terminal and update the package index.

    ```sh
    sudo apt update
    ```

2. **Install Java Development Kit (JDK):**
    Install the default JDK package.

    ```sh
    sudo apt install openjdk-17-jdk
    ```

    > **Note:** You can replace `17` with the latest version number available.
3. **Verify Installation:**
    Check the Java version to verify the installation.

    ```sh
    java -version
    ```

4. **Set JAVA_HOME Environment Variable (Optional):**
    Find the path to the JDK installation.

    ```sh
    sudo update-alternatives --config java
    ```

    Then, add the following lines to your `.bashrc` or `.profile` file.

    ```sh
    export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
    export PATH=$PATH:$JAVA_HOME/bin
    ```

    Apply the changes.

    ```sh
    source ~/.bashrc
    ```

You have successfully installed Java on your Ubuntu machine.

## Install Apache Tomcat on Ubuntu

Follow these steps to install Apache Tomcat on your Ubuntu machine:

1. **Install Java:**
    Ensure that Java is installed on your system. You can follow the steps above to install Java.

2. **Create Tomcat User:**
    Create a new user and group for Tomcat.

    ```sh
    sudo groupadd tomcat
    sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat
    ```

3. **Download Tomcat:**
    Download the latest version of Apache Tomcat from the official website.

    ```sh
    wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.95/bin/apache-tomcat-9.0.95.tar.gz
    ```

4. **Install Tomcat:**
    Extract the downloaded file and move it to `/opt/tomcat`.

    ```sh
    sudo mkdir /opt/tomcat
    sudo tar xzvf apache-tomcat-9.0.95.tar.gz -C /opt/tomcat --strip-components=1
    ```

5. **Update Permissions:**
    Change the ownership of the Tomcat directory.

    ```sh
    sudo chown -R tomcat: /opt/tomcat
    sudo chmod -R 755 /opt/tomcat
    ```

6. **Create Systemd Service File:**
    Create a systemd service file for Tomcat.

    ```sh
    sudo nano /etc/systemd/system/tomcat.service
    ```

    Add the following content to the file:

    ```ini
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
    ```

7. **Reload Systemd and Start Tomcat:**
    Reload the systemd daemon and start the Tomcat service.

    ```sh
    sudo systemctl daemon-reload
    sudo systemctl start tomcat
    sudo systemctl enable tomcat
    ```

8. **Verify Installation:**
    Check the status of the Tomcat service.

    ```sh
    sudo systemctl status tomcat
    ```

You have successfully installed Apache Tomcat on your Ubuntu machine.

## Install Maven on Ubuntu

Follow these steps to install Maven on your Ubuntu machine:

1. **Update Package Index:**
    Open a terminal and update the package index.

    ```sh
    sudo apt update
    ```

2. **Install Maven:**
    Install Maven using the package manager.

    ```sh
    sudo apt install maven
    ```

3. **Verify Installation:**
    Check the Maven version to verify the installation.

    ```sh
    mvn -version
    ```

You have successfully installed Maven on your Ubuntu machine.
