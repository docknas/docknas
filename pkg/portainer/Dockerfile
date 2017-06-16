FROM linuxkit/alpine:630ee558e4869672fae230c78364e367b8ea67a9 AS build

## Get the dependencies
RUN apk add --no-cache --initdb \
        ca-certificates \
        curl

## Download Portainer
ENV PORTAINER_VERSION 1.13.2
#ENV DOCKER_SHA256 340e0b5a009ba70e1b644136b94d13824db0aeb52e09071410f35a95d94316d9

# Install the client here
RUN set -x \
        && mkdir /out \
        && curl -fSL \
            "https://github.com/portainer/portainer/releases/download/${PORTAINER_VERSION}/portainer-${PORTAINER_VERSION}-linux-amd64.tar.gz" \
            -o portainer.tgz \
        && tar -C /out -xzvf portainer.tgz \
        && rm portainer.tgz

FROM busybox:musl

## Copy portainer client from the mirror
COPY --from=build /out/ /opt/

RUN mkdir /data
WORKDIR /opt/portainer

EXPOSE 9000
VOLUME "/data"

ENTRYPOINT [ "/opt/portainer/portainer", "-H", "tcp://127.0.0.1:2375" ]
