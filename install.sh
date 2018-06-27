#!/usr/bin/env bash

pip install -f wheels pip virtualenv
virtualenv /tmp/mac-dev-playbook
. /tmp/mac-dev-playbook/bin/activate
pip install ansible

cp -n files/mac-dev-playbook ~/.config

echo 'Default configuration file will be opened in an editor. At a minimum, set your name and email address.'
read -p 'Press Return to continue'
vi ~/.config/mac-dev-playbook
./provision.sh
