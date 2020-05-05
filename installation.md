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
Now we're going to be installing Ruby using rvm:

    sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    curl -sSL https://get.rvm.io | bash -s stable
    source ~/.rvm/scripts/rvm
    rvm install 2.3.0
    rvm use 2.3.0 --default
    ruby -v
    gem update --system
    gem install bundler

## Setting up git


## Specifying Node Versions using 'n'


## Installing mysql


## Installing Redis


## Clone the Repository through GitHub


## Run Bundle Install and Yarn Install


## Setup database


## Start Server


## Try login
