# Multi stage container for build and running the binary

FROM jrei/crystal-alpine as builder
COPY . /opt/app
WORKDIR /opt/app
RUN crystal build --release /opt/app/src/run.cr


FROM jrei/crystal-alpine
WORKDIR /opt/app
RUN wget https://github.com/segmentio/chamber/releases/download/v2.0.0/chamber-v2.0.0-linux-amd64 \
    && chmod +x chamber* \
    && mv chamber* /usr/local/bin/chamber
COPY --from=builder /opt/app/run* /
CMD ["/run.sh"]

