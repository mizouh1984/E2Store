#!/bin/sh
# ==============================================================================
# mizou1984 Exclusive E2 Store — Official Public Installer (v4.4.0)
# Includes: Full-Screen Dark Frameless UI + Enlarged Custom Icon (plugin.png)
#           + Silent Background Auto-Update + Official Developer Sources
# Works on ALL Enigma2 Images (OpenATV, OpenPLi, OpenBH, Egami, PurE2, VTi, DreamOS)
# Supports Python 2.7 & Python 3.x (3.9 -> 3.14+)
# ==============================================================================

PLUGIN_DIR="/usr/lib/enigma2/python/Plugins/Extensions/Mizou1984Store"
STATE_DIR="/etc/mizou1984_store"

echo "============================================================"
echo "  Installing mizou1984 E2 Store v4.4.0 (mizou1984 Exclusive)"
echo "  Full-Screen Dark UI + Custom Icon + Silent Auto-Updater"
echo "============================================================"

rm -rf "$PLUGIN_DIR"
mkdir -p "$PLUGIN_DIR" "$STATE_DIR"
rm -f "$STATE_DIR/github.conf"
touch "$PLUGIN_DIR/__init__.py" "$STATE_DIR/installed.list" "$STATE_DIR/upstream_sha.db"
echo "4.4.0" > "$STATE_DIR/store_version.txt"

cat << 'EOF_MIZOU1984_ICON' > /tmp/mizou1984_icon.b64
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
EOF_MIZOU1984_ICON

if command -v python3 >/dev/null 2>&1; then
  python3 -c 'import base64; data = open("/tmp/mizou1984_icon.b64", "r").read().replace("\n", ""); open("/usr/lib/enigma2/python/Plugins/Extensions/Mizou1984Store/plugin.png", "wb").write(base64.b64decode(data))'
elif command -v python >/dev/null 2>&1; then
  python -c 'import base64; data = open("/tmp/mizou1984_icon.b64", "r").read().replace("\n", ""); open("/usr/lib/enigma2/python/Plugins/Extensions/Mizou1984Store/plugin.png", "wb").write(base64.b64decode(data))'
else
  base64 -d /tmp/mizou1984_icon.b64 > "$PLUGIN_DIR/plugin.png" 2>/dev/null || true
fi
rm -f /tmp/mizou1984_icon.b64

cat << 'EOF_MIZOU1984_PY' > "$PLUGIN_DIR/plugin.py"
# -*- coding: utf-8 -*-
# ==============================================================================
# mizou1984 E2 Store — Exclusive Edition by mizou1984 (v4.4.0)
# Full-Screen Dark Frameless UI (wfNoBorder) + Enlarged Custom Plugin Icon
# Silent Background Auto-Update + Direct Official Developer Sources
# Compatible with: OpenATV, OpenPLi, OpenBH, Egami, PurE2, OpenSPA, VTi, DreamOS
# Python Support: Python 2.7 & Python 3.x (3.9 -> 3.14+)
# ==============================================================================

from __future__ import print_function
import json
import os
import re
import ssl
import sys
import time

try:
    from urllib.request import urlopen, Request
except ImportError:
    from urllib2 import urlopen, Request

from Plugins.Plugin import PluginDescriptor
from Screens.Screen import Screen
from Screens.MessageBox import MessageBox
from Screens.Console import Console
from Components.ActionMap import ActionMap
from Components.MenuList import MenuList
from Components.Label import Label
from enigma import getDesktop, eTimer

PLUGIN_VERSION = "4.4.0"
BRAND_MARK = "mizou1984 Exclusive"
UPDATE_FEED_BASE = "https://raw.githubusercontent.com/mizouh1984/E2Store/main"

IS_DREAMOS = os.path.exists("/var/lib/dpkg/status")
DESKTOP_WIDTH = getDesktop(0).size().width()
PLUGIN_DIR = "/usr/lib/enigma2/python/Plugins/Extensions/Mizou1984Store"
STATE_DIR = "/etc/mizou1984_store"
INSTALLED_FILE = os.path.join(STATE_DIR, "installed.list")
AUTO_UPDATER_BIN = os.path.join(PLUGIN_DIR, "auto_updater.sh")
AUTO_SCHEDULE = "0 4 * * *"

CATEGORIES = [
    ("all", "All Plugins — Direct Official Sources", "Browse all verified Enigma2 plugins from top developers with live official source installation."),
    ("panels", "Panels & Addon Stores", "AJPanel, TunisiaSat (TSpanel), SatVenus, ElieSat, EnigmaPlay, SkyBlue, Ciefp (CIFP), Levi45, AIO, Linuxsat & DreamSat."),
    ("plugins_hub", "Plugins Collection (Alayer, Ansite, AthanTimes, EPG...)", "Alayer, Ansite, ArabicSavior, AthanTimes, BitrateViewer, BootLogoSwapper, EPGGrabber, EPGImport, EPGTranslator, IPAudioPlus, XtraEvent, Quran Karim & more."),
    ("softcams", "Softcams & Keys (OSCam / NCam / All Cams)", "All OSCam & NCam builds, Gosat/GCam, PowerCam, CCcam, RevCam, UltraCam, Levi45 Multicam & KeyAdder."),
    ("iptv", "IPTV & Stalker Players", "XStreamity, XKlass, BouquetMakerXtream, MultiStalker Pro, E2m3u2bouquet and Vavoo."),
    ("sports_media", "Sports & Media", "FootOnsat live match schedules, E2iPlayer VOD library and YouTube-E2 4K."),
    ("epg_subtitles", "Subtitles & EPG Packs", "Subssupport Arabic mod and Rytec EPG XMLTV official sources."),
    ("skins", "FullHD & 4K Skins", "Aglare-FHD, NitroAdvanceFHD, Slyk Q, Slyk Onyx, Glamour Aura, oDreamy-FHD, Youchie-PLI, BlackHarmony, MetrixFHD & PD1LOI."),
    ("system_tools", "System Tools & WireGuard VPN", "WireGuard VPN, RaedQuickSignal, ServiceApp Exteplayer3, BackupSuite, Foreca and CacheFlush."),
    ("picons_feeds", "Picons & Official Feeds", "Chocholousek Picons updater and MOHAMED_OS Universal Feed."),
]

