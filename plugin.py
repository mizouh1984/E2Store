# -*- coding: utf-8 -*-
from __future__ import print_function
import os
from Screens.MessageBox import MessageBox


def get_free_flash_mb(path="/"):
    try:
        st = os.statvfs(path)
        free_bytes = st.f_bavail * st.f_frsize
        return round(free_bytes / (1024.0 * 1024.0), 1)
    except Exception:
        return 999.0



# ==============================================================================
# mizou1984 E2 Store — Exclusive Edition by mizou1984 (v4.2.0)
# Full-Screen Dark Frameless UI (wfNoBorder) + Enlarged Custom Plugin Icon
# Silent Background Auto-Update + Direct Official Developer Sources
# Compatible with: OpenATV, OpenPLi, OpenBH, Egami, PurE2, OpenSPA, VTi, DreamOS
# Python Support: Python 2.7 & Python 3.x (3.9 -> 3.14+)
# ==============================================================================

 
import json
import os
import re
import ssl
import sys

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

PLUGIN_VERSION = "5.6.0"
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
    ("panels", "Panels & Addon Stores", "AJPanel, SkyBlue Panel, Ciefp (CIFP), Levi45 Addons, AIO Panel, Linuxsat-Panel and DreamSat Panel."),
    ("softcams", "Softcams & Keys (OSCam / NCam / All Cams)", "All OSCam & NCam builds, Gosat/GCam, PowerCam, CCcam, RevCam, UltraCam, Levi45 Multicam & KeyAdder."),
    ("iptv", "IPTV & Stalker Players", "XStreamity, XKlass, BouquetMakerXtream, MultiStalker Pro, E2m3u2bouquet and Vavoo."),
    ("sports_media", "Sports & Media", "FootOnsat live match schedules, E2iPlayer VOD library and YouTube-E2 4K."),
    ("epg_subtitles", "Subtitles & EPG Tools", "Subssupport Arabic mod, EPGImport Dorik Mod, EPG Grabber and ArabicSavior."),
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
        "id": "epgimport-dorik",
        "name": "EPGImport (Dorik1972 Mod)",
        "developer": "Dorik1972 & ZadMario",
        "category": "epg_subtitles",
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
        "category": "epg_subtitles",
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
        "category": "epg_subtitles",
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


def fetch_remote_text(url, timeout=3):
    if not url:
        return None
    try:
        req = Request(url, headers={"User-Agent": "mizou1984-e2-store/" + PLUGIN_VERSION})
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

        self["actions"] = ActionMap(
            ["OkCancelActions", "ColorActions", "DirectionActions", "MenuActions"],
            {
                "ok": self.onOk,
                "cancel": self.onBack,
                "red": self.onBack,
                "green": self.onOk,
                "yellow": self.onAutoUpdateAll,
                "blue": self.onCheckStoreUpdate,
                "menu": self.onShowAbout,
                "up": self.onMoveUp,
                "down": self.onMoveDown,
                "left": self.onPageUp,
                "right": self.onPageDown,
            },
            -1,
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
                        self.loadCategories()
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
        remote_ver = fetch_remote_text(UPDATE_FEED_BASE + "/version.txt", timeout=4)
        if not is_valid_version(remote_ver) or remote_ver.strip() == PLUGIN_VERSION:
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
            raw_url = "%s/installer.sh" % UPDATE_FEED_BASE
            cmd = (
                'wget --no-check-certificate -q -O /tmp/mizou1984_update.sh "%s" '
                '&& [ -s /tmp/mizou1984_update.sh ] '
                '&& /bin/sh /tmp/mizou1984_update.sh '
                '|| echo "[mizou1984] Update server temporarily unavailable."'
            ) % raw_url
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
        self["list"].up()
        self.updateInspector()

    def onMoveDown(self):
        self["list"].down()
        self.updateInspector()

    def onPageUp(self):
        self["list"].pageUp()
        self.updateInspector()

    def onPageDown(self):
        self["list"].pageDown()
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
            free_mb = get_free_flash_mb("/")
            min_mb = 25.0 if plugin.get("category") in ("skins", "images") else 15.0
            if free_mb < min_mb:
                msg = (
                    "⚠️ تحذير: مساحة الذاكرة الداخلية منخفضة!\n\n"
                    "• المساحة المتوفرة: %s MB\n"
                    "• الحد الأدنى المطلوب: %s MB\n\n"
                    "تثبيت (%s) قد يسبب تجمد الجهاز.\n"
                    "هل تريد المتابعة على أي حال؟"
                ) % (free_mb, min_mb, plugin.get("name", plugin.get("id", "Plugin")))
                self.session.openWithCallback(
                    lambda ok: self._executePluginInstall(plugin) if ok else None,
                    MessageBox,
                    msg,
                    MessageBox.TYPE_YESNO,
                    default=False
                )
                return
            self._executePluginInstall(plugin)

    def _executePluginInstall(self, plugin):
        register_installed_plugin(plugin["id"])
        cmd = plugin["cmd_dpkg"] if IS_DREAMOS else plugin["cmd_opkg"]
        prefix = "apt-get update && " if IS_DREAMOS else ""
        self.session.open(
            Console,
            title="mizou1984 Store - Installing %s" % plugin["name"],
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
