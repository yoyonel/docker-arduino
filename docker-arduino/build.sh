docker build \
    --build-arg http_proxy=http://proxy.ign.fr:3128 \
    --build-arg HTTP_PROXY=http://proxy.ign.fr:3128 \
    --build-arg https_proxy=http://proxy.ign.fr:3128 \
    --tag arduino/rosserial-indigo/cmake:1.0.5 \
    .
