FROM golang:alpine AS builder
WORKDIR $GOPATH/src/hello/
COPY hello.go hello.go
RUN go build -o hi hello.go
ENTRYPOINT ["./hi"]