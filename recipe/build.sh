#!/bin/bash

set -ex

# use newer config.guess and config.sub that support linux-aarch64
cp ${RECIPE_DIR}/config.* .

./configure prefix=$PREFIX
make -j${CPU_COUNT}
make install
