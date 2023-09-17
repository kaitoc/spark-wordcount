# Spark Wordcount

## Usage

### Build

```bash
docker build -t kaitoc/spark-wordcount:1.5.2-python2 .
```

### Run

```bash
docker run -it --rm -v "$(pwd)"/data:/data kaitoc/spark-wordcount:1.5.2-python2
```

## Docker Hub

[https://hub.docker.com/r/kaitoc/spark-wordcount/tags](https://hub.docker.com/r/kaitoc/spark-wordcount/tags)

## Monitoring

```bash
docker run \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:ro \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --volume=/dev/disk/:/dev/disk:ro \
  --publish=8080:8080 \
  --detach=true \
  --name=cadvisor \
  --privileged \
  --device=/dev/kmsg \
  gcr.io/cadvisor/cadvisor:v0.47.2
```
