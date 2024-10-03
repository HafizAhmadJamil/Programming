# Hello World in Go

This guide will help you create a basic "Hello, World!" application in Go on an Ubuntu system.

## Prerequisites

- Ubuntu system
- Go installed (If not installed, follow the [official installation guide](https://golang.org/doc/install)) OR [installation guide](0-Install.md).

## Steps

1. **Create a new directory for your project:**

    ```sh
    mkdir -p ~/go/go_projects/hello_world
    cd ~/go/go_projects/hello_world
    ```

2. **Initialize a new Go module:**

    ```sh
    go mod init hello_world
    ```

3. **Create the main Go file:**

    ```sh
    vi main.go
    ```

    Press `i` to enter insert mode.

4. **Write the Hello World code:**

    ```go
    package main

    import "fmt"

    func main() {
        fmt.Println("Hello, World!")
    }
    ```

   write your code, then press `ESC` to exit insert mode. Type `:wq` and press `ENTER` to save and exit.

5. **Run the application:**

    ```sh
    go run main.go
    ```

    You should see the output:

    ```bash
    Hello, World!
    ```

## Explanation

- **Step 1:** Create a directory for your project and navigate into it.
- **Step 2:** Initialize a new Go module, which helps manage dependencies.
- **Step 3:** Create a new Go file named `main.go`.
- **Step 4:** Write a simple Go program that prints "Hello, World!" to the console.
- **Step 5:** Save the file and exit the text editor.
- **Step 6:** Use `go run` to compile and run the program.

**Congratulations! You've created and run your first Go application.**

### Additional Resources

- [Go Documentation](https://golang.org/doc/)
- [Go Tour](https://tour.golang.org/)
