# Dock-NAS

Docker-native NAS solution based on linuxkit focused at software professionals who want to run a
home NAS server and are comfortable with Docker.

# Key Objectives #

1. The whole system is based on containers and mounts via a read-only USB stick (linuxkit provides this
   foundation out-of-box).
2. A customized portainer-style frontend with defaults for most services and advanced options
   to run any Docker container.
3. Use ZFS for data-storage.
4. Have a docker-native user-experience:
    a. System provided services should also just result in a `docker-compose.yml` under the hood
       which can be manually modified by an experienced user.
    b. Advanced users should be able to directly run `docker-compose` *scripts*.

# Core Services #

1. Windows sharing (SAMBA).
2. Media streaming (Emby, Plex).
3. Video encoding (HandBrake).
4. Time-machine backup (AFP).
5. Backup to S3.
6. UPS support.
7. SSH server (with ability to spin up Docker containers).
8. rsync.
9. cron.
10. SMART status checks.
11. ZFS tools (scrubs, snapshots, remote-syncing).

# Nice-to-Have Services #

1. DNS server/forwarder (BIND/DNSMasq)
2. Gerrit Server.
3. CI server (jenkins).
4. Certificate Authority (compatible with ACME protocol for Let's Encrypt support).
5. Domain controller.
