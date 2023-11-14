# base
FROM golang:1.18-alpine3.17 AS development-builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN go build -o main /app/main.go

# development
FROM golang:1.18-alpine3.17 AS development
WORKDIR /app
# development-builderのコピー
COPY --from=development-builder /app .
# airのインストール
RUN go install github.com/cosmtrek/air@latest
CMD [ "air" ]

# production
FROM alpine:3.17 AS production
WORKDIR /app
# development-builderのコピー
COPY --from=development-builder /app/main .
CMD [ "/app/main" ]
