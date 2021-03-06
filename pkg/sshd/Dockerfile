FROM linuxkit/alpine:630ee558e4869672fae230c78364e367b8ea67a9 AS build

## Get the dependencies
RUN apk add --no-cache --initdb \
        ca-certificates \
        curl

## Download Docker
ENV DOCKER_BUCKET get.docker.com
ENV DOCKER_VERSION 17.05.0-ce
ENV DOCKER_SHA256 340e0b5a009ba70e1b644136b94d13824db0aeb52e09071410f35a95d94316d9

# Install the client here
RUN set -x \
        && curl -fSL "https://${DOCKER_BUCKET}/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz" -o docker.tgz \
        && echo "${DOCKER_SHA256} *docker.tgz" | sha256sum -c - \
        && tar -xzvf docker.tgz \
        && mkdir -p /out/docker \
        && mv docker/* /out/docker/ \
        && rmdir docker \
        && rm docker.tgz \
        && /out/docker/docker -v

FROM linuxkit/sshd:fb4a9145bf133681e47a47ef21031d9ca51e76f5

## Install Docker client inside the SSHD package, so we can use Docker after logging in

# set up Docker group
# set up subuid/subgid so that "--userns-remap=default" works out-of-the-box
RUN set -x \
        && addgroup -S docker \
        && addgroup -S dockremap \
        && adduser -S -G dockremap dockremap \
        && echo 'dockremap:165536:65536' >> /etc/subuid \
        && echo 'dockremap:165536:65536' >> /etc/subgid

## Copy docker client from the mirror
COPY --from=build /out/docker/ /usr/bin/
