FROM crystallang/crystal

RUN apt-get update && apt-get install -y wget \
    && wget https://github.com/segmentio/chamber/releases/download/v2.0.0/chamber-v2.0.0-linux-amd64 \
    && chmod +x chamber* \
    && mv chamber* /usr/local/bin/chamber

COPY run* /

CMD ["/run.sh"]
