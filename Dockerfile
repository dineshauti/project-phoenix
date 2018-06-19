FROM golang:1.9 as builder

WORKDIR /home/app/
RUN env GOOS=linux go build -o dev-app .

FROM alpine:latest
MAINTAINER Dinesh Auti auti.dinesh3@gmail.com
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /home/app .
CMD ["./dev-app"]