PLUGIN_CATALOG = [
    {
        "id": "ajpanel",
        "name": "AJPanel",
        "developer": "biko & A.J. (AJPanel)",
        "category": "panels",
        "version": "10.8.2",
        "size": "1.8 MB",
        "description": "AJPanel by biko & A.J. (AJPanel) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/AMAJamry/AJPanel/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/AMAJamry/AJPanel/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "linuxsat-panel",
        "name": "Linuxsat-Panel",
        "developer": "Lululla (Linuxsat)",
        "category": "panels",
        "version": "2.5.4",
        "size": "2.4 MB",
        "description": "Linuxsat-Panel by Lululla (Linuxsat) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/Belfagor2005/LinuxsatPanel/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/Belfagor2005/LinuxsatPanel/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "dreamsat-panel",
        "name": "DreamSat Panel",
        "developer": "Madhouse & DreamSat",
        "category": "panels",
        "version": "1.6.2",
        "size": "1.5 MB",
        "description": "DreamSat Panel by Madhouse & DreamSat — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/DreamSatPanel/Panel/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/DreamSatPanel/Panel/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "levi45-panel",
        "name": "Levi45 Addons Panel",
        "developer": "Levi45",
        "category": "panels",
        "version": "10.4",
        "size": "1.2 MB",
        "description": "Levi45 Addons Panel by Levi45 — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/levi-45/Addon/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/levi-45/Addon/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "skyblue-panel",
        "name": "SkyBlue Panel",
        "developer": "Madhouse & DreamSat",
        "category": "panels",
        "version": "3.8",
        "size": "1.6 MB",
        "description": "SkyBlue Panel by Madhouse & DreamSat — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/Belfagor2005/LinuxsatPanel/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/Belfagor2005/LinuxsatPanel/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "ciefp-panel",
        "name": "Ciefp Panel (CIFP)",
        "developer": "Ciefp (CIFP)",
        "category": "panels",
        "version": "2.9",
        "size": "1.4 MB",
        "description": "Ciefp Panel (CIFP) by Ciefp (CIFP) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/ciefp/CiefpPlugins/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/ciefp/CiefpPlugins/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "aio-panel",
        "name": "AIO Panel (All-In-One)",
        "developer": "Lululla (Linuxsat)",
        "category": "panels",
        "version": "5.4",
        "size": "1.9 MB",
        "description": "AIO Panel (All-In-One) by Lululla (Linuxsat) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/Belfagor2005/LinuxsatPanel/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/Belfagor2005/LinuxsatPanel/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "enigma-play",
        "name": "EnigmaPlay",
        "developer": "Ahmad Alarjan (EnigmaPlay)",
        "category": "panels",
        "version": "2.6.0",
        "size": "2.0 MB",
        "description": "EnigmaPlay by Ahmad Alarjan (EnigmaPlay) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/Ahmadarjan1/EnigmaPlay-Repo/main/install.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/Ahmadarjan1/EnigmaPlay-Repo/main/install.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "tunisiasat-panel",
        "name": "TunisiaSat Panel (TSpanel)",
        "developer": "TunisiaSat & SatVenus Team",
        "category": "panels",
        "version": "8.4-py3",
        "size": "2.1 MB",
        "description": "TunisiaSat Panel (TSpanel) by TunisiaSat & SatVenus Team — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/eliesat/eliesatpanel/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/eliesat/eliesatpanel/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "satvenus-panel",
        "name": "SatVenus Panel",
        "developer": "TunisiaSat & SatVenus Team",
        "category": "panels",
        "version": "7.4.2",
        "size": "1.9 MB",
        "description": "SatVenus Panel by TunisiaSat & SatVenus Team — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/Belfagor2005/LinuxsatPanel/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/Belfagor2005/LinuxsatPanel/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "eliesat-panel",
        "name": "ElieSat Panel",
        "developer": "ElieSat (إيلي سات)",
        "category": "panels",
        "version": "3.2.0",
        "size": "2.3 MB",
        "description": "ElieSat Panel by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/eliesat/eliesatpanel/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/eliesat/eliesatpanel/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "alayer-plugin",
        "name": "Alayer (Alaire)",
        "developer": "ElieSat (إيلي سات)",
        "category": "plugins_hub",
        "version": "2.4",
        "size": "1.1 MB",
        "description": "Alayer (Alaire) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/eliesat/eliesatpanel/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/eliesat/eliesatpanel/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "ansite-plugin",
        "name": "Ansite",
        "developer": "MOHAMED_OS",
        "category": "plugins_hub",
        "version": "1.8",
        "size": "980 KB",
        "description": "Ansite by MOHAMED_OS — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Download/main/Ansite/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Download/main/Ansite/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "athantimes",
        "name": "AthanTimes",
        "developer": "fairbird (رائد)",
        "category": "plugins_hub",
        "version": "2.9.5",
        "size": "3.4 MB",
        "description": "AthanTimes by fairbird (رائد) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/AthanTimes/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/AthanTimes/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "bitrate-viewer",
        "name": "BitrateViewer",
        "developer": "Lululla (Linuxsat)",
        "category": "plugins_hub",
        "version": "2.5",
        "size": "320 KB",
        "description": "BitrateViewer by Lululla (Linuxsat) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "opkg install enigma2-plugin-extensions-bitrate || opkg install enigma2-plugin-extensions-bitrateviewer",
        "cmd_dpkg": "apt-get install -y enigma2-plugin-extensions-bitrateviewer",
        "restart": True,
    },
    {
        "id": "bootlogo-swapper",
        "name": "BootLogoSwapper",
        "developer": "ElieSat (إيلي سات)",
        "category": "plugins_hub",
        "version": "2.3",
        "size": "4.2 MB",
        "description": "BootLogoSwapper by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/eliesat/eliesatpanel/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/eliesat/eliesatpanel/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "epg-translator",
        "name": "EPGTranslator",
        "developer": "ElieSat (إيلي سات)",
        "category": "plugins_hub",
        "version": "1.6",
        "size": "540 KB",
        "description": "EPGTranslator by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "opkg install enigma2-plugin-extensions-epgtranslator || opkg install enigma2-plugin-extensions-translator",
        "cmd_dpkg": "apt-get install -y enigma2-plugin-extensions-epgtranslator",
        "restart": True,
    },
    {
        "id": "ipaudio-plus",
        "name": "IPAudioPlus / IPAudio Pro",
        "developer": "ziko",
        "category": "plugins_hub",
        "version": "7.4",
        "size": "1.3 MB",
        "description": "IPAudioPlus / IPAudio Pro by ziko — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/ziko-ZR1/IPAudio/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/ziko-ZR1/IPAudio/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "xtraevent",
        "name": "XtraEvent",
        "developer": "ElieSat (إيلي سات)",
        "category": "plugins_hub",
        "version": "6.8",
        "size": "1.5 MB",
        "description": "XtraEvent by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/digiteng/xtra/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/digiteng/xtra/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "quran-karim",
        "name": "Quran Karim (القرآن الكريم)",
        "developer": "fairbird (رائد)",
        "category": "plugins_hub",
        "version": "2.6",
        "size": "2.2 MB",
        "description": "Quran Karim (القرآن الكريم) by fairbird (رائد) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/Quran/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/Quran/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "historyzap-selector",
        "name": "HistoryZap Selector",
        "developer": "Lululla (Linuxsat)",
        "category": "plugins_hub",
        "version": "1.9",
        "size": "410 KB",
        "description": "HistoryZap Selector by Lululla (Linuxsat) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "opkg install enigma2-plugin-extensions-historyzapselector",
        "cmd_dpkg": "apt-get install -y enigma2-plugin-extensions-historyzapselector",
        "restart": True,
    },
    {
        "id": "dream-explorer",
        "name": "DreamExplorer",
        "developer": "Lululla (Linuxsat)",
        "category": "plugins_hub",
        "version": "7.5",
        "size": "380 KB",
        "description": "DreamExplorer by Lululla (Linuxsat) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "opkg install enigma2-plugin-extensions-dreamexplorer",
        "cmd_dpkg": "apt-get install -y enigma2-plugin-extensions-dreamexplorer",
        "restart": True,
    },
    {
        "id": "permanent-clock",
        "name": "PermanentClock",
        "developer": "Lululla (Linuxsat)",
        "category": "plugins_hub",
        "version": "2.1",
        "size": "160 KB",
        "description": "PermanentClock by Lululla (Linuxsat) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "opkg install enigma2-plugin-extensions-permanentclock",
        "cmd_dpkg": "apt-get install -y enigma2-plugin-extensions-permanentclock",
        "restart": True,
    },
    {
        "id": "autobouquets-maker",
        "name": "AutoBouquetsMaker",
        "developer": "Lululla (Linuxsat)",
        "category": "plugins_hub",
        "version": "3.4",
        "size": "890 KB",
        "description": "AutoBouquetsMaker by Lululla (Linuxsat) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "opkg install enigma2-plugin-systemplugins-autobouquetsmaker",
        "cmd_dpkg": "apt-get install -y enigma2-plugin-systemplugins-autobouquetsmaker",
        "restart": True,
    },
    {
        "id": "tmdb-info",
        "name": "TMDB Movie Info",
        "developer": "Lululla (Linuxsat)",
        "category": "plugins_hub",
        "version": "1.4",
        "size": "620 KB",
        "description": "TMDB Movie Info by Lululla (Linuxsat) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "opkg install enigma2-plugin-extensions-tmdb",
        "cmd_dpkg": "apt-get install -y enigma2-plugin-extensions-tmdb",
        "restart": True,
    },
    {
        "id": "oscam-emu-mohamed",
        "name": "OSCam-Emu Universal",
        "developer": "MOHAMED_OS",
        "category": "softcams",
        "version": "11856-r802",
        "size": "2.1 MB",
        "description": "OSCam-Emu Universal by MOHAMED_OS — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/installer.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "ncam-emu-mohamed",
        "name": "NCam-Emu Universal",
        "developer": "MOHAMED_OS",
        "category": "softcams",
        "version": "15.2-r0",
        "size": "2.0 MB",
        "description": "NCam-Emu Universal by MOHAMED_OS — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/ncam-installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/ncam-installer.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "levi45-multicam",
        "name": "Levi45 Multicam Manager",
        "developer": "Levi45",
        "category": "softcams",
        "version": "10.6-r3",
        "size": "980 KB",
        "description": "Levi45 Multicam Manager by Levi45 — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/levi-45/Multicam/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/levi-45/Multicam/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "keyadder",
        "name": "KeyAdder",
        "developer": "fairbird (رائد)",
        "category": "softcams",
        "version": "8.7",
        "size": "640 KB",
        "description": "KeyAdder by fairbird (رائد) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/KeyAdder/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/KeyAdder/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "oscam-icam",
        "name": "OSCam-ICam (Sky DE/IT/UK)",
        "developer": "MOHAMED_OS",
        "category": "softcams",
        "version": "11856-icam-v9",
        "size": "2.2 MB",
        "description": "OSCam-ICam (Sky DE/IT/UK) by MOHAMED_OS — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/oscam-icam-installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/oscam-icam-installer.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "oscam-smod",
        "name": "OSCam-Smod Universal",
        "developer": "MOHAMED_OS",
        "category": "softcams",
        "version": "11856-smod",
        "size": "1.9 MB",
        "description": "OSCam-Smod Universal by MOHAMED_OS — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/installer.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "oscam-samur",
        "name": "OSCam Samur Edition",
        "developer": "Levi45",
        "category": "softcams",
        "version": "11856-samur",
        "size": "2.1 MB",
        "description": "OSCam Samur Edition by Levi45 — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/levi-45/Multicam/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/levi-45/Multicam/main/installer.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "ncam-icam",
        "name": "NCam-ICam Universal",
        "developer": "MOHAMED_OS",
        "category": "softcams",
        "version": "15.2-icam",
        "size": "2.1 MB",
        "description": "NCam-ICam Universal by MOHAMED_OS — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/ncam-installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/ncam-installer.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "ncam-fairbird",
        "name": "NCam Fairbird (Raed Edition)",
        "developer": "fairbird (رائد)",
        "category": "softcams",
        "version": "15.2-raed",
        "size": "2.0 MB",
        "description": "NCam Fairbird (Raed Edition) by fairbird (رائد) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/NCam/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/NCam/main/installer.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "gosat-gcam",
        "name": "Gosat / GCam Universal (القوسات)",
        "developer": "MOHAMED_OS",
        "category": "softcams",
        "version": "2.4-r2",
        "size": "1.8 MB",
        "description": "Gosat / GCam Universal (القوسات) by MOHAMED_OS — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/gcam-installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/gcam-installer.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "powercam",
        "name": "PowerCam Universal (الباور كام)",
        "developer": "MOHAMED_OS",
        "category": "softcams",
        "version": "11856-powercam",
        "size": "2.0 MB",
        "description": "PowerCam Universal (الباور كام) by MOHAMED_OS — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/powercam-installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/powercam-installer.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "cccam-universal",
        "name": "CCcam 2.3.9 / 2.3.8 / 2.3.2 (السيس كام)",
        "developer": "MOHAMED_OS",
        "category": "softcams",
        "version": "2.3.9-r6",
        "size": "1.1 MB",
        "description": "CCcam 2.3.9 / 2.3.8 / 2.3.2 (السيس كام) by MOHAMED_OS — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/cccam-installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/cccam-installer.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "revcam",
        "name": "RevCam V2 Universal (الراف كام)",
        "developer": "MOHAMED_OS",
        "category": "softcams",
        "version": "2.5-revcam",
        "size": "1.7 MB",
        "description": "RevCam V2 Universal (الراف كام) by MOHAMED_OS — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/revcam-installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/revcam-installer.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "ultracam",
        "name": "UltraCam Universal (الألترا كام)",
        "developer": "MOHAMED_OS",
        "category": "softcams",
        "version": "3.1-ultracam",
        "size": "1.8 MB",
        "description": "UltraCam Universal (الألترا كام) by MOHAMED_OS — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/ultracam-installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/ultracam-installer.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "xstreamity",
        "name": "XStreamity",
        "developer": "KiddaC",
        "category": "iptv",
        "version": "4.88",
        "size": "3.2 MB",
        "description": "XStreamity by KiddaC — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/kiddac/XStreamity/master/XStreamity/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/kiddac/XStreamity/master/XStreamity/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "xklass",
        "name": "XKlass",
        "developer": "KiddaC",
        "category": "iptv",
        "version": "1.42",
        "size": "2.9 MB",
        "description": "XKlass by KiddaC — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/kiddac/XKlass/master/XKlass/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/kiddac/XKlass/master/XKlass/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "bouquetmakerxtream",
        "name": "BouquetMakerXtream",
        "developer": "KiddaC",
        "category": "iptv",
        "version": "1.56",
        "size": "1.7 MB",
        "description": "BouquetMakerXtream by KiddaC — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/kiddac/BouquetMakerXtream/master/BouquetMakerXtream/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/kiddac/BouquetMakerXtream/master/BouquetMakerXtream/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "multistalker-pro",
        "name": "MultiStalker Pro",
        "developer": "ziko",
        "category": "iptv",
        "version": "1.3-py312",
        "size": "1.9 MB",
        "description": "MultiStalker Pro by ziko — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/ziko-ZR1/Multi-StalkerPro/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/ziko-ZR1/Multi-StalkerPro/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "e2m3u2bouquet",
        "name": "E2m3u2bouquet (Dorik Mod)",
        "developer": "Dorik1972 & ZadMario",
        "category": "iptv",
        "version": "1.9.4",
        "size": "1.4 MB",
        "description": "E2m3u2bouquet (Dorik Mod) by Dorik1972 & ZadMario — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/pepsik-kiev/e2m3u2bouquet/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/pepsik-kiev/e2m3u2bouquet/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "vavoo-live",
        "name": "Vavoo Stream Live",
        "developer": "Lululla (Linuxsat)",
        "category": "iptv",
        "version": "1.40",
        "size": "820 KB",
        "description": "Vavoo Stream Live by Lululla (Linuxsat) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/Belfagor2005/vavoo/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/Belfagor2005/vavoo/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "footonsat",
        "name": "FootOnsat",
        "developer": "ziko",
        "category": "sports_media",
        "version": "2.1",
        "size": "2.2 MB",
        "description": "FootOnsat by ziko — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/ziko-ZR1/FootOnsat/main/Download/install.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/ziko-ZR1/FootOnsat/main/Download/install.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "e2iplayer",
        "name": "E2iPlayer (ZadMario / MOHAMED_OS)",
        "developer": "Dorik1972 & ZadMario",
        "category": "sports_media",
        "version": "2026.11.15",
        "size": "8.4 MB",
        "description": "E2iPlayer (ZadMario / MOHAMED_OS) by Dorik1972 & ZadMario — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/E2IPlayer/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/E2IPlayer/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "youtube-e2",
        "name": "YouTube-E2 (Taapat Mod)",
        "developer": "fairbird (رائد)",
        "category": "sports_media",
        "version": "git1294",
        "size": "680 KB",
        "description": "YouTube-E2 (Taapat Mod) by fairbird (رائد) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/YouTube-E2/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/YouTube-E2/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "subssupport",
        "name": "Subssupport (MOHAMED_OS Mod)",
        "developer": "MOHAMED_OS",
        "category": "epg_subtitles",
        "version": "1.7.0-r18",
        "size": "1.6 MB",
        "description": "Subssupport (MOHAMED_OS Mod) by MOHAMED_OS — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SubsSupport/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SubsSupport/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "rytec-epg-sources",
        "name": "Rytec EPG Sources Pack",
        "developer": "Dorik1972 & ZadMario",
        "category": "epg_subtitles",
        "version": "2026.11",
        "size": "240 KB",
        "description": "Rytec EPG Sources Pack by Dorik1972 & ZadMario — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "opkg install enigma2-plugin-extensions-epgimport-rytec",
        "cmd_dpkg": "apt-get install -y enigma2-plugin-extensions-epgimport-rytec",
        "restart": False,
    },
    {
        "id": "epgimport-dorik",
        "name": "EPGImport (Dorik1972 Mod)",
        "developer": "Dorik1972 & ZadMario",
        "category": "plugins_hub",
        "version": "1.9.1.2026",
        "size": "740 KB",
        "description": "EPGImport (Dorik1972 Mod) by Dorik1972 & ZadMario — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/pepsik-kiev/EPGImport/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/pepsik-kiev/EPGImport/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "epg-grabber-ziko",
        "name": "EPG Grabber",
        "developer": "ziko",
        "category": "plugins_hub",
        "version": "23.4",
        "size": "1.1 MB",
        "description": "EPG Grabber by ziko — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/ziko-ZR1/Epg-plugin/master/Download/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/ziko-ZR1/Epg-plugin/master/Download/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "arabicsavior",
        "name": "ArabicSavior",
        "developer": "fairbird (رائد)",
        "category": "plugins_hub",
        "version": "2.2",
        "size": "420 KB",
        "description": "ArabicSavior by fairbird (رائد) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/ArabicSavior/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/ArabicSavior/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "aglare-fhd",
        "name": "Aglare-FHD Skin",
        "developer": "Madhouse & DreamSat",
        "category": "skins",
        "version": "4.6",
        "size": "6.8 MB",
        "description": "Aglare-FHD Skin by Madhouse & DreamSat — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/popking159/skins/main/aglare/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/popking159/skins/main/aglare/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "nitroadvance-fhd",
        "name": "NitroAdvance FHD",
        "developer": "fairbird (رائد)",
        "category": "skins",
        "version": "5.8",
        "size": "7.4 MB",
        "description": "NitroAdvance FHD by fairbird (رائد) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/NitroAdvanceFHD/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/NitroAdvanceFHD/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "slyk-1080-r19",
        "name": "Slyk 1080 R19",
        "developer": "KiddaC",
        "category": "skins",
        "version": "3.12",
        "size": "4.1 MB",
        "description": "Slyk 1080 R19 by KiddaC — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/kiddac/Slyk_1080_R19/master/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/kiddac/Slyk_1080_R19/master/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "fullhdline",
        "name": "FullHDLine Skin",
        "developer": "Lululla (Linuxsat)",
        "category": "skins",
        "version": "3.4",
        "size": "3.5 MB",
        "description": "FullHDLine Skin by Lululla (Linuxsat) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/Belfagor2005/Skins/main/FullHDLine/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/Belfagor2005/Skins/main/FullHDLine/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "slyk-q-1080",
        "name": "Slyk Q 1080 (SkyQ)",
        "developer": "KiddaC",
        "category": "skins",
        "version": "2.18",
        "size": "5.2 MB",
        "description": "Slyk Q 1080 (SkyQ) by KiddaC — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/kiddac/Slyk_Q_1080/master/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/kiddac/Slyk_Q_1080/master/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "slyk-onyx-1080",
        "name": "Slyk Onyx 1080",
        "developer": "KiddaC",
        "category": "skins",
        "version": "2.16",
        "size": "4.8 MB",
        "description": "Slyk Onyx 1080 by KiddaC — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/kiddac/Slyk_Onyx_1080/master/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/kiddac/Slyk_Onyx_1080/master/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "glamour-aura-fhd",
        "name": "Glamour Aura FHD",
        "developer": "Lululla (Linuxsat)",
        "category": "skins",
        "version": "6.2",
        "size": "6.4 MB",
        "description": "Glamour Aura FHD by Lululla (Linuxsat) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/Belfagor2005/Skins/main/GlamourAuraFHD/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/Belfagor2005/Skins/main/GlamourAuraFHD/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "odreamy-fhd",
        "name": "oDreamy-FHD Skin",
        "developer": "fairbird (رائد)",
        "category": "skins",
        "version": "7.4",
        "size": "7.1 MB",
        "description": "oDreamy-FHD Skin by fairbird (رائد) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/oDreamy-FHD/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/oDreamy-FHD/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "youchie-pli-fhd",
        "name": "Youchie-PLI-FHD Skin",
        "developer": "Madhouse & DreamSat",
        "category": "skins",
        "version": "3.9",
        "size": "6.2 MB",
        "description": "Youchie-PLI-FHD Skin by Madhouse & DreamSat — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/popking159/skins/main/youchie/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/popking159/skins/main/youchie/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "blackharmony-fhd",
        "name": "BlackHarmony FHD",
        "developer": "Chocholousek & oottppxx",
        "category": "skins",
        "version": "2026.11",
        "size": "5.9 MB",
        "description": "BlackHarmony FHD by Chocholousek & oottppxx — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/j00zek/BlackHarmony/master/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/j00zek/BlackHarmony/master/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "mymetrix-fhd",
        "name": "MyMetrixFHD / MetrixHD Mod",
        "developer": "Lululla (Linuxsat)",
        "category": "skins",
        "version": "4.2",
        "size": "4.5 MB",
        "description": "MyMetrixFHD / MetrixHD Mod by Lululla (Linuxsat) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "opkg update && opkg install enigma2-plugin-skins-metrixhd",
        "cmd_dpkg": "apt-get update && apt-get install -y enigma2-plugin-skins-metrixhd",
        "restart": True,
    },
    {
        "id": "pd1loi-fhd",
        "name": "PD1LOI-FullHD Skin",
        "developer": "Lululla (Linuxsat)",
        "category": "skins",
        "version": "2.8",
        "size": "3.1 MB",
        "description": "PD1LOI-FullHD Skin by Lululla (Linuxsat) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "opkg update && opkg install enigma2-plugin-skins-pd1loi-hd-night",
        "cmd_dpkg": "apt-get update && apt-get install -y enigma2-plugin-skins-pd1loi-hd-night",
        "restart": True,
    },
    {
        "id": "wireguard-vpn",
        "name": "WireGuard VPN",
        "developer": "Madhouse & DreamSat",
        "category": "system_tools",
        "version": "15.2",
        "size": "1.3 MB",
        "description": "WireGuard VPN by Madhouse & DreamSat — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/m4dhouse/WireGuard/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/m4dhouse/WireGuard/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "raedquicksignal",
        "name": "RaedQuickSignal",
        "developer": "fairbird (رائد)",
        "category": "system_tools",
        "version": "17.3",
        "size": "1.9 MB",
        "description": "RaedQuickSignal by fairbird (رائد) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/RaedQuickSignal/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/RaedQuickSignal/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "serviceapp",
        "name": "ServiceApp (Exteplayer3 / Gstplayer)",
        "developer": "Dorik1972 & ZadMario",
        "category": "system_tools",
        "version": "0.5+git218",
        "size": "1.5 MB",
        "description": "ServiceApp (Exteplayer3 / Gstplayer) by Dorik1972 & ZadMario — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "opkg update && opkg install enigma2-plugin-systemplugins-serviceapp exteplayer3 gstplayer",
        "cmd_dpkg": "apt-get update && apt-get install -y enigma2-plugin-systemplugins-serviceapp exteplayer3",
        "restart": True,
    },
    {
        "id": "backupsuite",
        "name": "BackupSuite",
        "developer": "Lululla (Linuxsat)",
        "category": "system_tools",
        "version": "28.5",
        "size": "890 KB",
        "description": "BackupSuite by Lululla (Linuxsat) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "opkg update && opkg install enigma2-plugin-extensions-backupsuite",
        "cmd_dpkg": "apt-get update && apt-get install -y enigma2-plugin-extensions-backupsuite",
        "restart": True,
    },
    {
        "id": "foreca-weather",
        "name": "Foreca Weather",
        "developer": "Lululla (Linuxsat)",
        "category": "system_tools",
        "version": "3.3.6",
        "size": "1.1 MB",
        "description": "Foreca Weather by Lululla (Linuxsat) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/Belfagor2005/Foreca/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/Belfagor2005/Foreca/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "cacheflush",
        "name": "CacheFlush",
        "developer": "fairbird (رائد)",
        "category": "system_tools",
        "version": "2.1",
        "size": "210 KB",
        "description": "CacheFlush by fairbird (رائد) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "opkg update && opkg install enigma2-plugin-extensions-cacheflush",
        "cmd_dpkg": "apt-get update && apt-get install -y enigma2-plugin-extensions-cacheflush",
        "restart": False,
    },
    {
        "id": "chocholousek-picons",
        "name": "Chocholousek Picons",
        "developer": "Chocholousek & oottppxx",
        "category": "picons_feeds",
        "version": "5.0.261110",
        "size": "1.3 MB",
        "description": "Chocholousek Picons by Chocholousek & oottppxx — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://github.com/s3n0/e2plugins/raw/master/ChocholousekPicons/online-setup -O - | bash -s install",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://github.com/s3n0/e2plugins/raw/master/ChocholousekPicons/online-setup -O - | bash -s install",
        "restart": True,
    },
    {
        "id": "mohamed-os-feed",
        "name": "MOHAMED_OS Universal Feed",
        "developer": "MOHAMED_OS",
        "category": "picons_feeds",
        "version": "2026.11",
        "size": "120 KB",
        "description": "MOHAMED_OS Universal Feed by MOHAMED_OS — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/Feed/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/Feed/installer.sh -O - | /bin/sh",
        "restart": False,
    },
]


