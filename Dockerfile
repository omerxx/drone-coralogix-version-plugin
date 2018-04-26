# Multi stage container for build and running the binary

FROM jrei/crystal-alpine as builder
COPY . /opt/app
WORKDIR /opt/app
RUN crystal build --release /opt/app/src/run.cr


FROM jrei/crystal-alpine
WORKDIR /opt/app
COPY --from=builder /opt/app/run /
CMD ["/run"]

