# Blip Installation
- [Blip Installation](#blip-installation)
    - [Prerequisites](#prerequisites)
    - [Installing Node and Yarn](#installing-node-and-yarn)
    - [Installing RVM and Ruby](#installing-rvm-and-ruby)
    - [Setting up git](#setting-up-git)
    - [Specifying Node Versions using 'n'](#specifying-node-versions-using-'n')
    - [Installing mysql](#installing-mysql)
    - [Installing Redis](#installing-redis)
    - [Clone the Repository through GitHub](#clone-the-repository-through-github)
    - [Run Bundle Install and Yarn Install](#run-bundle-install-and-yarn-install)
    - [Setup database](#setup-database)
    - [Start Server](#start-server)
    - [Try login](#try-login)

## Prerequisites
The only prerequisite for installing blip is:
- OS: Ubuntu 16.04 (Xenial Xerus).

## Installing Node and Yarn
The first step is to install some dependencies for Ruby and Rails.

To make sure we have everything necessary for Webpacker support in Rails, we're first going to start by adding the Node.js and Yarn repositories to our system before installing them.

    sudo apt install curl
    curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

    sudo apt-get update
    sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn

## Installing RVM and Ruby


## Setting up git


## Specifying Node Versions using 'n'


## Installing mysql


## Installing Redis


## Clone the Repository through GitHub


## Run Bundle Install and Yarn Install


## Setup database


## Start Server


## Try login