def is_valid_version(val):
    if not val:
        return False
    return bool(re.match(r"^[0-9A-Za-z._-]{1,24}$", val.strip()))


def fetch_remote_text(url, timeout=4):
    if not url:
        return None
    try:
        sep = "&" if "?" in url else "?"
        nocache_url = "%s%st=%d" % (url, sep, int(time.time()))
        req = Request(
            nocache_url,
            headers={
                "User-Agent": "mizou1984-e2-store/" + PLUGIN_VERSION,
                "Cache-Control": "no-cache",
                "Pragma": "no-cache",
            },
        )
        ctx = None
        if hasattr(ssl, "_create_unverified_context"):
            ctx = ssl._create_unverified_context()
        if ctx is not None:
            resp = urlopen(req, timeout=timeout, context=ctx)
        else:
            resp = urlopen(req, timeout=timeout)
        raw = resp.read()
        if isinstance(raw, bytes):
            return raw.decode("utf-8", "ignore").strip()
        return str(raw).strip()
    except Exception:
        return None


def register_installed_plugin(plugin_id):
    try:
        if not os.path.isdir(STATE_DIR):
            os.makedirs(STATE_DIR)
        existing = set()
        if os.path.exists(INSTALLED_FILE):
            with open(INSTALLED_FILE, "r") as f:
                for line in f:
                    line = line.strip()
                    if line:
                        existing.add(line)
        if plugin_id not in existing:
            with open(INSTALLED_FILE, "a") as f:
                f.write(plugin_id + "\n")
    except Exception:
        pass


