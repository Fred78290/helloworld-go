#!/bin/bash
GOARCH=amd64 go build -o out/linux/amd64/helloworld
GOARCH=arm64 go build -o out/linux/arm64/helloworld

docker buildx build --pull --platform linux/amd64,linux/arm64 --push -t devregistry.aldunelabs.com/helloworld:v1.0.0 .
