#!/bin/sh

wget https://bootstrap.pypa.io/get-pip.py -O /tmp/get-pip.py
sudo python /tmp/get-pip.py
sudo pip install -U pip

sudo apt-get install ansible
sudo pip install -U ansible
