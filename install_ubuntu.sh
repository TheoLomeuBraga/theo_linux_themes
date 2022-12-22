#!/bin/bash

theme=${1}
user=${2}

install_dependencies(){
    sudo apt -y install software-properties-common

    dependencies="configs/${theme}/dependencies.txt"
    n = 1
    while read line; do
        sudo add-apt-repository ${line}
        n =$ ( ( n+ 1 ) )
    done < $dependencies

    sudo apt update

    repositorys="configs/${theme}/repositorys.txt"
    n = 1
    while read line; do
        sudo apt -y install ${line}
        n =$ ( ( n+ 1 ) )
    done < $repositorys
}

install_configs(){
    echo instaling theme: ${theme}
    echo to user: ${user}
    config_folders="configs/${theme}/config_folders.txt"
    n = 1
    while read line; do
        sudo cp -r /configs/${theme}/${line} /home/${user}/.config
        n =$ ( ( n+ 1 ) )
    done < $config_folders
    install_dependencies
}

install(){
    sudo cp -r /theo_themes /usr/share
    install_configs
}


install


