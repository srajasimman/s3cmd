FROM        alpine:latest
LABEL       MAINTAINER="Rajasimman S"

ARG         VERSION=2.3.0

RUN         apk --no-cache add tar curl python3 py-dateutil
RUN         curl -O https://cfhcable.dl.sourceforge.net/project/s3tools/s3cmd/${VERSION}/s3cmd-${VERSION}.tar.gz

RUN         tar -zxf s3cmd-${VERSION}.tar.gz --strip 1 -C /usr/local/bin && rm -rf s3cmd-${VERSION}.tar.gz

ENTRYPOINT  ["/usr/local/bin/s3cmd"]
CMD         [ "--help" ]
