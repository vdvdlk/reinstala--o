#!/bin/bash

## RPM Fusion ##

sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf groupupdate -y core

sudo dnf groupupdate -y multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin

sudo dnf groupupdate -y sound-and-video

sudo dnf install -y rpmfusion-free-release-tainted

sudo dnf install -y rpmfusion-nonfree-release-tainted
sudo dnf install -y \*-firmware

dnf check-update

PROGRAMAS_DNF=(
  aisleriot
  audacity
  calibre
  cups
  deja-dup
  discord
  dnfdragora
  geary
  gimp
  gnome-dictionary
  gnome-extensions-app
  gnome-firmware
  gnome-mines
  gnome-shell-extension-appindicator
  gnome-shell-extension-caffeine
  gnome-shell-extension-dash-to-dock
  gnome-shell-extension-drive-menu
  gnome-shell-extension-gsconnect
  gnome-shell-extension-sound-output-device-chooser
  gnome-tweaks
  google-chrome-stable
  gparted
  grub-customizer
  hunspell-pt
  hydrapaper
  libreoffice-langpack-pt-BR
  mupen64plus
  neofetch
  nsnake
  okular
  pcsxr
  psi4
  remmina
  steam
  texlive-scheme-full
  texmaker
  transmission-gtk
  visualboyadvance-m
  vlc
  ## xournal
  xournalpp
)

for nome_do_programa in ${PROGRAMAS_DNF[@]}; do
  sudo dnf install -y "$nome_do_programa"
done