class Mizou1984StoreScreen(Screen):
    if DESKTOP_WIDTH >= 1920:
        skin = """
        <screen name="Mizou1984StoreScreen" position="0,0" size="1920,1080" flags="wfNoBorder" backgroundColor="#070d19">
            <eLabel position="0,0" size="1920,1080" backgroundColor="#070d19" zPosition="0" />
            <eLabel position="0,0" size="1920,120" backgroundColor="#0f172a" zPosition="1" />
            <eLabel position="0,120" size="1920,2" backgroundColor="#1e293b" zPosition="2" />

            <ePixmap pixmap="/usr/lib/enigma2/python/Plugins/Extensions/Mizou1984Store/plugin.png" position="50,12" size="250,98" alphatest="blend" scale="1" zPosition="3" />

            <widget name="header" position="324,22" size="980,48" font="Regular;38" foregroundColor="#f8fafc" backgroundColor="#0f172a" transparent="1" zPosition="3" />
            <widget name="sysinfo" position="324,72" size="1020,34" font="Regular;22" foregroundColor="#94a3b8" backgroundColor="#0f172a" transparent="1" zPosition="3" />
            <widget name="brand" position="1380,36" size="480,48" font="Regular;28" halign="right" foregroundColor="#38bdf8" backgroundColor="#0f172a" transparent="1" zPosition="3" />

            <eLabel position="60,152" size="1140,788" backgroundColor="#111827" zPosition="1" />
            <eLabel position="60,152" size="1140,2" backgroundColor="#1e293b" zPosition="2" />
            <eLabel position="60,938" size="1140,2" backgroundColor="#1e293b" zPosition="2" />
            <widget name="list_title" position="86,170" size="1088,42" font="Regular;26" foregroundColor="#38bdf8" backgroundColor="#111827" transparent="1" zPosition="3" />
            <eLabel position="86,218" size="1088,1" backgroundColor="#1e293b" zPosition="2" />
            <widget name="list" position="78,232" size="1104,690" font="Regular;28" itemHeight="60" foregroundColor="#e2e8f0" backgroundColor="#111827" foregroundColorSelected="#ffffff" backgroundColorSelected="#0284c7" scrollbarMode="showOnDemand" enableWrapAround="1" zPosition="3" />

            <eLabel position="1230,152" size="630,788" backgroundColor="#111827" zPosition="1" />
            <eLabel position="1230,152" size="630,3" backgroundColor="#0284c7" zPosition="2" />
            <eLabel position="1230,938" size="630,2" backgroundColor="#1e293b" zPosition="2" />
            <widget name="detail_kicker" position="1260,174" size="570,32" font="Regular;21" foregroundColor="#38bdf8" backgroundColor="#111827" transparent="1" zPosition="3" />
            <widget name="detail_title" position="1260,214" size="570,84" font="Regular;34" foregroundColor="#f8fafc" backgroundColor="#111827" transparent="1" zPosition="3" />
            <eLabel position="1260,308" size="570,1" backgroundColor="#1e293b" zPosition="2" />
            <widget name="detail_meta" position="1260,326" size="570,110" font="Regular;23" foregroundColor="#cbd5e1" backgroundColor="#111827" transparent="1" zPosition="3" />
            <widget name="detail_desc" position="1260,450" size="570,220" font="Regular;24" foregroundColor="#94a3b8" backgroundColor="#111827" transparent="1" zPosition="3" />
            <eLabel position="1260,695" size="570,1" backgroundColor="#1e293b" zPosition="2" />
            <widget name="detail_status" position="1260,715" size="570,130" font="Regular;21" foregroundColor="#38bdf8" backgroundColor="#111827" transparent="1" zPosition="3" />
            <widget name="detail_hint" position="1260,868" size="570,50" font="Regular;21" foregroundColor="#94a3b8" backgroundColor="#111827" transparent="1" zPosition="3" />

            <eLabel position="0,972" size="1920,108" backgroundColor="#0f172a" zPosition="1" />
            <eLabel position="0,972" size="1920,2" backgroundColor="#1e293b" zPosition="2" />

            <eLabel position="60,992" size="350,6" backgroundColor="#dc2626" zPosition="2" />
            <widget name="key_red" position="60,1004" size="350,52" font="Regular;25" halign="center" valign="center" foregroundColor="#f8fafc" backgroundColor="#111827" zPosition="3" />

            <eLabel position="440,992" size="350,6" backgroundColor="#16a34a" zPosition="2" />
            <widget name="key_green" position="440,1004" size="350,52" font="Regular;25" halign="center" valign="center" foregroundColor="#f8fafc" backgroundColor="#111827" zPosition="3" />

            <eLabel position="820,992" size="350,6" backgroundColor="#d97706" zPosition="2" />
            <widget name="key_yellow" position="820,1004" size="350,52" font="Regular;25" halign="center" valign="center" foregroundColor="#f8fafc" backgroundColor="#111827" zPosition="3" />

            <eLabel position="1200,992" size="320,6" backgroundColor="#0284c7" zPosition="2" />
            <widget name="key_blue" position="1200,1004" size="320,52" font="Regular;25" halign="center" valign="center" foregroundColor="#f8fafc" backgroundColor="#111827" zPosition="3" />

            <eLabel position="1550,992" size="310,6" backgroundColor="#64748b" zPosition="2" />
            <widget name="key_menu" position="1550,1004" size="310,52" font="Regular;23" halign="center" valign="center" foregroundColor="#38bdf8" backgroundColor="#111827" zPosition="3" />
        </screen>
        """
    else:
        skin = """
        <screen name="Mizou1984StoreScreen" position="0,0" size="1280,720" flags="wfNoBorder" backgroundColor="#070d19">
            <eLabel position="0,0" size="1280,720" backgroundColor="#070d19" zPosition="0" />
            <eLabel position="0,0" size="1280,84" backgroundColor="#0f172a" zPosition="1" />
            <eLabel position="0,84" size="1280,2" backgroundColor="#1e293b" zPosition="2" />

            <ePixmap pixmap="/usr/lib/enigma2/python/Plugins/Extensions/Mizou1984Store/plugin.png" position="30,8" size="176,68" alphatest="blend" scale="1" zPosition="3" />

            <widget name="header" position="222,14" size="660,34" font="Regular;26" foregroundColor="#f8fafc" backgroundColor="#0f172a" transparent="1" zPosition="3" />
            <widget name="sysinfo" position="222,50" size="700,24" font="Regular;16" foregroundColor="#94a3b8" backgroundColor="#0f172a" transparent="1" zPosition="3" />
            <widget name="brand" position="940,26" size="304,34" font="Regular;20" halign="right" foregroundColor="#38bdf8" backgroundColor="#0f172a" transparent="1" zPosition="3" />

            <eLabel position="36,104" size="754,524" backgroundColor="#111827" zPosition="1" />
            <widget name="list_title" position="52,116" size="720,30" font="Regular;19" foregroundColor="#38bdf8" backgroundColor="#111827" transparent="1" zPosition="3" />
            <widget name="list" position="48,154" size="730,462" font="Regular;20" itemHeight="42" foregroundColor="#e2e8f0" backgroundColor="#111827" foregroundColorSelected="#ffffff" backgroundColorSelected="#0284c7" scrollbarMode="showOnDemand" enableWrapAround="1" zPosition="3" />

            <eLabel position="810,104" size="434,524" backgroundColor="#111827" zPosition="1" />
            <eLabel position="810,104" size="434,3" backgroundColor="#0284c7" zPosition="2" />
            <widget name="detail_kicker" position="830,118" size="394,24" font="Regular;15" foregroundColor="#38bdf8" backgroundColor="#111827" transparent="1" zPosition="3" />
            <widget name="detail_title" position="830,148" size="394,60" font="Regular;24" foregroundColor="#f8fafc" backgroundColor="#111827" transparent="1" zPosition="3" />
            <widget name="detail_meta" position="830,218" size="394,80" font="Regular;17" foregroundColor="#cbd5e1" backgroundColor="#111827" transparent="1" zPosition="3" />
            <widget name="detail_desc" position="830,308" size="394,150" font="Regular;17" foregroundColor="#94a3b8" backgroundColor="#111827" transparent="1" zPosition="3" />
            <widget name="detail_status" position="830,470" size="394,94" font="Regular;15" foregroundColor="#38bdf8" backgroundColor="#111827" transparent="1" zPosition="3" />
            <widget name="detail_hint" position="830,576" size="394,38" font="Regular;15" foregroundColor="#94a3b8" backgroundColor="#111827" transparent="1" zPosition="3" />

            <eLabel position="0,646" size="1280,74" backgroundColor="#0f172a" zPosition="1" />
            <eLabel position="36,658" size="224,4" backgroundColor="#dc2626" zPosition="2" />
            <widget name="key_red" position="36,666" size="224,40" font="Regular;18" halign="center" valign="center" foregroundColor="#f8fafc" backgroundColor="#111827" zPosition="3" />
            <eLabel position="276,658" size="224,4" backgroundColor="#16a34a" zPosition="2" />
            <widget name="key_green" position="276,666" size="224,40" font="Regular;18" halign="center" valign="center" foregroundColor="#f8fafc" backgroundColor="#111827" zPosition="3" />
            <eLabel position="516,658" size="234,4" backgroundColor="#d97706" zPosition="2" />
            <widget name="key_yellow" position="516,666" size="234,40" font="Regular;18" halign="center" valign="center" foregroundColor="#f8fafc" backgroundColor="#111827" zPosition="3" />
            <eLabel position="766,658" size="234,4" backgroundColor="#0284c7" zPosition="2" />
            <widget name="key_blue" position="766,666" size="234,40" font="Regular;18" halign="center" valign="center" foregroundColor="#f8fafc" backgroundColor="#111827" zPosition="3" />
            <eLabel position="1016,658" size="228,4" backgroundColor="#64748b" zPosition="2" />
            <widget name="key_menu" position="1016,666" size="228,40" font="Regular;17" halign="center" valign="center" foregroundColor="#38bdf8" backgroundColor="#111827" zPosition="3" />
        </screen>
        """

    def __init__(self, session):
        Screen.__init__(self, session)
        self.session = session
        self.mode = "categories"
        self.current_category = "all"
        self.catalog = list(PLUGIN_CATALOG)
        self.is_cloud_synced = False

        self["header"] = Label("mizou1984 E2 Store")
        self["brand"] = Label("%s  |  v%s" % (BRAND_MARK, PLUGIN_VERSION))
        self["sysinfo"] = Label("")
        self["list_title"] = Label("Categories")
        self["list"] = MenuList([])

        self["detail_kicker"] = Label("SELECTED ITEM")
        self["detail_title"] = Label("mizou1984 E2 Store")
        self["detail_meta"] = Label("")
        self["detail_desc"] = Label("")
        self["detail_status"] = Label("")
        self["detail_hint"] = Label("OK: Open/Install  |  BLUE: Check Store Update")

        self["key_red"] = Label("Exit")
        self["key_green"] = Label("Open Category")
        self["key_yellow"] = Label("Auto-Update All")
        self["key_blue"] = Label("Update Store")
        self["key_menu"] = Label("MENU: About")

        try:
            self["list"].onSelectionChanged.append(self.updateInspector)
        except Exception:
            pass

        self["actions"] = ActionMap(
            [
                "OkCancelActions",
                "ColorActions",
                "WizardActions",
                "NavigationActions",
                "ListboxActions",
                "DirectionActions",
                "ChannelSelectBaseActions",
                "MenuActions",
            ],
            {
                "ok": self.onOk,
                "cancel": self.onBack,
                "back": self.onBack,
                "red": self.onBack,
                "green": self.onOk,
                "yellow": self.onAutoUpdateAll,
                "blue": self.onCheckStoreUpdate,
                "menu": self.onShowAbout,
                "up": self.onMoveUp,
                "upRepeated": self.onMoveUp,
                "moveUp": self.onMoveUp,
                "down": self.onMoveDown,
                "downRepeated": self.onMoveDown,
                "moveDown": self.onMoveDown,
                "left": self.onPageUp,
                "leftRepeated": self.onPageUp,
                "pageUp": self.onPageUp,
                "prevBouquet": self.onPageUp,
                "right": self.onPageDown,
                "rightRepeated": self.onPageDown,
                "pageDown": self.onPageDown,
                "nextBouquet": self.onPageDown,
                "top": self.onMoveTop,
                "moveTop": self.onMoveTop,
                "bottom": self.onMoveEnd,
                "moveEnd": self.onMoveEnd,
            },
            -2,
        )

        self.syncTimer = eTimer()
        try:
            self.syncTimer.callback.append(self.silentBackgroundCheck)
        except AttributeError:
            self.syncTimer_conn = self.syncTimer.timeout.connect(self.silentBackgroundCheck)

        self.refreshHeaderInfo()
        self.loadCategories()
        if UPDATE_FEED_BASE:
            self.onLayoutFinish.append(self.startSilentCheck)

    def startSilentCheck(self):
        self.syncTimer.start(600, True)

    def silentBackgroundCheck(self):
        if not UPDATE_FEED_BASE:
            return
        raw_cat = fetch_remote_text(UPDATE_FEED_BASE + "/catalog.json", timeout=2)
        if raw_cat:
            try:
                parsed = json.loads(raw_cat)
                plugins = parsed.get("plugins")
                if isinstance(plugins, list) and len(plugins) > 0:
                    self.catalog = plugins
                    self.is_cloud_synced = True
                    self.refreshHeaderInfo()
                    if self.mode == "categories":
                        prev_idx = 0
                        try:
                            prev_idx = self["list"].getSelectionIndex()
                        except Exception:
                            pass
                        self.loadCategories()
                        try:
                            if prev_idx > 0 and prev_idx < len(self["list"].list):
                                self["list"].moveToIndex(prev_idx)
                                self.updateInspector()
                        except Exception:
                            pass
            except Exception:
                pass

        remote_ver = fetch_remote_text(UPDATE_FEED_BASE + "/version.txt", timeout=2)
        if is_valid_version(remote_ver) and remote_ver.strip() != PLUGIN_VERSION:
            self.session.openWithCallback(
                self.confirmStoreUpdate,
                MessageBox,
                "New mizou1984 Store update v%s is available.\nDo you want to update now?" % remote_ver.strip(),
                MessageBox.TYPE_YESNO,
            )

    def onCheckStoreUpdate(self):
        if not UPDATE_FEED_BASE:
            self.onSystemUpgrade()
            return
        remote_ver = fetch_remote_text(UPDATE_FEED_BASE + "/version.txt", timeout=5)
        if not is_valid_version(remote_ver):
            self.session.open(
                MessageBox,
                "Could not reach update server.\nPlease check your internet connection or install the latest installer.sh once.",
                MessageBox.TYPE_WARNING,
            )
        elif remote_ver.strip() == PLUGIN_VERSION:
            self.session.open(
                MessageBox,
                "mizou1984 Store v%s is up to date." % PLUGIN_VERSION,
                MessageBox.TYPE_INFO,
            )
        else:
            self.session.openWithCallback(
                self.confirmStoreUpdate,
                MessageBox,
                "Update mizou1984 Store from v%s to v%s now?" % (PLUGIN_VERSION, remote_ver.strip()),
                MessageBox.TYPE_YESNO,
            )

    def confirmStoreUpdate(self, answer):
        if answer and UPDATE_FEED_BASE:
            raw_url = "%s/installer.sh?t=%d" % (UPDATE_FEED_BASE, int(time.time()))
            cmd = (
                'rm -f /tmp/mizou1984_update.sh && '
                '(wget --no-check-certificate -q -O /tmp/mizou1984_update.sh "%s" '
                '|| curl -fsSLk -o /tmp/mizou1984_update.sh "%s") '
                '&& [ -s /tmp/mizou1984_update.sh ] '
                '&& sed -i "s/\r$//" /tmp/mizou1984_update.sh 2>/dev/null; '
                'if [ -s /tmp/mizou1984_update.sh ]; then /bin/sh /tmp/mizou1984_update.sh; '
                'else echo "[mizou1984] Update download failed."; fi'
            ) % (raw_url, raw_url)
            self.session.open(
                Console,
                title="Updating mizou1984 Exclusive E2 Store...",
                cmdlist=[cmd],
            )

    def refreshHeaderInfo(self):
        py_ver = "%d.%d" % (sys.version_info[0], sys.version_info[1])
        pkg_type = "DreamOS (dpkg)" if IS_DREAMOS else "OE-Alliance / OpenPLi (opkg)"
        sync_label = "Cloud Synced" if self.is_cloud_synced else "Direct Official Sources"
        self["sysinfo"].setText(
            "%s  |  Python %s  |  %s"
            % (pkg_type, py_ver, sync_label)
        )
        self["detail_status"].setText(
            "Edition: %s v%s\nAuto-Update: Active (%s)\nSource: Official Developer Servers"
            % (BRAND_MARK, PLUGIN_VERSION, AUTO_SCHEDULE)
        )

    def onMoveUp(self):
        if self["list"].instance is not None:
            try:
                self["list"].up()
            except Exception:
                self["list"].instance.moveSelection(self["list"].instance.moveUp)
        self.updateInspector()

    def onMoveDown(self):
        if self["list"].instance is not None:
            try:
                self["list"].down()
            except Exception:
                self["list"].instance.moveSelection(self["list"].instance.moveDown)
        self.updateInspector()

    def onPageUp(self):
        if self["list"].instance is not None:
            try:
                self["list"].pageUp()
            except Exception:
                self["list"].instance.moveSelection(self["list"].instance.pageUp)
        self.updateInspector()

    def onPageDown(self):
        if self["list"].instance is not None:
            try:
                self["list"].pageDown()
            except Exception:
                self["list"].instance.moveSelection(self["list"].instance.pageDown)
        self.updateInspector()

    def onMoveTop(self):
        try:
            self["list"].moveToIndex(0)
        except Exception:
            pass
        self.updateInspector()

    def onMoveEnd(self):
        try:
            count = len(self["list"].list)
            if count > 0:
                self["list"].moveToIndex(count - 1)
        except Exception:
            pass
        self.updateInspector()

    def updateInspector(self):
        sel = self["list"].getCurrent()
        if not sel:
            return
        if self.mode == "categories":
            cat_id = sel[1]
            cat_meta = [c for c in CATEGORIES if c[0] == cat_id]
            title = cat_meta[0][1] if cat_meta else cat_id
            desc = cat_meta[0][2] if cat_meta else ""
            count = len(self.catalog) if cat_id == "all" else len([p for p in self.catalog if p.get("category") == cat_id])
            self["detail_kicker"].setText("CATEGORY OVERVIEW")
            self["detail_title"].setText(title)
            self["detail_meta"].setText("Plugins Available: %d\nSource Mode: Direct Upstream Auto-Update\nCompatibility: All OE2.0 & DreamOS Images" % count)
            self["detail_desc"].setText(desc)
        else:
            p = sel[1]
            dev = p.get("developer", "Official Developer")
            ver = p.get("version", "Latest")
            size = p.get("size", "Auto")
            desc = p.get("description", "Official Enigma2 plugin updated automatically from its developer source.")
            self["detail_kicker"].setText("PLUGIN DETAILS  |  AUTO-SOURCE")
            self["detail_title"].setText(p.get("name", p.get("id")))
            self["detail_meta"].setText("Developer: %s\nVersion: v%s   |   Size: %s\nFormat: %s" % (dev, ver, size, ".deb (DreamOS)" if IS_DREAMOS else ".ipk (opkg)"))
            self["detail_desc"].setText(desc)

    def loadCategories(self):
        self.mode = "categories"
        entries = []
        for cat_id, cat_label, _desc in CATEGORIES:
            count = len(self.catalog) if cat_id == "all" else len([p for p in self.catalog if p.get("category") == cat_id])
            if count > 0:
                entries.append(("  %s   [%d]" % (cat_label, count), cat_id))
        self["list_title"].setText("Store Categories (%d Plugins)" % len(self.catalog))
        self["list"].setList(entries)
        self["key_red"].setText("Exit")
        self["key_green"].setText("Open Category")
        self.updateInspector()

    def loadPlugins(self, cat_id):
        self.mode = "plugins"
        self.current_category = cat_id
        filtered = self.catalog if cat_id == "all" else [p for p in self.catalog if p.get("category") == cat_id]
        entries = []
        for p in filtered:
            dev = p.get("developer", "")
            ver = p.get("version", "")
            label = "  %s  v%s  (%s)" % (p.get("name", p.get("id")), ver, dev) if dev else "  %s" % p.get("name", p.get("id"))
            entries.append((label, p))
        self["list_title"].setText("Plugins in Category (%d)" % len(entries))
        self["list"].setList(entries)
        self["key_red"].setText("Back")
        self["key_green"].setText("Install Latest")
        self.updateInspector()

    def onShowAbout(self):
        py_ver = "%d.%d" % (sys.version_info[0], sys.version_info[1])
        pkg_type = "DreamOS (dpkg)" if IS_DREAMOS else "OE-Alliance / OpenPLi (opkg)"
        self.session.open(
            MessageBox,
            "mizou1984 E2 Store v%s\n%s\n\nPlugins: %d verified official sources\nSystem: %s | Python %s\nAuto-Update: Active (%s)"
            % (PLUGIN_VERSION, BRAND_MARK, len(self.catalog), pkg_type, py_ver, AUTO_SCHEDULE),
            MessageBox.TYPE_INFO,
        )

    def onSystemUpgrade(self):
        cmd = "apt-get update && apt-get upgrade -y" if IS_DREAMOS else "opkg update && opkg upgrade"
        self.session.open(
            Console,
            title="mizou1984 Store — System Feed Upgrade",
            cmdlist=[cmd],
        )

    def onOk(self):
        sel = self["list"].getCurrent()
        if not sel:
            return
        if self.mode == "categories":
            self.loadPlugins(sel[1])
        else:
            plugin = sel[1]
            register_installed_plugin(plugin["id"])
            cmd = plugin["cmd_dpkg"] if IS_DREAMOS else plugin["cmd_opkg"]
            prefix = "apt-get update && " if IS_DREAMOS else "opkg update && "
            self.session.open(
                Console,
                title="mizou1984 Store — Installing %s" % plugin["name"],
                cmdlist=[prefix + cmd],
            )

    def onBack(self):
        if self.mode == "plugins":
            self.loadCategories()
        else:
            self.close()

    def onAutoUpdateAll(self):
        if os.path.exists(AUTO_UPDATER_BIN):
            self.session.open(
                Console,
                title="mizou1984 Auto-Updater — Syncing Store & Official Sources",
                cmdlist=["sh %s" % AUTO_UPDATER_BIN],
            )
        else:
            self.onSystemUpgrade()


