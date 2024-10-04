
// Package main implements a simple web server that responds with a welcome message.
package main

import (
	"fmt"
	"net/http"
)

// handlerFunc is an HTTP handler function that writes a welcome message to the response writer.
func handlerFunc(w http.ResponseWriter, r *http.Request) {
	// fmt.Fprint(w, "<h1>Welcome to my awesome site!</h1>")
	http.ServeFile(w, r, "index.html")
}

// main is the entry point of the program. It sets up the HTTP server and starts listening on port 3000.
func main() {
	// Register the handler function for the root URL path.
	http.HandleFunc("/", handlerFunc)
	
	// Print a message to the console indicating that the server is running.
	fmt.Println("Server is running on port 3000")
	
   // Start the HTTP server on port 3000 and log any errors.
   if err := http.ListenAndServe(":3000", nil); err != nil {
	log.Fatal(err)
}


}