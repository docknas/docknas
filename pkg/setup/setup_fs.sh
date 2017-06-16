#!/bin/sh -ex

## TODO: testing only... figure out how to do proper permissions, so containers can read-write to
## these directories
umask 000

mkdir -p /var/lib/docker && \
mkdir -p /var/lib/sshd && \
mkdir -p /var/lib/portainer && \
true
