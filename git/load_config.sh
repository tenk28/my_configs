#!/bin/bash

PATH_TO_PLACE="$HOME"
CONFIG_FILES=(".gitconfig")
BINARY_NAME="git"

if [ -x "$(command -v $BINARY_NAME)" ]; then
  echo -- Loading $BINARY_NAME configs
  for file in ${CONFIG_FILES[@]}; do
    echo $file placed to $PATH_TO_PLACE
    cp -r "$(find -name $file)" $PATH_TO_PLACE
  done
  else
  echo !!! $BINARY_NAME not found
fi
