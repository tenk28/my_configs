#!/bin/bash

PATH_TO_PLACE="$HOME"
CONFIG_FILES=(".zshrc" ".p10k.zsh")
BINARY_NAME="zsh"

if [ -x "$(command -v $BINARY_NAME)" ]; then
  echo -- Loading $BINARY_NAME configs
  mkdir -p $PATH_TO_PLACE
  for file in ${CONFIG_FILES[@]}; do
    echo $file placed to $PATH_TO_PLACE
    cp -r "$(find -name $file)" $PATH_TO_PLACE
  done
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
else
  echo !!! $BINARY_NAME not found
fi
