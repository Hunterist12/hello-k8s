FROM golang:1.11 as builder
WORKDIR /go/src/github.com/Hunterist/hello-golang/
COPY main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM alpine:3.7  
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /go/src/github.com/Hunterist/hello-golang/main .
EXPOSE 8080
CMD ["./main"]
