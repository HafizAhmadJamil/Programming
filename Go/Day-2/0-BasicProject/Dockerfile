# Use the official Golang image as a build stage
FROM golang:1.20 AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the go.mod and go.sum files to the working directory
COPY main/go.mod main/go.sum ./

# Download dependencies
RUN go mod download

# Copy the entire application code
COPY . .

# Build the Go application for Linux
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o main ./main/main.go

# Start a new stage from a minimal base image
FROM alpine:latest

# Set the working directory in the new stage
WORKDIR /app

# Copy the binary from the builder stage
COPY --from=builder /app/main .

# Copy static files to the container
COPY --from=builder /app/index.html .
COPY --from=builder /app/web ./web

# Expose port 8080
EXPOSE 8080

# Command to run the application
CMD ["./main"]
