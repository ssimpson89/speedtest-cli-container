FROM alpine:latest

RUN apk add --no-cache wget ca-certificates tar

ARG TARGETARCH

RUN if [ "$TARGETARCH" = "amd64" ]; then \
    ARCH="x86_64"; \
    elif [ "$TARGETARCH" = "arm64" ]; then \
    ARCH="aarch64"; \
    fi && \
    wget -q https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-linux-${ARCH}.tgz && \
    tar -xzf ookla-speedtest-1.2.0-linux-${ARCH}.tgz -C /usr/bin && \
    rm ookla-speedtest-1.2.0-linux-${ARCH}.tgz && \
    chmod +x /usr/bin/speedtest

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]