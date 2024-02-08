#!/bin/bash

load_kitty_config() {
  bash kitty/load_config.sh
}

load_zsh_config() {
  bash zsh/load_config.sh
}

load_all_configs() {
  echo -- Loading all configs
  load_kitty_config
  load_zsh_config
}

if [ $# -eq 0 ]; then
  load_all_configs
else
  for config_binary in "$@" 
  do
    case $config_binary in
      kitty) load_kitty_config;;
      zsh) load_zsh_config;;
      *) echo "!!! Config for \"$config_binary\" not found"
    esac
  done
fi
