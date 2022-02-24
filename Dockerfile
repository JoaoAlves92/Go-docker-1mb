FROM golang:1.13.8-alpine3.11 as builder

WORKDIR /go/src/hello-golang

COPY main.go .
RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o /hello-app

FROM scratch
COPY --from=builder /hello-app /hello-app

CMD ["/hello-app"]