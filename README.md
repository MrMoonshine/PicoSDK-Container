# PicoSDK-Container
Full Raspberry Pico C/C++ SDK in a docker container

**Run with**:
`docker run -v ./:/opt --rm --env PROJECT_NAME=blinky --name pico-toolchain -it pico-sdk`

## Locations
- `/opt/` - working directory
- `/var/opt/`
    - A copy of `pico_sdk_import.cmake`
    - An example `CMakeLists.txt`
