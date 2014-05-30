#!/bin/bash

echo "Updating system ..."
yum -y update

echo "Installing extra repositories ..."
rpm -Uvh http://ftp-srv2.kddilabs.jp/Linux/distributions/fedora/epel/6/i386/epel-release-6-8.noarch.rpm

echo "Installing development tools ..."
yum -y install git wget

echo "Installing redis ..."
rpm -Uvh http://ftp-srv2.kddilabs.jp/Linux/distributions/fedora/epel/6/i386/epel-release-6-8.noarch.rpm
yum -y --enablerepo=epel install redis
service redis start

echo "Installing webdis ..."
yum -y install libevent-devel
git clone https://github.com/nicolasff/webdis.git
cd webdis
make
./webdis &