def main(session, **kwargs):
    session.open(Mizou1984StoreScreen)


def Plugins(**kwargs):
    return [
        PluginDescriptor(
            name="mizou1984 E2 Store",
            description="Exclusive Enigma2 Store & Auto-Updater by mizou1984",
            where=[PluginDescriptor.WHERE_PLUGINMENU, PluginDescriptor.WHERE_EXTENSIONSMENU],
            icon="plugin.png",
            fnc=main,
        )
    ]

EOF_MIZOU1984_PY

cat << 'EOF_MIZOU1984_UPDATER' > "$PLUGIN_DIR/auto_updater.sh"
#!/bin/sh
# ==============================================================================
# mizou1984 Exclusive E2 Store — Autonomous Background Auto-Updater (v4.4.0)
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
CB_TS=$(date +%s 2>/dev/null || echo 1)
LOCAL_STORE_VER=$(cat "$STORE_VER_FILE" 2>/dev/null | tr -d '\r\n ')
REMOTE_STORE_VER=$(wget -q --no-check-certificate -O - "https://raw.githubusercontent.com/mizouh1984/E2Store/main/version.txt?t=$CB_TS" 2>/dev/null | tr -d '\r\n ')
if [ -z "$REMOTE_STORE_VER" ] && command -v curl >/dev/null 2>&1; then
  REMOTE_STORE_VER=$(curl -fsSLk "https://raw.githubusercontent.com/mizouh1984/E2Store/main/version.txt?t=$CB_TS" 2>/dev/null | tr -d '\r\n ')
