# envoy-docker-base
Base container with Envoy

A base container with Envoy and a simple config/start script.

This is useful for when you need to run a single static binary and Envoy in the same container.

Currently Envoy is configured with environment variables to communicate with an xDS management server.  It is not intended to be a generic Envoy config templating setup.

It is also a little brittle right now:
* The binary must be added to the container as `/app`, though this could probably be made configurable.
* If `/app` fails to start the container will not exit, as Envoy is the primary process.  This will be solved in the start script in the future.

You can use it with a second Dockerfile in a service repo that looks something like this:

```
FROM golang:1.9.4-alpine3.7 as builder
ADD . /go/src/app
WORKDIR /go/src/app
RUN CGO_ENABLED=0 GOOS=linux go build -a -ldflags "-s" -installsuffix cgo -o bin/app .

FROM chtorr/envoy-docker-base:v1.6.0
EXPOSE 8080
WORKDIR /
COPY --from=builder /go/src/app/bin/app .
```

And then build and run with commands that resemble the following:
```sh
docker build -t test-service:latest

docker run -e NODE_ID=test-service -e NODE_CLUSTER=test-service -e XDS_HOST=172.17.8.101 -e XDS_PORT=18000 -ti test-service:latst
```
