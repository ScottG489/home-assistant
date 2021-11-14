#!/bin/bash
set -ex

# Taken from: https://github.com/home-assistant/supervised-installer

sudo apt-get update

sudo apt-get install jq wget curl udisks2 libglib2.0-bin network-manager dbus -y

[[ -x "$(command -v docker)" ]] || curl -fsSL get.docker.com | sh

dpkg -s os-agent ||
    (wget 'https://github.com/home-assistant/os-agent/releases/download/1.2.2/os-agent_1.2.2_linux_x86_64.deb' \
    && sudo apt install -y './os-agent_1.2.2_linux_x86_64.deb')

dpkg -s homeassistant-supervised ||
    (wget 'https://github.com/home-assistant/supervised-installer/releases/latest/download/homeassistant-supervised.deb' \
    && sudo apt install -y './homeassistant-supervised.deb')
