#!/bin/bash
set -e

[ $(id -u www-data) -ne $UID -o $(id -g www-data) -ne $GID -o "/var/www" != $HOME ] && groupmod -g $GID www-data && usermod -u $UID -d $HOME www-data

exec sudo -u www-data $@

