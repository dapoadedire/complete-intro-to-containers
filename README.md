[Complete Intro to Containers](https://frontendmasters.com/courses/complete-intro-containers-v2)

[Course Website Notes](https://containers-v2.holt.courses/)


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
