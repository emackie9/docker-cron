# docker-cron
Docker image that runs cron. Useful for restarting containers, or running other docker commands without having to do so on the host.
- Mount `/var/run/docker.sock` to `/var/run/docker.sock` on the docker, to expose host's containers within the container
- Mount crontabs into `/cron` on the docker
- Set `TZ` environment variable for timezone
- Includes `rsync` for running backup tasks 

Example cron file:

```cron
# must be ended with a new line "LF" (Unix) and not "CRLF" (Windows)
 * * * * * docker ps > /proc/1/fd/1 2>/proc/1/fd/2
# An empty line is required at the end of this file for a valid cron file.

```

Run it:

```bash
docker run \
    --restart=always \
    --name=docker-cron \
    --env TZ=America/Toronto \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v ./cronfile:/cron/cronfile \
    emackie/docker-cron 
```