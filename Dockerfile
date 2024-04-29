# we using latest ubuntu version
FROM ubuntu:latest

RUN mkdir -p /home/bebone
WORKDIR /home/bebone

COPY . /home/bebone

RUN apt-get update
RUN apt-get upgrade

RUN apt-get install -y git
RUN apt-get install -y ninja-build
RUN apt-get install -y clang 
RUN apt-get install -y cmake 

RUN git clone --recursive https://github.com/Maksasj/bebone 3dparty/bebone

CMD bash build.sh

