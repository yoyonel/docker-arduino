#FROM ubuntu:15.10
#FROM ros:indigo
FROM ros/rosserial:indigo 

MAINTAINER Lionel ATTY <lionel.atty@ign.fr>

# arduino-cmake
RUN apt-get update \
	&& apt-get install -y \
		git	\
        # curl \
        cmake \
        build-essential g++ \
        vim \
        arduino \
        && apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/yoyonel/arduino-cmake.git /root/arduino-cmake

COPY ./apt.conf /etc/apt/apt.conf

COPY ./scripts/set_env_arduino-cmake.sh /root/.
COPY ./scripts/launch_rosserial_client.sh /root/.
COPY ./scripts/stop_rosserial_client.sh /root/.

ENV ARDUINOCMAKE_DIR /root/arduino-cmake

CMD ["/bin/bash"]

WORKDIR /root/
