FROM golang

# Fetch dependencies
RUN go get github.com/tools/godep

# Add project directory to Docker image.
ADD . /go/src/github.com/brupm/gostrap

ENV USER Bruno
ENV HTTP_ADDR 8888
ENV HTTP_DRAIN_INTERVAL 1s
ENV COOKIE_SECRET PL4jOhItlfhEJr9S

# Replace this with actual PostgreSQL DSN.
ENV DSN postgres://Bruno@localhost:5432/gostrap?sslmode=disable

WORKDIR /go/src/github.com/brupm/gostrap

RUN godep go build
RUN ./gostrap

EXPOSE 8888