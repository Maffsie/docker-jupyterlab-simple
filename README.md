[![Build Status](https://github.com/Maffsie/docker-jupyterlab-simple/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/Maffsie/docker-jupyterlab-simple/actions/workflows/docker-publish.yml)

# docker-jupyter-simple

Very, very simple container for running JupyterLab (+Notebook, +Voila).

Runs whatever the latest stable Python is, exclusively runs inside a virtualenv, has NodeJS installed using nodeenv inside the virtualenv.

## Using

	docker volume create jupyter-data
	docker volume create jupyter-conf
	docker run --rm -p 8888:8888 -v jupyter-data:/data -v jupyter-conf:/root/.jupyter maffsie/jupyter-simple:latest

The JupyterLab web interface is exposed on port 8888. No packages are installed by default, but can easily be installed using `pip`. On each startup, the entrypoint script checks for the existence of the file `/data/requirements` and runs `pip install -Ur /data/requirements` if present - an easy way to make sure everything you're using is up-to-date is to simply restart the container. This is also how you are expected to install plugins.

## Volumes

* `/data` - where all user data is stored
* `/root/.jupyter` - where all config and state is stored

## Security

This container deliberately does not have any security considerations. It is built as root, runs as root, and I have no interest in changing that. This is not because I believe root is fine, or because I don't care about security, but instead is because this container was created in order to have a lowest-friction Jupyter setup. The existing docker containers do not have a clearly defined usage, for whatever reason.

