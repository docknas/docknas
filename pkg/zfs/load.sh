#!/bin/sh -xe

function run {
    modinfo $1.ko \
    && insmod $1.ko \
    && true
}

mkdir -p /etc/zfs

for ko in spl splat zavl znvpair zunicode zcommon icp zpios zfs
do
    echo "Installing $ko..."
    run $ko
done #> /tmp/load.zfs.$$.log 2>&1
