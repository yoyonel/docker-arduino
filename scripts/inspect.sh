#!/bin/sh
docker run -it \
    --network=dockerarduino_default \
    --env ROS_HOSTNAME=arduino_client \
    --env ROS_MASTER_URI=http://master:11311 \
    dockerarduino_arduino \
    /bin/bash
