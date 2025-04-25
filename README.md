[Complete Intro to Containers](https://frontendmasters.com/courses/complete-intro-containers-v2)

[Course Website Notes](https://containers-v2.holt.courses/)

[Project Files Repository](https://github.com/btholt/project-files-for-complete-intro-to-containers-v2)

## Notes


```bash
docker run -it --name docker-host --rm --privileged ubuntu:jammy
```

This command **runs a Docker container** using the `ubuntu:jammy` image (Ubuntu 22.04 LTS, codenamed "Jammy Jellyfish") with several options that modify the behavior of the container:

---

### 🏷️ **Flag Breakdown**

- `docker run`: Starts a new container from a specified image.

- `-it`: Combines two flags:
  - `-i` (**interactive**): Keeps STDIN open even if not attached.
  - `-t` (**tty**): Allocates a pseudo-TTY, allowing you to interact with the container via the terminal.

- `--name docker-host`: Assigns the name `docker-host` to the container. This makes it easier to refer to the container later (e.g., `docker logs docker-host`).

- `--rm`: Automatically **removes** the container when it **exits**. This ensures that it doesn't persist on your system once it's done running.

- `--privileged`: Grants **extended privileges** to the container. This:
  - Allows access to all devices on the host.
  - Lifts many default security restrictions.
  - Is often used when running **Docker inside Docker (DinD)** or working with hardware devices or low-level system operations (e.g., mounting filesystems, changing kernel parameters).

- `ubuntu:jammy`: Specifies the image to use—Ubuntu 22.04.




```
# start docker contaier with docker running in it connected to host docker daemon
docker run -ti -v /var/run/docker.sock:/var/run/docker.sock --privileged --rm --name docker-host docker:26.0.1-cli

# run stock alpine container
docker run --rm -dit --name my-alpine alpine:3.19.1 sh

# export running container's file system
docker export -o dockercontainer.tar my-alpine

# make container-root directory, export contents of container into it
mkdir container-root
tar xf dockercontainer.tar -C container-root/

# make a contained user, mount in name spaces
unshare --mount --uts --ipc --net --pid --fork --user --map-root-user chroot $PWD/container-root ash # this also does chroot for us
mount -t proc none /proc
mount -t sysfs none /sys
mount -t tmpfs none /tmp

# here's where you'd do all the cgroup rules making with the settings you wanted to
# we're not going to since we did it all in the last lesson



```



```
docker attach <container_id>
```

```
docker run --dit --name my-alpine alpine:3.19.1 
```

```
docker container prune
```

```
docker kill <container_id>
```


```
docker run -it --rm node:20
```



```
docker build . --tag my-image
```

```
docker run my-image
```

```
docker run --init --publish 3000:3000 --rm --name na my-node-app:2
```