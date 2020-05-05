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
    - [Setup database](#setup-database)
    - [Start Server](#start-server)
    - [Try login](#try-login)

## Prerequisites
The only prerequisite for installing blip is:
- OS: Ubuntu 16.04 (Xenial Xerus).

## Installing Node and Yarn
The first step is to install some dependencies for Ruby and Rails.

To make sure we have everything necessary for Webpacker support in Rails, we're first going to start by adding the Node.js and Yarn repositories to our system before installing them.

    $ sudo apt install curl
    $ curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
    $ curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    $ echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

    $ sudo apt-get update
    $ sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn

## Installing RVM and Ruby
Now we're going to be installing Ruby using rvm:

    $ sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
    $ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    $ curl -sSL https://get.rvm.io | bash -s stable
    $ source ~/.rvm/scripts/rvm
    $ rvm install 2.3.0
    $ rvm use 2.3.0 --default
    $ ruby -v
    $ gem update --system
    $ gem install bundler

## Setting up git
We'll be using Git for our version control system so we're going to set it up to match our Github account.

Replace my name and email address in the following steps with the ones you used for your Github account.

    $ git config --global color.ui true
    $ git config --global user.name "YOUR NAME"
    $ git config --global user.email "YOUR@EMAIL.com"
    $ ssh-keygen -t rsa -b 4096 -C "YOUR@EMAIL.com"

The next step is to take the newly generated SSH key and add it to your Github account.

    $ cat ~/.ssh/id_rsa.pub

Go to GitHub account. In Settings' go to 'SSH and GPG Keys'. Click on 'New SSH Key', give a suitable title and paste the copied key there.

Once you've done this, you can check and see if it worked:

    $ ssh -T git@github.com

You should get a message like this:

    Hi xyz! You've successfully authenticated, but GitHub does not provide shell access.

## Specifying Node Versions using 'n'
Since you probably already have node, the easiest way to install n is through npm:

    $ sudo npm install -g n

Simply execute sudo n <version> to download and install a version of node. If <version> has already been downloaded, n will install from its cache.

    $ sudo n 8.17.0

Execute n on its own to view your downloaded versions, and install the selected version.

    $ sudo n

      node/8.17.0
      node/12.16.3

    Use up/down arrow keys to select a version, return key to install, d to delete, q to quit

If the active node version does not change after install, try opening a new shell in case seeing a stale version.

## Installing mysql
If you want to install MySQL 5.7, you’ll need to add the latest APT package repository from the [MySQL APT repository page](https://dev.mysql.com/downloads/repo/apt/). The below version may be out of date.

    $ wget http://dev.mysql.com/get/mysql-apt-config_0.8.15-1_all.deb
    $ sudo dpkg -i mysql-apt-config_0.8.15-1_all.deb

You’ll see a prompt that asks you which MySQL product you want to configure. The MySQL Server option, which is highlighted, should say mysql-5.7. If it doesn’t, press ENTER, then scroll down to mysql-5.7 using the arrow keys, and press ENTER again.

Once the option says mysql-5.7, scroll down on the main menu to Apply and press ENTER again. Now, update your package index.

    $ sudo apt-get update

Finally, install the mysql-server package, which now contains MySQL 5.7.

    $ sudo apt-get install mysql-server

You’ll be prompted to create a root password during the installation. Choose 'welcome' as password.

## Installing Redis
In order to get the latest version of Redis, we will be compiling and installing the software from source. Before we download the code, we need to satisfy the build dependencies so that we can compile the software.

To do this, we can install the build-essential meta-package from the Ubuntu repositories. We will also be downloading the tcl package, which we can use to test our binaries.

We can update our local apt package cache and install the dependencies by typing:

    $ sudo apt-get update
    $ sudo apt-get install build-essential tcl

### Download, Compile, and Install Redis
Next, we can begin to build Redis.

#### Download and Extract the Source Code
Since we won’t need to keep the source code that we’ll compile long term (we can always re-download it), we will build in the /tmp directory. Let’s move there now:
    $ cd /tmp

Now, download the latest stable version of Redis.

    $ curl -O http://download.redis.io/redis-stable.tar.gz

Unpack the tarball by typing:

    $ tar xzvf redis-stable.tar.gz

Move into the Redis source directory structure that was just extracted:

    $ cd redis-stable

#### Build and Install Redis
Now, we can compile the Redis binaries by typing:

    $ make

After the binaries are compiled, run the test suite to make sure everything was built correctly. You can do this by typing:

    $ make test

This will typically take a few minutes to run. Once it is complete, you can install the binaries onto the system by typing:

    $ sudo make install

### Configure Redis
Now that Redis is installed, we can begin to configure it.

To start off, we need to create a configuration directory. We will use the conventional /etc/redis directory, which can be created by typing:

    $ sudo mkdir /etc/redis

Now, copy over the sample Redis configuration file included in the Redis source archive:

    $ sudo cp /tmp/redis-stable/redis.conf /etc/redis

Next, we can open the file to adjust a few items in the configuration:

    $ sudo nano /etc/redis/redis.conf

In the file, find the supervised directive. Currently, this is set to no. Since we are running an operating system that uses the systemd init system, we can change this to systemd:

Next, find the dir directory. This option specifies the directory that Redis will use to dump persistent data. We need to pick a location that Redis will have write permission and that isn’t viewable by normal users.

We will use the /var/lib/redis directory for this

Save and close the file when you are finished.

### Create a Redis systemd Unit File
Next, we can create a systemd unit file so that the init system can manage the Redis process.

Create and open the /etc/systemd/system/redis.service file to get started:

    $ sudo nano /etc/systemd/system/redis.service

Copy the following to the file:

    [Unit]
    Description=Redis In-Memory Data Store
    After=network.target

    [Service]
    User=redis
    Group=redis
    ExecStart=/usr/local/bin/redis-server /etc/redis/redis.conf
    ExecStop=/usr/local/bin/redis-cli shutdown
    Restart=always

    [Install]
    WantedBy=multi-user.target

Save and close the file when you are finished.

### Create the Redis User, Group and Directories
Now, we just have to create the user, group, and directory that we referenced in the previous two files.

Begin by creating the redis user and group. This can be done in a single command by typing:

    $ sudo adduser --system --group --no-create-home redis

Now, we can create the /var/lib/redis directory by typing:

    $ sudo mkdir /var/lib/redis

We should give the redis user and group ownership over this directory:

    $ sudo chown redis:redis /var/lib/redis

Adjust the permissions so that regular users cannot access this location:

    $ sudo chmod 770 /var/lib/redis

### Start and Test Redis
Now, we are ready to start the Redis server.

#### Start the Redis Service
Start up the systemd service by typing:

    $ sudo systemctl start redis

Check that the service had no errors by running:

    $ sudo systemctl status redis

It should show Active(Running)

#### Test the Redis Instance Functionality
To test that your service is functioning correctly, connect to the Redis server with the command-line client:

    $ redis-cli

In the prompt that follows, test connectivity by typing:

    127.0.0.1:6379> ping

You should see:

    Output
    PONG

Check that you can set keys by typing:

    127.0.0.1:6379> set test "It's working!"
    Output
    OK

Now, retrieve the value by typing:

    127.0.0.1:6379> get test

You should be able to retrieve the value we stored:

    Output
    "It's working!"

Exit the Redis prompt to get back to the shell:

    127.0.0.1:6379> exit

As a final test, let’s restart the Redis instance:

    $ sudo systemctl restart redis

Now, connect with the client again and confirm that your test value is still available:

    $ redis-cli
    127.0.0.1:6379> get test

The value of your key should still be accessible:

    Output
    "It's working!"

Back out into the shell again when you are finished:

    127.0.0.1:6379> exit

#### Enable Redis to Start at Boot

If all of your tests worked, and you would like to start Redis automatically when your server boots, you can enable the systemd service.

To do so, type:

    $ sudo systemctl enable redis
    Output
    Created symlink from /etc/systemd/system/multi-user.target.wants/redis.service to /etc/systemd/system/redis.service.

## Clone the Repository through GitHub
Move to home directory:

    $ cd

To clone blip repository from GitHub, visit https://github.com/amagimedia/blip

Click on 'Clone or Download'.

Click on 'Use SSH' and copy the given link.

Open terminal in home directory and type the following command:

    $ git clone git@github.com:amagimedia/blip.git

The repository will be downloaded.

Now move to the blip folder:

    $ cd blip

After this we need to run 'bundle install' to install all the dependencies:

    $ bundle install

To install all the frontend dependencies run the following commands:

    $ yarn install

After it is successful, run the following command:

    $ yarn run build-hot

And then leave the terminal as it is and open a new terminal in blip folder.

## Setup database


## Start Server


## Try login
