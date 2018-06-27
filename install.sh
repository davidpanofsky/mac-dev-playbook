#!/usr/bin/env bash

if [ ! -f ~/.config/mac-dev-playbook ]; then
  cp files/mac-dev-playbook ~/.config

  echo 'Default configuration file will be opened in an editor. At a minimum, set your name and email address.'
  read -p 'Press Return to continue'
  vi ~/.config/mac-dev-playbook
fi
./env/bin/ansible-playbook main.yml -K -i inventory
