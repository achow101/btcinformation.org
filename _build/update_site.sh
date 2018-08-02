#!/bin/bash

# This file is licensed under the MIT License (MIT) available on
# http://opensource.org/licenses/MIT.

PATH=/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/bin

AUTHORIZED_SIGNERS_DIR='/btcinformation.org/auto-build-committers.gnupg'
REPO='https://github.com/achow101/btcinformation.org.git'
BASEDIR='/btcinformation.org'
BUNDLE_DIR="$BASEDIR/bundle"
SITEDIR="$BASEDIR//site"
DESTDIR="$BASEDIR/built"
WORKDIR=`mktemp -d`
BITCOINORG_BUILD_TYPE='deployment'

export BUNDLE_DIR
export BITCOINORG_BUILD_TYPE

# Stop script in case a single command fails
set -ex

# Cleanup on EXIT and kill all subprocesses (even when a command fails)
trap "rm -rf $WORKDIR $BASEDIR/build.pid; kill 0;" EXIT

# Make the base dir and set a pid file
mkdir -p $BASEDIR
if [ -f $BASEDIR/build.pid ]
then
    # Kill the process and wait
    kill $(<"$BASEDIR/build.pid")
    while [ -f $BASEDIR/build.pid ]
    do
        sleep 1
    done
fi
echo $$ > $BASEDIR/build.pid

# Clone repository if missing
if [ ! -d $SITEDIR ]; then
	git clone $REPO $SITEDIR
	cd $SITEDIR
	git reset --hard HEAD~1
fi

cd $SITEDIR
git fetch -a

## Whether to auto-build or force-build
case "${1:-nil}" in
  auto)
    # Exit if no new commit is available
    LASTLOCALCOMMIT=`git log --format="%H" | head -n1`
    LASTREMOTECOMMIT=`git log origin/master --format="%H" | head -n1`
    if [ $LASTLOCALCOMMIT == $LASTREMOTECOMMIT ]; then
      exit
    fi

    ## From git-log(1):
    ## %G?: show "G" for a Good signature, "B" for a Bad signature, "U"
    ## for a good, untrusted signature and "N" for no signature
    if ! GNUPGHOME=$AUTHORIZED_SIGNERS_DIR git log --format='%G?' -1 | egrep -q '^(G|U)$'
    then
      echo "Commit tree tip not signed by an authorized signer.  Terminating build."
      exit 1
    fi
  ;;

  force)
    true
  ;;

  *)
    echo "$0 <auto|force>"
    echo
    echo "auto: only builds if the latest commit is GPG signed by an authorized key"
    echo "force: builds latest commit no matter what"
    exit 1
  ;;
esac

# Update local branch
git reset --hard origin/master
git clean -x -f -d

# Copy files to temporary directory
rsync -rt --delete "$SITEDIR/" "$WORKDIR/"

# Build website
source /etc/profile.d/rvm.sh
cd $WORKDIR
make deployment

#  Upload stuff
find $WORKDIR/_site \( -iname '*.html' -o -iname '*.css' -o -iname '*.js' -o -iname '*.rss' -o -iname '*.xml' -o -iname '*.svg' -o -iname '*.ttf' \) -exec gzip -9 -k {} \;
rsync --delete -zrt --exclude .git* $WORKDIR/_site/ $DESTDIR/
echo "Upload done"
