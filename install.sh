#!/usr/bin/env bash

xcode-select --install
pip install -f wheels pip virtualenv
virtualenv /tmp/mac-dev-playbook
. /tmp/mac-dev-playbook/bin/activate
pip install ansible
ansible-galaxy install -r requirements.yml

vi config.yml
ansible-playbook main.yml -K -i inventory
