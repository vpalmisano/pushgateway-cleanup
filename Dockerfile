FROM debian:bookworm-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends curl ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
COPY cleanup.sh /cleanup.sh
COPY entrypoint.sh /entrypoint.sh

ENV PUSHGATEWAY_URL=http://pushgateway:9091
ENV PUSHGATEWAY_TIMEOUT=60
ENTRYPOINT ["/entrypoint.sh"]
