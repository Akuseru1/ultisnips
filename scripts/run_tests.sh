#!/usr/bin/env bash

set -e

PYTHON_CMD="$(which python)"
INTERFACE="--interface tmux"
VIM="$HOME/bin/vim"
PYTHON_VERSION=$($PYTHON_CMD -c 'import sys;print(sys.version.split()[0])')
echo "Using python from: $PYTHON_CMD Version: $PYTHON_VERSION"
echo "Using vim from:"
$VIM --version | head -n 3

set -x

tmux new -d -s vim

$PYTHON_CMD ./test_all.py \
   -v \
   --plugins \
   --session vim \
   --vim $VIM \
   $INTERFACE \
   --expected-python-version $PYTHON_VERSION
