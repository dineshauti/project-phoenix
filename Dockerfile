FROM alpine
MAINTAINER Dinesh Auti auti.dinesh3@gmail.com

COPY dev-v1.0 /home/app/

CMD ["/home/app/dev-v1.0"]