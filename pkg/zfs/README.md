ZFS package for linuxkit.

## Usage

Add the package to your distro's `yml` with `onboot` container:

```yml

  - name: zfs
    image: docknas/zfs:2a4fe1ea262388384c3bc592b4c1a7172989e93d
    pid: host
    ipc: host
    capabilities:
      - all
    binds:
      - /dev:/dev
      - /lib/modules:/lib/modules
```

## TODO:

* Add `zfs-admin` package with userland tools to manage `zfs`.
