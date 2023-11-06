FROM openjdk:8-jre

# Install pbzip2 for parallel extraction
RUN apt-get update \
    && apt-get -y install \
        pbzip2 \
        wget \
        procps \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /photon
EXPOSE 2322
