#!/usr/bin/env bash

clear

echo 'Ensuring xcode is installed.'
xcode-select --install 2> /dev/null

if [ ! -f ~/.config/mac-dev-playbook ]; then
  echo 'Copying default configuration into ~/.config/mac-dev-playbook. Any changes to this file will be used on future runs.'
  mkdir -p ~/.config
  cp -v files/mac-dev-playbook ~/.config

  echo
  echo 'Default configuration file will be opened in an editor. At a minimum, set your name and email address.'
  read -p 'Press Return to continue'
  vi ~/.config/mac-dev-playbook
  echo
fi
echo 'Invoking ansible to configure your Mac.'
./env/bin/ansible-playbook main.yml -K -i inventory $*
