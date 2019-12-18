# Build

`docker build -t go_scratch .`

# Run

`docker run --rm -i -t go_scratch`

If everything went well we should see the following output

> hello world

We can use the base golang image `FROM golang:alpine AS builder` to compile a standalone binary. Then in a new docker layer we can copy the built binary into a standalone layer.

```
FROM scratch
COPY --from=builder /go/src/hello/hi /go/src/hello/hi
```

This is great for security omiting all linux system utils and great for speedy deployments as we end up with a 2MB Go binary.

```
docker image ls
> go_scratch  latest  0b6bcd18eeb2  8 seconds ago  2MB
```