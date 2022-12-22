#!/bin/bash

theme=${1}
user=${2}

install_configs(){
    echo instaling theme: ${theme}
    echo to user: ${user}
}

sudo cp -r /theo_themes /usr/share

install_configs

