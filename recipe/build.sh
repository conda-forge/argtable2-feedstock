#!/bin/bash

set -ex

if [ `uname` == Darwin ]; then
    # patch for Mac OSX error:
    # arg_int.c:89:8: error: call to undeclared library function 'toupper' with type 'int (int)'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    # if (toupper(*ptr++)!=toupper(X))
    # arg_int.c:89:8: note: include the header <ctype.h> or explicitly provide a declaration for 'toupper'
    sed -i'.bak' -e "33i #include <ctype.h>" src/arg_int.c
fi

./configure prefix=$PREFIX
make -j
make install
