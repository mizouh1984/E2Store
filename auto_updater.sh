#!/bin/sh
# ==============================================================================
# mizou1984 Exclusive E2 Store — Autonomous Background Auto-Updater (v4.2.0)
# Silent Store Self-Update + Direct Official Developer Plugin Updates
# ==============================================================================

STATE_DIR="/etc/mizou1984_store"
INSTALLED_FILE="$STATE_DIR/installed.list"
SHA_DB="$STATE_DIR/upstream_sha.db"
STORE_VER_FILE="$STATE_DIR/store_version.txt"
LOG_FILE="/tmp/mizou1984_autoupdate.log"

mkdir -p "$STATE_DIR"
touch "$INSTALLED_FILE" "$SHA_DB"

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] [mizou1984] $1" | tee -a "$LOG_FILE"
}

if [ -f /var/lib/dpkg/status ]; then
  PKG_MGR="dpkg"
else
  PKG_MGR="opkg"
fi

# Silent background Store self-update (no account info shown on TV)
LOCAL_STORE_VER=$(cat "$STORE_VER_FILE" 2>/dev/null | tr -d '\r\n ')
REMOTE_STORE_VER=$(wget -q --no-check-certificate -O - "https://raw.githubusercontent.com/mizou1984-store/e2-store/main/version.txt" 2>/dev/null | tr -d '\r\n ')

if [ -n "$REMOTE_STORE_VER" ] && [ "$REMOTE_STORE_VER" != "$LOCAL_STORE_VER" ]; then
  log "New mizou1984 Store update available ($LOCAL_STORE_VER -> $REMOTE_STORE_VER). Updating silently..."
  wget -q --no-check-certificate "https://raw.githubusercontent.com/mizou1984-store/e2-store/main/installer.sh" -O /tmp/mizou1984_selfupdate.sh 2>/dev/null
  if [ -s /tmp/mizou1984_selfupdate.sh ]; then
    chmod +x /tmp/mizou1984_selfupdate.sh
    /bin/sh /tmp/mizou1984_selfupdate.sh --no-restart >> "$LOG_FILE" 2>&1
    rm -f /tmp/mizou1984_selfupdate.sh
    log "mizou1984 Store updated silently to v$REMOTE_STORE_VER."
  fi
fi

log "Checking official developer sources for installed plugins (mode: $PKG_MGR)..."

UPDATED_ANY=0

