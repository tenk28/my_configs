#!/bin/bash

DISTRO=''

if [ -f "/etc/debian_version" ]; then
  DISTRO='debian'
fi

install_ssh_key() {
  ssh-keygen -t rsa -C "shtrikker28@gmail.com" -f $HOME/.ssh/id_rsa  -N "" -q
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    echo "Your ssh key:"
    cat id_rsa.pub
}

disable_bluetooth() {
  sudo systemctl disable bluetooth.service 
  sudo systemctl stop bluetooth.service
}

install_kitty() {
  case $DISTRO in
    debian)
      sudo apt install kitty --assume-yes
      sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/kitty 60
      ;;
    *) echo "Distro is not supported"
  esac
}

install_zsh() {
  case $DISTRO in
    debian)
      sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
      sudo apt install zsh --assume-yes
      ;;
    *) echo "Distro is not supported"
  esac
}

install_flameshot() {
  case $DISTRO in
    debian)
      sudo apt install flameshot --assume-yes
      ;;
    *) echo "Distro is not supported"
  esac
}

if [ $# -eq 0 ]; then
  echo ""
else
  for config_binary in "$@" 
  do
    case $config_binary in
      ssh_keys) install_ssh_key;;
      disable_bluetooth) disable_bluetooth;;
      kitty) install_kitty;;
      zsh) install_zsh;;
      flameshot) install_flameshot;;
      *) echo "!!! Config for \"$config_binary\" not found"
    esac
  done
fi
