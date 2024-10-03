# Installing Go on Ubuntu

Go is an open-source programming language designed for simplicity and efficiency, particularly in building scalable applications. Follow these steps to install Go on your Ubuntu system:

1. **Update the package list:**

    ```sh
    sudo apt update
    ```

2. **Install Go:**

    ```sh
    sudo apt install golang-go
    ```

   Note: This installs the latest version available in the Ubuntu repositories. For the latest version, consider downloading directly from the [official Go website](https://golang.org/dl/).

3. **Verify the installation:**

    ```sh
    go version
    ```

4. **Set up the workspace:**
   Create a directory for your Go projects, for example:

    ```sh
    mkdir -p ~/go/{bin,src,pkg}
    ```

   The `bin` directory is for compiled binaries, `src` is where your source code will live, and `pkg` is for compiled package objects.

5. **Configure environment variables:**
   Add the following lines to your `~/.profile` or `~/.bashrc` file:

    ```sh
    export GOPATH=$HOME/go
    export PATH=$PATH:$GOPATH/bin
    ```

6. **Apply the changes:**

    ```sh
    source ~/.bashrc
    ```

7. **Verify Go installation:**
   To ensure everything is set up correctly, run:

    ```sh
    go version
    ```

You have successfully installed Go on your Ubuntu system!
