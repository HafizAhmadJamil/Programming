package main

import (
	"log"
	"net/http"
	"path/filepath"
)

func main() {
	// Serve static files from the web directory
	absPath, err := filepath.Abs("../web")
	if err != nil {
		log.Fatalf("Error getting absolute path: %v", err)
	}

	fs := http.FileServer(http.Dir(absPath))

	// Create a new ServeMux
	mux := http.NewServeMux()

	// Handle root path and custom 404
	mux.Handle("/", fs)

	// Start the server on port 3000
	port := ":3000"
	log.Println("Server is running on http://localhost" + port)

	err = http.ListenAndServe(port, mux)
	if err != nil {
		log.Fatalf("Error starting server: %v", err)
	}
}
