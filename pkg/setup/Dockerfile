FROM linuxkit/alpine:630ee558e4869672fae230c78364e367b8ea67a9 AS mirror

RUN mkdir -p /out/etc/apk && cp -r /etc/apk/* /out/etc/apk/
RUN apk add --no-cache --initdb -p /out \
   alpine-baselayout \
   busybox \
   musl \
   && true
RUN rm -rf /out/etc/apk /out/lib/apk /out/var/cache

FROM scratch

COPY --from=mirror /out/ /
COPY setup_fs.sh /usr/bin

ENTRYPOINT []
CMD [ "/usr/bin/setup_fs.sh" ]
