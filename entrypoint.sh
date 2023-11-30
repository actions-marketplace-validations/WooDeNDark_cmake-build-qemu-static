#!/bin/sh

#
#
#

PKG_MANAGER=""
findPkgManager() {
  if [ -x "$(command -v apk)" ]; then
    PKG_MANAGER="apk"
  elif [ -x "$(command -v apt)" ]; then
    PKG_MANAGER="apt"
  else
    echo "[Error] Failed to identify package manager">&2 && exit 1
  fi
}

installPackages() {

  if [ "$PKG_MANAGER" = "apt" ]; then

    export DEBIAN_FRONTEND=noninteractive

    apt update

    PACKAGES="g++ cmake make python3 gcc"
    for PKG in $PACKAGES; do
      apt install -yq --no-install-recommends "$PKG"
    done

  elif [ "$PKG_MANAGER" = "apk" ]; then

    apk update

    PACKAGES="g++ cmake make python3 gcc"
    for PKG in $PACKAGES; do
      apk add --no-cache "$PKG"
    done

  else
    echo "[Error] Unimplemented logic for package manager $PKG_MANAGER.">&2 && exit 1
  fi

}

buildProject() {
  ls
  cmake -B ./cmake-build-release -DCMAKE_BUILD_TYPE=release
  cmake --build ./cmake-build-release --config release --target "$1"
}



findPkgManager
installPackages
buildProject "$@"