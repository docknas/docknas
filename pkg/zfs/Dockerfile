# This Dockerfile extracts the kernel headers from the kernel image
# and then compiles a simple hello world kernel module against them.
# In the last stage, it creates a package, which can be used for
# testing.

FROM linuxkit/kernel:4.9.x AS ksrc

# Extract headers and compile module
FROM linuxkit/kernel-compile:1b396c221af673757703258159ddc8539843b02b@sha256:6b32d205bfc6407568324337b707d195d027328dbfec554428ea93e7b0a8299b AS build
COPY --from=ksrc /kernel-dev.tar /
RUN tar xf kernel-dev.tar

WORKDIR /kmod

RUN apk update \
    && apk add \
        zlib-dev \
        alpine-sdk glib-dev e2fsprogs-dev util-linux-dev libtirpc-dev automake autoconf libtool \
        attr-dev

COPY ./src/spl/ ./spl/
COPY ./src/zfs/ ./zfs/

RUN cd spl \
    && sh autogen.sh \
    && ./configure \
    && make -s \
    && make install \
    && true

RUN cd zfs \
    && sh autogen.sh \
    && ./configure LIBS='-lintl' --with-tirpc --disable-systemd \
    && make -s \
    && make install \
    && true

RUN mkdir -p /out/ \
    && mv $(find /lib/modules -name *.ko) /out/

# Package
FROM alpine:3.6
ENTRYPOINT []
WORKDIR /

COPY --from=build /out/ /

COPY load.sh /load.sh
CMD ["/bin/sh", "/load.sh"]
