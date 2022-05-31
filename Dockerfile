FROM alpine:3.16

WORKDIR /usr/src/app

COPY . .

CMD ["sh", "hasher.sh"]