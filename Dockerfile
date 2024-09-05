FROM golang:1.22-alpine as build

WORKDIR /app
COPY . .

RUN go build -ldflags="-w -s"

FROM alpine:latest as run

WORKDIR /app

COPY --from=build /app/dankscreen ./run

EXPOSE 8989

CMD ["./run"]
