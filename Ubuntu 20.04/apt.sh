#!/bin/bash

sudo apt update

sudo apt install $(check-language-support)

PROGRAMAS=(
#   aisleriot
  apt-transport-https
  arduino
  audacity
  calibre
  chiaki
#   chromium
  codeblocks
#   cups
#   deja-dup
#   digimend-dkms
  gdebi
#   geary
#   flatpak
  gimp
#   gnome-dictionary
#   gnome-extensions-app
#   gnome-firmware
#   gnome-mines
#   gnome-shell-extension-appindicator
#   gnome-shell-extension-caffeine
#   gnome-shell-extension-dash-to-dock
#   gnome-shell-extension-drive-menu
#   gnome-shell-extension-gsconnect
#   gnome-shell-extension-sound-output-device-chooser
#   gnome-tweaks
#   google-chrome-stable
  gparted
  grub-customizer
#   hunspell-pt
#   hplip-gui
  hydrapaper
  idle
  ipython3
  linssid
  mupen64plus-qt
  myspell-pt
#   neofetch
  nsnake
#   okular
  pcsxr
  psi4
  remmina
#   snapd
  speedtest-cli
  steam-installer
  texlive-full
  texmaker
  timeshift
#   transmission-gtk
  ubuntu-wallpapers-eoan
  update-manager
  visualboyadvance
#   vlc
  wxmaxima
#   xournal
  xournalpp
  youtubedl-gui
)

for nome_do_programa in ${PROGRAMAS[@]}; do
  sudo apt install -y "$nome_do_programa"
done
