#Start from eh latest golang base image
FROM golang:latest

# Add maintainer info
LABEL maintainer="Adole Samuel"

# Set the current working Directory inside the container
WORKDIR /app

# Copy Go Modules dependency requirements file
COPY go.mod .

# Copy Go modules  expected hashes file
COPY go.sum .

# Download dependencies
RUN go mod download

# Copy all the app sources recursively
COPY . .

# Set http port
ENV PORT 5000

# Build the app
RUN go Build

# Remove source files
RUN find . -name "*.go" -type f -delete

# Make port 5000 available to the world outside this container
EXPOSE $PORT

# Run the app
CMD ["./GOLANG-GIN-PROJECT"]

