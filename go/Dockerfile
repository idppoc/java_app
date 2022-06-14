FROM golang:alpine AS builder
RUN mkdir /goserver
ADD . /goserver/
WORKDIR /goserver
RUN go build -ldflags '-s -w' -o goserver .

FROM vault:latest
USER root
COPY --from=builder /goserver/goserver /root/goserver
ENTRYPOINT ["/root/goserver"]
