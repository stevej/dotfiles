#!/usr/bin/env bash

set -eux

DOTFILE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &>/dev/null && pwd )"

sudo apt update
sudo apt install -y \
    gnupg2 \
    htop \
    jo \
    jq \
    less \
    locales \
    man \
    psmisc \
    ripgrep \
    vim \
    zsh

sudo sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen
sudo locale-gen

git config --global user.email "stevej@buoyant.io"
git config --global user.name "Steve Jenson"

cp "$DOTFILE_DIR"/.zshenv "$HOME"/.zshenv
cp "$DOTFILE_DIR"/.zshrc "$HOME"/.zshrc

mkdir -p "$HOME"/bin
cp -rp "$DOTFILE_DIR"/bin/* "$HOME"/bin/

if (command -v cargo && ! command -v cargo-nextest) >/dev/null 2>&1 ; then
    curl --proto '=https' --tlsv1.3 -fLsSv https://get.nexte.st/latest/linux \
        | tar xzvf - -C "$HOME"/bin
fi

if command -v k3d >/dev/null 2>&1 ; then
    k3d kubeconfig merge -d 2>/dev/null || true
fi
