# we using latest ubuntu version
FROM ubuntu:latest

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY app/* /usr/src/app/

RUN apt-get update
RUN apt-get upgrade

RUN apt-get install -y git
RUN apt-get install -y ninja-build
RUN apt-get install -y clang 
RUN apt-get install -y cmake 

RUN git clone https://github.com/Maksasj/bebone 3dparty/bebone

RUN cmake -B build -G Ninja
RUN cmake --build build

