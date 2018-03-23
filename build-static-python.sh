#!/bin/bash
# set -eux

# Based off of: http://general-purpose.io/2015/12/06/compiling-python-and-libpython-statically-using-musl-libc/

WORKING_DIR="$(pwd)/python"
MUSL_PREFIX="$WORKING_DIR/musl"
MUSL_VERSION="1.1.19"
PYTHON_PREFIX="$WORKING_DIR/python"
PYTHON_VERSION="3.6.4"
JOBS="$(grep -c ^processor /proc/cpuinfo)"

COMPILER="gcc"
# COMPILER_VERSION="7.3.1"
# COMPILER="clang"
# COMPILER_VERSION="5.0"

# make the compiler's actual command name
# export CC="${COMPILER}-${COMPILER_VERSION}"
export CC="${COMPILER}"

# prepare the working directory
mkdir --parents "${WORKING_DIR}"

# download/extract/build static musl libc
cd "${WORKING_DIR}" || exit
wget -c "http://www.musl-libc.org/releases/musl-${MUSL_VERSION}.tar.gz"
tar -xzf "musl-${MUSL_VERSION}.tar.gz"
cd "musl-${MUSL_VERSION}" || exit
./configure --prefix="${MUSL_PREFIX}" --disable-shared
make -j "$JOBS"
make install

# enable the "musl compiler"
export CC="${MUSL_PREFIX}/bin/musl-${COMPILER}"

# download/extract/build static python/libpython
cd "${WORKING_DIR}" || exit
wget -c "https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tar.xz"
tar -xJf "Python-${PYTHON_VERSION}.tar.xz"
cd "Python-${PYTHON_VERSION}" || exit
./configure --prefix="${PYTHON_PREFIX}" --disable-shared  \
            LDFLAGS="-static" CFLAGS="-static" CPPFLAGS="-static"
make -j "$JOBS"
make install

# done ! (ignore any error that might happen during "make install")
# we now have:
#   ${MUSL_PREFIX}/bin/musl-gcc           : "static gcc" that uses musl
#   ${PYTHON_PREFIX}/bin/python3.5        : static python interpreter
#   ${PYTHON_PREFIX}/lib/libpython3.5m.a  : static libpython
#   ${PYTHON_PREFIX}/include/python3.5m   : include directory for libpython
