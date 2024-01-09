# 
#   Building
#   docker build --network host --tag pico-sdk .
#
#   Running:
#   docker run -v ./:/opt --rm --env PROJECT_NAME=blinky --name pico-toolchain -it pico-sdk
#
FROM debian
ADD CMakeLists.txt /var/opt
ADD pico_sdk_import.cmake /var/opt
# Update compiler toolchain
RUN apt update && apt install cmake git gcc-arm-none-eabi libnewlib-arm-none-eabi libstdc++-arm-none-eabi-newlib python3 build-essential -y
WORKDIR /usr/share/
RUN git clone https://github.com/raspberrypi/pico-sdk.git
WORKDIR /usr/share/pico-sdk/src/rp2_common/tinyusb/
RUN git submodule update --init
# cd to working dir
WORKDIR /opt