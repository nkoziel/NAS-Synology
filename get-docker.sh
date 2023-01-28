#!/bin/bash
set -e

ARCH=aarch64
DOCKER_VERSION=20.10.9
DOCKER_DIR=/volume1/@docker

echo "Downloading docker $DOCKER_VERSION-$ARCH"
curl "https://download.docker.com/linux/static/stable/$ARCH/docker-$DOCKER_VERSION.tgz" | tar -xz -C /usr/local/bin --strip-components=1

echo "Creating docker working directory $DOCKER_DIR"
mkdir -p "$DOCKER_DIR"

echo "Creating docker.json config file"
mkdir -p /usr/local/etc/docker
cat <<EOT > /usr/local/etc/docker/docker.json
{
  "storage-driver": "vfs",
  "iptables": false,
  "bridge": "none",
  "data-root": "$DOCKER_DIR"
}
EOT

echo "Creating docker startup script"
cat <<'EOT' > /usr/local/etc/rc.d/docker.sh
#!/bin/sh
# Start docker daemon

NAME=dockerd
PIDFILE=/var/run/$NAME.pid
DAEMON_ARGS="--config-file=/usr/local/etc/docker/docker.json --pidfile=$PIDFILE"

case "$1" in
    start)
        echo "Starting docker daemon"
        /usr/local/bin/dockerd $DAEMON_ARGS &
        ;;
    stop)
        echo "Stopping docker daemon"
        kill $(cat $PIDFILE)
        ;;
    *)
        echo "Usage: "$1" {start|stop}"
        exit 1
esac
exit 0
EOT

chmod 755 /usr/local/etc/rc.d/docker.sh

echo "Creating docker group"
synogroup --add docker root

echo "Installing docker compose"
curl -L --fail https://gist.githubusercontent.com/ta264/af20c367aafa63795c3104d4b0c8b148/raw/4f6d257c026596cfce1c9052d9ac426a50e9f205/run.sh -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

echo "Starting docker"
/usr/local/etc/rc.d/docker.sh start

echo "Done.  Please add your user to the docker group in the Synology GUI and reboot your NAS."
