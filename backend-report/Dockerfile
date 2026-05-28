
FROM golang:1.21-alpine AS builder

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o /out/backend-report .

FROM alpine:3.20

WORKDIR /app

RUN addgroup -S app && adduser -S -G app app

COPY --from=builder /out/backend-report ./backend-report

EXPOSE 8080

USER app
CMD ["./backend-report"]