while IFS= read -r PLUGIN_ID || [ -n "$PLUGIN_ID" ]; do
  [ -z "$PLUGIN_ID" ] && continue

  API_URL=""
  CMD_OPKG=""
  CMD_DPKG=""
  PLUGIN_NAME="$PLUGIN_ID"

  case "$PLUGIN_ID" in
    "ajpanel")
      API_URL="https://api.github.com/repos/AMAJamry/AJPanel/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/AMAJamry/AJPanel/main/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/AMAJamry/AJPanel/main/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="AJPanel"
      ;;
    "linuxsat-panel")
      API_URL="https://api.github.com/repos/Belfagor2005/LinuxsatPanel/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/Belfagor2005/LinuxsatPanel/main/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/Belfagor2005/LinuxsatPanel/main/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="Linuxsat-Panel"
      ;;
    "dreamsat-panel")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/DreamSatPanel/Panel/main/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/DreamSatPanel/Panel/main/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="DreamSat Panel"
      ;;
    "levi45-panel")
      API_URL="https://api.github.com/repos/levi-45/Addon/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/levi-45/Addon/main/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/levi-45/Addon/main/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="Levi45 Addons Panel"
      ;;
    "skyblue-panel")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/Belfagor2005/LinuxsatPanel/main/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/Belfagor2005/LinuxsatPanel/main/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="SkyBlue Panel"
      ;;
    "ciefp-panel")
      API_URL="https://api.github.com/repos/ciefp/CiefpPlugins/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/ciefp/CiefpPlugins/main/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/ciefp/CiefpPlugins/main/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="Ciefp Panel (CIFP)"
      ;;
    "aio-panel")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/Belfagor2005/LinuxsatPanel/main/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/Belfagor2005/LinuxsatPanel/main/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="AIO Panel (All-In-One)"
      ;;
    "oscam-emu-mohamed")
      API_URL="https://api.github.com/repos/MOHAMED19OS/Enigma2_Store/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="OSCam-Emu Universal"
      ;;
    "ncam-emu-mohamed")
      API_URL="https://api.github.com/repos/MOHAMED19OS/Enigma2_Store/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/ncam-installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/ncam-installer.sh -O - | /bin/sh'
      PLUGIN_NAME="NCam-Emu Universal"
      ;;
    "levi45-multicam")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/levi-45/Multicam/main/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/levi-45/Multicam/main/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="Levi45 Multicam Manager"
      ;;
    "keyadder")
      API_URL="https://api.github.com/repos/fairbird/KeyAdder/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/fairbird/KeyAdder/main/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/fairbird/KeyAdder/main/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="KeyAdder"
      ;;
    "oscam-icam")
      API_URL="https://api.github.com/repos/MOHAMED19OS/Enigma2_Store/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/oscam-icam-installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/oscam-icam-installer.sh -O - | /bin/sh'
      PLUGIN_NAME="OSCam-ICam (Sky DE/IT/UK)"
      ;;
    "oscam-smod")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="OSCam-Smod Universal"
      ;;
    "oscam-samur")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/levi-45/Multicam/main/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/levi-45/Multicam/main/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="OSCam Samur Edition"
      ;;
    "ncam-icam")
      API_URL="https://api.github.com/repos/MOHAMED19OS/Enigma2_Store/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/ncam-installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/ncam-installer.sh -O - | /bin/sh'
      PLUGIN_NAME="NCam-ICam Universal"
      ;;
    "ncam-fairbird")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/fairbird/NCam/main/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/fairbird/NCam/main/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="NCam Fairbird (Raed Edition)"
      ;;
    "gosat-gcam")
      API_URL="https://api.github.com/repos/MOHAMED19OS/Enigma2_Store/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/gcam-installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/gcam-installer.sh -O - | /bin/sh'
      PLUGIN_NAME="Gosat / GCam Universal (القوسات)"
      ;;
    "powercam")
      API_URL="https://api.github.com/repos/MOHAMED19OS/Enigma2_Store/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/powercam-installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/powercam-installer.sh -O - | /bin/sh'
      PLUGIN_NAME="PowerCam Universal (الباور كام)"
      ;;
    "cccam-universal")
      API_URL="https://api.github.com/repos/MOHAMED19OS/Enigma2_Store/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/cccam-installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/cccam-installer.sh -O - | /bin/sh'
      PLUGIN_NAME="CCcam 2.3.9 / 2.3.8 / 2.3.2 (السيس كام)"
      ;;
    "revcam")
      API_URL="https://api.github.com/repos/MOHAMED19OS/Enigma2_Store/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/revcam-installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/revcam-installer.sh -O - | /bin/sh'
      PLUGIN_NAME="RevCam V2 Universal (الراف كام)"
      ;;
    "ultracam")
      API_URL="https://api.github.com/repos/MOHAMED19OS/Enigma2_Store/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/ultracam-installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/ultracam-installer.sh -O - | /bin/sh'
      PLUGIN_NAME="UltraCam Universal (الألترا كام)"
      ;;
    "xstreamity")
      API_URL="https://api.github.com/repos/kiddac/XStreamity/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/kiddac/XStreamity/master/XStreamity/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/kiddac/XStreamity/master/XStreamity/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="XStreamity"
      ;;
    "xklass")
      API_URL="https://api.github.com/repos/kiddac/XKlass/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/kiddac/XKlass/master/XKlass/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/kiddac/XKlass/master/XKlass/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="XKlass"
      ;;
    "bouquetmakerxtream")
      API_URL="https://api.github.com/repos/kiddac/BouquetMakerXtream/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/kiddac/BouquetMakerXtream/master/BouquetMakerXtream/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/kiddac/BouquetMakerXtream/master/BouquetMakerXtream/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="BouquetMakerXtream"
      ;;
    "multistalker-pro")
      API_URL="https://api.github.com/repos/ziko-ZR1/Multi-StalkerPro/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/ziko-ZR1/Multi-StalkerPro/main/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/ziko-ZR1/Multi-StalkerPro/main/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="MultiStalker Pro"
      ;;
    "e2m3u2bouquet")
      API_URL="https://api.github.com/repos/pepsik-kiev/e2m3u2bouquet/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/pepsik-kiev/e2m3u2bouquet/main/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/pepsik-kiev/e2m3u2bouquet/main/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="E2m3u2bouquet (Dorik Mod)"
      ;;
    "vavoo-live")
      API_URL="https://api.github.com/repos/Belfagor2005/vavoo/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/Belfagor2005/vavoo/main/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/Belfagor2005/vavoo/main/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="Vavoo Stream Live"
      ;;
    "footonsat")
      API_URL="https://api.github.com/repos/ziko-ZR1/FootOnsat/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/ziko-ZR1/FootOnsat/main/Download/install.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/ziko-ZR1/FootOnsat/main/Download/install.sh -O - | /bin/sh'
      PLUGIN_NAME="FootOnsat"
      ;;
    "e2iplayer")
      API_URL="https://gitlab.com/api/v4/projects/zadmario%2Fe2iplayer/repository/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/E2IPlayer/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/E2IPlayer/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="E2iPlayer (ZadMario / MOHAMED_OS)"
      ;;
    "youtube-e2")
      API_URL="https://api.github.com/repos/Taapat/enigma2-plugin-youtube/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/fairbird/YouTube-E2/main/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/fairbird/YouTube-E2/main/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="YouTube-E2 (Taapat Mod)"
      ;;
    "subssupport")
      API_URL="https://api.github.com/repos/MOHAMED19OS/Enigma2_Store/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SubsSupport/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SubsSupport/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="Subssupport (MOHAMED_OS Mod)"
      ;;
    "epgimport-dorik")
      API_URL="https://api.github.com/repos/pepsik-kiev/EPGImport/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/pepsik-kiev/EPGImport/main/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/pepsik-kiev/EPGImport/main/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="EPGImport (Dorik1972 Mod)"
      ;;
    "epg-grabber-ziko")
      API_URL="https://api.github.com/repos/ziko-ZR1/Epg-plugin/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/ziko-ZR1/Epg-plugin/master/Download/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/ziko-ZR1/Epg-plugin/master/Download/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="EPG Grabber"
      ;;
    "arabicsavior")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/fairbird/ArabicSavior/main/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/fairbird/ArabicSavior/main/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="ArabicSavior"
      ;;
    "aglare-fhd")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/popking159/skins/main/aglare/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/popking159/skins/main/aglare/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="Aglare-FHD Skin"
      ;;
    "nitroadvance-fhd")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/fairbird/NitroAdvanceFHD/main/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/fairbird/NitroAdvanceFHD/main/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="NitroAdvance FHD"
      ;;
    "slyk-1080-r19")
      API_URL="https://api.github.com/repos/kiddac/Slyk_1080_R19/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/kiddac/Slyk_1080_R19/master/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/kiddac/Slyk_1080_R19/master/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="Slyk 1080 R19"
      ;;
    "fullhdline")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/Belfagor2005/Skins/main/FullHDLine/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/Belfagor2005/Skins/main/FullHDLine/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="FullHDLine Skin"
      ;;
    "slyk-q-1080")
      API_URL="https://api.github.com/repos/kiddac/Slyk_Q_1080/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/kiddac/Slyk_Q_1080/master/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/kiddac/Slyk_Q_1080/master/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="Slyk Q 1080 (SkyQ)"
      ;;
    "slyk-onyx-1080")
      API_URL="https://api.github.com/repos/kiddac/Slyk_Onyx_1080/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/kiddac/Slyk_Onyx_1080/master/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/kiddac/Slyk_Onyx_1080/master/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="Slyk Onyx 1080"
      ;;
    "glamour-aura-fhd")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/Belfagor2005/Skins/main/GlamourAuraFHD/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/Belfagor2005/Skins/main/GlamourAuraFHD/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="Glamour Aura FHD"
      ;;
    "odreamy-fhd")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/fairbird/oDreamy-FHD/main/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/fairbird/oDreamy-FHD/main/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="oDreamy-FHD Skin"
      ;;
    "youchie-pli-fhd")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/popking159/skins/main/youchie/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/popking159/skins/main/youchie/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="Youchie-PLI-FHD Skin"
      ;;
    "blackharmony-fhd")
      API_URL="https://api.github.com/repos/j00zek/BlackHarmony/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/j00zek/BlackHarmony/master/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/j00zek/BlackHarmony/master/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="BlackHarmony FHD"
      ;;
    "mymetrix-fhd")
      API_URL=""
      CMD_OPKG='opkg update && opkg install enigma2-plugin-skins-metrixhd'
      CMD_DPKG='apt-get update && apt-get install -y enigma2-plugin-skins-metrixhd'
      PLUGIN_NAME="MyMetrixFHD / MetrixHD Mod"
      ;;
    "pd1loi-fhd")
      API_URL=""
      CMD_OPKG='opkg update && opkg install enigma2-plugin-skins-pd1loi-hd-night'
      CMD_DPKG='apt-get update && apt-get install -y enigma2-plugin-skins-pd1loi-hd-night'
      PLUGIN_NAME="PD1LOI-FullHD Skin"
      ;;
    "wireguard-vpn")
      API_URL="https://api.github.com/repos/m4dhouse/WireGuard/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/m4dhouse/WireGuard/main/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/m4dhouse/WireGuard/main/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="WireGuard VPN"
      ;;
    "raedquicksignal")
      API_URL="https://api.github.com/repos/fairbird/RaedQuickSignal/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/fairbird/RaedQuickSignal/main/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/fairbird/RaedQuickSignal/main/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="RaedQuickSignal"
      ;;
    "serviceapp")
      API_URL="https://api.github.com/repos/mx3L/serviceapp/commits?per_page=1"
      CMD_OPKG='opkg update && opkg install enigma2-plugin-systemplugins-serviceapp exteplayer3 gstplayer'
      CMD_DPKG='apt-get update && apt-get install -y enigma2-plugin-systemplugins-serviceapp exteplayer3'
      PLUGIN_NAME="ServiceApp (Exteplayer3 / Gstplayer)"
      ;;
    "backupsuite")
      API_URL=""
      CMD_OPKG='opkg update && opkg install enigma2-plugin-extensions-backupsuite'
      CMD_DPKG='apt-get update && apt-get install -y enigma2-plugin-extensions-backupsuite'
      PLUGIN_NAME="BackupSuite"
      ;;
    "foreca-weather")
      API_URL="https://api.github.com/repos/Belfagor2005/Foreca/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/Belfagor2005/Foreca/main/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/Belfagor2005/Foreca/main/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="Foreca Weather"
      ;;
    "cacheflush")
      API_URL=""
      CMD_OPKG='opkg update && opkg install enigma2-plugin-extensions-cacheflush'
      CMD_DPKG='apt-get update && apt-get install -y enigma2-plugin-extensions-cacheflush'
      PLUGIN_NAME="CacheFlush"
      ;;
    "chocholousek-picons")
      API_URL="https://api.github.com/repos/s3n0/e2plugins/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://github.com/s3n0/e2plugins/raw/master/ChocholousekPicons/online-setup -O - | bash -s install'
      CMD_DPKG='wget -q "--no-check-certificate" https://github.com/s3n0/e2plugins/raw/master/ChocholousekPicons/online-setup -O - | bash -s install'
      PLUGIN_NAME="Chocholousek Picons"
      ;;
    "mohamed-os-feed")
      API_URL="https://api.github.com/repos/MOHAMED19OS/Enigma2_Store/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/Feed/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/Feed/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="MOHAMED_OS Universal Feed"
      ;;
    *)
      continue
      ;;
  esac

  if [ -z "$API_URL" ]; then
    continue
  fi

  REMOTE_SHA=$(wget -q --no-check-certificate -U "mizou1984-e2-updater/4.2.0" -O - "$API_URL" 2>/dev/null | grep -oE '"(sha|short_id)"[[:space:]]*:[[:space:]]*"[0-9a-f]+"' | head -n 1 | sed -E 's/.*"([0-9a-f]+)"/\1/' | cut -c1-12)

  if [ -z "$REMOTE_SHA" ]; then
    log "Skipping $PLUGIN_NAME (official source temporarily unreachable)"
    continue
  fi

  LOCAL_SHA=$(grep "^$PLUGIN_ID=" "$SHA_DB" 2>/dev/null | cut -d'=' -f2)

  if [ "$REMOTE_SHA" != "$LOCAL_SHA" ]; then
    log "New upstream update for $PLUGIN_NAME ($LOCAL_SHA -> $REMOTE_SHA). Updating automatically..."
    if [ "$PKG_MGR" = "dpkg" ]; then
      apt-get update -y >/dev/null 2>&1
      sh -c "$CMD_DPKG" >> "$LOG_FILE" 2>&1
    else
      opkg update >/dev/null 2>&1
      sh -c "$CMD_OPKG" >> "$LOG_FILE" 2>&1
    fi

    grep -v "^$PLUGIN_ID=" "$SHA_DB" > "$SHA_DB.tmp" 2>/dev/null || true
    echo "$PLUGIN_ID=$REMOTE_SHA" >> "$SHA_DB.tmp"
    mv "$SHA_DB.tmp" "$SHA_DB"
    UPDATED_ANY=1
    log "Updated $PLUGIN_NAME to upstream $REMOTE_SHA."
  else
    log "$PLUGIN_NAME is up-to-date ($REMOTE_SHA)."
  fi
done < "$INSTALLED_FILE"

if [ "$UPDATED_ANY" -eq 1 ]; then
  log "Upstream updates completed successfully."
  if [ "$1" = "--restart" ]; then
    sync
    if [ "$PKG_MGR" = "dpkg" ]; then
      systemctl restart enigma2
    else
      killall -9 enigma2
    fi
  fi
else
  log "All tracked plugins are up-to-date."
fi

exit 0
