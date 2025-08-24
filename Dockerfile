FROM debian:trixie-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin
ENV AUTOSTART=false

LABEL org.opencontainers.image.title="iVentoy Docker"
LABEL org.opencontainers.image.description="Dockerized version of iVentoy"
LABEL org.opencontainers.image.source="https://github.com/EErikas/iventoy"
LABEL org.opencontainers.image.licenses="MIT"

WORKDIR /iventoy
COPY start.sh .
RUN chmod +x start.sh
COPY iventoy/ .

# Read version from iventoy/version and set as label
ARG VERSION
RUN VERSION=$(cat /iventoy/version)
LABEL org.opencontainers.image.version="${VERSION}"

CMD ["./start.sh"]