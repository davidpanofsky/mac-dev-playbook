#!/usr/bin/env bash

xcode-select --install
pip install files/pip-10.0.1-py2.py3-none-any.whl
pip install ansible --user
ansible-galaxy install -r requirements.yml

vi config.yml
ansible-playbook main.yml -K -i inventory
