#!/bin/sh
docker run -it \
    --network=dockerarduino_default \
    --env ROS_HOSTNAME=arduino_client \
    --env ROS_MASTER_URI=http://master:11311 \
    --device=/dev/ttyACM0:/dev/ttyACM0 \
    -v /home/atty/Prog/__IGN__/__DOCKER__/docker-arduino/docker-arduino/project/LI3DS_ARDUINO:/root/LI3DS_ARDUINO \
    dockerarduino_arduino \
    /bin/bash
