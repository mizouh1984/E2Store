# -*- coding: utf-8 -*-
# ==============================================================================
# E2 Universal Store - Native Universal Enigma2 Store Plugin
# Compatible with: OpenATV, OpenPLi, OpenBH, Egami, PurE2, OpenSPA, VTi, DreamOS
# Python Support: Python 2.7 & Python 3.x (3.9 / 3.10 / 3.11 / 3.12+)
# ==============================================================================

from __future__ import print_function
import os
import sys

from Plugins.Plugin import PluginDescriptor
from Screens.Screen import Screen
from Screens.MessageBox import MessageBox
from Screens.Console import Console
from Components.ActionMap import ActionMap
from Components.MenuList import MenuList
from Components.Label import Label
from enigma import getDesktop

PLUGIN_VERSION = "2.6.0"
IS_DREAMOS = os.path.exists("/var/lib/dpkg/status")
DESKTOP_WIDTH = getDesktop(0).size().width()

CATEGORIES = [
    ("all", "All Plugins / All Developers"),
    ("panels", "Panels & Addon Stores"),
    ("softcams", "Softcams & Keys (OSCam / NCam)"),
    ("iptv", "IPTV & Stalker Players"),
    ("sports_media", "Sports & Media (FootOnsat / E2iPlayer)"),
    ("epg_subtitles", "Subtitles & EPG Tools"),
    ("skins", "FullHD & 4K Skins"),
    ("system_tools", "System Tools & WireGuard VPN"),
    ("picons_feeds", "Picons & Official Feeds"),
]

