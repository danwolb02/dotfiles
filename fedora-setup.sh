#!/bin/bash

# dnf packages
sudo dnf remove -y firefox rhythmbox gnome-calendar gnome-maps cheese *libreoffice* gnome-photos gnome-boxes gnome-maps gedit gnome-clocks totem gnome-weather baobab gnome-calculator eog evince file-roller gnome-screenshot simple-scan gnome-characters gnome-logs gnome-font-viewer yelp gnome-contacts
sudo dnf update -y
sudo dnf install -y cmake ninja-build meson g++ clang vim exa bat micro zsh

# flatpak apps
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub org.gnome.Epiphany
flatpak install -y flathub org.gnome.Builder
flatpak install -y flathub org.gnome.gitlab.somas.Apostrophe
flatpak install -y flathub org.mozilla.firefox
flatpak install -y flathub com.uploadedlobster.peek

flatpak install -y flathub runtime/org.freedesktop.Platform.openh264/x86_64/19.08
flatpak install -y flathub org.freedesktop.Platform/x86_64/19.08
flatpak install -y flathub org.freedesktop.Platform.ffmpeg-full/x86_64/19.08
flatpak install -y flathub org.freedesktop.Platform.ffmpeg-full/x86_64/20.04

# vscode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf -y install code

# rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# reset app grid
gsettings reset org.gnome.shell app-picker-layout
