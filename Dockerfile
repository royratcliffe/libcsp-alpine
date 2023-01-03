FROM alpine:latest
RUN apk add zeromq
RUN apk add -t build git build-base meson linux-headers zeromq-dev
RUN git clone https://github.com/libcsp/libcsp.git && \
    cd libcsp && \
    ./waf configure --with-driver-usart=linux --enable-if-zmqhub --enable-examples && \
    ./waf install
RUN apk del build
