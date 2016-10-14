#!/bin/bash

# set dir
dotfile_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

system_is() {
  test=$(uname -a 2>/dev/null | grep -i $1)
  if [ -z "$test" ]; then
    return 1
  else
    return 0
  fi
}

if system_is ubuntu; then
  echo "to be continue"
fi

if system_is cygwin; then
  UserProfile=$( cygpath $USERPROFILE )

  echo "copy file [_vsvimrc] to" $UserProfile
  cp $dotfile_dir/_vsvimrc $UserProfile
fi

