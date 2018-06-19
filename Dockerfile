FROM golang:1.9 as builder

WORKDIR /home/app/
COPY . .
RUN env GOOS=linux go build -o dev-app .

FROM alpine:latest
MAINTAINER Dinesh Auti auti.dinesh3@gmail.com
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /home/app/dev-app .
CMD ["./dev-app"]

