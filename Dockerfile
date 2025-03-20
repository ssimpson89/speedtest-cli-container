FROM alpine:latest

# Set architecture as a build argument with a default value
ARG ARCH=x86_64

RUN apk add --no-cache wget ca-certificates tar

RUN wget -q https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-linux-${ARCH}.tgz && \
    tar -xzf ookla-speedtest-1.2.0-linux-${ARCH}.tgz -C /usr/bin && \
    rm ookla-speedtest-1.2.0-linux-${ARCH}.tgz && \
    chmod +x /usr/bin/speedtest

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]