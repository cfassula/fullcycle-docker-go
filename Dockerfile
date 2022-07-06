# Imagem Base original
FROM golang:alpine AS builder

WORKDIR /go/fullcycle

COPY ./fullcycle/*.go .

#Comandos GO
RUN go mod init example/fullcycle

RUN go install example/fullcycle

# Construindo o binário
RUN go build -o /go/bin/fullcycle

# Otimizando a imagem
FROM scratch

# Copando o executável
COPY --from=builder /go/bin/fullcycle /go/bin/fullcycle

# Rodando
ENTRYPOINT ["/go/bin/fullcycle"]