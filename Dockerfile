FROM ubuntu:22.04

RUN apt-get update \
    && apt-get install -y git make \
    && git clone -b v1.16 --depth=1 https://github.com/linux-test-project/lcov.git \
    && cd lcov \
    && make install \
    && cd .. \
    && rm -fr lcov \
    && apt-get purge -y git make \
    && apt-get autoremove \
    && rm -fr /var/lib/apt/lists/*
