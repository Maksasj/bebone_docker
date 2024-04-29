# We using latest ubuntu version
FROM ubuntu:latest

RUN mkdir -p /home/bebone
WORKDIR /home/bebone

COPY . /home/bebone

RUN apt-get update  -y
RUN apt-get upgrade -y

# Install Git
RUN apt-get install -y git

# Install build tools
RUN apt-get install -y ninja-build
RUN apt-get install -y clang 
RUN apt-get install -y cmake 

# Install libraries
RUN apt-get install -y xorg-dev
RUN apt-get install -y libxrandr-dev

# Install Vulkan SDK
RUN apt install     -y wget
RUN wget -qO- https://packages.lunarg.com/lunarg-signing-key-pub.asc | tee /etc/apt/trusted.gpg.d/lunarg.asc
RUN wget -qO /etc/apt/sources.list.d/lunarg-vulkan-jammy.list http://packages.lunarg.com/vulkan/lunarg-vulkan-jammy.list
RUN apt update
RUN apt install     -y vulkan-sdk

# Clone Bebone repo
RUN git clone --recursive https://github.com/Maksasj/bebone 3dparty/bebone

# Bebone checkout to dev branch
WORKDIR /home/bebone/3dparty/bebone
RUN git checkout dev
RUN git submodule update --init
WORKDIR /home/bebone

# Run build
CMD bash build.sh

