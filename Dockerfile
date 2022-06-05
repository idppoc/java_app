FROM golang:alpine AS builder
RUN mkdir /goserver
ADD . /goserver/
WORKDIR /goserver
RUN go build -ldflags '-s -w' -o goserver .

FROM vault:latest
USER root
COPY --from=builder /vault-sidecar/vault-sidecar /vault-sidecar
RUN apk update --no-cache && apk upgrade && \
    chmod +x /vault-sidecar
USER vault
CMD ["/vault-sidecar"]