# Basic Web Application in Java

## Steps to Create a Basic Web Application

1. **Set Up Your Development Environment**
    - Install JDK (Java Development Kit).
    - Install Apache Tomcat server. [installation guide](0-Install.md).
    - Install Maven [installation guide](0-Install.md).

2. **Create a New Project**
    - create folder structure for project

    ```bash
    mkdir -p my-webapp/src/main/java my-webapp/src/main/resources my-webapp/src/webapp/WEB-INF



    - src/main/java: This directory will contain your Java source files.
    - src/main/resources: Use this for any resource files your application might need.
    - webapp/WEB-INF: This folder will hold configuration files like web.xml and compiled classes.

3. **Create a Servlet**

    - Create a new Java class that extends `HttpServlet`.
    - Override the `doGet` and/or `doPost` methods to handle HTTP requests.
    - Save the following code in src/main/java/HelloWorldServlet.java:

    ```java
        import java.io.IOException;
        import javax.servlet.ServletException;
        import javax.servlet.annotation.WebServlet;
        import javax.servlet.http.HttpServlet;
        import javax.servlet.http.HttpServletRequest;
        import javax.servlet.http.HttpServletResponse;
        
        @WebServlet("/hello")
        public class HelloWorldServlet extends HttpServlet {
            protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                response.setContentType("text/html");
                response.getWriter().println("<h1>Hello, World!</h1>");
            }
        }
    ```

4. **Configure `web.xml`**
    - Create a `web.xml` file in the `WEB-INF` directory to configure your servlet.

    ```xml
    <web-app>
         <servlet>
              <servlet-name>HelloWorldServlet</servlet-name>
              <servlet-class>HelloWorldServlet</servlet-class>
         </servlet>
         <servlet-mapping>
              <servlet-name>HelloWorldServlet</servlet-name>
              <url-pattern>/hello</url-pattern>
         </servlet-mapping>
    </web-app>
    ```

5. **Create `pom.xml`**
    - Create a `pom.xml` file in the root directory of your project to manage your project's dependencies and build configuration.

    ```xml
    <project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
        <modelVersion>4.0.0</modelVersion>
        <groupId>com.example</groupId>
        <artifactId>my-webapp</artifactId>
        <version>1.0-SNAPSHOT</version>
        <packaging>war</packaging>

        <dependencies>
            <dependency>
                <groupId>javax.servlet</groupId>
                <artifactId>javax.servlet-api</artifactId>
                <version>4.0.1</version>
                <scope>provided</scope>
            </dependency>
        </dependencies>

        <build>
            <plugins>
                <plugin>
                    <groupId>org.apache.maven.plugins</groupId>
                    <artifactId>maven-compiler-plugin</artifactId>
                    <version>3.8.1</version>
                    <configuration>
                        <source>1.8</source>
                        <target>1.8</target>
                    </configuration>
                </plugin>
                <plugin>
                    <groupId>org.apache.maven.plugins</groupId>
                    <artifactId>maven-war-plugin</artifactId>
                    <version>3.2.3</version>
                </plugin>
            </plugins>
        </build>
    </project>
    ```

6. **Build the Project**
    - Compile your project and ensure there are no errors.

    ```sh
    mvn clean compile
    ```

7. **Package the Application into a WAR File**

    ```bash
    mvn clean package
    ```

    This command will generate a `your-app-name.war` file in the `target` directory.

8. **Deploy the WAR File**
    - Copy the WAR file to the `webapps` directory of your Apache Tomcat server.
    - Start the Tomcat server and access your application at `http://localhost:8080/your-app-name/hello`.

    By following these steps, you can create a basic web application in Java, package it into a WAR file, and deploy it on a Tomcat server.

    This command will generate a `your-app-name.war` file in the `target` directory.

9. **Deploy the WAR File**
    - Copy the WAR file to the `webapps` directory of your Apache Tomcat server.

    ```bash
    sudo cp target/my-webapp-1.0-SNAPSHOT.war /opt/tomcat/webapps/

    # to check if its deployed automatically
    ls /opt/tomcat/webapps/

    ```

    - Start the Tomcat server and access your application at `http://localhost:8080/my-webapp-1.0-SNAPSHOT/hello`.

## Conclusion

By following these steps, you can create a basic web application in Java, package it into a WAR file, and deploy it on a Tomcat server.
