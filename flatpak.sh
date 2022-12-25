#!/bin/bash

PROGRAMAS_FLATPAK=(
#   cc.arduino.arduinoide
#   ch.openboard.OpenBoard
  com.discordapp.Discord
#   com.github.hugolabe.Wike
  com.github.tchx84.Flatseal
#   com.github.xournalpp.xournalpp
  com.obsproject.Studio
#   com.rafaelmardojai.Blanket
  com.stremio.Stremio
#   dev.Cogitri.Health
  io.crow_translate.CrowTranslate
  org.fedoraproject.MediaWriter
#   org.ferdium.Ferdium
  org.geogebra.GeoGebra
#   org.gnome.Solanum
  org.telegram.desktop
  us.zoom.Zoom
)

for nome_do_programa in ${PROGRAMAS_FLATPAK[@]}; do
  sudo flatpak install -y --noninteractive "$nome_do_programa"
done
