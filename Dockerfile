FROM python:buster as build

RUN apt update && \
	apt upgrade -y && \
	pip install virtualenv && \
	virtualenv /v

RUN . /v/bin/activate && \
	pip install \
		--no-cache-dir \
		-U \
		jupyterlab \
		notebook \
		voila \
		jupyterlab-git \
		nodeenv && \
	nodeenv -p

FROM python:slim as run

RUN apt update && \
	apt upgrade -y && \
	apt install -no-install-recommends -y \
		git

COPY --from=build /v /v

RUN mkdir /data /root/.jupyter
COPY entrypoint.sh /e
COPY conf.py /.default.py

WORKDIR /data
VOLUME /data
VOLUME /root/.jupyter
VOLUME /v/share/jupyter/lab

EXPOSE 8888
ENTRYPOINT ["/e"]
CMD ["jupyter-lab"]

