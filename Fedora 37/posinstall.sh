#!/bin/bash


## RPM Fusion ## https://rpmfusion.org/Configuration
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

## AppStream metadata ##  https://rpmfusion.org/Configuration
sudo dnf groupupdate -y core


## Additional codec ## https://rpmfusion.org/Howto/Multimedia
sudo dnf groupupdate -y multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf groupupdate -y sound-and-video

## Hardware Accelerated Codec ## https://rpmfusion.org/Howto/Multimedia
sudo dnf install -y intel-media-driver

## Play a DVD ## https://rpmfusion.org/Howto/Multimedia
sudo dnf install -y rpmfusion-free-release-tainted
sudo dnf install -y libdvdcss

## Various firmwares ## https://rpmfusion.org/Howto/Multimedia
sudo dnf install -y rpmfusion-nonfree-release-tainted
sudo dnf --repo=rpmfusion-nonfree-tainted install -y "*-firmware"


## Flathub ## https://flatpak.org/setup/Fedora
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo


## Visual Studio Code ## https://code.visualstudio.com/docs/setup/linux
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'


## Skype ## https://docs.fedoraproject.org/en-US/quick-docs/installing-skype/
sudo curl -o /etc/yum.repos.d/skype-stable.repo https://repo.skype.com/rpm/stable/skype-stable.repo


## Sublime Text ## https://www.sublimetext.com/docs/linux_repositories.html
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo


dnf check-update

PROGRAMAS_DNF=(
  aisleriot
  audacity
  calibre
  cawbird
  code
  cups
  deja-dup
  discord
  # dnfdragora
  geary
  gimp
  # gnome-dictionary
  gnome-extensions-app
  gnome-firmware
  gnome-mines
  gnome-shell-extension-appindicator
  gnome-shell-extension-caffeine
  gnome-shell-extension-dash-to-dock
  # gnome-shell-extension-drive-menu
  # gnome-shell-extension-gsconnect
  # gnome-shell-extension-sound-output-device-chooser
  gnome-shell-extension-user-theme
  gnome-tweaks
  google-chrome-stable
  # gparted
  grub-customizer
  # hunspell-pt-BR
  # hydrapaper
  # libreoffice-langpack-pt-BR
  # mupen64plus
  neofetch
  # nsnake
  obs-studio
  # okular
  # pcsxr
  # psi4
  pulseaudio
  pycharm-community
  python3-autopep8
  python3-matplotlib
  python3-numpy
  python3-pandas
  python3-pip
  python3-scipy
  python3-sympy
  python3-tqdm
  python3-virtualenv
  remmina
  skypeforlinux
  snapd  ## https://snapcraft.io/docs/installing-snap-on-fedora
  speedtest-cli
  # steam
  sublime-text
  telegram-desktop
  texlive-scheme-full
  texmaker
  transmission
  # visualboyadvance-m
  vlc
  wxMaxima
  xournalpp
)

for nome_do_programa in ${PROGRAMAS_DNF[@]}; do
  sudo dnf install -y "$nome_do_programa"
done


PROGRAMAS_FLATPAK=(
  com.github.tchx84.Flatseal
  com.stremio.Stremio
  io.github.JaGoLi.ytdl_gui
  io.github.seadve.Mousai
  org.gnome.World.Citations
  org.geogebra.GeoGebra
  org.kde.kdenlive
  org.kde.okular
  us.zoom.Zoom
)

for nome_do_programa in ${PROGRAMAS_FLATPAK[@]}; do
  sudo flatpak install -y --noninteractive "$nome_do_programa"
done


sudo reboot
