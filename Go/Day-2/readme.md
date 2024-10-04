# Summary Day-2

This Go program implements a simple web server that responds with a welcome message. Below is a brief overview of the code:

- **Package Declaration**: The program is part of the `main` package.
- **Imports**: It imports the `fmt` and `net/http` packages.
- **Handler Function**: 
    - `handlerFunc` is an HTTP handler function that writes a welcome message (`<h1>Welcome to my awesome site!</h1>`) to the response writer.
- **Main Function**:
    - Registers the `handlerFunc` for the root URL path (`/`).
    - Prints a message to the console indicating that the server is running on port 3000.
    - Starts the HTTP server on port 3000 and logs any errors.

The server can be accessed by navigating to `http://localhost:3000` in a web browser.

### 0-BasicProject

In this project, we have created a basic Go web server that serves a simple welcome message. Additionally, we have:

- Created a basic project structure for the Go web server.
- Developed a Dockerfile to containerize the application.
- Configured the Docker container to run the application on port 8080.