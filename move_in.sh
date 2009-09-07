#!/bin/sh
#
# download dot files from github, install them to ~
# joshua stein <jcs@jcs.org>
#
# usage: sh -c `ftp -o - http://github.com/jcs/dotfiles/raw/master/move_in.sh`
#

if [ ! -d ~/.ssh/ ]; then
	mkdir ~/.ssh/
fi

TD=`mktemp -d`

ftp -o - http://github.com/jcs/dotfiles/tarball/master | tar -C $TD -xvzf -
rm -f $TD/move_in.sh
mv -f $TD/.???* ~/

rm -rf $TD