PLUGIN_CATALOG = [
    {
        "id": "ajpanel",
        "name": "AJPanel v10.8.2 (biko & A.J. (AJPanel))",
        "category": "panels",
        "version": "10.8.2",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/AMAJamry/AJPanel/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/AMAJamry/AJPanel/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "linuxsat-panel",
        "name": "Linuxsat-Panel v2.5.4 (Lululla (Linuxsat))",
        "category": "panels",
        "version": "2.5.4",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/Belfagor2005/LinuxsatPanel/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/Belfagor2005/LinuxsatPanel/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "dreamsat-panel",
        "name": "DreamSat Panel v1.6.2 (Madhouse & DreamSat)",
        "category": "panels",
        "version": "1.6.2",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/DreamSatPanel/Panel/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/DreamSatPanel/Panel/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "levi45-panel",
        "name": "Levi45 Addons Panel v10.4 (Levi45)",
        "category": "panels",
        "version": "10.4",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/levi-45/Addon/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/levi-45/Addon/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "oscam-emu-mohamed",
        "name": "OSCam-Emu Universal v11856-r802 (MOHAMED_OS)",
        "category": "softcams",
        "version": "11856-r802",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/installer.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "ncam-emu-mohamed",
        "name": "NCam-Emu Universal v15.2-r0 (MOHAMED_OS)",
        "category": "softcams",
        "version": "15.2-r0",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/ncam-installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SoftCam/ncam-installer.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "levi45-multicam",
        "name": "Levi45 Multicam Manager v10.6-r3 (Levi45)",
        "category": "softcams",
        "version": "10.6-r3",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/levi-45/Multicam/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/levi-45/Multicam/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "keyadder",
        "name": "KeyAdder v8.7 (fairbird (رائد))",
        "category": "softcams",
        "version": "8.7",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/KeyAdder/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/KeyAdder/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "xstreamity",
        "name": "XStreamity v4.88 (KiddaC)",
        "category": "iptv",
        "version": "4.88",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/kiddac/XStreamity/master/XStreamity/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/kiddac/XStreamity/master/XStreamity/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "xklass",
        "name": "XKlass v1.42 (KiddaC)",
        "category": "iptv",
        "version": "1.42",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/kiddac/XKlass/master/XKlass/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/kiddac/XKlass/master/XKlass/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "bouquetmakerxtream",
        "name": "BouquetMakerXtream v1.56 (KiddaC)",
        "category": "iptv",
        "version": "1.56",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/kiddac/BouquetMakerXtream/master/BouquetMakerXtream/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/kiddac/BouquetMakerXtream/master/BouquetMakerXtream/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "multistalker-pro",
        "name": "MultiStalker Pro v1.3-py312 (ziko)",
        "category": "iptv",
        "version": "1.3-py312",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/ziko-ZR1/Multi-StalkerPro/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/ziko-ZR1/Multi-StalkerPro/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "e2m3u2bouquet",
        "name": "E2m3u2bouquet (Dorik Mod) v1.9.4 (Dorik1972 & ZadMario)",
        "category": "iptv",
        "version": "1.9.4",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/pepsik-kiev/e2m3u2bouquet/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/pepsik-kiev/e2m3u2bouquet/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "vavoo-live",
        "name": "Vavoo Stream Live v1.40 (Lululla (Linuxsat))",
        "category": "iptv",
        "version": "1.40",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/Belfagor2005/vavoo/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/Belfagor2005/vavoo/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "footonsat",
        "name": "FootOnsat v2.1 (ziko)",
        "category": "sports_media",
        "version": "2.1",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/ziko-ZR1/FootOnsat/main/Download/install.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/ziko-ZR1/FootOnsat/main/Download/install.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "e2iplayer",
        "name": "E2iPlayer (ZadMario / MOHAMED_OS) v2026.11.15 (Dorik1972 & ZadMario)",
        "category": "sports_media",
        "version": "2026.11.15",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/E2IPlayer/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/E2IPlayer/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "youtube-e2",
        "name": "YouTube-E2 (Taapat Mod) vgit1294 (fairbird (رائد))",
        "category": "sports_media",
        "version": "git1294",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/YouTube-E2/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/YouTube-E2/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "subssupport",
        "name": "Subssupport (MOHAMED_OS Mod) v1.7.0-r18 (MOHAMED_OS)",
        "category": "epg_subtitles",
        "version": "1.7.0-r18",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SubsSupport/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/SubsSupport/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "epgimport-dorik",
        "name": "EPGImport (Dorik1972 Mod) v1.9.1.2026 (Dorik1972 & ZadMario)",
        "category": "epg_subtitles",
        "version": "1.9.1.2026",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/pepsik-kiev/EPGImport/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/pepsik-kiev/EPGImport/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "epg-grabber-ziko",
        "name": "EPG Grabber v23.4 (ziko)",
        "category": "epg_subtitles",
        "version": "23.4",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/ziko-ZR1/Epg-plugin/master/Download/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/ziko-ZR1/Epg-plugin/master/Download/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "arabicsavior",
        "name": "ArabicSavior v2.2 (fairbird (رائد))",
        "category": "epg_subtitles",
        "version": "2.2",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/ArabicSavior/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/ArabicSavior/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "aglare-fhd",
        "name": "Aglare-FHD Skin v4.6 (Madhouse & DreamSat)",
        "category": "skins",
        "version": "4.6",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/popking159/skins/main/aglare/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/popking159/skins/main/aglare/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "nitroadvance-fhd",
        "name": "NitroAdvance FHD v5.8 (fairbird (رائد))",
        "category": "skins",
        "version": "5.8",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/NitroAdvanceFHD/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/NitroAdvanceFHD/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "slyk-1080-r19",
        "name": "Slyk 1080 R19 v3.12 (KiddaC)",
        "category": "skins",
        "version": "3.12",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/kiddac/Slyk_1080_R19/master/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/kiddac/Slyk_1080_R19/master/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "fullhdline",
        "name": "FullHDLine Skin v3.4 (Lululla (Linuxsat))",
        "category": "skins",
        "version": "3.4",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/Belfagor2005/Skins/main/FullHDLine/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/Belfagor2005/Skins/main/FullHDLine/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "wireguard-vpn",
        "name": "WireGuard VPN v15.2 (Madhouse & DreamSat)",
        "category": "system_tools",
        "version": "15.2",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/m4dhouse/WireGuard/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/m4dhouse/WireGuard/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "raedquicksignal",
        "name": "RaedQuickSignal v17.3 (fairbird (رائد))",
        "category": "system_tools",
        "version": "17.3",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/RaedQuickSignal/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/RaedQuickSignal/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "serviceapp",
        "name": "ServiceApp (Exteplayer3 / Gstplayer) v0.5+git218 (Dorik1972 & ZadMario)",
        "category": "system_tools",
        "version": "0.5+git218",
        "cmd_opkg": "opkg update && opkg install enigma2-plugin-systemplugins-serviceapp exteplayer3 gstplayer",
        "cmd_dpkg": "apt-get update && apt-get install -y enigma2-plugin-systemplugins-serviceapp exteplayer3",
        "restart": True,
    },
    {
        "id": "backupsuite",
        "name": "BackupSuite v28.5 (Lululla (Linuxsat))",
        "category": "system_tools",
        "version": "28.5",
        "cmd_opkg": "opkg update && opkg install enigma2-plugin-extensions-backupsuite",
        "cmd_dpkg": "apt-get update && apt-get install -y enigma2-plugin-extensions-backupsuite",
        "restart": True,
    },
    {
        "id": "foreca-weather",
        "name": "Foreca Weather v3.3.6 (Lululla (Linuxsat))",
        "category": "system_tools",
        "version": "3.3.6",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/Belfagor2005/Foreca/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/Belfagor2005/Foreca/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "cacheflush",
        "name": "CacheFlush v2.1 (fairbird (رائد))",
        "category": "system_tools",
        "version": "2.1",
        "cmd_opkg": "opkg update && opkg install enigma2-plugin-extensions-cacheflush",
        "cmd_dpkg": "apt-get update && apt-get install -y enigma2-plugin-extensions-cacheflush",
        "restart": False,
    },
    {
        "id": "chocholousek-picons",
        "name": "Chocholousek Picons v5.0.261110 (Chocholousek & oottppxx)",
        "category": "picons_feeds",
        "version": "5.0.261110",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://github.com/s3n0/e2plugins/raw/master/ChocholousekPicons/online-setup -O - | bash -s install",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://github.com/s3n0/e2plugins/raw/master/ChocholousekPicons/online-setup -O - | bash -s install",
        "restart": True,
    },
    {
        "id": "mohamed-os-feed",
        "name": "MOHAMED_OS Universal Feed v2026.11 (MOHAMED_OS)",
        "category": "picons_feeds",
        "version": "2026.11",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/Feed/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/MOHAMED19OS/Enigma2_Store/main/Feed/installer.sh -O - | /bin/sh",
        "restart": False,
    },
]


