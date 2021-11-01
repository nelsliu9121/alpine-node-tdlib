FROM mhart/alpine-node:12

RUN apk update \
    && apk upgrade \
    && apk add --update alpine-sdk linux-headers git zlib-dev openssl-dev gperf php cmake

RUN git clone https://github.com/tdlib/td.git \
    && cd td \
    && rm -rf build \
    && mkdir build \
    && cd build \
    && cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=../tdlib .. \
    && cmake --build . --target install

COPY /td/tdlib/lib/libtdjson.so /tdlib

ENTRYPOINT [ "/" ]
