# Imagem com Golang de 1mb


Desafio da code.education para executar um hello world na golang em uma imagem que tivesse no final menos de 3mb.

## Link para a imagem no DockerHub

 - [hello-golang](https://hub.docker.com/repository/docker/joaomarangoni/hello-golang)


## Rodando o projeto

Para rodar esse projeto você precisará executar os seguintes comandos:

```bash
  docker build -t golang-image .
  docker run -it --name go-docker golang-image
  docker images
```

Executando o comando images você verá o tamanho de aproximadamente 1.43mb da imagem.

---

## Dockerfile

```go
FROM golang:1.13.8-alpine3.11 as builder

WORKDIR /go/src/hello-golang

COPY main.go .
RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o /hello-app

FROM scratch
COPY --from=builder /hello-app /hello-app

CMD ["/hello-app"]
```

O dockerfile usa o conceito de multi-stage building e a maior parte da 'mágica' acontece no segundo build da aplicação, onde usamos uma imagem reservada do docker chamada de Scratch, para subir a aplicação no menor espaço possível.

## Referência Adicional
 - [Reducing-container-image-size-esp-for-go-applications-medium](https://medium.com/swlh/reducing-container-image-size-esp-for-go-applications-db7658e9063a)
