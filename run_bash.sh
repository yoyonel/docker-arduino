docker run \
    -it \
    --privileged \
    --device=/dev/ttyACM0 \
    arduino/xfvb:1.6.13 \
    /bin/bash
