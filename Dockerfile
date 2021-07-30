FROM debian:buster

WORKDIR /root/raspberrypi

RUN apt update && \
    apt install -y git bc bison flex libssl-dev make libc6-dev libncurses5-dev

RUN apt install -y crossbuild-essential-armhf


CMD ["/bin/bash"]
