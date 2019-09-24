FROM python:stretch
MAINTAINER radiosmersh <radiosmersh@gmail.com>

USER root

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		curl \
                zip \
		unzip \
		ca-certificates

RUN dpkg --add-architecture i386 \
		&& apt-get update \
		&& apt-get install -y --no-install-recommends \
				wine \
				wine32 \
		&& rm -rf /var/lib/apt/lists/*

RUN  apt-get install  Xvfb \
		&& Xvfb :0 -screen 0 1024x768x16 &

		
USER root
ENV HOME /root
ENV WINEPREFIX /root/.wine
ENV WINEARCH win32
ENV DISPLAY  :0.0

WORKDIR /root
