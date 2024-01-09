#
#   docker run -v ./:/opt --rm --env PROJECT_NAME=blinky --name pico-toolchain -it pico-sdk
#
cmake_minimum_required(VERSION 3.13)
# initialize the SDK based on PICO_SDK_PATH
set(PICO_SDK_PATH /usr/share/pico-sdk/)
# note: this must happen before project() and it must be the absolute path
include("${PICO_SDK_PATH}./external/pico_sdk_import.cmake")

if(DEFINED $ENV{PROJECT_NAME})
    set(PNAME $ENV{PROJECT_NAME})
else()
    set(PNAME "pico-project")
endif()

project(${PNAME} C CXX ASM)
# initialize the Raspberry Pi Pico SDK
pico_sdk_init()

# rest of your project

#C++ standards
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)

#PICO-led
add_definitions(
    -DPICO_DEFAULT_LED_PIN=25
    -DCMAKE_BUILD_TYPE=Debug
)

file(GLOB SRC_FILES
    "src/*.cpp"
)

include_directories(
    /usr/share/pico-sdk/src/common/pico_stdlib/
    inc/
)

add_executable(${PROJECT_NAME} ${SRC_FILES})

# Pull in our pico_stdlib which pulls in commonly used features
target_link_libraries(${PROJECT_NAME}
    pico_stdlib
    hardware_gpio
    hardware_pwm
)

#disable uart
pico_enable_stdio_usb(${PROJECT_NAME} true)

# create map/bin/hex file etc.
pico_add_extra_outputs(${PROJECT_NAME})

# add url via pico_set_program_url
#example_auto_set_url(${PROJECT_NAME})
