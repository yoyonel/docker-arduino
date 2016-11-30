#FROM ubuntu:15.10
#FROM ros:indigo
FROM ros/rosserial:indigo 

MAINTAINER Lionel ATTY <lionel.atty@ign.fr>

#RUN apt-get update \
#	&& apt-get install -y \
#		wget \
#        # openjdk-7-jre \
#        # xvfb \
#	&& apt-get clean \
#	&& rm -rf /var/lib/apt/lists/*

#ENV ARDUINO_IDE_VERSION 1.6.13
#RUN (wget -q -O- https://downloads.arduino.cc/arduino-${ARDUINO_IDE_VERSION}-linux64.tar.xz \
#	| tar xJC /usr/local/share \
#	&& ln -s /usr/local/share/arduino-${ARDUINO_IDE_VERSION} /usr/local/share/arduino \
#	&& ln -s /usr/local/share/arduino-${ARDUINO_IDE_VERSION}/arduino /usr/local/bin/arduino)

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

#RUN curl -sSL https://cmake.org/files/v3.5/cmake-3.5.2-Linux-x86_64.tar.gz | tar -xzC /opt

#RUN git clone -b arduino_1.5 https://github.com/yoyonel/arduino-cmake.git /usr/local/share/arduino-cmake
#RUN git clone https://github.com/yoyonel/arduino-cmake.git /usr/local/share/arduino-cmake
RUN git clone https://github.com/yoyonel/arduino-cmake.git /root/arduino-cmake

COPY ./apt.conf /etc/apt/apt.conf

COPY ./scripts/set_env_arduino-cmake.sh /root/.
COPY ./scripts/launch_rosserial_client.sh /root/.
COPY ./scripts/stop_rosserial_client.sh /root/.

# ENTRYPOINT ["source /root/set_env_arduino-cmake.sh"]
ENV ARDUINOCMAKE_DIR /root/arduino-cmake
CMD ["/bin/bash"]
