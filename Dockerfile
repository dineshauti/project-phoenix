FROM golang:1.9 as builder
WORKDIR /home/app/
COPY . .
# RUN env GOOS=linux GOARCH=amd64 go build -o dev-app .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -installsuffix cgo -tags netgo -ldflags '-w' -o dev-app .

FROM alpine:latest
MAINTAINER Dinesh Auti auti.dinesh3@gmail.com
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /home/app/dev-app .	
CMD ["./dev-app"]

