#!/usr/bin/env bash

set -xe

# Install packages and dependencies
go get github.com/gin-gonic/gin

go get gopkg.in/go-playground/validator.v9

# Build command
go build -o bin/application server.go