#!/bin/bash

# Firstly we will check if bebone is up to date
git pull --recurse-submodules

# Now lets build
cmake -B build -G Ninja
cmake --build build