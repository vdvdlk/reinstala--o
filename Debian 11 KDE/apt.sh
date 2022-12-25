#!/bin/bash

sudo apt update

# sudo apt install $(check-language-support)

PROGRAMAS=(
#   aisleriot
#   apt-transport-https
  arduino
  audacity
  birdtray
  calibre
  chiaki
#   chromium
#   codeblocks
#   cups
#   deja-dup
  digimend-dkms
  exfat-utils
#   gdebi
#   geary
  flatpak
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
#   gparted
  grub-customizer
#   hunspell-pt
#   hplip-gui
  hydrapaper
  idle
  ipython3
  isympy3
  kaccounts-integration
  kde-config-tablet
  kiogdrive
  linssid
  mupen64plus-qt
  neofetch
  nsnake
  okular-extra-backends
  pavucontrol
  pcsxr
  psi4
  python3-autopep8
  python3-ipykernel
  python3-lmfit
  python3-matplotlib
  python3-notebook
  python3-pint
  python3-pip
  python3-scipy
  python3-sympy
  python3-tabulate
  python3-uncertainties
  python3-venv
  qapt-deb-installer
  remmina
  snapd
  sddm-theme-debian-breeze
  speedtest-cli
#   steam-installer
  texlive-full
  texmaker
  thunderbird
  timeshift
#   transmission-gtk
  udftools
  visualboyadvance
  vlc
  wxmaxima
#   xournal
#   xournalpp
  youtube-dl
#   youtubedl-gui
)

for nome_do_programa in ${PROGRAMAS[@]}; do
  sudo apt install -y "$nome_do_programa"
done
