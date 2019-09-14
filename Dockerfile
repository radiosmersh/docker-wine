FROM python:stretch
MAINTAINER radiosmersh <radiosmersh@gmail.com>

USER root

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		curl \
		unzip \
		ca-certificates

RUN dpkg --add-architecture i386 \
		&& apt-get update \
		&& apt-get install -y --no-install-recommends \
				wine \
				wine32 \
		&& rm -rf /var/lib/apt/lists/*

USER wineclient
ENV HOME /home/wineclient
ENV WINEPREFIX /home/wineclient/.wine
ENV WINEARCH win32

WORKDIR /home/wineclient
