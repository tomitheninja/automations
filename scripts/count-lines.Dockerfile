FROM alpine:3.10

RUN apk add --no-cache bash git findutils coreutils tree

COPY ./count-lines.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
