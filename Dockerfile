FROM golang:alpine AS builder
WORKDIR $GOPATH/src/hello/
COPY hello.go hello.go
RUN go build -o hi hello.go

FROM scratch
COPY --from=builder /go/src/hello/hi /go/src/hello/hi
ENTRYPOINT ["/go/src/hello/hi"]