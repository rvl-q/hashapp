FROM alpine:3.16

RUN apk add --update coreutils && rm -rf /var/cache/apk/*

WORKDIR /usr/src/app

COPY . .

CMD ["sh", "hasher.sh"]