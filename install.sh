#!/usr/bin/env bash

pip install -f wheels pip virtualenv
virtualenv /tmp/mac-dev-playbook
. /tmp/mac-dev-playbook/bin/activate
pip install ansible

cp -n files/mac-dev-playbook ~/.config
vi ~/.config/mac-dev-playbook
./provision.sh
