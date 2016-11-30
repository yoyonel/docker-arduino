#!/bin/bash

    # --privileged \        
    # -v ros-indigo-ros_lib:/root/ros_lib \
    # -v $(pwd):/root/src/ \
    
docker run \
    -it \
    --rm \
    --net foo \
    --name docker-arduino_for_rosserial \
    --env ROS_HOSTNAME=docker-arduino_for_rosserial \
    --env ROS_MASTER_URI=http://master:11311 \
    --device=/dev/ttyACM0 \
    arduino/rosserial-indigo/cmake:1.0.5 \
    /bin/bash