fi

if [ -n "$REMOTE_STORE_VER" ] && [ "$REMOTE_STORE_VER" != "$LOCAL_STORE_VER" ]; then
  log "New mizou1984 Store update available ($LOCAL_STORE_VER -> $REMOTE_STORE_VER). Updating silently..."
  rm -f /tmp/mizou1984_selfupdate.sh
  wget -q --no-check-certificate "https://raw.githubusercontent.com/mizouh1984/E2Store/main/installer.sh?t=$CB_TS" -O /tmp/mizou1984_selfupdate.sh 2>/dev/null || (command -v curl >/dev/null 2>&1 && curl -fsSLk "https://raw.githubusercontent.com/mizouh1984/E2Store/main/installer.sh?t=$CB_TS" -o /tmp/mizou1984_selfupdate.sh 2>/dev/null)
  if [ -s /tmp/mizou1984_selfupdate.sh ]; then
    sed -i 's/\r$//' /tmp/mizou1984_selfupdate.sh 2>/dev/null || true
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
    "enigma-play")
      API_URL="https://api.github.com/repos/Ahmadarjan1/EnigmaPlay-Repo/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/Ahmadarjan1/EnigmaPlay-Repo/main/install.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/Ahmadarjan1/EnigmaPlay-Repo/main/install.sh -O - | /bin/sh'
      PLUGIN_NAME="EnigmaPlay"
      ;;
    "tunisiasat-panel")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/eliesat/eliesatpanel/main/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/eliesat/eliesatpanel/main/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="TunisiaSat Panel (TSpanel)"
      ;;
    "satvenus-panel")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/Belfagor2005/LinuxsatPanel/main/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/Belfagor2005/LinuxsatPanel/main/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="SatVenus Panel"
      ;;
    "eliesat-panel")
      API_URL="https://api.github.com/repos/eliesat/eliesatpanel/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/eliesat/eliesatpanel/main/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/eliesat/eliesatpanel/main/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="ElieSat Panel"
      ;;
    "alayer-plugin")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/eliesat/eliesatpanel/main/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/eliesat/eliesatpanel/main/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="Alayer (Alaire)"
      ;;
    "ansite-plugin")
      API_URL="https://api.github.com/repos/MOHAMED19OS/Enigma2_Store/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/MOHAMED19OS/Download/main/Ansite/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/MOHAMED19OS/Download/main/Ansite/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="Ansite"
      ;;
    "athantimes")
      API_URL="https://api.github.com/repos/fairbird/AthanTimes/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/fairbird/AthanTimes/main/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/fairbird/AthanTimes/main/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="AthanTimes"
      ;;
    "bitrate-viewer")
      API_URL=""
      CMD_OPKG='opkg install enigma2-plugin-extensions-bitrate || opkg install enigma2-plugin-extensions-bitrateviewer'
      CMD_DPKG='apt-get install -y enigma2-plugin-extensions-bitrateviewer'
      PLUGIN_NAME="BitrateViewer"
      ;;
    "bootlogo-swapper")
      API_URL="https://api.github.com/repos/eliesat/eliesatpanel/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/eliesat/eliesatpanel/main/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/eliesat/eliesatpanel/main/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="BootLogoSwapper"
      ;;
    "epg-translator")
      API_URL="https://api.github.com/repos/eliesat/eliesatpanel/commits?per_page=1"
      CMD_OPKG='opkg install enigma2-plugin-extensions-epgtranslator || opkg install enigma2-plugin-extensions-translator'
      CMD_DPKG='apt-get install -y enigma2-plugin-extensions-epgtranslator'
      PLUGIN_NAME="EPGTranslator"
      ;;
    "ipaudio-plus")
      API_URL="https://api.github.com/repos/ziko-ZR1/IPAudio/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/ziko-ZR1/IPAudio/main/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/ziko-ZR1/IPAudio/main/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="IPAudioPlus / IPAudio Pro"
      ;;
    "xtraevent")
      API_URL="https://api.github.com/repos/digiteng/xtra/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/digiteng/xtra/main/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/digiteng/xtra/main/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="XtraEvent"
      ;;
    "quran-karim")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/fairbird/Quran/main/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/fairbird/Quran/main/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="Quran Karim (القرآن الكريم)"
      ;;
    "historyzap-selector")
      API_URL=""
      CMD_OPKG='opkg install enigma2-plugin-extensions-historyzapselector'
      CMD_DPKG='apt-get install -y enigma2-plugin-extensions-historyzapselector'
      PLUGIN_NAME="HistoryZap Selector"
      ;;
    "dream-explorer")
      API_URL=""
      CMD_OPKG='opkg install enigma2-plugin-extensions-dreamexplorer'
      CMD_DPKG='apt-get install -y enigma2-plugin-extensions-dreamexplorer'
      PLUGIN_NAME="DreamExplorer"
      ;;
    "permanent-clock")
      API_URL=""
      CMD_OPKG='opkg install enigma2-plugin-extensions-permanentclock'
      CMD_DPKG='apt-get install -y enigma2-plugin-extensions-permanentclock'
      PLUGIN_NAME="PermanentClock"
      ;;
    "autobouquets-maker")
      API_URL=""
      CMD_OPKG='opkg install enigma2-plugin-systemplugins-autobouquetsmaker'
      CMD_DPKG='apt-get install -y enigma2-plugin-systemplugins-autobouquetsmaker'
      PLUGIN_NAME="AutoBouquetsMaker"
      ;;
    "tmdb-info")
      API_URL=""
      CMD_OPKG='opkg install enigma2-plugin-extensions-tmdb'
      CMD_DPKG='apt-get install -y enigma2-plugin-extensions-tmdb'
      PLUGIN_NAME="TMDB Movie Info"
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
    "rytec-epg-sources")
      API_URL=""
      CMD_OPKG='opkg install enigma2-plugin-extensions-epgimport-rytec'
      CMD_DPKG='apt-get install -y enigma2-plugin-extensions-epgimport-rytec'
      PLUGIN_NAME="Rytec EPG Sources Pack"
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

  REMOTE_SHA=$(wget -q --no-check-certificate -U "mizou1984-e2-updater/4.4.0" -O - "$API_URL" 2>/dev/null | grep -oE '"(sha|short_id)"[[:space:]]*:[[:space:]]*"[0-9a-f]+"' | head -n 1 | sed -E 's/.*"([0-9a-f]+)"/\1/' | cut -c1-12)

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

