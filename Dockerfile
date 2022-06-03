FROM docker
RUN apk add --no-cache \
        dumb-init \
        rsync \
        tzdata
COPY ./docker-entrypoint .
RUN chmod +x ./docker-entrypoint
ENTRYPOINT [ "./docker-entrypoint" ]