class E2UniversalStoreScreen(Screen):
    if DESKTOP_WIDTH >= 1920:
        skin = """
        <screen name="E2UniversalStoreScreen" position="center,center" size="1480,860" title="E2 Universal Store" backgroundColor="#0b1120">
            <widget name="header" position="40,25" size="1400,55" font="Regular;38" foregroundColor="#38bdf8" backgroundColor="#0b1120" transparent="1" />
            <widget name="sysinfo" position="40,85" size="1400,36" font="Regular;24" foregroundColor="#94a3b8" backgroundColor="#0b1120" transparent="1" />
            <widget name="list" position="40,145" size="1400,610" font="Regular;30" itemHeight="54" foregroundColor="#f8fafc" backgroundColor="#111827" selectionBackground="#0284c7" scrollbarMode="showOnDemand" />
            <widget name="key_red" position="40,785" size="320,45" font="Regular;26" halign="center" valign="center" foregroundColor="#ffffff" backgroundColor="#b91c1c" />
            <widget name="key_green" position="390,785" size="320,45" font="Regular;26" halign="center" valign="center" foregroundColor="#ffffff" backgroundColor="#15803d" />
            <widget name="key_yellow" position="740,785" size="320,45" font="Regular;26" halign="center" valign="center" foregroundColor="#ffffff" backgroundColor="#b45309" />
            <widget name="key_blue" position="1090,785" size="350,45" font="Regular;26" halign="center" valign="center" foregroundColor="#ffffff" backgroundColor="#0369a1" />
        </screen>
        """
    else:
        skin = """
        <screen name="E2UniversalStoreScreen" position="center,center" size="1060,600" title="E2 Universal Store" backgroundColor="#0b1120">
            <widget name="header" position="25,18" size="1010,40" font="Regular;28" foregroundColor="#38bdf8" backgroundColor="#0b1120" transparent="1" />
            <widget name="sysinfo" position="25,62" size="1010,28" font="Regular;19" foregroundColor="#94a3b8" backgroundColor="#0b1120" transparent="1" />
            <widget name="list" position="25,102" size="1010,420" font="Regular;22" itemHeight="40" foregroundColor="#f8fafc" backgroundColor="#111827" selectionBackground="#0284c7" scrollbarMode="showOnDemand" />
            <widget name="key_red" position="25,540" size="235,38" font="Regular;20" halign="center" valign="center" foregroundColor="#ffffff" backgroundColor="#b91c1c" />
            <widget name="key_green" position="280,540" size="235,38" font="Regular;20" halign="center" valign="center" foregroundColor="#ffffff" backgroundColor="#15803d" />
            <widget name="key_yellow" position="535,540" size="235,38" font="Regular;20" halign="center" valign="center" foregroundColor="#ffffff" backgroundColor="#b45309" />
            <widget name="key_blue" position="790,540" size="245,38" font="Regular;20" halign="center" valign="center" foregroundColor="#ffffff" backgroundColor="#0369a1" />
        </screen>
        """

    def __init__(self, session):
        Screen.__init__(self, session)
        self.session = session
        self.mode = "categories"
        self.current_category = "all"
        self.current_items = []

        py_ver = "%d.%d" % (sys.version_info[0], sys.version_info[1])
        pkg_type = "DreamOS (dpkg/apt)" if IS_DREAMOS else "OE-Alliance / OpenPLi (opkg)"

        self["header"] = Label("E2 Universal Store v%s" % PLUGIN_VERSION)
        self["sysinfo"] = Label("System: %s  |  Python %s  |  Catalog: %d Plugins" % (pkg_type, py_ver, len(PLUGIN_CATALOG)))
        self["list"] = MenuList([])
        self["key_red"] = Label("Exit / Back")
        self["key_green"] = Label("Open / Install")
        self["key_yellow"] = Label("Update Feeds")
        self["key_blue"] = Label("Restart GUI")

        self["actions"] = ActionMap(
            ["OkCancelActions", "ColorActions", "DirectionActions"],
            {
                "ok": self.onOk,
                "cancel": self.onBack,
                "red": self.onBack,
                "green": self.onOk,
                "yellow": self.onUpdateFeeds,
                "blue": self.onRestartGui,
            },
            -1,
        )
        self.loadCategories()

    def loadCategories(self):
        self.mode = "categories"
        entries = []
        for cat_id, cat_label in CATEGORIES:
            count = len(PLUGIN_CATALOG) if cat_id == "all" else len([p for p in PLUGIN_CATALOG if p["category"] == cat_id])
            if count > 0:
                entries.append(("%s  [%d]" % (cat_label, count), cat_id))
        self.current_items = entries
        self["list"].setList(entries)
        self["key_red"].setText("Exit")
        self["key_green"].setText("Open Category")

    def loadPlugins(self, cat_id):
        self.mode = "plugins"
        self.current_category = cat_id
        filtered = PLUGIN_CATALOG if cat_id == "all" else [p for p in PLUGIN_CATALOG if p["category"] == cat_id]
        entries = [(p["name"], p) for p in filtered]
        self.current_items = entries
        self["list"].setList(entries)
        self["key_red"].setText("Back")
        self["key_green"].setText("Install Selected")

    def onOk(self):
        sel = self["list"].getCurrent()
        if not sel:
            return
        if self.mode == "categories":
            self.loadPlugins(sel[1])
        else:
            plugin = sel[1]
            cmd = plugin["cmd_dpkg"] if IS_DREAMOS else plugin["cmd_opkg"]
            prefix = "apt-get update && " if IS_DREAMOS else "opkg update && "
            self.session.open(
                Console,
                title="Installing %s" % plugin["name"],
                cmdlist=[prefix + cmd],
            )

    def onBack(self):
        if self.mode == "plugins":
            self.loadCategories()
        else:
            self.close()

    def onUpdateFeeds(self):
        cmd = "apt-get update && apt-get upgrade -y" if IS_DREAMOS else "opkg update && opkg upgrade"
        self.session.open(Console, title="Updating Image Feeds & Plugins", cmdlist=[cmd])

    def onRestartGui(self):
        self.session.openWithCallback(
            self.confirmRestart,
            MessageBox,
            "Restart Enigma2 GUI now to apply installed plugins?",
            MessageBox.TYPE_YESNO,
        )

    def confirmRestart(self, answer):
        if answer:
            if IS_DREAMOS:
                os.system("systemctl restart enigma2")
            else:
                os.system("killall -9 enigma2")


def main(session, **kwargs):
    session.open(E2UniversalStoreScreen)


def Plugins(**kwargs):
    return [
        PluginDescriptor(
            name="E2 Universal Store",
            description="Universal Enigma2 Plugins & Updates Store",
            where=[PluginDescriptor.WHERE_PLUGINMENU, PluginDescriptor.WHERE_EXTENSIONSMENU],
            fnc=main,
        )
    ]
