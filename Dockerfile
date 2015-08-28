FROM ubuntu:14.04

MAINTAINER Alexey Kornilov <alexey.kornilov@kavolorn.ru>

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y unzip wget build-essential \
		cmake git pkg-config libswscale-dev \
		python3-dev python3-numpy \
		libtbb2 libtbb-dev libjpeg-dev \
		libpng-dev libtiff-dev libjasper-dev

RUN cd && wget https://github.com/Itseez/opencv/archive/3.0.0.zip \
	&& unzip 3.0.0.zip \
	&& cd opencv-3.0.0 && mkdir build && cd build \
	&& cmake .. && make -j2 && make install \
	&& cd && rm -rf opencv-3.0.0 && rm 3.0.0.zip