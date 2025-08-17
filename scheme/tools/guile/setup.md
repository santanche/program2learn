# Guile over Jupyter

## Guile Kernel and Dockerfile for Jupyter

1. Download the `Dockerfile`from:

[guile-kernel](https://github.com/jerry40/guile-kernel/tree/master)

Or use the version available in this directory.

2. Build the `guile-kernel` image:

~~~bash
docker build -t guile-kernel .
~~~

3. Copy the file `docker-compose-model.yml` to `docker-compose.yml` and adapt it according to your setup, as further described:

The `docker-compose.yml` has the instructions for "docker compose":

* It departs from the `guile-kernel` image (produced in step 2).
* It is meant to be a local configuration of the docker image and must be adapted to the deployment server.
* In the `ports` section, it redirects the default Jupyter port (`8888`) to another an external one (`8888`). The external can be different from the internal.
* It maps one internal (docker machine) folder to external (host machine) one.
  * A folder inside the internal docker home folder (`/home/guile_user/program2learn`) is mapped to the external: `/home/user/git/program2learn/`.
  * You must adjust the external directory to your machine folder structure.
* The `restart` clause considers the local dev environment (it does not restart whenever you turn the machine on). In the server configuration, we suggest replacing it with `restart: always`.

4. To run:
~~~
docker compose up
~~~