EOF_MIZOU1984_UPDATER

chmod 644 "$PLUGIN_DIR/__init__.py" "$PLUGIN_DIR/plugin.py" "$PLUGIN_DIR/plugin.png" "$STATE_DIR/store_version.txt"
chmod 755 "$PLUGIN_DIR/auto_updater.sh"

# Configure automatic background Store & Plugin updates via Enigma2 Cron
CRON_DIR="/etc/cron/crontabs"
[ -d "/var/spool/cron/crontabs" ] && CRON_DIR="/var/spool/cron/crontabs"
mkdir -p "$CRON_DIR"
CRON_FILE="$CRON_DIR/root"
touch "$CRON_FILE"

grep -v "Mizou1984Store/auto_updater.sh" "$CRON_FILE" > "$CRON_FILE.tmp" 2>/dev/null || true
echo "0 4 * * * /usr/lib/enigma2/python/Plugins/Extensions/Mizou1984Store/auto_updater.sh >/dev/null 2>&1" >> "$CRON_FILE.tmp"
mv "$CRON_FILE.tmp" "$CRON_FILE"
chmod 600 "$CRON_FILE"

if command -v crond >/dev/null 2>&1; then
  pidof crond >/dev/null 2>&1 || crond -c "$CRON_DIR"
fi

echo "[mizou1984] Installed v4.4.0 (Full-Screen Dark UI + Custom plugin.png Icon)"
echo "[mizou1984] Auto-Updater scheduled: 0 4 * * *"

if [ "$1" = "--no-restart" ]; then
  echo "[mizou1984] Background update complete (GUI restart deferred)."
  exit 0
fi

echo "[mizou1984] Restarting Enigma2 GUI..."
sync
sleep 2

if [ -f /var/lib/dpkg/status ]; then
  systemctl restart enigma2
else
  killall -9 enigma2
fi

exit 0
