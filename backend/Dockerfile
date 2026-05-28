#Это так называемый мультистейдж docker-файл. Сначала делаем образ, который соберёт нам java-приложение,
#а затем из него берём собранный артефакт и кладём его в новый образ, чтобы оставить в нём меньше лишнего

# build
FROM maven:3.8.2-openjdk-16-slim AS builder
# задаём переменную VERSION, которая будет использоваться для сборки проекта
ARG VERSION=${VERSION}
WORKDIR /usr/src/app
COPY ./src ./src
COPY *.xml ./

RUN mvn package -Dversion.application=${VERSION}

# release
FROM eclipse-temurin:17-jre
ARG VERSION=${VERSION}
WORKDIR /app
# создаём пользователя jaruser
RUN groupadd --system jaruser \
    && useradd --system --shell /usr/sbin/nologin --gid jaruser jaruser \
    && apt-get update \
    && apt-get install -y --no-install-recommends dumb-init curl ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /logs/reports \
    && chown -R jaruser:jaruser /logs
COPY --chown=jaruser:jaruser \
     --from=builder /usr/src/app/target/sausage-store-${VERSION}.jar ./sausage-store.jar
EXPOSE 8080
# приложение будет запускаться под пользователем jaruser
USER jaruser
ENTRYPOINT ["dumb-init", "java", "-jar", "-Dmyserver.bindPort=8080", "./sausage-store.jar"]