#!/bin/bash

## RPM Fusion ##

sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf groupupdate -y core

sudo dnf groupupdate -y multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin

sudo dnf groupupdate -y sound-and-video

sudo dnf install -y rpmfusion-free-release-tainted

sudo dnf install -y rpmfusion-nonfree-release-tainted
sudo dnf install -y \*-firmware

## Repositórios ##

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo

sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

## Programas RPM ##

dnf check-update

PROGRAMAS_DNF=(
  aisleriot
  audacity
  calibre
  code
  codium
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
  sublime-text
  texlive-scheme-full
  texmaker
  transmission-gtk
  visualboyadvance-m
  vlc
  ##xournal
  xournalpp
)

for nome_do_programa in ${PROGRAMAS_DNF[@]}; do
  sudo dnf install -y "$nome_do_programa"
done


## Programas Flatpak ##

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

PROGRAMAS_FLATPAK=(
  cc.arduino.arduinoide
  com.github.hugolabe.Wike
  com.github.tchx84.Flatseal
  com.obsproject.Studio
  com.rafaelmardojai.Blanket
  com.stremio.Stremio
  dev.Cogitri.Health
  io.crow_translate.CrowTranslate
  org.geogebra.GeoGebra
  org.telegram.desktop
  org.telegram.desktop.webview
  re.chiaki.Chiaki
  us.zoom.Zoom
)

for nome_do_programa in ${PROGRAMAS_FLATPAK[@]}; do
  sudo flatpak install -y --noninteractive "$nome_do_programa"
done

## Programas Snap ##

sudo snap install hello-world
sudo snap install skype
sudo snap install snap-store
sudo snap install spotify
