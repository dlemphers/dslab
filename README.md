# DS Lab is a simple project for running data science experiments in Jupyter locally.

## Usage

### Configure for your own use

In the `Makefile`, there are two config variables
- PROJECT
- CONTAINER_IMAGE

Both are used by the `Makefile` to build and control where your underlying image is stored and the name of your running container.

Change these values, especially `CONTAINER_IMAGE` if you want to build and manage your own.

### The underlying Jupyter image

In the `.docker/Dockerfile`, the `FROM` directive uses `jupyter/scipy-notebook` as it's base. You can build your own, and change this base. If you want to change the underlying base container image and/or update the built image, you can:

- Change the `FROM` directive, I recommend using https://hub.docker.com/u/jupyter images as your base
- Update the requirements.txt to install pip libraries when you run `make build-notebook-base`
- Update the setup.sh with OS level changes that you want run when you run `make build-notebook-base`

