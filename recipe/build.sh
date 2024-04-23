#!/bin/bash

set -ex

./configure prefix=$PREFIX
make -j
make install
