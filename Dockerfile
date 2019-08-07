FROM alpine:3.7

ENV WORKDIR=/workdir \
    BUILDS=${WORKDIR}/builds \
    FIRMWARE=${WORKDIR}/firmware \
    FIRMWARE_REPO=https://www.github.com/raspberrypi/firmware

# Install build dependencies
RUN apk add --no-cache bash git

WORKDIR ${WORKDIR}

COPY scripts/* common_vars ${WORKDIR}/

ENTRYPOINT ["./build.sh"]
