FROM golang:1.17-alpine3.14 AS builder

COPY . /github.com/godedok/pocket-collections/
WORKDIR /github.com/godedok/pocket-collections/

RUN go mod download
RUN go build -o ./bin/bot cmd/bot/main.go

FROM alpine:latest

WORKDIR /root/

COPY --from=0 /github.com/godedok/pocket-collections/bin/bot .
COPY --from=0 /github.com/godedok/pocket-collections/configs configs/

EXPOSE 80

CMD ["./bot"]