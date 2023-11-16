# 1. Build step
# ----------
FROM jelastic/maven:3.9.5-openjdk-21 AS build

# RUN apt-get update \
#     && apt-get -y install \
#         pbzip2 \
#         wget \
#         procps \
#     && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY . /usr/src/app

RUN mvn clean package -DskipTests

# 2. Run step
# --------
# FROM openjdk:21-slim
FROM openjdk:21-jdk

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/target/photon-0.4.3.jar photon.jar

EXPOSE 2322
