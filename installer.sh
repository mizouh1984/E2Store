#!/bin/sh
# ==============================================================================
# mizou1984 Exclusive E2 Store — Official Public Installer (v5.7.0)
# Includes: Full Uninstall Manager + 6 Languages + 6 Color Themes + 3 Skin Layouts
#           + Enlarged Custom Icon (plugin.png) + Silent Background Auto-Update
# Works on ALL Enigma2 Images (OpenATV, OpenPLi, OpenBH, Egami, PurE2, VTi, DreamOS)
# Supports Python 2.7 & Python 3.x (3.9 -> 3.14+)
# ==============================================================================

PLUGIN_DIR="/usr/lib/enigma2/python/Plugins/Extensions/Mizou1984Store"
PLUGIN_DIR64="/usr/lib64/enigma2/python/Plugins/Extensions/Mizou1984Store"
STATE_DIR="/etc/mizou1984_store"

echo "============================================================"
echo "  Installing mizou1984 E2 Store v5.7.0 (mizou1984 Exclusive)"
echo "  Flash & RAM Guard + Live Version + System Cleaner + Doctor"
echo "============================================================"

# Flash Space Guard before writing plugin files
FREE_MB=$(df -m /usr 2>/dev/null | awk 'NR==2 {print $4}' | tr -dc '0-9')
if [ -n "$FREE_MB" ] && [ "$FREE_MB" -lt 4 ]; then
  echo "[mizou1984] ERROR: Critically low internal flash space (${FREE_MB} MB free on /usr)!"
  echo "[mizou1984] Free at least 15 MB before updating to prevent flash corruption."
  exit 1
fi
[ -n "$FREE_MB" ] && echo "[mizou1984] Internal Flash Free: ${FREE_MB} MB (OK)"

rm -rf "$PLUGIN_DIR"
if [ -d "/usr/lib64/enigma2/python/Plugins/Extensions" ] && [ ! -L "/usr/lib64" ]; then
  rm -rf "$PLUGIN_DIR64"
fi
mkdir -p "$PLUGIN_DIR" "$STATE_DIR"
rm -f "$STATE_DIR/github.conf"
touch "$PLUGIN_DIR/__init__.py" "$STATE_DIR/installed.list" "$STATE_DIR/upstream_sha.db"
echo "5.7.0" > "$STATE_DIR/store_version.txt"

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
# mizou1984 E2 Store — Exclusive Edition by mizou1984 (v5.7.0)
# Full Uninstall Manager + 6 Languages + 6 Color Themes + 3 Panel Skin Layouts
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
import subprocess
import sys
import time

try:
    from urllib.request import urlopen, Request
    from urllib.parse import quote as url_quote, unquote as url_unquote
except ImportError:
    from urllib2 import urlopen, Request
    from urllib import quote as url_quote, unquote as url_unquote

from Plugins.Plugin import PluginDescriptor
from Screens.Screen import Screen
from Screens.MessageBox import MessageBox
from Screens.ChoiceBox import ChoiceBox
from Screens.Console import Console
from Components.ActionMap import ActionMap
from Components.MenuList import MenuList
from Components.Label import Label
from enigma import getDesktop, eTimer

PLUGIN_VERSION = "5.7.0"
BRAND_MARK = "mizou1984 Exclusive"
UPDATE_FEED_BASE = "https://raw.githubusercontent.com/mizouh1984/E2Store/main"

DEFAULT_LANG = "en"
DEFAULT_THEME = "midnight_cyan"
DEFAULT_LAYOUT = "classic_split"

IS_DREAMOS = os.path.exists("/var/lib/dpkg/status")
DESKTOP_WIDTH = getDesktop(0).size().width()
PLUGIN_DIR = "/usr/lib/enigma2/python/Plugins/Extensions/Mizou1984Store"
STATE_DIR = "/etc/mizou1984_store"
INSTALLED_FILE = os.path.join(STATE_DIR, "installed.list")
SETTINGS_FILE = os.path.join(STATE_DIR, "settings.json")
AUTO_UPDATER_BIN = os.path.join(PLUGIN_DIR, "auto_updater.sh")
AUTO_SCHEDULE = "0 4 * * *"

PROTECTED_SKIN_DIRS = set([
    "skin_default",
    "display",
    "countries",
    "rc_models",
    "keymaps",
    "po",
    "defaults",
    "vfd_icons",
    "spinner",
    "icons",
    "menu",
    "buttons",
    "extensions",
    "picon",
])

SOFTCAM_KEYWORDS = (
    "softcam",
    "oscam",
    "ncam",
    "cccam",
    "gcam",
    "powercam",
    "revcam",
    "ultracam",
    "mgcamd",
    "wicardd",
    "doscam",
    "gbox",
    "rqcamd",
    "scam",
    "emu",
)

PANEL_LANGUAGES = [
    ("en", "English"),
    ("fr", "Français"),
    ("tr", "Türkçe"),
    ("ar", "العربية"),
    ("es", "Español"),
    ("de", "Deutsch"),
]

PANEL_THEMES = {
    "midnight_cyan": {
        "name": "Midnight Cyan",
        "bg": "#070d19",
        "bar": "#0f172a",
        "panel": "#111827",
        "border": "#1e293b",
        "accent": "#0284c7",
        "accent_light": "#38bdf8",
        "text": "#f8fafc",
        "muted": "#94a3b8",
    },
    "emerald_matrix": {
        "name": "Emerald Matrix",
        "bg": "#04120d",
        "bar": "#082017",
        "panel": "#0c291f",
        "border": "#144333",
        "accent": "#059669",
        "accent_light": "#34d399",
        "text": "#ecfdf5",
        "muted": "#86efac",
    },
    "crimson_sport": {
        "name": "Crimson Sport",
        "bg": "#14070a",
        "bar": "#230b10",
        "panel": "#1c0d11",
        "border": "#3f1822",
        "accent": "#dc2626",
        "accent_light": "#f87171",
        "text": "#fef2f2",
        "muted": "#fca5a5",
    },
    "royal_gold": {
        "name": "Royal Gold",
        "bg": "#0f0c06",
        "bar": "#1d170c",
        "panel": "#171209",
        "border": "#3a2e18",
        "accent": "#d97706",
        "accent_light": "#fbbf24",
        "text": "#fffbeb",
        "muted": "#fcd34d",
    },
    "violet_neon": {
        "name": "Violet Neon",
        "bg": "#0b0717",
        "bar": "#160e2d",
        "panel": "#130c25",
        "border": "#2e1d57",
        "accent": "#7c3aed",
        "accent_light": "#c084fc",
        "text": "#faf5ff",
        "muted": "#d8b4fe",
    },
    "arctic_slate": {
        "name": "Arctic Blue Steel",
        "bg": "#09111e",
        "bar": "#132038",
        "panel": "#101c30",
        "border": "#223557",
        "accent": "#2563eb",
        "accent_light": "#60a5fa",
        "text": "#f0f9ff",
        "muted": "#93c5fd",
    },
}

PANEL_THEME_ORDER = [
    "midnight_cyan",
    "emerald_matrix",
    "crimson_sport",
    "royal_gold",
    "violet_neon",
    "arctic_slate",
]

PANEL_LAYOUTS = [
    ("classic_split", "Classic Split (List Left / Details Right)"),
    ("mirror_split", "Mirror Split (Details Left / List Right)"),
    ("cinema_wide", "Cinema Wide (Full-Width List + Bottom Bar)"),
]

TRANSLATIONS = {
    "en": {
        "store_categories": "Store Categories (%d Plugins)",
        "plugins_in_cat": "Plugins in Category (%d)",
        "exit": "Exit",
        "back": "Back",
        "open_cat": "Open",
        "install": "Install Latest",
        "remove": "Remove Item",
        "auto_update": "Auto-Update",
        "update_store": "Update Store",
        "menu_btn": "MENU: Settings",
        "cat_overview": "CATEGORY OVERVIEW",
        "plugin_details": "PLUGIN DETAILS  |  AUTO-SOURCE",
        "uninstall_kicker": "UNINSTALL MANAGER  |  REMOVE FROM BOX",
        "hint_main": "OK: Open / Install  |  MENU: Remove / Lang / Theme / Skin",
        "hint_uninstall": "OK / GREEN: Remove Selected  |  RED: Back",
        "cloud_synced": "Cloud Synced",
        "direct_sources": "Direct Official Sources",
        "plugins_avail": "Plugins Available: %d",
        "source_mode": "Source Mode: Direct Upstream Auto-Update",
        "compat": "Compatibility: All OE2.0 & DreamOS Images",
        "dev_label": "Developer: %s",
        "ver_size": "Version: v%s   |   Size: %s",
        "fmt_label": "Format: %s",
        "status_line": "Edition: %s v%s\nAuto-Update: Active (%s)\nTheme: %s | Lang: %s",
        "cat_all": "All Plugins — Direct Official Sources",
        "cat_panels": "Panels & Addon Stores",
        "cat_plugins_hub": "Plugins Collection (Quran mizouh, IPtoSAT, XtraEvent Suite, Screen Grab, Weather, SkyBlue...)",
        "cat_images": "Enigma2 Images (EGAMI / OpenPLi / OpenBH / HDSatelit / Hyperion / OpenATV...)",
        "cat_multiboot": "MultiBoot (NeoBoot / EGAMI Boot / OpenMultiboot / BarryAllen)",
        "cat_channels": "Channel Lists (Ciefp / Morph883 / Vhannibal / MOHAMED_OS / Novaler)",
        "cat_bootlogos": "Bootlogos 4K (BootLogoSwapper / ElieSat / Sports / Nature / Ramadan)",
        "cat_backup": "Backup & Restore (Full Image / Channels / Emus & Subs / BackupSuite)",
        "cat_softcams": "Softcams & Keys (OSCam / NCam / All Cams)",
        "cat_iptv": "IPTV & Stalker Players (JediMakerXtream, XCplugin IPTV, XStreamity, SkyBlue...)",
        "cat_sports_media": "Sports & Media",
        "cat_epg_subtitles": "Subtitles & EPG Packs (EPGImport, EPGTranslator, SubSupport Pro, Translate AI...)",
        "cat_skins": "FullHD & 4K Skins (HD Glass 17, KravenHD, Fury-FHD, MohammedSkin, Aglare...)",
        "cat_system_tools": "System Tools & WireGuard VPN",
        "cat_picons_feeds": "Picons & Feeds (E2Picons, ciefp, Ch Logo, Raed Black/White)",
        "cat_doctor": "Plugin Health Scanner & Auto-Repair (Scan & Fix All Plugins)",
        "cat_doctor_desc": "Full device scan of EVERY installed plugin on your receiver: shows Broken, Stopped (with exact reason), or Healthy status, and auto-repairs missing files, Python dependencies, permissions, or broken installs.",
        "doctor_kicker": "PLUGIN HEALTH SCANNER  |  AUTO-REPAIR",
        "doctor_title": "Device Plugin Scan — Broken: %d | Stopped: %d | Healthy: %d",
        "doctor_repair": "Repair Selected",
        "doctor_repair_all": "Repair ALL",
        "doctor_hint": "OK / GREEN: Repair Selected  |  YELLOW: Repair ALL Issues  |  RED: Back",
        "d_healthy": "HEALTHY",
        "d_stopped": "STOPPED",
        "d_broken": "BROKEN",
        "d_empty": "No installed plugins found in Enigma2 plugin folders.",
        "d_confirm_one": "Run Auto-Repair for plugin:\n\n%s\nStatus: %s\nCause: %s\nFix: %s\n\nProceed with automatic repair?",
        "d_confirm_all": "Found %d plugin(s) with issues (%d Broken, %d Stopped).\n\nRun Full Auto-Repair for ALL detected issues now?",
        "d_all_ok": "All %d installed plugins on your receiver are HEALTHY! No repairs needed.",
        "cat_uninstall": "Uninstall Manager (Remove Plugins / Emus / Skins / Folders)",
        "cat_uninstall_desc": "Safely delete ANY installed plugin, softcam/emu (OSCam, NCam, CCcam...), skin, package, or manual folder directly from your receiver.",
        "uninstall_title": "Uninstall Manager — Select Category to Clean",
        "uninstall_list_title": "Installed Items on Receiver (%d)",
        "u_all": "All Installed Plugins, Emus, Skins & Folders",
        "u_plugins": "Installed Plugins & Extensions",
        "u_softcams": "Installed Softcams & Emus (OSCam / NCam / CCcam / GCam...)",
        "u_skins": "Installed Skins (FHD / 4K)",
        "u_other": "Other Installed Packages (Feeds / Tools / Libraries)",
        "u_manual": "Manual Folders & Binaries (/Extensions, /skins, /usr/bin)",
        "u_empty": "No removable items found in this category.",
        "u_confirm": "Are you sure you want to permanently remove:\n\n%s\nType: %s\nTarget: %s\n\nThis action cannot be undone.",
        "u_console_title": "mizou1984 Uninstaller — Removing %s",
        "u_type_pkg": "System Package (%s)",
        "u_type_dir": "Plugin / Skin Folder",
        "u_type_bin": "Softcam / Emu Binary",
        "menu_title": "mizou1984 Panel Settings & System Tools",
        "m_doctor": "1. Plugin Health Scanner & Auto-Repair",
        "m_uninstall": "2. Uninstall Manager (Remove Plugins / Emus / Skins)",
        "m_quick_filter": "3. Quick Filter / Jump (A-Z / Skins / IPTV / Quran)",
        "m_ram_boost": "4. RAM & Cache Booster (Free Memory Now)",
        "m_clean_junk": "5. Clean Temp, Junk & Crash Logs (Free Flash)",
        "m_lang": "6. Panel Language  [%s]",
        "m_theme": "7. Panel Color Theme  [%s]",
        "m_layout": "8. Panel Skin Layout  [%s]",
        "m_update": "9. Check Store Update",
        "m_upgrade": "10. System Feed Upgrade (opkg / apt)",
        "m_restart_gui": "11. Restart Enigma2 GUI",
        "m_about": "12. About mizou1984 Store",
        "choose_lang": "Select Panel Language",
        "choose_theme": "Select Panel Color Theme (Instant Apply)",
        "choose_layout": "Select Panel Skin Layout (Instant Apply)",
        "choose_filter": "Quick Filter — Jump to Plugins",
        "filter_title": "Filtered: %s (%d)",
        "restart_confirm": "Restart Enigma2 GUI now?\n\nActive recordings may be interrupted briefly.",
        "up_to_date": "mizou1984 Store v%s is up to date.",
        "unreachable": "Could not reach update server.\nPlease check your internet connection.",
        "upd_avail": "New mizou1984 Store update v%s is available!",
        "whats_new": "What's New in v%s:",
        "upd_ask": "Do you want to update now?",
        "flash_free_lbl": "Flash: %.1f MB",
        "flash_low_lbl": "LOW FLASH: %.1f MB!",
        "ram_free_lbl": "RAM: %.0f MB",
        "flash_low_warn": "WARNING: Low Internal Flash Space!\n\nFree Flash: %.1f MB  (Recommended minimum: %d MB)\nTarget: %s\n\nInstalling now may fill your receiver flash and cause a freeze or crash.\nDo you still want to continue?",
        "ver_live_tag": "LIVE",
    },
    "fr": {
        "store_categories": "Catégories du Store (%d Plugins)",
        "plugins_in_cat": "Plugins dans la catégorie (%d)",
        "exit": "Quitter",
        "back": "Retour",
        "open_cat": "Ouvrir",
        "install": "Installer",
        "remove": "Supprimer",
        "auto_update": "Maj Auto",
        "update_store": "Maj Store",
        "menu_btn": "MENU: Réglages",
        "cat_overview": "APERÇU DE LA CATÉGORIE",
        "plugin_details": "DÉTAILS DU PLUGIN  |  SOURCE OFFICIELLE",
        "uninstall_kicker": "GESTIONNAIRE DE DÉSINSTALLATION",
        "hint_main": "OK: Ouvrir / Installer  |  MENU: Supprimer / Langue / Couleur / Skin",
        "hint_uninstall": "OK / VERT: Supprimer l'élément  |  ROUGE: Retour",
        "cloud_synced": "Synchronisé Cloud",
        "direct_sources": "Sources Officielles Directes",
        "plugins_avail": "Plugins disponibles : %d",
        "source_mode": "Source : Mise à jour auto officielle",
        "compat": "Compatibilité : Toutes images OE2.0 & DreamOS",
        "dev_label": "Développeur : %s",
        "ver_size": "Version : v%s   |   Taille : %s",
        "fmt_label": "Format : %s",
        "status_line": "Édition : %s v%s\nMaj Auto : Active (%s)\nThème : %s | Langue : %s",
        "cat_all": "Tous les Plugins — Sources Officielles",
        "cat_panels": "Panels & Boutiques d'Extensions",
        "cat_plugins_hub": "Collection Plugins (Quran mizouh, IPtoSAT, XtraEvent, Screen Grab, Météo, SkyBlue...)",
        "cat_images": "Images Enigma2 (EGAMI / OpenPLi / OpenBH / HDSatelit / Hyperion / OpenATV...)",
        "cat_multiboot": "MultiBoot (NeoBoot / EGAMI Boot / OpenMultiboot / BarryAllen)",
        "cat_channels": "Listes de Chaînes (Ciefp / Morph883 / Vhannibal / MOHAMED_OS / Novaler)",
        "cat_bootlogos": "Bootlogos 4K (BootLogoSwapper / ElieSat / Sports / Nature / Ramadan)",
        "cat_backup": "Sauvegarde & Restauration (Image Complète / Chaînes / Emus & Abos)",
        "cat_softcams": "Softcams & Clés (OSCam / NCam / Tous Cams)",
        "cat_iptv": "Lecteurs IPTV & Stalker (JediMakerXtream, XCplugin IPTV, XStreamity, SkyBlue...)",
        "cat_sports_media": "Sports & Multimédia",
        "cat_epg_subtitles": "Sous-titres & Packs EPG (EPGImport, EPGTranslator, SubSupport Pro, Translate AI...)",
        "cat_skins": "Skins FullHD & 4K (HD Glass 17, KravenHD, Fury-FHD, MohammedSkin, Aglare...)",
        "cat_system_tools": "Outils Système & WireGuard VPN",
        "cat_picons_feeds": "Picons & Feeds (E2Picons, ciefp, Ch Logo, Raed Black/White)",
        "cat_doctor": "Diagnostic & Réparation Auto des Plugins (Scan Complet)",
        "cat_doctor_desc": "Analyse complète de TOUS les plugins installés sur le récepteur : affiche Cassé, Arrêté (avec la cause exacte) ou Sain, et répare automatiquement fichiers manquants et dépendances.",
        "doctor_kicker": "DIAGNOSTIC PLUGINS  |  RÉPARATION AUTO",
        "doctor_title": "Analyse Plugins — Cassés: %d | Arrêtés: %d | Sains: %d",
        "doctor_repair": "Réparer",
        "doctor_repair_all": "Tout Réparer",
        "doctor_hint": "OK / VERT: Réparer la sélection  |  JAUNE: Tout réparer  |  ROUGE: Retour",
        "d_healthy": "SAIN",
        "d_stopped": "ARRÊTÉ",
        "d_broken": "CASSÉ",
        "d_empty": "Aucun plugin installé trouvé dans Enigma2.",
        "d_confirm_one": "Réparer automatiquement le plugin :\n\n%s\nÉtat : %s\nCause : %s\nAction : %s\n\nContinuer la réparation ?",
        "d_confirm_all": "%d plugin(s) avec problème(s) (%d Cassés, %d Arrêtés).\n\nLancer la réparation automatique pour TOUS ?",
        "d_all_ok": "Tous les %d plugins installés sont SAINS ! Aucune réparation nécessaire.",
        "cat_uninstall": "Désinstaller (Supprimer Plugins / Emus / Skins / Dossiers)",
        "cat_uninstall_desc": "Supprimez facilement tout plugin, softcam/emu (OSCam, NCam, CCcam...), skin, paquet ou dossier installé sur votre récepteur.",
        "uninstall_title": "Gestionnaire de Suppression — Choisir une catégorie",
        "uninstall_list_title": "Éléments installés sur le récepteur (%d)",
        "u_all": "Tout ce qui est installé (Plugins, Emus, Skins, Dossiers)",
        "u_plugins": "Plugins & Extensions installés",
        "u_softcams": "Softcams & Emus installés (OSCam / NCam / CCcam...)",
        "u_skins": "Skins installés (FHD / 4K)",
        "u_other": "Autres paquets installés (Feeds / Outils)",
        "u_manual": "Dossiers & Binaires manuels (/Extensions, /skins, /usr/bin)",
        "u_empty": "Aucun élément supprimable trouvé dans cette catégorie.",
        "u_confirm": "Voulez-vous supprimer définitivement :\n\n%s\nType : %s\nCible : %s\n\nCette action est irréversible.",
        "u_console_title": "Désinstallation mizou1984 — %s",
        "u_type_pkg": "Paquet système (%s)",
        "u_type_dir": "Dossier Plugin / Skin",
        "u_type_bin": "Binaire Softcam / Emu",
        "menu_title": "Paramètres & Outils Système mizou1984",
        "m_doctor": "1. Diagnostic & Réparation Auto des Plugins",
        "m_uninstall": "2. Désinstaller (Plugins / Emus / Skins)",
        "m_quick_filter": "3. Filtre Rapide (A-Z / Skins / IPTV / Coran)",
        "m_ram_boost": "4. Booster RAM & Cache (Libérer Mémoire)",
        "m_clean_junk": "5. Nettoyer Temp, Cache & Crash Logs (Libérer Flash)",
        "m_lang": "6. Langue du Panel  [%s]",
        "m_theme": "7. Couleur / Thème du Panel  [%s]",
        "m_layout": "8. Skin / Disposition du Panel  [%s]",
        "m_update": "9. Vérifier Mise à Jour du Store",
        "m_upgrade": "10. Mise à Jour Système (opkg / apt)",
        "m_restart_gui": "11. Redémarrer Interface Enigma2 (GUI)",
        "m_about": "12. À propos de mizou1984 Store",
        "choose_lang": "Choisir la langue du Panel",
        "choose_theme": "Choisir la couleur du Panel (Application immédiate)",
        "choose_layout": "Choisir le Skin du Panel (Application immédiate)",
        "choose_filter": "Filtre Rapide — Accès Direct",
        "filter_title": "Filtre : %s (%d)",
        "restart_confirm": "Redémarrer l'interface Enigma2 (GUI) maintenant ?",
        "up_to_date": "mizou1984 Store v%s est déjà à jour.",
        "unreachable": "Serveur de mise à jour inaccessible.\nVérifiez votre connexion Internet.",
        "upd_avail": "Nouvelle mise à jour mizou1984 Store v%s disponible !",
        "whats_new": "Nouveautés de la v%s :",
        "upd_ask": "Voulez-vous mettre à jour maintenant ?",
        "flash_free_lbl": "Flash : %.1f Mo",
        "flash_low_lbl": "FLASH FAIBLE : %.1f Mo !",
        "ram_free_lbl": "RAM : %.0f Mo",
        "flash_low_warn": "ATTENTION : Espace Flash interne faible !\n\nMémoire libre : %.1f Mo  (Minimum conseillé : %d Mo)\nCible : %s\n\nContinuer peut saturer la mémoire flash et bloquer le récepteur (Crash).\nVoulez-vous quand même installer ?",
        "ver_live_tag": "LIVE",
    },
    "tr": {
        "store_categories": "Mağaza Kategorileri (%d Eklenti)",
        "plugins_in_cat": "Kategorideki Eklentiler (%d)",
        "exit": "Çıkış",
        "back": "Geri",
        "open_cat": "Aç",
        "install": "Yükle",
        "remove": "Kaldır / Sil",
        "auto_update": "Oto Güncelle",
        "update_store": "Panel Güncelle",
        "menu_btn": "MENU: Ayarlar",
        "cat_overview": "KATEGORİ ÖZETİ",
        "plugin_details": "EKLENTİ DETAYLARI  |  RESMİ KAYNAK",
        "uninstall_kicker": "KALDIRMA YÖNETİCİSİ  |  CİHAZDAN SİL",
        "hint_main": "OK: Aç / Yükle  |  MENU: Sil / Dil / Renk / Skin",
        "hint_uninstall": "OK / YEŞİL: Seçileni Sil  |  KIRMIZI: Geri",
        "cloud_synced": "Bulut Senkronize",
        "direct_sources": "Doğrudan Resmi Kaynaklar",
        "plugins_avail": "Mevcut Eklenti: %d",
        "source_mode": "Kaynak: Otomatik Resmi Güncelleme",
        "compat": "Uyumluluk: Tüm OE2.0 & DreamOS İmajları",
        "dev_label": "Geliştirici: %s",
        "ver_size": "Sürüm: v%s   |   Boyut: %s",
        "fmt_label": "Format: %s",
        "status_line": "Sürüm: %s v%s\nOto-Güncelleme: Aktif (%s)\nTema: %s | Dil: %s",
        "cat_all": "Tüm Eklentiler — Resmi Kaynaklar",
        "cat_panels": "Paneller & Eklenti Mağazaları",
        "cat_plugins_hub": "Eklenti Koleksiyonu (Quran mizouh, IPtoSAT, XtraEvent, Screen Grab, Hava Durumu...)",
        "cat_images": "Enigma2 İmajları (EGAMI / OpenPLi / OpenBH / HDSatelit / Hyperion / OpenATV...)",
        "cat_multiboot": "MultiBoot (NeoBoot / EGAMI Boot / OpenMultiboot / BarryAllen)",
        "cat_channels": "Kanal Listeleri (Ciefp / Morph883 / Vhannibal / MOHAMED_OS / Novaler)",
        "cat_bootlogos": "Bootlogos 4K (BootLogoSwapper / ElieSat / Spor / Doğa / Ramazan)",
        "cat_backup": "Yedekleme & Geri Yükleme (Tam İmaj / Kanallar / Emu & Abonelik)",
        "cat_softcams": "Softcam & Keyler (OSCam / NCam / Tüm Emu)",
        "cat_iptv": "IPTV & Stalker Oynatıcılar (JediMakerXtream, XCplugin IPTV, XStreamity, SkyBlue...)",
        "cat_sports_media": "Spor & Medya",
        "cat_epg_subtitles": "Altyazı & EPG Paketleri (EPGImport, EPGTranslator, SubSupport Pro, Translate AI...)",
        "cat_skins": "FullHD & 4K Arayüzler (HD Glass 17, KravenHD, Fury-FHD, MohammedSkin, Aglare...)",
        "cat_system_tools": "Sistem Araçları & WireGuard VPN",
        "cat_picons_feeds": "Piconlar & Feedler (E2Picons, ciefp, Ch Logo, Raed Black/White)",
        "cat_doctor": "Eklenti Sağlık Tarayıcı & Oto-Onarım (Tam Cihaz Taraması)",
        "cat_doctor_desc": "Cihazdaki TÜM eklentileri tarar: Bozuk, Durdurulmuş (kesin sebep ile) veya Sağlam durumunu gösterir ve eksik dosya/bağımlılıkları otomatik onarır.",
        "doctor_kicker": "EKLENTİ TARAYICI  |  OTOMATİK ONARIM",
        "doctor_title": "Cihaz Eklenti Taraması — Bozuk: %d | Sorunlu: %d | Sağlam: %d",
        "doctor_repair": "Seçileni Onar",
        "doctor_repair_all": "Tümünü Onar",
        "doctor_hint": "OK / YEŞİL: Seçileni Onar  |  SARI: Tümünü Onar  |  KIRMIZI: Geri",
        "d_healthy": "SAĞLAM",
        "d_stopped": "DURDURULDU",
        "d_broken": "BOZUK",
        "d_empty": "Enigma2 klasörlerinde kurulu eklenti bulunamadı.",
        "d_confirm_one": "Otomatik onarım başlatılsın mı?\n\n%s\nDurum: %s\nSebep: %s\nÇözüm: %s",
        "d_confirm_all": "%d sorunlu eklenti bulundu (%d Bozuk, %d Durdurulmuş).\n\nTÜM sorunları şimdi otomatik onar?",
        "d_all_ok": "Cihazdaki %d eklentinin tümü SAĞLAM! Onarım gerekmiyor.",
        "cat_uninstall": "Kaldırma Yöneticisi (Eklenti / Emu / Skin / Klasör Sil)",
        "cat_uninstall_desc": "Cihazınızda kurulu herhangi bir eklentiyi, softcam/emu (OSCam, NCam, CCcam...), skin veya klasörü güvenle silin.",
        "uninstall_title": "Kaldırma Yöneticisi — Silinecek Türü Seçin",
        "uninstall_list_title": "Cihazda Kurulu Öğeler (%d)",
        "u_all": "Kurulu Tüm Eklenti, Emu, Skin & Klasörler",
        "u_plugins": "Kurulu Eklentiler (Plugins)",
        "u_softcams": "Kurulu Softcam & Emular (OSCam / NCam / CCcam...)",
        "u_skins": "Kurulu Skinler (FHD / 4K)",
        "u_other": "Diğer Kurulu Paketler (Feed / Araçlar)",
        "u_manual": "Manuel Klasörler & Dosyalar (/Extensions, /skins, /usr/bin)",
        "u_empty": "Bu kategoride kaldırılacak öğe bulunamadı.",
        "u_confirm": "Kalıcı olarak silmek istediğinizden emin misiniz?\n\n%s\nTür: %s\nHedef: %s\n\nBu işlem geri alınamaz.",
        "u_console_title": "mizou1984 Kaldırıcı — Siliniyor: %s",
        "u_type_pkg": "Sistem Paketi (%s)",
        "u_type_dir": "Eklenti / Skin Klasörü",
        "u_type_bin": "Softcam / Emu Dosyası",
        "menu_title": "mizou1984 Panel Ayarları & Sistem Araçları",
        "m_doctor": "1. Eklenti Sağlık Tarayıcı & Oto-Onarım",
        "m_uninstall": "2. Kaldırma Yöneticisi (Eklenti / Emu / Skin Sil)",
        "m_quick_filter": "3. Hızlı Filtre (A-Z / Skin / IPTV / Kuran)",
        "m_ram_boost": "4. RAM & Önbellek Hızlandırıcı (Bellek Aç)",
        "m_clean_junk": "5. Geçici Dosya, Cache & Crash Log Temizle (Flash Aç)",
        "m_lang": "6. Panel Dili  [%s]",
        "m_theme": "7. Panel Renk Teması  [%s]",
        "m_layout": "8. Panel Skin Düzeni  [%s]",
        "m_update": "9. Mağaza Güncellemesini Kontrol Et",
        "m_upgrade": "10. Sistem Paket Güncellemesi (opkg / apt)",
        "m_restart_gui": "11. Enigma2 Arayüzünü Yeniden Başlat (GUI)",
        "m_about": "12. mizou1984 Store Hakkında",
        "choose_lang": "Panel Dilini Seçin",
        "choose_theme": "Panel Renk Temasını Seçin (Anında Uygulanır)",
        "choose_layout": "Panel Skin Düzenini Seçin (Anında Uygulanır)",
        "choose_filter": "Hızlı Filtre — Eklentilere Geç",
        "filter_title": "Filtrelendi: %s (%d)",
        "restart_confirm": "Enigma2 arayüzü (GUI) şimdi yeniden başlatılsın mı?",
        "up_to_date": "mizou1984 Store v%s güncel.",
        "unreachable": "Güncelleme sunucusuna ulaşılamadı.\nİnternet bağlantınızı kontrol edin.",
        "upd_avail": "Yeni mizou1984 Store v%s güncellemesi mevcut!",
        "whats_new": "v%s Yenilikleri:",
        "upd_ask": "Şimdi güncellemek istiyor musunuz?",
        "flash_free_lbl": "Flash: %.1f MB",
        "flash_low_lbl": "DÜŞÜK FLASH: %.1f MB!",
        "ram_free_lbl": "RAM: %.0f MB",
        "flash_low_warn": "UYARI: Dahili Flash Alanı Çok Az!\n\nBoş Alan: %.1f MB  (Önerilen en az: %d MB)\nHedef: %s\n\nKuruluma devam etmek flash belleği doldurabilir ve cihazı kilitleyebilir (Crash).\nYine de devam edilsin mi?",
        "ver_live_tag": "CANLI",
    },
    "ar": {
        "store_categories": "أقسام المتجر (%d إضافة)",
        "plugins_in_cat": "إضافات القسم (%d)",
        "exit": "خروج",
        "back": "رجوع",
        "open_cat": "فتح",
        "install": "تثبيت",
        "remove": "حذف من الجهاز",
        "auto_update": "تحديث تلقائي",
        "update_store": "تحديث المتجر",
        "menu_btn": "MENU: إعدادات",
        "cat_overview": "نظرة عامة على القسم",
        "plugin_details": "تفاصيل الإضافة  |  مصدر رسمي",
        "uninstall_kicker": "مدير الحذف الشامل من الريسيفر",
        "hint_main": "OK: فتح / تثبيت  |  MENU: حذف / لغة / لون / سكين",
        "hint_uninstall": "OK / أخضر: حذف العنصر المحدد  |  أحمر: رجوع",
        "cloud_synced": "مزامنة سحابية نشطة",
        "direct_sources": "مصادر المطورين الرسمية",
        "plugins_avail": "عدد الإضافات المتوفرة: %d",
        "source_mode": "المصدر: تحديث تلقائي مباشر من المطور",
        "compat": "التوافق: جميع صور OE2.0 و DreamOS",
        "dev_label": "المطور: %s",
        "ver_size": "الإصدار: v%s   |   الحجم: %s",
        "fmt_label": "الصيغة: %s",
        "status_line": "الإصدار: %s v%s\nالتحديث التلقائي: مفعل (%s)\nاللون: %s | اللغة: %s",
        "cat_all": "جميع الإضافات — المصادر الرسمية",
        "cat_panels": "البانلز ومتاجر الإضافات",
        "cat_plugins_hub": "البلوجن (قارئ القرآن mizouh, IPtoSAT, XtraEvent, Screen Grab, الطقس, SkyBlue...)",
        "cat_images": "صور إنيجما2 (EGAMI / OpenPLi / OpenBH / HDSatelit / Hyperion / OpenATV...)",
        "cat_multiboot": "MultiBoot (NeoBoot / EGAMI Boot / OpenMultiboot / BarryAllen)",
        "cat_channels": "قوائم القنوات Channel (Ciefp / Morph883 / Vhannibal / MOHAMED_OS)",
        "cat_bootlogos": "البوت لوقو Bootlogos 4K (BootLogoSwapper / ElieSat / Sports / Nature)",
        "cat_backup": "الباك اب والاستعادة Backup (الصورة كاملة / القنوات / الاشتراكات والإيمو)",
        "cat_softcams": "الإيموهات والشفرات (OSCam / NCam / All Cams)",
        "cat_iptv": "مشغلات IPTV و Stalker (JediMakerXtream, XCplugin IPTV, XStreamity, SkyBlue...)",
        "cat_sports_media": "الرياضة والوسائط",
        "cat_epg_subtitles": "الترجمة ودليل البرامج EPG (EPGImport, EPGTranslator, SubSupport Pro, Translate AI...)",
        "cat_skins": "السكينز FullHD و 4K (HD Glass 17, KravenHD, Fury-FHD, MohammedSkin, Aglare...)",
        "cat_system_tools": "أدوات النظام و WireGuard VPN",
        "cat_picons_feeds": "البيكونز (E2Picons, ciefp, Ch Logo, Raed Black/White)",
        "cat_doctor": "فحص وتصحيح جميع بلوجنات الجهاز (مسح شامل وإصلاح تلقائي)",
        "cat_doctor_desc": "يمسح كامل الجهاز ويتفقد كل البلوجنات المثبتة مع ذكر حالتها: عاطل، متوقف لسبب (مع ذكر السبب بدقة)، أو سليم؛ ويقوم بتصحيح أي بلوجن تالف أو ناقص ملف أو مكتبة بايثون تلقائياً.",
        "doctor_kicker": "فحص صحة البلوجنات  |  تصحيح تلقائي شامل",
        "doctor_title": "نتائج فحص الجهاز — عاطل: %d | متوقف: %d | سليم: %d",
        "doctor_repair": "تصحيح المحدد",
        "doctor_repair_all": "تصحيح الكل",
        "doctor_hint": "OK / أخضر: تصحيح البلوجن المحدد  |  أصفر: تصحيح جميع الأعطال  |  أحمر: رجوع",
        "d_healthy": "سليم",
        "d_stopped": "متوقف لسبب",
        "d_broken": "عاطل",
        "d_empty": "لم يتم العثور على بلوجنات مثبتة في مسارات إنيجما2.",
        "d_confirm_one": "هل تريد تشغيل التصحيح التلقائي للبلوجن:\n\n%s\nالحالة: %s\nالسبب: %s\nالتصحيح المقترح: %s",
        "d_confirm_all": "تم اكتشاف %d بلوجن بها مشاكل (%d عاطل، %d متوقف لسبب).\n\nهل تريد تصحيح جميع الأعطال والملفات الناقصة تلقائياً الآن؟",
        "d_all_ok": "جميع البلوجنات المثبتة (%d) سليمة 100%% ولا توجد أي أعطال!",
        "cat_uninstall": "مدير الحذف الشامل (حذف أي بلوجن / إيمو / سكين / مجلد)",
        "cat_uninstall_desc": "احذف بأمان أي بلوجن أو إيمو (OSCam, NCam, CCcam...) أو سكين أو حزمة أو مجلد مثبت على الريسيفر.",
        "uninstall_title": "مدير الحذف الشامل — اختر نوع الملفات للحذف",
        "uninstall_list_title": "العناصر المثبتة على الجهاز (%d)",
        "u_all": "جميع العناصر المثبتة (بلوجنز / إيموهات / سكينز / مجلدات)",
        "u_plugins": "البلوجنز والإضافات المثبتة",
        "u_softcams": "الإيموهات المثبتة (OSCam / NCam / CCcam / GCam...)",
        "u_skins": "السكينز المثبتة (FHD / 4K)",
        "u_other": "حزم وأدوات أخرى مثبتة",
        "u_manual": "المجلدات والملفات اليدوية (/Extensions, /skins, /usr/bin)",
        "u_empty": "لا توجد عناصر قابلة للحذف في هذا القسم.",
        "u_confirm": "هل أنت متأكد من الحذف النهائي من الجهاز؟\n\n%s\nالنوع: %s\nالمسار: %s\n\nلا يمكن التراجع بعد الحذف.",
        "u_console_title": "مدير حذف mizou1984 — جارٍ حذف %s",
        "u_type_pkg": "حزمة نظام (%s)",
        "u_type_dir": "مجلد بلوجن / سكين",
        "u_type_bin": "ملف إيمو / سوفتكام",
        "menu_title": "إعدادات وأدوات النظام — بانل mizou1984",
        "m_doctor": "1. فحص وتصحيح بلوجنات الجهاز (مسح شامل)",
        "m_uninstall": "2. مدير الحذف الشامل (حذف بلوجن / إيمو / سكين)",
        "m_quick_filter": "3. تصفية سريعة (A-Z / السكينز / IPTV / القرآن)",
        "m_ram_boost": "4. تسريع وتفريغ الرام والكاش (RAM Booster)",
        "m_clean_junk": "5. تنظيف الملفات المؤقتة والكراش (توسيع الفلاش)",
        "m_lang": "6. لغة البانل  [%s]",
        "m_theme": "7. لون البانل  [%s]",
        "m_layout": "8. سكين وتخطيط البانل  [%s]",
        "m_update": "9. فحص تحديث المتجر",
        "m_upgrade": "10. تحديث حزم النظام (opkg / apt)",
        "m_restart_gui": "11. إعادة تشغيل واجهة إنيجما2 (Restart GUI)",
        "m_about": "12. حول متجر mizou1984",
        "choose_lang": "اختر لغة البانل",
        "choose_theme": "اختر لون البانل (تطبيق فوري)",
        "choose_layout": "اختر سكين البانل (تطبيق فوري)",
        "choose_filter": "تصفية سريعة — انتقال مباشر للإضافات",
        "filter_title": "تصفية: %s (%d)",
        "restart_confirm": "هل تريد إعادة تشغيل واجهة إنيجما2 (Restart GUI) الآن؟",
        "up_to_date": "متجر mizou1984 إصدار v%s محدث لآخر نسخة.",
        "unreachable": "تعذر الاتصال بخادم التحديث.\nتحقق من اتصال الإنترنت.",
        "upd_avail": "يتوفر تحديث جديد لمتجر mizou1984 إصدار v%s!",
        "whats_new": "ما الجديد في الإصدار v%s:",
        "upd_ask": "هل تريد التحديث الآن؟",
        "flash_free_lbl": "فلاش: %.1f MB",
        "flash_low_lbl": "تحذير فلاش: %.1f MB!",
        "ram_free_lbl": "رام: %.0f MB",
        "flash_low_warn": "تحذير: المساحة الداخلية للريسيفر منخفضة جداً!\n\nالمساحة الفارغة المتبقية: %.1f MB  (الحد الآمن: %d MB)\nالإضافة: %s\n\nالاستمرار في التثبيت قد يؤدي لامتلاء الفلاشة أو تجمد الجهاز (Crash).\nهل تريد المتابعة رغم التحذير؟",
        "ver_live_tag": "مباشر",
    },
    "es": {
        "store_categories": "Categorías de la Tienda (%d Plugins)",
        "plugins_in_cat": "Plugins en la Categoría (%d)",
        "exit": "Salir",
        "back": "Volver",
        "open_cat": "Abrir",
        "install": "Instalar",
        "remove": "Eliminar",
        "auto_update": "Auto-Act.",
        "update_store": "Act. Tienda",
        "menu_btn": "MENU: Ajustes",
        "cat_overview": "RESUMEN DE CATEGORÍA",
        "plugin_details": "DETALLES DEL PLUGIN  |  FUENTE OFICIAL",
        "uninstall_kicker": "GESTOR DE DESINSTALACIÓN",
        "hint_main": "OK: Abrir / Instalar  |  MENU: Eliminar / Idioma / Color / Skin",
        "hint_uninstall": "OK / VERDE: Eliminar selección  |  ROJO: Volver",
        "cloud_synced": "Sincronizado en la Nube",
        "direct_sources": "Fuentes Oficiales Directas",
        "plugins_avail": "Plugins disponibles: %d",
        "source_mode": "Modo: Actualización automática oficial",
        "compat": "Compatibilidad: Todas las imágenes OE2.0 y DreamOS",
        "dev_label": "Desarrollador: %s",
        "ver_size": "Versión: v%s   |   Tamaño: %s",
        "fmt_label": "Formato: %s",
        "status_line": "Edición: %s v%s\nAuto-Act: Activa (%s)\nTema: %s | Idioma: %s",
        "cat_all": "Todos los Plugins — Fuentes Oficiales",
        "cat_panels": "Paneles y Tiendas de Plugins",
        "cat_plugins_hub": "Colección de Plugins (Quran mizouh, IPtoSAT, XtraEvent, Screen Grab, Clima...)",
        "cat_images": "Imágenes Enigma2 (EGAMI / OpenPLi / OpenBH / HDSatelit / Hyperion / OpenATV...)",
        "cat_multiboot": "MultiBoot (NeoBoot / EGAMI Boot / OpenMultiboot / BarryAllen)",
        "cat_channels": "Listas de Canales (Ciefp / Morph883 / Vhannibal / MOHAMED_OS / Novaler)",
        "cat_bootlogos": "Bootlogos 4K (BootLogoSwapper / ElieSat / Deportes / Naturaleza)",
        "cat_backup": "Copias de Seguridad Backup (Imagen Completa / Canales / Emus y Subs)",
        "cat_softcams": "Softcams y Claves (OSCam / NCam / Todos Cams)",
        "cat_iptv": "Reproductores IPTV y Stalker (JediMakerXtream, XCplugin IPTV, XStreamity, SkyBlue...)",
        "cat_sports_media": "Deportes y Multimedia",
        "cat_epg_subtitles": "Subtítulos y Paquetes EPG (EPGImport, EPGTranslator, SubSupport Pro, Translate AI...)",
        "cat_skins": "Skins FullHD y 4K (HD Glass 17, KravenHD, Fury-FHD, MohammedSkin, Aglare...)",
        "cat_system_tools": "Herramientas del Sistema y WireGuard VPN",
        "cat_picons_feeds": "Picons y Feeds (E2Picons, ciefp, Ch Logo, Raed Black/White)",
        "cat_doctor": "Escáner de Salud y Auto-Reparación de Plugins",
        "cat_doctor_desc": "Escanea TODOS los plugins instalados en el receptor: muestra Roto, Detenido (con motivo exacto) o Sano, y repara automáticamente archivos faltantes o dependencias.",
        "doctor_kicker": "ESCÁNER DE PLUGINS  |  AUTO-REPARACIÓN",
        "doctor_title": "Escaneo de Plugins — Rotos: %d | Detenidos: %d | Sanos: %d",
        "doctor_repair": "Reparar",
        "doctor_repair_all": "Reparar TODO",
        "doctor_hint": "OK / VERDE: Reparar selección  |  AMARILLO: Reparar TODO  |  ROJO: Volver",
        "d_healthy": "SANO",
        "d_stopped": "DETENIDO",
        "d_broken": "ROTO",
        "d_empty": "No se encontraron plugins instalados en Enigma2.",
        "d_confirm_one": "¿Ejecutar auto-reparación para el plugin?\n\n%s\nEstado: %s\nCausa: %s\nSolución: %s",
        "d_confirm_all": "Se encontraron %d plugin(s) con problemas (%d Rotos, %d Detenidos).\n\n¿Reparar TODOS automáticamente ahora?",
        "d_all_ok": "¡Todos los %d plugins instalados están SANOS! No requiere reparación.",
        "cat_uninstall": "Desinstalador (Eliminar Plugins / Emus / Skins / Carpetas)",
        "cat_uninstall_desc": "Elimina de forma segura cualquier plugin, softcam/emu, skin, paquete o carpeta instalada en tu receptor.",
        "uninstall_title": "Gestor de Desinstalación — Selecciona categoría",
        "uninstall_list_title": "Elementos instalados en el receptor (%d)",
        "u_all": "Todo lo instalado (Plugins, Emus, Skins, Carpetas)",
        "u_plugins": "Plugins y Extensiones instalados",
        "u_softcams": "Softcams y Emus instalados (OSCam / NCam / CCcam...)",
        "u_skins": "Skins instalados (FHD / 4K)",
        "u_other": "Otros paquetes instalados (Feeds / Herramientas)",
        "u_manual": "Carpetas y Binarios manuales (/Extensions, /skins, /usr/bin)",
        "u_empty": "No se encontraron elementos eliminables.",
        "u_confirm": "¿Seguro que deseas eliminar permanentemente?\n\n%s\nTipo: %s\nDestino: %s\n\nNo se puede deshacer.",
        "u_console_title": "Desinstalador mizou1984 — Eliminando %s",
        "u_type_pkg": "Paquete del sistema (%s)",
        "u_type_dir": "Carpeta de Plugin / Skin",
        "u_type_bin": "Binario Softcam / Emu",
        "menu_title": "Ajustes y Herramientas del Sistema mizou1984",
        "m_doctor": "1. Escáner de Salud y Auto-Reparación de Plugins",
        "m_uninstall": "2. Gestor de Desinstalación (Plugins / Emus / Skins)",
        "m_quick_filter": "3. Filtro Rápido (A-Z / Skins / IPTV / Corán)",
        "m_ram_boost": "4. Optimizar RAM y Caché (Liberar Memoria)",
        "m_clean_junk": "5. Limpiar Temporales y Crash Logs (Liberar Flash)",
        "m_lang": "6. Idioma del Panel  [%s]",
        "m_theme": "7. Color / Tema del Panel  [%s]",
        "m_layout": "8. Skin / Diseño del Panel  [%s]",
        "m_update": "9. Buscar Actualización de la Tienda",
        "m_upgrade": "10. Actualizar Paquetes del Sistema (opkg / apt)",
        "m_restart_gui": "11. Reiniciar Interfaz Enigma2 (GUI)",
        "m_about": "12. Acerca de mizou1984 Store",
        "choose_lang": "Seleccionar idioma del Panel",
        "choose_theme": "Seleccionar color del Panel (Cambio instantáneo)",
        "choose_layout": "Seleccionar Skin del Panel (Cambio instantáneo)",
        "choose_filter": "Filtro Rápido — Saltar a Plugins",
        "filter_title": "Filtro: %s (%d)",
        "restart_confirm": "¿Reiniciar la interfaz de Enigma2 (GUI) ahora?",
        "up_to_date": "mizou1984 Store v%s está actualizado.",
        "unreachable": "No se pudo conectar al servidor de actualización.\nComprueba tu conexión.",
        "upd_avail": "¡Nueva actualización de mizou1984 Store v%s disponible!",
        "whats_new": "Novedades en v%s:",
        "upd_ask": "¿Quieres actualizar ahora?",
        "flash_free_lbl": "Flash: %.1f MB",
        "flash_low_lbl": "FLASH BAJA: %.1f MB!",
        "ram_free_lbl": "RAM: %.0f MB",
        "flash_low_warn": "¡ADVERTENCIA: Poco espacio en la memoria Flash interna!\n\nEspacio libre: %.1f MB  (Mínimo recomendado: %d MB)\nElemento: %s\n\nInstalar ahora puede llenar la flash y congelar el receptor (Crash).\n¿Deseas continuar de todos modos?",
        "ver_live_tag": "EN VIVO",
    },
    "de": {
        "store_categories": "Store-Kategorien (%d Plugins)",
        "plugins_in_cat": "Plugins in Kategorie (%d)",
        "exit": "Beenden",
        "back": "Zurück",
        "open_cat": "Öffnen",
        "install": "Installieren",
        "remove": "Entfernen",
        "auto_update": "Auto-Update",
        "update_store": "Store Update",
        "menu_btn": "MENU: Optionen",
        "cat_overview": "KATEGORIE-ÜBERSICHT",
        "plugin_details": "PLUGIN-DETAILS  |  OFFIZIELLE QUELLE",
        "uninstall_kicker": "DEINSTALLATIONS-MANAGER",
        "hint_main": "OK: Öffnen / Installieren  |  MENU: Löschen / Sprache / Farbe / Skin",
        "hint_uninstall": "OK / GRÜN: Auswahl entfernen  |  ROT: Zurück",
        "cloud_synced": "Cloud-Synchronisiert",
        "direct_sources": "Direkte offizielle Quellen",
        "plugins_avail": "Verfügbare Plugins: %d",
        "source_mode": "Quelle: Offizielles Auto-Update",
        "compat": "Kompatibilität: Alle OE2.0 & DreamOS Images",
        "dev_label": "Entwickler: %s",
        "ver_size": "Version: v%s   |   Größe: %s",
        "fmt_label": "Format: %s",
        "status_line": "Edition: %s v%s\nAuto-Update: Aktiv (%s)\nTheme: %s | Sprache: %s",
        "cat_all": "Alle Plugins — Offizielle Quellen",
        "cat_panels": "Panels & Erweiterungs-Stores",
        "cat_plugins_hub": "Plugin-Sammlung (Quran mizouh, IPtoSAT, XtraEvent, Screen Grab, Wetter...)",
        "cat_images": "Enigma2 Images (EGAMI / OpenPLi / OpenBH / HDSatelit / Hyperion / OpenATV...)",
        "cat_multiboot": "MultiBoot (NeoBoot / EGAMI Boot / OpenMultiboot / BarryAllen)",
        "cat_channels": "Senderlisten (Ciefp / Morph883 / Vhannibal / MOHAMED_OS / Novaler)",
        "cat_bootlogos": "Bootlogos 4K (BootLogoSwapper / ElieSat / Sport / Natur / Ramadan)",
        "cat_backup": "Backup & Wiederherstellung (Full Image / Sender / Emus & Abos)",
        "cat_softcams": "Softcams & Keys (OSCam / NCam / Alle Cams)",
        "cat_iptv": "IPTV & Stalker Player (JediMakerXtream, XCplugin IPTV, XStreamity, SkyBlue...)",
        "cat_sports_media": "Sport & Medien",
        "cat_epg_subtitles": "Untertitel & EPG-Pakete (EPGImport, EPGTranslator, SubSupport Pro, Translate AI...)",
        "cat_skins": "FullHD & 4K Skins (HD Glass 17, KravenHD, Fury-FHD, MohammedSkin, Aglare...)",
        "cat_system_tools": "System-Tools & WireGuard VPN",
        "cat_picons_feeds": "Picons & Feeds (E2Picons, ciefp, Ch Logo, Raed Black/White)",
        "cat_doctor": "Plugin-Gesundheitsscan & Auto-Reparatur (Geräte-Check)",
        "cat_doctor_desc": "Prüft ALLE installierten Plugins auf dem Receiver: zeigt Defekt, Gestoppt (mit genauem Grund) oder OK und repariert fehlende Dateien & Python-Pakete automatisch.",
        "doctor_kicker": "PLUGIN-SCANNER  |  AUTO-REPARATUR",
        "doctor_title": "Geräte-Plugin-Scan — Defekt: %d | Gestoppt: %d | OK: %d",
        "doctor_repair": "Reparieren",
        "doctor_repair_all": "Alle reparieren",
        "doctor_hint": "OK / GRÜN: Auswahl reparieren  |  GELB: Alle reparieren  |  ROT: Zurück",
        "d_healthy": "OK",
        "d_stopped": "GESTOPPT",
        "d_broken": "DEFEKT",
        "d_empty": "Keine installierten Plugins in Enigma2 gefunden.",
        "d_confirm_one": "Auto-Reparatur starten für Plugin:\n\n%s\nStatus: %s\nGrund: %s\nLösung: %s",
        "d_confirm_all": "%d Plugin(s) mit Problemen gefunden (%d Defekt, %d Gestoppt).\n\nALLE Probleme jetzt automatisch reparieren?",
        "d_all_ok": "Alle %d installierten Plugins sind OK! Keine Reparatur nötig.",
        "cat_uninstall": "Deinstallations-Manager (Plugins / Emus / Skins / Ordner)",
        "cat_uninstall_desc": "Entferne sicher jedes installierte Plugin, Softcam/Emu, Skin, Paket oder manuelle Ordner direkt vom Receiver.",
        "uninstall_title": "Deinstallations-Manager — Kategorie wählen",
        "uninstall_list_title": "Installierte Elemente auf Receiver (%d)",
        "u_all": "Alle installierten Plugins, Emus, Skins & Ordner",
        "u_plugins": "Installierte Plugins & Erweiterungen",
        "u_softcams": "Installierte Softcams & Emus (OSCam / NCam / CCcam...)",
        "u_skins": "Installierte Skins (FHD / 4K)",
        "u_other": "Weitere installierte Pakete (Feeds / Tools)",
        "u_manual": "Manuelle Ordner & Binaries (/Extensions, /skins, /usr/bin)",
        "u_empty": "Keine entfernbaren Elemente gefunden.",
        "u_confirm": "Möchten Sie wirklich dauerhaft entfernen?\n\n%s\nTyp: %s\nZiel: %s\n\nKann nicht rückgängig gemacht werden.",
        "u_console_title": "mizou1984 Deinstaller — Entferne %s",
        "u_type_pkg": "Systempaket (%s)",
        "u_type_dir": "Plugin- / Skin-Ordner",
        "u_type_bin": "Softcam- / Emu-Binary",
        "menu_title": "mizou1984 Panel Einstellungen & System-Tools",
        "m_doctor": "1. Plugin-Gesundheitsscan & Auto-Reparatur",
        "m_uninstall": "2. Deinstallations-Manager (Plugins / Emus / Skins)",
        "m_quick_filter": "3. Schnellfilter (A-Z / Skins / IPTV / Koran)",
        "m_ram_boost": "4. RAM & Cache Booster (Speicher freigeben)",
        "m_clean_junk": "5. Temp, Cache & Crash-Logs bereinigen (Flash frei)",
        "m_lang": "6. Panel-Sprache  [%s]",
        "m_theme": "7. Panel-Farbthema  [%s]",
        "m_layout": "8. Panel-Skin-Layout  [%s]",
        "m_update": "9. Store-Update prüfen",
        "m_upgrade": "10. System-Feed Upgrade (opkg / apt)",
        "m_restart_gui": "11. Enigma2 GUI neu starten",
        "m_about": "12. Über mizou1984 Store",
        "choose_lang": "Panel-Sprache auswählen",
        "choose_theme": "Panel-Farbthema wählen (Sofort aktiv)",
        "choose_layout": "Panel-Skin-Layout wählen (Sofort aktiv)",
        "choose_filter": "Schnellfilter — Plugins anzeigen",
        "filter_title": "Filter: %s (%d)",
        "restart_confirm": "Enigma2 Oberfläche (GUI) jetzt neu starten?",
        "up_to_date": "mizou1984 Store v%s ist aktuell.",
        "unreachable": "Update-Server nicht erreichbar.\nBitte Internetverbindung prüfen.",
        "upd_avail": "Neues mizou1984 Store Update v%s verfügbar!",
        "whats_new": "Neu in v%s:",
        "upd_ask": "Jetzt aktualisieren?",
        "flash_free_lbl": "Flash: %.1f MB",
        "flash_low_lbl": "WENIG FLASH: %.1f MB!",
        "ram_free_lbl": "RAM: %.0f MB",
        "flash_low_warn": "WARNUNG: Wenig interner Flash-Speicher!\n\nFreier Speicher: %.1f MB  (Empfohlen mindestens: %d MB)\nZiel: %s\n\nEine Installation kann den Flash füllen und einen Absturz (Crash) verursachen.\nTrotzdem fortfahren?",
        "ver_live_tag": "LIVE",
    },
}

CATEGORIES = [
    ("all", "cat_all", "Browse all verified Enigma2 plugins from top developers with live official source installation."),
    ("panels", "cat_panels", "AJPanel, TunisiaSat (TSpanel), SatVenus, ElieSat, EnigmaPlay, SkyBlue, Ciefp (CIFP), Levi45, AIO, Linuxsat & DreamSat."),
    ("plugins_hub", "cat_plugins_hub", "Quran Reader - mizouh (v3.3.0), XtraEvent (8 editions), Screen Grab, ScreenGrabber, ShootYourScreen, IPtoSAT, ServerColoring, Weather Suite, SkyBlue Team, AI Subtitle, Mawaqit & more."),
    ("images", "cat_images", "Official Enigma2 Images Live Browser: EGAMI, OpenPLi, OpenBH, BlackHole, OpenATV, HDSatelit, Hyperion zukonMOD, OpenSPA, OpenViX, PurE2, OpenHDF, OpenDroid, VTi & DreamOS."),
    ("multiboot", "cat_multiboot", "MultiBoot Managers: NeoBoot (Universal & Vu+ Duo 4K), EGAMI Boot, OpenMultiboot, BarryAllen & MultiBoot FlashOnline."),
    ("channels", "cat_channels", "Top Enigma2 Channel Lists & Motor Settings: Ciefp Settings & Panel, Morpheus883 Pro, Vhannibal Italian & Autosetting, MOHAMED_OS, Novaler Motor & GioppyGio."),
    ("bootlogos", "cat_bootlogos", "Bootlogo Managers & 4K Packs: BootLogoSwapper, Advanced Bootlogo, ElieSat Special 4K, Euro Football Sports, Nature 4K, City Night, Moon Space, Ramadan Islamic, Smart Minimal & Kids."),
    ("backup", "cat_backup", "Full Backup & Restore Manager: Instant All-in-One Backup, Full Image Backup (BackupSuite & BackupFlash), Channels Backup, Emus & Subscriptions Backup & One-Click Restore."),
    ("softcams", "cat_softcams", "OSCam, NCam, CCcam, CCcam Adder, MultiCamAdder, Enigma2 Reader Adder, DreamOSat XLine, FreeServer (Mino60), Levi45 FreeServer, Simple Zoom Panel, Zoom, EagleSat, CCcam Info, OSCam Status & KeyAdder."),
    ("iptv", "cat_iptv", "JediMakerXtream (v6.40), XCplugin IPTV (XCPlugin Forever), SkyBlue Player, XStreamity, XKlass, BouquetMakerXtream, MultiStalker Pro, E2m3u2bouquet and Vavoo."),
    ("sports_media", "cat_sports_media", "FootOnsat live match schedules, E2iPlayer VOD library and YouTube-E2 4K."),
    ("epg_subtitles", "cat_epg_subtitles", "EPGImport, EPGTranslator, EPG Grabber (ziko), SubSupport, SubSupport Pro, Translate AI, Sky Blue Subtitle E2, Ciefp OpenSubtitles and Rytec EPG XMLTV."),
    ("skins", "cat_skins", "HD Glass 17 (FullHDGlass17 v9.50), KravenHD (v7.6.0), KravenFHD (v7.0.3), Fury-FHD (v9.0), Fury-FHD Setup, MohammedSkin FHD, Aglare-FHD, NitroAdvanceFHD, Slyk Q, Slyk Onyx, Glamour Aura, oDreamy-FHD & more."),
    ("system_tools", "cat_system_tools", "E2 Doctor, Dish Pointer, Internet SpeedTest, WireGuard VPN, RaedQuickSignal, ServiceApp Exteplayer3 & CacheFlush."),
    ("picons_feeds", "cat_picons_feeds", "E2Picons (E2Piconizer), Ch Logo Changer, ciefp Picon Manager, Picon Updater, Raed Black & White Picons, Chocholousek Picons & MOHAMED_OS Feed."),
]

PLUGIN_CATALOG = [
    {
        "id": "backup-all-in-one-now",
        "name": "[Backup] All-in-One Backup (Channels + Emus + Subs + Settings)",
        "developer": "ElieSat (إيلي سات)",
        "category": "backup",
        "version": "Built-In",
        "size": "Instant",
        "description": "[Backup] All-in-One Backup (Channels + Emus + Subs + Settings) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "DIR=/media/hdd/mizou1984_backups; [ -d /media/hdd ] || DIR=/media/usb/mizou1984_backups; [ -d /media/hdd ] || [ -d /media/usb ] || DIR=/tmp/mizou1984_backups; mkdir -p \"$DIR\"; TS=$(date +%Y%m%d_%H%M); OUT=\"$DIR/mizou_all_backup_$TS.tar.gz\"; opkg list-installed > /etc/enigma2/installed_packages.txt 2>/dev/null || true; tar -czf \"$OUT\" /etc/enigma2 /etc/tuxbox/config /usr/keys /var/keys /etc/CCcam.cfg /etc/mizou1984_store 2>/dev/null || true; ls -lh \"$OUT\" && echo \"[mizou1984] ALL-IN-ONE BACKUP SAVED TO $OUT\"",
        "cmd_dpkg": "DIR=/media/hdd/mizou1984_backups; [ -d /media/hdd ] || DIR=/media/usb/mizou1984_backups; [ -d /media/hdd ] || [ -d /media/usb ] || DIR=/tmp/mizou1984_backups; mkdir -p \"$DIR\"; TS=$(date +%Y%m%d_%H%M); OUT=\"$DIR/mizou_all_backup_$TS.tar.gz\"; tar -czf \"$OUT\" /etc/enigma2 /etc/tuxbox/config /usr/keys /var/keys /etc/CCcam.cfg /etc/mizou1984_store 2>/dev/null || true; ls -lh \"$OUT\" && echo \"[mizou1984] ALL-IN-ONE BACKUP SAVED TO $OUT\"",
        "restart": False,
    },
    {
        "id": "backup-channels-now",
        "name": "[Backup] Channels & Bouquets Backup (باك اب القنوات)",
        "developer": "ElieSat (إيلي سات)",
        "category": "backup",
        "version": "Built-In",
        "size": "Instant",
        "description": "[Backup] Channels & Bouquets Backup (باك اب القنوات) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "DIR=/media/hdd/mizou1984_backups; [ -d /media/hdd ] || DIR=/media/usb/mizou1984_backups; [ -d /media/hdd ] || [ -d /media/usb ] || DIR=/tmp/mizou1984_backups; mkdir -p \"$DIR\"; TS=$(date +%Y%m%d_%H%M); OUT=\"$DIR/mizou_channels_$TS.tar.gz\"; tar -czf \"$OUT\" /etc/enigma2/lamedb* /etc/enigma2/*.tv /etc/enigma2/*.radio /etc/enigma2/bouquets.* /etc/enigma2/blacklist /etc/enigma2/whitelist /etc/tuxbox/satellites.xml 2>/dev/null || true; ls -lh \"$OUT\" && echo \"[mizou1984] CHANNELS BACKUP SAVED TO $OUT\"",
        "cmd_dpkg": "DIR=/media/hdd/mizou1984_backups; [ -d /media/hdd ] || DIR=/media/usb/mizou1984_backups; [ -d /media/hdd ] || [ -d /media/usb ] || DIR=/tmp/mizou1984_backups; mkdir -p \"$DIR\"; TS=$(date +%Y%m%d_%H%M); OUT=\"$DIR/mizou_channels_$TS.tar.gz\"; tar -czf \"$OUT\" /etc/enigma2/lamedb* /etc/enigma2/*.tv /etc/enigma2/*.radio /etc/enigma2/bouquets.* /etc/enigma2/blacklist /etc/enigma2/whitelist /etc/tuxbox/satellites.xml 2>/dev/null || true; ls -lh \"$OUT\" && echo \"[mizou1984] CHANNELS BACKUP SAVED TO $OUT\"",
        "restart": False,
    },
    {
        "id": "backup-emus-subs-now",
        "name": "[Backup] Emus & Subscriptions Backup (الاشتراكات والإيمو)",
        "developer": "ElieSat (إيلي سات)",
        "category": "backup",
        "version": "Built-In",
        "size": "Instant",
        "description": "[Backup] Emus & Subscriptions Backup (الاشتراكات والإيمو) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "DIR=/media/hdd/mizou1984_backups; [ -d /media/hdd ] || DIR=/media/usb/mizou1984_backups; [ -d /media/hdd ] || [ -d /media/usb ] || DIR=/tmp/mizou1984_backups; mkdir -p \"$DIR\"; TS=$(date +%Y%m%d_%H%M); OUT=\"$DIR/mizou_emus_subs_$TS.tar.gz\"; tar -czf \"$OUT\" /etc/tuxbox/config /usr/keys /var/keys /etc/CCcam.cfg /etc/enigma2/xstreamity /etc/enigma2/jediplaylists /etc/enigma2/MultiStalkerPro.json /etc/enigma2/iptosat.json /etc/enigma2/e2m3u2bouquet 2>/dev/null || true; ls -lh \"$OUT\" && echo \"[mizou1984] EMUS & SUBSCRIPTIONS BACKUP SAVED TO $OUT\"",
        "cmd_dpkg": "DIR=/media/hdd/mizou1984_backups; [ -d /media/hdd ] || DIR=/media/usb/mizou1984_backups; [ -d /media/hdd ] || [ -d /media/usb ] || DIR=/tmp/mizou1984_backups; mkdir -p \"$DIR\"; TS=$(date +%Y%m%d_%H%M); OUT=\"$DIR/mizou_emus_subs_$TS.tar.gz\"; tar -czf \"$OUT\" /etc/tuxbox/config /usr/keys /var/keys /etc/CCcam.cfg /etc/enigma2/xstreamity /etc/enigma2/jediplaylists /etc/enigma2/MultiStalkerPro.json /etc/enigma2/iptosat.json /etc/enigma2/e2m3u2bouquet 2>/dev/null || true; ls -lh \"$OUT\" && echo \"[mizou1984] EMUS & SUBSCRIPTIONS BACKUP SAVED TO $OUT\"",
        "restart": False,
    },
    {
        "id": "backup-full-image-now",
        "name": "[Backup] Full Image Backup (الصورة كاملة)",
        "developer": "ElieSat (إيلي سات)",
        "category": "backup",
        "version": "Built-In",
        "size": "Instant",
        "description": "[Backup] Full Image Backup (الصورة كاملة) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "if [ -x /usr/lib/enigma2/python/Plugins/Extensions/BackupSuite/backup.sh ]; then sh /usr/lib/enigma2/python/Plugins/Extensions/BackupSuite/backup.sh hdd; else echo \"[mizou1984] Installing BackupSuite for Full Image Backup...\"; wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/backupsuite/backupsuite.sh -O - | /bin/sh; fi",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/backupsuite/backupsuite.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "backup-restore-now",
        "name": "[Restore] Restore Saved Backup (استعادة نسخة احتياطية)",
        "developer": "ElieSat (إيلي سات)",
        "category": "backup",
        "version": "Built-In",
        "size": "Instant",
        "description": "[Restore] Restore Saved Backup (استعادة نسخة احتياطية) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "LATEST=$(ls -t /media/hdd/mizou1984_backups/*.tar.gz /media/usb/mizou1984_backups/*.tar.gz /tmp/mizou1984_backups/*.tar.gz 2>/dev/null | head -n 1); if [ -n \"$LATEST\" ]; then echo \"[mizou1984] Restoring $LATEST ...\"; tar -xzf \"$LATEST\" -C / && echo \"[mizou1984] RESTORE COMPLETE! Restart Enigma2 GUI.\"; else echo \"[mizou1984] No backup archives found yet.\"; fi",
        "cmd_dpkg": "LATEST=$(ls -t /media/hdd/mizou1984_backups/*.tar.gz /media/usb/mizou1984_backups/*.tar.gz /tmp/mizou1984_backups/*.tar.gz 2>/dev/null | head -n 1); if [ -n \"$LATEST\" ]; then echo \"[mizou1984] Restoring $LATEST ...\"; tar -xzf \"$LATEST\" -C / && echo \"[mizou1984] RESTORE COMPLETE! Restart Enigma2 GUI.\"; else echo \"[mizou1984] No backup archives found yet.\"; fi",
        "restart": True,
    },
    {
        "id": "advanced-bootlogo",
        "name": "Advanced Bootlogo Manager",
        "developer": "ElieSat (إيلي سات)",
        "category": "bootlogos",
        "version": "1.0",
        "size": "2.1 MB",
        "description": "Advanced Bootlogo Manager by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/advancedbootlogo/advancedbootlogo.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/advancedbootlogo/advancedbootlogo.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "aglare-fhd",
        "name": "Aglare-FHD Skin",
        "developer": "Madhouse & DreamSat",
        "category": "skins",
        "version": "Latest",
        "size": "6.8 MB",
        "description": "Aglare-FHD Skin by Madhouse & DreamSat — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/skins/-/raw/main/all/aglare-fhd/aglare-fhd.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/skins/-/raw/main/all/aglare-fhd/aglare-fhd.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "ai-subtitle",
        "name": "AI Subtitle (AISubtitles)",
        "developer": "ElieSat (إيلي سات)",
        "category": "plugins_hub",
        "version": "3.2.0",
        "size": "1.9 MB",
        "description": "AI Subtitle (AISubtitles) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/aisubtitles/aisubtitles.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/aisubtitles/aisubtitles.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "ai-fury",
        "name": "AIFury (AI EPG Translator & Tools)",
        "developer": "Islam Salama (Fury Team)",
        "category": "plugins_hub",
        "version": "2.5",
        "size": "1.4 MB",
        "description": "AIFury (AI EPG Translator & Tools) by Islam Salama (Fury Team) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/islam-2412/IPKS/refs/heads/main/fury/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/islam-2412/IPKS/refs/heads/main/fury/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "aio-panel",
        "name": "AIO Panel (All-In-One)",
        "developer": "Lululla (Linuxsat)",
        "category": "panels",
        "version": "Latest",
        "size": "1.9 MB",
        "description": "AIO Panel (All-In-One) by Lululla (Linuxsat) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/panelaio/panelaio.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/panelaio/panelaio.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "ajpanel",
        "name": "AJPanel",
        "developer": "biko & A.J. (AJPanel)",
        "category": "panels",
        "version": "10.8.5",
        "size": "1.8 MB",
        "description": "AJPanel by biko & A.J. (AJPanel) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/ajpanel/ajpanel.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/ajpanel/ajpanel.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "alayer-plugin",
        "name": "Alayer (Alaire)",
        "developer": "ElieSat (إيلي سات)",
        "category": "plugins_hub",
        "version": "1.2",
        "size": "1.1 MB",
        "description": "Alayer (Alaire) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/alajre/alajre.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/alajre/alajre.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "ansite-plugin",
        "name": "Ansite",
        "developer": "MOHAMED_OS",
        "category": "plugins_hub",
        "version": "Latest",
        "size": "980 KB",
        "description": "Ansite by MOHAMED_OS — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/ansite/ansite.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/ansite/ansite.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "arabicsavior",
        "name": "ArabicSavior",
        "developer": "fairbird (رائد)",
        "category": "plugins_hub",
        "version": "2.5",
        "size": "420 KB",
        "description": "ArabicSavior by fairbird (رائد) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/ArabicSavior/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/ArabicSavior/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "athantimes",
        "name": "AthanTimes",
        "developer": "fairbird (رائد)",
        "category": "plugins_hub",
        "version": "3.9",
        "size": "3.4 MB",
        "description": "AthanTimes by fairbird (رائد) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/AthanTimes/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/AthanTimes/main/installer.sh -O - | /bin/sh",
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
        "id": "backup-flash",
        "name": "BackupFlash (Full Image & Online Flash)",
        "developer": "ElieSat (إيلي سات)",
        "category": "backup",
        "version": "9.5",
        "size": "1.1 MB",
        "description": "BackupFlash (Full Image & Online Flash) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/backupflashe/backupflashe.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/backupflashe/backupflashe.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "backupsuite",
        "name": "BackupSuite (Full Image Backup)",
        "developer": "ElieSat (إيلي سات)",
        "category": "backup",
        "version": "3.0-r10",
        "size": "890 KB",
        "description": "BackupSuite (Full Image Backup) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/backupsuite/backupsuite.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/backupsuite/backupsuite.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "barryallen",
        "name": "BarryAllen MultiBoot (DreamOS)",
        "developer": "ElieSat (إيلي سات)",
        "category": "multiboot",
        "version": "12.91-r1",
        "size": "2.4 MB",
        "description": "BarryAllen MultiBoot (DreamOS) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/barryallen/barryallen.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/barryallen/barryallen.sh -O - | /bin/sh",
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
        "id": "blackharmony-fhd",
        "name": "BlackHarmony FHD",
        "developer": "Chocholousek & oottppxx",
        "category": "skins",
        "version": "Latest",
        "size": "5.9 MB",
        "description": "BlackHarmony FHD by Chocholousek & oottppxx — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/skins/-/raw/main/all/black-neon/black-neon.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/skins/-/raw/main/all/black-neon/black-neon.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "image-blackhole",
        "name": "BlackHole / OpenBH Vu+ (Live — All Vu+)",
        "developer": "fairbird (رائد)",
        "category": "images",
        "version": "6.0 / 3.1.0",
        "size": "Vu+ Official",
        "description": "BlackHole / OpenBH Vu+ (Live — All Vu+) by fairbird (رائد) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "BOX=$(cat /proc/stb/info/boxtype 2>/dev/null || cat /proc/stb/info/model 2>/dev/null || hostname); echo \"====================================================\"; echo \"[mizou1984] BlackHole Official Image (Vu+ Receivers)\"; echo \"Detected Box: $BOX | Arch: $(uname -m)\"; echo \"Official Vu+ BlackHole Portal: https://www.vuplus-community.net\"; echo \"OpenBlackHole Modern Py3 Portal: https://images.openbh.net\"; echo \"Tip: For direct TV flashing install Image Downloader plugin above.\"; echo \"====================================================\"",
        "cmd_dpkg": "echo \"[mizou1984] BlackHole Official Portal: https://www.vuplus-community.net (Vu+ receivers only)\"",
        "restart": False,
    },
    {
        "id": "bootlogo-swapper",
        "name": "BootLogoSwapper",
        "developer": "ElieSat (إيلي سات)",
        "category": "bootlogos",
        "version": "Latest",
        "size": "4.2 MB",
        "description": "BootLogoSwapper by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/bootlogoswapper/bootlogoswapper-eliesat-special-edition.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/bootlogoswapper/bootlogoswapper-eliesat-special-edition.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "bouquetmakerxtream",
        "name": "BouquetMakerXtream",
        "developer": "KiddaC",
        "category": "iptv",
        "version": "Latest",
        "size": "1.7 MB",
        "description": "BouquetMakerXtream by KiddaC — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/bouquetmakerxtream/bouquetmakerxtream.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/bouquetmakerxtream/bouquetmakerxtream.sh -O - | /bin/sh",
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
        "id": "cccam-universal",
        "name": "CCcam 2.3.9 / 2.3.8 / 2.3.2 (السيس كام)",
        "developer": "MOHAMED_OS",
        "category": "softcams",
        "version": "2.3.9-r6",
        "size": "1.1 MB",
        "description": "CCcam 2.3.9 / 2.3.8 / 2.3.2 (السيس كام) by MOHAMED_OS — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/softcams/-/raw/main/cccam/cccam.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/softcams/-/raw/main/cccam/cccam.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "cccam-adder",
        "name": "CCcam Adder (Easy-CCcam)",
        "developer": "ElieSat (إيلي سات)",
        "category": "softcams",
        "version": "0.2",
        "size": "480 KB",
        "description": "CCcam Adder (Easy-CCcam) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/emil237/plugins/refs/heads/main/easy-cccam/easy-cccam.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/emil237/plugins/refs/heads/main/easy-cccam/easy-cccam.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "cccam-info",
        "name": "CCcam Info",
        "developer": "ElieSat (إيلي سات)",
        "category": "softcams",
        "version": "1.9",
        "size": "510 KB",
        "description": "CCcam Info by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/cccaminfo/cccaminfo.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/cccaminfo/cccaminfo.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "ch-logo-changer",
        "name": "Ch Logo Changer",
        "developer": "ElieSat (إيلي سات)",
        "category": "picons_feeds",
        "version": "1.5.0",
        "size": "950 KB",
        "description": "Ch Logo Changer by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/chlogochanger/chlogochanger.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/chlogochanger/chlogochanger.sh -O - | /bin/sh",
        "restart": True,
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
        "id": "ciefp-opensubtitles",
        "name": "Ciefp OpenSubtitles",
        "developer": "Ciefp (CIFP)",
        "category": "epg_subtitles",
        "version": "1.5",
        "size": "890 KB",
        "description": "Ciefp OpenSubtitles by Ciefp (CIFP) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/ciefp/CiefpOpenSubtitles/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/ciefp/CiefpOpenSubtitles/main/installer.sh -O - | /bin/sh",
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
        "id": "ciefp-picon-manager",
        "name": "ciefp Picon Manager",
        "developer": "Ciefp (CIFP)",
        "category": "picons_feeds",
        "version": "2.8.0",
        "size": "1.2 MB",
        "description": "ciefp Picon Manager by Ciefp (CIFP) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/ciefp/CiefpPiconManager/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/ciefp/CiefpPiconManager/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "channels-ciefp-motor",
        "name": "Ciefp Settings — All Satellites Motor",
        "developer": "Ciefp (CIFP)",
        "category": "channels",
        "version": "Latest",
        "size": "1.5 MB",
        "description": "Ciefp Settings — All Satellites Motor by Ciefp (CIFP) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/settings/-/raw/main/ciefp-motor/ciefp-motor.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/settings/-/raw/main/ciefp-motor/ciefp-motor.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "channels-ciefp-panel",
        "name": "Ciefp Settings Panel (Auto-Updater)",
        "developer": "Ciefp (CIFP)",
        "category": "channels",
        "version": "5.0",
        "size": "950 KB",
        "description": "Ciefp Settings Panel (Auto-Updater) by Ciefp (CIFP) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/ciefpsettingspanel/ciefpsettingspanel.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/ciefpsettingspanel/ciefpsettingspanel.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "bootlogo-city",
        "name": "City Night 4K Bootlogos",
        "developer": "ElieSat (إيلي سات)",
        "category": "bootlogos",
        "version": "1.0",
        "size": "3.9 MB",
        "description": "City Night 4K Bootlogos by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/display/-/raw/main/city/bootlogos-city.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/display/-/raw/main/city/bootlogos-city.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "dish-pointer",
        "name": "Dish Pointer (CiefpDishPointer)",
        "developer": "Ciefp (CIFP)",
        "category": "system_tools",
        "version": "1.1",
        "size": "1.1 MB",
        "description": "Dish Pointer (CiefpDishPointer) by Ciefp (CIFP) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/ciefp/CiefpDishPointer/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/ciefp/CiefpDishPointer/main/installer.sh -O - | /bin/sh",
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
        "id": "image-dreamos",
        "name": "DreamOS / GP4.2 (Dreambox Official)",
        "developer": "fairbird (رائد)",
        "category": "images",
        "version": "OE2.5 / OE2.6",
        "size": "Dreambox Official",
        "description": "DreamOS / GP4.2 (Dreambox Official) by fairbird (رائد) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "BOX=$(cat /proc/stb/info/model 2>/dev/null || hostname); echo \"[mizou1984] DreamOS / GP4.2 | Box: $BOX | Portal: https://dreamboxupdate.com\"",
        "cmd_dpkg": "BOX=$(cat /proc/stb/info/model 2>/dev/null || hostname); echo \"[mizou1984] DreamOS / GP4.2 | Box: $BOX | Portal: https://dreamboxupdate.com\"",
        "restart": False,
    },
    {
        "id": "dreamosat-xline",
        "name": "DreamOSat XLine (CCcam / OSCam Line Adder)",
        "developer": "Madhouse & DreamSat",
        "category": "softcams",
        "version": "1.0",
        "size": "690 KB",
        "description": "DreamOSat XLine (CCcam / OSCam Line Adder) by Madhouse & DreamSat — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/dreamosatxline/dreamosatxline.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/dreamosatxline/dreamosatxline.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "dreamsat-panel",
        "name": "DreamSat Panel",
        "developer": "Madhouse & DreamSat",
        "category": "panels",
        "version": "Latest",
        "size": "1.5 MB",
        "description": "DreamSat Panel by Madhouse & DreamSat — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/emilpanel/emilpanel.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/emilpanel/emilpanel.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "e2-doctor",
        "name": "E2 Doctor (System Diagnostic & Auto-Repair)",
        "developer": "ElieSat (إيلي سات)",
        "category": "system_tools",
        "version": "2.0",
        "size": "1.2 MB",
        "description": "E2 Doctor (System Diagnostic & Auto-Repair) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/OliOli2013/E2-Doctor-Plugin/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/OliOli2013/E2-Doctor-Plugin/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "e2iplayer",
        "name": "E2iPlayer (ZadMario / MOHAMED_OS)",
        "developer": "Dorik1972 & ZadMario",
        "category": "sports_media",
        "version": "Latest",
        "size": "8.4 MB",
        "description": "E2iPlayer (ZadMario / MOHAMED_OS) by Dorik1972 & ZadMario — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/e2iplayer/e2iplayer-main.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/e2iplayer/e2iplayer-main.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "e2m3u2bouquet",
        "name": "E2m3u2bouquet (Dorik Mod)",
        "developer": "Dorik1972 & ZadMario",
        "category": "iptv",
        "version": "2.0.13",
        "size": "1.4 MB",
        "description": "E2m3u2bouquet (Dorik Mod) by Dorik1972 & ZadMario — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/e2m3u2bouquet/e2m3u2bouquet.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/e2m3u2bouquet/e2m3u2bouquet.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "e2-picons",
        "name": "E2Picons (E2Piconizer)",
        "developer": "KiddaC",
        "category": "picons_feeds",
        "version": "1.22",
        "size": "1.6 MB",
        "description": "E2Picons (E2Piconizer) by KiddaC — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "rm -rf /tmp/e2piconizer.tar.gz /tmp/E2_Piconizer-master && wget -q \"--no-check-certificate\" https://github.com/kiddac/E2_Piconizer/archive/refs/heads/master.tar.gz -O /tmp/e2piconizer.tar.gz && tar -xzf /tmp/e2piconizer.tar.gz -C /tmp && cp -rf /tmp/E2_Piconizer-master/E2Piconizer/usr/* /usr/ && rm -rf /tmp/e2piconizer.tar.gz /tmp/E2_Piconizer-master",
        "cmd_dpkg": "rm -rf /tmp/e2piconizer.tar.gz /tmp/E2_Piconizer-master && wget -q \"--no-check-certificate\" https://github.com/kiddac/E2_Piconizer/archive/refs/heads/master.tar.gz -O /tmp/e2piconizer.tar.gz && tar -xzf /tmp/e2piconizer.tar.gz -C /tmp && cp -rf /tmp/E2_Piconizer-master/E2Piconizer/usr/* /usr/ && rm -rf /tmp/e2piconizer.tar.gz /tmp/E2_Piconizer-master",
        "restart": True,
    },
    {
        "id": "egamiboot",
        "name": "EGAMI Boot (MultiBoot)",
        "developer": "ElieSat (إيلي سات)",
        "category": "multiboot",
        "version": "10.6",
        "size": "1.8 MB",
        "description": "EGAMI Boot (MultiBoot) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/egamiboot/egamiboot.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/egamiboot/egamiboot.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "image-egami",
        "name": "EGAMI Image (11.0 Live — Select Box)",
        "developer": "ElieSat (إيلي سات)",
        "category": "images",
        "version": "11.0",
        "size": "Auto-Box",
        "description": "EGAMI Image (11.0 Live — Select Box) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "BOX=$(cat /proc/stb/info/boxtype 2>/dev/null || cat /proc/stb/info/model 2>/dev/null || hostname); DIR=/media/hdd/images; [ -d /media/hdd ] || DIR=/media/usb/images; [ -d /media/usb ] || [ -d /media/hdd ] || DIR=/tmp/images; mkdir -p $DIR; echo \"[mizou1984] EGAMI Image Fetcher | Box: $BOX | Save: $DIR\"; FILE=$(wget -qO- --no-check-certificate https://image.egami-image.com/index.php?open=$BOX | grep -oE \"egami-[0-9A-Za-z._-]+\\.zip\" | head -n 1); if [ -n \"$FILE\" ]; then echo \"[mizou1984] Downloading $FILE ...\"; wget --no-check-certificate -O \"$DIR/$FILE\" \"https://image.egami-image.com/$BOX/$FILE\" && echo \"[mizou1984] Saved to $DIR/$FILE — Flash via Image Manager / Flash Online!\"; else echo \"[mizou1984] Box $BOX: Visit https://egami-image.com or install Image Downloader plugin from this Images menu.\"; fi",
        "cmd_dpkg": "echo \"[mizou1984] EGAMI Official Portal: https://egami-image.com — Install Image Downloader plugin from this menu for online flashing.\"",
        "restart": False,
    },
    {
        "id": "eliesat-panel",
        "name": "ElieSat Panel",
        "developer": "ElieSat (إيلي سات)",
        "category": "panels",
        "version": "Latest",
        "size": "2.3 MB",
        "description": "ElieSat Panel by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/eliesatpanel/-/raw/main/eliesatpanel.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/eliesatpanel/-/raw/main/eliesatpanel.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "bootlogo-eliesat",
        "name": "ElieSat Special Edition 4K Bootlogos",
        "developer": "ElieSat (إيلي سات)",
        "category": "bootlogos",
        "version": "1.0",
        "size": "4.5 MB",
        "description": "ElieSat Special Edition 4K Bootlogos by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/display/-/raw/main/eliesat/bootlogos-eliesat-special-edition-1.0.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/display/-/raw/main/eliesat/bootlogos-eliesat-special-edition-1.0.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "enigma2-reader-adder",
        "name": "Enigma2 Reader Adder (OSCam / NCam / CCcam)",
        "developer": "ElieSat (إيلي سات)",
        "category": "softcams",
        "version": "1.2",
        "size": "540 KB",
        "description": "Enigma2 Reader Adder (OSCam / NCam / CCcam) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/emilnabil/download-plugins/refs/heads/main/enigma2readeradder/enigma2readeradder.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/emilnabil/download-plugins/refs/heads/main/enigma2readeradder/enigma2readeradder.sh -O - | /bin/sh",
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
        "id": "epg-grabber-ziko",
        "name": "EPG Grabber",
        "developer": "ziko",
        "category": "epg_subtitles",
        "version": "25.7",
        "size": "1.1 MB",
        "description": "EPG Grabber by ziko — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/ziko-ZR1/Epg-plugin/master/Download/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/ziko-ZR1/Epg-plugin/master/Download/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "epgimport-dorik",
        "name": "EPGImport (Dorik1972 Mod)",
        "developer": "Dorik1972 & ZadMario",
        "category": "epg_subtitles",
        "version": "1.9.1",
        "size": "740 KB",
        "description": "EPGImport (Dorik1972 Mod) by Dorik1972 & ZadMario — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/epgimport-mod-dorik1972/epgimport-mod-dorik1972.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/epgimport-mod-dorik1972/epgimport-mod-dorik1972.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "epg-translator",
        "name": "EPGTranslator",
        "developer": "ElieSat (إيلي سات)",
        "category": "epg_subtitles",
        "version": "1.6",
        "size": "540 KB",
        "description": "EPGTranslator by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "opkg install enigma2-plugin-extensions-epgtranslator || opkg install enigma2-plugin-extensions-translator",
        "cmd_dpkg": "apt-get install -y enigma2-plugin-extensions-epgtranslator",
        "restart": True,
    },
    {
        "id": "bootlogo-euro-sports",
        "name": "Euro & Football Sports Bootlogos",
        "developer": "ElieSat (إيلي سات)",
        "category": "bootlogos",
        "version": "1.0",
        "size": "3.8 MB",
        "description": "Euro & Football Sports Bootlogos by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/display/-/raw/main/euro2024/bootlogos-euro2024.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/display/-/raw/main/euro2024/bootlogos-euro2024.sh -O - | /bin/sh",
        "restart": False,
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
        "id": "foreca-weather",
        "name": "Foreca Weather",
        "developer": "Lululla (Linuxsat)",
        "category": "plugins_hub",
        "version": "1.2.4",
        "size": "1.1 MB",
        "description": "Foreca Weather by Lululla (Linuxsat) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/foreca/foreca.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/foreca/foreca.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "freeserver-mino60",
        "name": "FreeServer (Mino60 Free CCcam / OSCam)",
        "developer": "ElieSat (إيلي سات)",
        "category": "softcams",
        "version": "8.3.8-r1",
        "size": "1.8 MB",
        "description": "FreeServer (Mino60 Free CCcam / OSCam) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/freeserver/freeserver.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/freeserver/freeserver.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "fullhdline",
        "name": "FullHDLine Skin",
        "developer": "Lululla (Linuxsat)",
        "category": "skins",
        "version": "Latest",
        "size": "3.5 MB",
        "description": "FullHDLine Skin by Lululla (Linuxsat) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/skins/-/raw/main/all/fullhdglass17/fullhdglass17.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/skins/-/raw/main/all/fullhdglass17/fullhdglass17.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "fury-setup-plugin",
        "name": "Fury-FHD Setup & Control",
        "developer": "Islam Salama (Fury Team)",
        "category": "skins",
        "version": "9.0",
        "size": "1.8 MB",
        "description": "Fury-FHD Setup & Control by Islam Salama (Fury Team) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/islam-2412/IPKS/refs/heads/main/fury/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/islam-2412/IPKS/refs/heads/main/fury/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "fury-fhd-skin",
        "name": "Fury-FHD Skin (Official)",
        "developer": "Islam Salama (Fury Team)",
        "category": "skins",
        "version": "9.0",
        "size": "9.4 MB",
        "description": "Fury-FHD Skin (Official) by Islam Salama (Fury Team) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/islam-2412/IPKS/refs/heads/main/fury/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/islam-2412/IPKS/refs/heads/main/fury/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "fury-biss",
        "name": "FuryBiss (Auto Feed BISS)",
        "developer": "Islam Salama (Fury Team)",
        "category": "plugins_hub",
        "version": "3.2",
        "size": "1.1 MB",
        "description": "FuryBiss (Auto Feed BISS) by Islam Salama (Fury Team) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/islam-2412/FuryBiss/refs/heads/main/fury/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/islam-2412/FuryBiss/refs/heads/main/fury/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "fury-posterx",
        "name": "FuryPosterX",
        "developer": "Islam Salama (Fury Team)",
        "category": "plugins_hub",
        "version": "3.1",
        "size": "950 KB",
        "description": "FuryPosterX by Islam Salama (Fury Team) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/islam-2412/IPKS/refs/heads/main/fury/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/islam-2412/IPKS/refs/heads/main/fury/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "channels-gioppygio",
        "name": "GioppyGio Settings & Satellites.xml",
        "developer": "Morpheus883 & Vhannibal",
        "category": "channels",
        "version": "Latest",
        "size": "900 KB",
        "description": "GioppyGio Settings & Satellites.xml by Morpheus883 & Vhannibal — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/settings/-/raw/main/gioppygio/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/settings/-/raw/main/gioppygio/installer.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "glamour-aura-fhd",
        "name": "Glamour Aura FHD",
        "developer": "Lululla (Linuxsat)",
        "category": "skins",
        "version": "Latest",
        "size": "6.4 MB",
        "description": "Glamour Aura FHD by Lululla (Linuxsat) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/skins/-/raw/main/all/xdreamy/xdreamy.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/skins/-/raw/main/all/xdreamy/xdreamy.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "gosat-gcam",
        "name": "Gosat / GCam Universal (القوسات)",
        "developer": "MOHAMED_OS",
        "category": "softcams",
        "version": "2.0-11950",
        "size": "1.8 MB",
        "description": "Gosat / GCam Universal (القوسات) by MOHAMED_OS — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/softcams/-/raw/main/mohamed-os/gosatplus.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/softcams/-/raw/main/mohamed-os/gosatplus.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "hd-glass-17",
        "name": "HD Glass 17 (FullHDGlass17)",
        "developer": "ElieSat (إيلي سات)",
        "category": "skins",
        "version": "9.50",
        "size": "14.5 MB",
        "description": "HD Glass 17 (FullHDGlass17) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/skins/-/raw/main/all/fullhdglass17/fullhdglass17.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/skins/-/raw/main/all/fullhdglass17/fullhdglass17.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "image-hdsatelit",
        "name": "HDSatelit Image (0.7.8 Live — All Boxes)",
        "developer": "HD Satelit & PKTeam zukonMOD",
        "category": "images",
        "version": "0.7.8",
        "size": "Live Mirror",
        "description": "HDSatelit Image (0.7.8 Live — All Boxes) by HD Satelit & PKTeam zukonMOD — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "echo \"[mizou1984] Open HDSatelit inside mizou1984 TV Store to browse all boxes & download latest .zip from https://stb.hdsatelit.com/en/receptoare/\"",
        "cmd_dpkg": "echo \"[mizou1984] HDSatelit Official Portal: https://stb.hdsatelit.com/en/receptoare/\"",
        "restart": False,
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
        "id": "image-hyperion",
        "name": "Hyperion zukonMOD (PKTeam X.2 Live — All Boxes)",
        "developer": "HD Satelit & PKTeam zukonMOD",
        "category": "images",
        "version": "X.2",
        "size": "Live Mirror",
        "description": "Hyperion zukonMOD (PKTeam X.2 Live — All Boxes) by HD Satelit & PKTeam zukonMOD — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "echo \"[mizou1984] Open Hyperion zukonMOD inside mizou1984 TV Store to browse all boxes & download latest .zip from https://zukon.pl/app.php/downloadsystem\"",
        "cmd_dpkg": "echo \"[mizou1984] Hyperion zukonMOD Portal: https://zukon.pl/app.php/downloadsystem\"",
        "restart": False,
    },
    {
        "id": "image-downloader-plugin",
        "name": "Image Downloader (Flash Online)",
        "developer": "ElieSat (إيلي سات)",
        "category": "images",
        "version": "3.0",
        "size": "1.1 MB",
        "description": "Image Downloader (Flash Online) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/image-downloader/image-downloader.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/image-downloader/image-downloader.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "internet-speedtest",
        "name": "Internet SpeedTest",
        "developer": "ElieSat (إيلي سات)",
        "category": "system_tools",
        "version": "1.7",
        "size": "560 KB",
        "description": "Internet SpeedTest by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/internetspeedtest/internet-speed-test.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/internetspeedtest/internet-speed-test.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "ipaudio-plus",
        "name": "IPAudioPlus / IPAudio Pro",
        "developer": "ziko",
        "category": "plugins_hub",
        "version": "Latest",
        "size": "1.3 MB",
        "description": "IPAudioPlus / IPAudio Pro by ziko — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/ipaudiopro/ipaudiopro.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/ipaudiopro/ipaudiopro.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "iptosat",
        "name": "IPtoSAT",
        "developer": "ziko",
        "category": "plugins_hub",
        "version": "1.9",
        "size": "420 KB",
        "description": "IPtoSAT by ziko — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q --no-check-certificate -O /tmp/iptosat.tar.gz https://github.com/zKhadiri/IPtoSAT/archive/refs/heads/main.tar.gz && tar -xzf /tmp/iptosat.tar.gz -C /tmp && mkdir -p /usr/lib/enigma2/python/Plugins/Extensions/IPtoSAT && cp -rf /tmp/IPtoSAT-main/src/IPtoSAT/* /usr/lib/enigma2/python/Plugins/Extensions/IPtoSAT/ && [ -f /etc/enigma2/iptosat.json ] || cp -f /tmp/IPtoSAT-main/src/etc/enigma2/iptosat.json /etc/enigma2/iptosat.json 2>/dev/null; rm -rf /tmp/iptosat.tar.gz /tmp/IPtoSAT-main && echo \"[mizou1984] IPtoSAT installed! Restart Enigma2 GUI.\"",
        "cmd_dpkg": "wget -q --no-check-certificate -O /tmp/iptosat.tar.gz https://github.com/zKhadiri/IPtoSAT/archive/refs/heads/main.tar.gz && tar -xzf /tmp/iptosat.tar.gz -C /tmp && mkdir -p /usr/lib/enigma2/python/Plugins/Extensions/IPtoSAT && cp -rf /tmp/IPtoSAT-main/src/IPtoSAT/* /usr/lib/enigma2/python/Plugins/Extensions/IPtoSAT/ && [ -f /etc/enigma2/iptosat.json ] || cp -f /tmp/IPtoSAT-main/src/etc/enigma2/iptosat.json /etc/enigma2/iptosat.json 2>/dev/null; rm -rf /tmp/iptosat.tar.gz /tmp/IPtoSAT-main && echo \"[mizou1984] IPtoSAT installed! Restart Enigma2 GUI.\"",
        "restart": True,
    },
    {
        "id": "jedimakerxtream",
        "name": "JediMakerXtream",
        "developer": "KiddaC",
        "category": "iptv",
        "version": "6.40.20250212",
        "size": "1.1 MB",
        "description": "JediMakerXtream by KiddaC — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/jedimakerxtream/jedimakerxtream.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/jedimakerxtream/jedimakerxtream.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "keyadder",
        "name": "KeyAdder",
        "developer": "fairbird (رائد)",
        "category": "softcams",
        "version": "9.6",
        "size": "640 KB",
        "description": "KeyAdder by fairbird (رائد) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/KeyAdder/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/KeyAdder/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "bootlogo-kids",
        "name": "Kids & Animation Bootlogos (Stony272)",
        "developer": "ElieSat (إيلي سات)",
        "category": "bootlogos",
        "version": "1.0",
        "size": "4.2 MB",
        "description": "Kids & Animation Bootlogos (Stony272) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/bootlogokids/bootlogokids-stony272.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/bootlogokids/bootlogokids-stony272.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "kraven-fhd",
        "name": "KravenFHD Skin (1080p)",
        "developer": "Lululla (Linuxsat)",
        "category": "skins",
        "version": "7.0.3",
        "size": "8.4 MB",
        "description": "KravenFHD Skin (1080p) by Lululla (Linuxsat) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "rm -rf /tmp/kravenfhd.tar.gz /tmp/kravenfhd_extract && mkdir -p /tmp/kravenfhd_extract && (wget --no-check-certificate -q -O /tmp/kravenfhd.tar.gz https://codeload.github.com/KravenHD/KravenFHD/tar.gz/refs/heads/master || curl -fsSLk -o /tmp/kravenfhd.tar.gz https://codeload.github.com/KravenHD/KravenFHD/tar.gz/refs/heads/master) && tar -xzf /tmp/kravenfhd.tar.gz -C /tmp/kravenfhd_extract && cp -rf /tmp/kravenfhd_extract/KravenFHD-master/usr / && ([ -d /tmp/kravenfhd_extract/KravenFHD-master/etc ] && cp -rf /tmp/kravenfhd_extract/KravenFHD-master/etc / || true) && rm -rf /tmp/kravenfhd.tar.gz /tmp/kravenfhd_extract && echo \"[mizou1984] KravenFHD installed! Open KravenFHD plugin & press GREEN to activate.\"",
        "cmd_dpkg": "rm -rf /tmp/kravenfhd.tar.gz /tmp/kravenfhd_extract && mkdir -p /tmp/kravenfhd_extract && (wget --no-check-certificate -q -O /tmp/kravenfhd.tar.gz https://codeload.github.com/KravenHD/KravenFHD/tar.gz/refs/heads/master || curl -fsSLk -o /tmp/kravenfhd.tar.gz https://codeload.github.com/KravenHD/KravenFHD/tar.gz/refs/heads/master) && tar -xzf /tmp/kravenfhd.tar.gz -C /tmp/kravenfhd_extract && cp -rf /tmp/kravenfhd_extract/KravenFHD-master/usr / && ([ -d /tmp/kravenfhd_extract/KravenFHD-master/etc ] && cp -rf /tmp/kravenfhd_extract/KravenFHD-master/etc / || true) && rm -rf /tmp/kravenfhd.tar.gz /tmp/kravenfhd_extract && echo \"[mizou1984] KravenFHD installed! Open KravenFHD plugin & press GREEN to activate.\"",
        "restart": True,
    },
    {
        "id": "kraven-hd",
        "name": "KravenHD Skin",
        "developer": "Lululla (Linuxsat)",
        "category": "skins",
        "version": "7.6.0",
        "size": "7.8 MB",
        "description": "KravenHD Skin by Lululla (Linuxsat) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "rm -rf /tmp/kravenhd.tar.gz /tmp/kravenhd_extract && mkdir -p /tmp/kravenhd_extract && (wget --no-check-certificate -q -O /tmp/kravenhd.tar.gz https://codeload.github.com/KravenHD/KravenHD/tar.gz/refs/heads/master || curl -fsSLk -o /tmp/kravenhd.tar.gz https://codeload.github.com/KravenHD/KravenHD/tar.gz/refs/heads/master) && tar -xzf /tmp/kravenhd.tar.gz -C /tmp/kravenhd_extract && cp -rf /tmp/kravenhd_extract/KravenHD-master/usr / && ([ -d /tmp/kravenhd_extract/KravenHD-master/etc ] && cp -rf /tmp/kravenhd_extract/KravenHD-master/etc / || true) && rm -rf /tmp/kravenhd.tar.gz /tmp/kravenhd_extract && echo \"[mizou1984] KravenHD installed! Open KravenHD plugin & press GREEN to activate.\"",
        "cmd_dpkg": "rm -rf /tmp/kravenhd.tar.gz /tmp/kravenhd_extract && mkdir -p /tmp/kravenhd_extract && (wget --no-check-certificate -q -O /tmp/kravenhd.tar.gz https://codeload.github.com/KravenHD/KravenHD/tar.gz/refs/heads/master || curl -fsSLk -o /tmp/kravenhd.tar.gz https://codeload.github.com/KravenHD/KravenHD/tar.gz/refs/heads/master) && tar -xzf /tmp/kravenhd.tar.gz -C /tmp/kravenhd_extract && cp -rf /tmp/kravenhd_extract/KravenHD-master/usr / && ([ -d /tmp/kravenhd_extract/KravenHD-master/etc ] && cp -rf /tmp/kravenhd_extract/KravenHD-master/etc / || true) && rm -rf /tmp/kravenhd.tar.gz /tmp/kravenhd_extract && echo \"[mizou1984] KravenHD installed! Open KravenHD plugin & press GREEN to activate.\"",
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
        "id": "levi45-freeserver",
        "name": "Levi45 FreeServer",
        "developer": "Levi45",
        "category": "softcams",
        "version": "2.4",
        "size": "920 KB",
        "description": "Levi45 FreeServer by Levi45 — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/levi45-freeserver/levi45-freeserver.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/levi45-freeserver/levi45-freeserver.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "levi45-multicam",
        "name": "Levi45 Multicam Manager",
        "developer": "Levi45",
        "category": "softcams",
        "version": "11950-r803",
        "size": "980 KB",
        "description": "Levi45 Multicam Manager by Levi45 — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/softcams/-/raw/main/levi/oscam.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/softcams/-/raw/main/levi/oscam.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "linuxsat-panel",
        "name": "Linuxsat-Panel",
        "developer": "Lululla (Linuxsat)",
        "category": "panels",
        "version": "3.0.9",
        "size": "2.4 MB",
        "description": "Linuxsat-Panel by Lululla (Linuxsat) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/linuxsat-panel/linuxsat-panel.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/linuxsat-panel/linuxsat-panel.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "mawaqit",
        "name": "Mawaqit (بلوجن مواقيت)",
        "developer": "ElieSat (إيلي سات)",
        "category": "plugins_hub",
        "version": "2.1.0",
        "size": "2.3 MB",
        "description": "Mawaqit (بلوجن مواقيت) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/mawaqit/mawaqit.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/mawaqit/mawaqit.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "channels-mohamed-os",
        "name": "MOHAMED_OS Settings (Nilesat + Motor)",
        "developer": "MOHAMED_OS",
        "category": "channels",
        "version": "Latest",
        "size": "1.2 MB",
        "description": "MOHAMED_OS Settings (Nilesat + Motor) by MOHAMED_OS — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/settings/-/raw/main/mohamed-os/mohamed-os-motor.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/settings/-/raw/main/mohamed-os/mohamed-os-motor.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "mohamed-os-feed",
        "name": "MOHAMED_OS Universal Feed",
        "developer": "MOHAMED_OS",
        "category": "picons_feeds",
        "version": "Latest",
        "size": "120 KB",
        "description": "MOHAMED_OS Universal Feed by MOHAMED_OS — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/scripts/-/raw/main/feed/eliesat-feed.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/scripts/-/raw/main/feed/eliesat-feed.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "mohammed-skin",
        "name": "MohammedSkin FHD",
        "developer": "mido00020 (MohammedSkin)",
        "category": "skins",
        "version": "2.1.136",
        "size": "6.8 MB",
        "description": "MohammedSkin FHD by mido00020 (MohammedSkin) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/mido00020/MohammedSkin/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/mido00020/MohammedSkin/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "bootlogo-moon",
        "name": "Moon & Space 4K Bootlogos",
        "developer": "ElieSat (إيلي سات)",
        "category": "bootlogos",
        "version": "1.0",
        "size": "3.6 MB",
        "description": "Moon & Space 4K Bootlogos by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/display/-/raw/main/moon/bootlogos-moon.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/display/-/raw/main/moon/bootlogos-moon.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "channels-morph883",
        "name": "Morpheus883 Settings (Pro Motor)",
        "developer": "Morpheus883 & Vhannibal",
        "category": "channels",
        "version": "Latest",
        "size": "1.3 MB",
        "description": "Morpheus883 Settings (Pro Motor) by Morpheus883 & Vhannibal — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/settings/-/raw/main/morpheus883/morpheus883-motor.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/settings/-/raw/main/morpheus883/morpheus883-motor.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "weather-msn",
        "name": "MSN Weather",
        "developer": "ElieSat (إيلي سات)",
        "category": "plugins_hub",
        "version": "1.3-r3",
        "size": "640 KB",
        "description": "MSN Weather by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/weathermsn/weathermsn.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/weathermsn/weathermsn.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "multiboot-flashonline",
        "name": "MultiBoot FlashOnline",
        "developer": "ElieSat (إيلي سات)",
        "category": "multiboot",
        "version": "7.1",
        "size": "1.4 MB",
        "description": "MultiBoot FlashOnline by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/multiboot-flashonline/multiboot-flashonline.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/multiboot-flashonline/multiboot-flashonline.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "multicam-adder",
        "name": "MultiCamAdder (CCcam / OSCam / NCam)",
        "developer": "ElieSat (إيلي سات)",
        "category": "softcams",
        "version": "1.0",
        "size": "620 KB",
        "description": "MultiCamAdder (CCcam / OSCam / NCam) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/emilnabil/download-plugins/refs/heads/main/MultiCamAdder/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/emilnabil/download-plugins/refs/heads/main/MultiCamAdder/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "multistalker-pro",
        "name": "MultiStalker Pro",
        "developer": "ziko",
        "category": "iptv",
        "version": "Latest",
        "size": "1.9 MB",
        "description": "MultiStalker Pro by ziko — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/multistalker-pro/multistalkerpro.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/multistalker-pro/multistalkerpro.sh -O - | /bin/sh",
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
        "id": "bootlogo-nature",
        "name": "Nature 4K UHD Bootlogos",
        "developer": "ElieSat (إيلي سات)",
        "category": "bootlogos",
        "version": "1.0",
        "size": "4.1 MB",
        "description": "Nature 4K UHD Bootlogos by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/display/-/raw/main/nature/bootlogos-nature.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/display/-/raw/main/nature/bootlogos-nature.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "ncam-fairbird",
        "name": "NCam Fairbird (Raed Edition)",
        "developer": "fairbird (رائد)",
        "category": "softcams",
        "version": "15.7-r0",
        "size": "2.0 MB",
        "description": "NCam Fairbird (Raed Edition) by fairbird (رائد) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/softcams/-/raw/main/raed/ncam.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/softcams/-/raw/main/raed/ncam.sh -O - | /bin/sh",
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
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/softcams/-/raw/main/mohamed-os/ncam.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/softcams/-/raw/main/mohamed-os/ncam.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "ncam-icam",
        "name": "NCam-ICam Universal",
        "developer": "MOHAMED_OS",
        "category": "softcams",
        "version": "15.2-r0",
        "size": "2.1 MB",
        "description": "NCam-ICam Universal by MOHAMED_OS — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/softcams/-/raw/main/mohamed-os/ncam.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/softcams/-/raw/main/mohamed-os/ncam.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "neoboot",
        "name": "NeoBoot (MultiBoot)",
        "developer": "ElieSat (إيلي سات)",
        "category": "multiboot",
        "version": "9.65",
        "size": "3.2 MB",
        "description": "NeoBoot (MultiBoot) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/neoboot/neoboot-9.65.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/neoboot/neoboot-9.65.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "neoboot-duo4k",
        "name": "NeoBoot (Vu+ Duo 4K / 4K SE Edition)",
        "developer": "ElieSat (إيلي سات)",
        "category": "multiboot",
        "version": "9.65-duo4k",
        "size": "3.3 MB",
        "description": "NeoBoot (Vu+ Duo 4K / 4K SE Edition) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/neoboot/neoboot-duo4k.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/neoboot/neoboot-duo4k.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "nitroadvance-fhd",
        "name": "NitroAdvance FHD",
        "developer": "fairbird (رائد)",
        "category": "skins",
        "version": "Latest",
        "size": "7.4 MB",
        "description": "NitroAdvance FHD by fairbird (رائد) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/skins/-/raw/main/all/nitro/nitro-fhd.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/skins/-/raw/main/all/nitro/nitro-fhd.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "channels-novaler-motor",
        "name": "Novaler Motor Settings (All Satellites)",
        "developer": "ElieSat (إيلي سات)",
        "category": "channels",
        "version": "Latest",
        "size": "1.1 MB",
        "description": "Novaler Motor Settings (All Satellites) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/settings/-/raw/main/novaler-motor/novaler-motor.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/settings/-/raw/main/novaler-motor/novaler-motor.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "oaweather",
        "name": "OAWeather (Weather Plugin)",
        "developer": "ElieSat (إيلي سات)",
        "category": "plugins_hub",
        "version": "4.0",
        "size": "920 KB",
        "description": "OAWeather (Weather Plugin) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/oaweather/oaweather.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/oaweather/oaweather.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "odreamy-fhd",
        "name": "oDreamy-FHD Skin",
        "developer": "fairbird (رائد)",
        "category": "skins",
        "version": "Latest",
        "size": "7.1 MB",
        "description": "oDreamy-FHD Skin by fairbird (رائد) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/skins/-/raw/main/all/odreamy/odreamy.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/skins/-/raw/main/all/odreamy/odreamy.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "image-openatv",
        "name": "OpenATV Image (8.0 / 8.1 Live — 336+ Boxes)",
        "developer": "ElieSat (إيلي سات)",
        "category": "images",
        "version": "8.0",
        "size": "Auto-Box",
        "description": "OpenATV Image (8.0 / 8.1 Live — 336+ Boxes) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "BOX=$(cat /proc/stb/info/boxtype 2>/dev/null || cat /proc/stb/info/model 2>/dev/null || hostname); DIR=/media/hdd/images; [ -d /media/hdd ] || DIR=/media/usb/images; [ -d /media/usb ] || [ -d /media/hdd ] || DIR=/tmp/images; mkdir -p $DIR; echo \"[mizou1984] OpenATV Image Fetcher | Box: $BOX | Save: $DIR\"; FILE=$(wget -qO- --no-check-certificate https://images.mynonpublic.com/openatv/7.5.1/index.php?open=$BOX | grep -oE \"openatv-7\\.5\\.1-[0-9A-Za-z._-]+\\.zip\" | head -n 1); if [ -n \"$FILE\" ]; then echo \"[mizou1984] Downloading $FILE ...\"; wget --no-check-certificate -O \"$DIR/$FILE\" \"https://images.mynonpublic.com/openatv/7.5.1/$BOX/$FILE\" && echo \"[mizou1984] Saved to $DIR/$FILE — Flash via Menu > Setup > Software Management > Flash Online!\"; else echo \"[mizou1984] Box $BOX: Visit https://images.mynonpublic.com/openatv/7.5.1/index.php?open=$BOX\"; fi",
        "cmd_dpkg": "echo \"[mizou1984] OpenATV Official Portal: https://images.mynonpublic.com/openatv/7.5.1/\"",
        "restart": False,
    },
    {
        "id": "image-openbh",
        "name": "OpenBH Image (6.0 Live — All Boxes)",
        "developer": "ElieSat (إيلي سات)",
        "category": "images",
        "version": "6.0",
        "size": "Auto-Box",
        "description": "OpenBH Image (6.0 Live — All Boxes) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "BOX=$(cat /proc/stb/info/boxtype 2>/dev/null || cat /proc/stb/info/model 2>/dev/null || hostname); DIR=/media/hdd/images; [ -d /media/hdd ] || DIR=/media/usb/images; [ -d /media/usb ] || [ -d /media/hdd ] || DIR=/tmp/images; mkdir -p $DIR; echo \"[mizou1984] OpenBH Image Fetcher | Box: $BOX | Save: $DIR\"; FILE=$(wget -qO- --no-check-certificate https://images.openbh.net/index.php?open=$BOX | grep -oE \"openbh-[0-9A-Za-z._-]+\\.zip\" | head -n 1); if [ -n \"$FILE\" ]; then echo \"[mizou1984] Downloading $FILE ...\"; wget --no-check-certificate -O \"$DIR/$FILE\" \"https://images.openbh.net/$BOX/$FILE\" && echo \"[mizou1984] Saved to $DIR/$FILE — Flash via Image Manager / Flash Online!\"; else echo \"[mizou1984] Box $BOX: Visit https://images.openbh.net or install Image Downloader plugin from this menu.\"; fi",
        "cmd_dpkg": "echo \"[mizou1984] OpenBH Official Portal: https://images.openbh.net\"",
        "restart": False,
    },
    {
        "id": "image-opendroid",
        "name": "OpenDroid Image (8.1.2 Live — All Boxes)",
        "developer": "ElieSat (إيلي سات)",
        "category": "images",
        "version": "8.1.2",
        "size": "Auto-Box",
        "description": "OpenDroid Image (8.1.2 Live — All Boxes) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "BOX=$(cat /proc/stb/info/boxtype 2>/dev/null || cat /proc/stb/info/model 2>/dev/null || hostname); echo \"[mizou1984] OpenDroid 7.5 | Box: $BOX | Official Portal: https://opendroid.org\"; echo \"Install Image Downloader plugin above for direct TV flashing.\"",
        "cmd_dpkg": "echo \"[mizou1984] OpenDroid Official Portal: https://opendroid.org\"",
        "restart": False,
    },
    {
        "id": "image-openhdf",
        "name": "OpenHDF Image (7.5 Live — 74+ Boxes)",
        "developer": "ElieSat (إيلي سات)",
        "category": "images",
        "version": "7.5",
        "size": "Auto-Box",
        "description": "OpenHDF Image (7.5 Live — 74+ Boxes) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "BOX=$(cat /proc/stb/info/boxtype 2>/dev/null || cat /proc/stb/info/model 2>/dev/null || hostname); DIR=/media/hdd/images; [ -d /media/hdd ] || DIR=/media/usb/images; [ -d /media/usb ] || [ -d /media/hdd ] || DIR=/tmp/images; mkdir -p $DIR; echo \"[mizou1984] OpenHDF Fetcher | Box: $BOX | Save: $DIR\"; FILE=$(wget -qO- --no-check-certificate https://v73.hdfreaks.cc/$BOX/ | grep -oE \"openhdf-[0-9A-Za-z._-]+\\.zip\" | tail -n 1); if [ -n \"$FILE\" ]; then echo \"[mizou1984] Downloading $FILE ...\"; wget --no-check-certificate -O \"$DIR/$FILE\" \"https://v73.hdfreaks.cc/$BOX/$FILE\" && echo \"[mizou1984] Saved to $DIR/$FILE!\"; else echo \"[mizou1984] Box $BOX: Visit https://v73.hdfreaks.cc/$BOX/\"; fi",
        "cmd_dpkg": "echo \"[mizou1984] OpenHDF Official Portal: https://v73.hdfreaks.cc/\"",
        "restart": False,
    },
    {
        "id": "openmultiboot",
        "name": "OpenMultiboot",
        "developer": "ElieSat (إيلي سات)",
        "category": "multiboot",
        "version": "2.6",
        "size": "1.2 MB",
        "description": "OpenMultiboot by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/openmultiboot/openmultiboot-2.6.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/openmultiboot/openmultiboot-2.6.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "image-openpli",
        "name": "OpenPLi Image (9.2 Live — All Boxes)",
        "developer": "ElieSat (إيلي سات)",
        "category": "images",
        "version": "9.2",
        "size": "Auto-Box",
        "description": "OpenPLi Image (9.2 Live — All Boxes) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "BOX=$(cat /proc/stb/info/boxtype 2>/dev/null || cat /proc/stb/info/model 2>/dev/null || hostname); DIR=/media/hdd/images; [ -d /media/hdd ] || DIR=/media/usb/images; [ -d /media/usb ] || [ -d /media/hdd ] || DIR=/tmp/images; mkdir -p $DIR; echo \"[mizou1984] OpenPLi Image Fetcher | Box: $BOX | Save: $DIR\"; FILE=$(wget -qO- --no-check-certificate https://downloads.openpli.org/builds/$BOX/ | grep -oE \"openpli-[0-9A-Za-z._-]+\\.zip\" | head -n 1); if [ -n \"$FILE\" ]; then echo \"[mizou1984] Downloading $FILE ...\"; wget --no-check-certificate -O \"$DIR/$FILE\" \"https://downloads.openpli.org/builds/$BOX/$FILE\" && echo \"[mizou1984] Saved to $DIR/$FILE — Flash via Image Manager / ofgwrite!\"; else echo \"[mizou1984] Box $BOX: Visit https://openpli.org/download or use Image Downloader plugin in this menu.\"; fi",
        "cmd_dpkg": "echo \"[mizou1984] OpenPLi Official Portal: https://openpli.org/download\"",
        "restart": False,
    },
    {
        "id": "image-openspa",
        "name": "OpenSPA Image (Live — All Boxes)",
        "developer": "ElieSat (إيلي سات)",
        "category": "images",
        "version": "8.5",
        "size": "Auto-Box",
        "description": "OpenSPA Image (Live — All Boxes) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "BOX=$(cat /proc/stb/info/boxtype 2>/dev/null || cat /proc/stb/info/model 2>/dev/null || hostname); DIR=/media/hdd/images; [ -d /media/hdd ] || DIR=/media/usb/images; [ -d /media/usb ] || [ -d /media/hdd ] || DIR=/tmp/images; mkdir -p $DIR; echo \"[mizou1984] OpenSPA 8.4 | Box: $BOX | Portal: https://openspa.webhop.info\"; echo \"Install Image Downloader plugin above to flash OpenSPA directly online.\"",
        "cmd_dpkg": "echo \"[mizou1984] OpenSPA Official Portal: https://openspa.webhop.info\"",
        "restart": False,
    },
    {
        "id": "image-openvix",
        "name": "OpenViX Image (6.9 Live — 71+ Boxes)",
        "developer": "ElieSat (إيلي سات)",
        "category": "images",
        "version": "6.9.007",
        "size": "Auto-Box",
        "description": "OpenViX Image (6.9 Live — 71+ Boxes) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "BOX=$(cat /proc/stb/info/boxtype 2>/dev/null || cat /proc/stb/info/model 2>/dev/null || hostname); echo \"[mizou1984] OpenViX 6.7 | Box: $BOX | Official Downloads: https://www.openvix.co.uk/index.php/downloads/\"; echo \"Install Image Downloader plugin in this menu for one-click online flashing.\"",
        "cmd_dpkg": "echo \"[mizou1984] OpenViX Official Portal: https://www.openvix.co.uk/index.php/downloads/\"",
        "restart": False,
    },
    {
        "id": "oscam-samur",
        "name": "OSCam Samur Edition",
        "developer": "Levi45",
        "category": "softcams",
        "version": "11838-r802",
        "size": "2.1 MB",
        "description": "OSCam Samur Edition by Levi45 — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/softcams/-/raw/main/samur/oscam.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/softcams/-/raw/main/samur/oscam.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "oscam-status",
        "name": "OSCam Status Viewer",
        "developer": "ElieSat (إيلي سات)",
        "category": "softcams",
        "version": "7.0",
        "size": "580 KB",
        "description": "OSCam Status Viewer by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/oscam-status/oscam-status.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/oscam-status/oscam-status.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "oscam-emu-mohamed",
        "name": "OSCam-Emu Universal",
        "developer": "MOHAMED_OS",
        "category": "softcams",
        "version": "11950-r802",
        "size": "2.1 MB",
        "description": "OSCam-Emu Universal by MOHAMED_OS — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/softcams/-/raw/main/mohamed-os/oscam.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/softcams/-/raw/main/mohamed-os/oscam.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "oscam-icam",
        "name": "OSCam-ICam (Sky DE/IT/UK)",
        "developer": "MOHAMED_OS",
        "category": "softcams",
        "version": "v20-icam",
        "size": "2.2 MB",
        "description": "OSCam-ICam (Sky DE/IT/UK) by MOHAMED_OS — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/softcams/-/raw/main/kite888/oscamicamall-kite888.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/softcams/-/raw/main/kite888/oscamicamall-kite888.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "oscam-smod",
        "name": "OSCam-Smod Universal",
        "developer": "MOHAMED_OS",
        "category": "softcams",
        "version": "11945-r802",
        "size": "1.9 MB",
        "description": "OSCam-Smod Universal by MOHAMED_OS — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/softcams/-/raw/main/audi06_19/oscam.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/softcams/-/raw/main/audi06_19/oscam.sh -O - | /bin/sh",
        "restart": False,
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
        "id": "picon-updater",
        "name": "Picon Updater",
        "developer": "ElieSat (إيلي سات)",
        "category": "picons_feeds",
        "version": "1.9.0",
        "size": "1.1 MB",
        "description": "Picon Updater by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "opkg install enigma2-plugin-extensions-piconsupdater || wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/piconinstaller/piconinstaller.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/piconinstaller/piconinstaller.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "powercam",
        "name": "PowerCam Universal (الباور كام)",
        "developer": "MOHAMED_OS",
        "category": "softcams",
        "version": "3.0-11950",
        "size": "2.0 MB",
        "description": "PowerCam Universal (الباور كام) by MOHAMED_OS — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/softcams/-/raw/main/mohamed-os/powercam.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/softcams/-/raw/main/mohamed-os/powercam.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "image-pure2",
        "name": "PurE2 Image (7.6 Live — All Boxes)",
        "developer": "ElieSat (إيلي سات)",
        "category": "images",
        "version": "7.6",
        "size": "Auto-Box",
        "description": "PurE2 Image (7.6 Live — All Boxes) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "BOX=$(cat /proc/stb/info/boxtype 2>/dev/null || cat /proc/stb/info/model 2>/dev/null || hostname); echo \"[mizou1984] PurE2 7.4 | Box: $BOX | Official Portal: https://www.pur-e2.club/OU/images/7.4/\"; echo \"Tip: Use Image Downloader plugin above to flash PurE2 directly from TV.\"",
        "cmd_dpkg": "echo \"[mizou1984] PurE2 Official Portal: https://www.pur-e2.club/OU/images/7.4/\"",
        "restart": False,
    },
    {
        "id": "quran-karim",
        "name": "Quran Karim (القرآن الكريم)",
        "developer": "fairbird (رائد)",
        "category": "plugins_hub",
        "version": "2.2",
        "size": "2.2 MB",
        "description": "Quran Karim (القرآن الكريم) by fairbird (رائد) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/quran-karim/quran-karim.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/quran-karim/quran-karim.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "quran-mizouh",
        "name": "Quran Reader - mizouh (قارئ القرآن)",
        "developer": "mizouh (قارئ القرآن المتميز)",
        "category": "plugins_hub",
        "version": "3.3.0",
        "size": "2.1 MB",
        "description": "Quran Reader - mizouh (قارئ القرآن) by mizouh (قارئ القرآن المتميز) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/mizouh1984/quran_mizouh/main/install_quran_mizouh_allinone.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/mizouh1984/quran_mizouh/main/install_quran_mizouh_allinone.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "raed-black-picon",
        "name": "Raed Black Picon (Read Black Picon)",
        "developer": "fairbird (رائد)",
        "category": "picons_feeds",
        "version": "2026.11",
        "size": "14.5 MB",
        "description": "Raed Black Picon (Read Black Picon) by fairbird (رائد) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/RaedQuickSignal/main/picons/installerBlackPicons.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/RaedQuickSignal/main/picons/installerBlackPicons.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "raed-white-picon",
        "name": "Raed White Picon (Read White Picon)",
        "developer": "fairbird (رائد)",
        "category": "picons_feeds",
        "version": "2026.11",
        "size": "14.2 MB",
        "description": "Raed White Picon (Read White Picon) by fairbird (رائد) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/RaedQuickSignal/main/picons/installerWhitePicons.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/RaedQuickSignal/main/picons/installerWhitePicons.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "raedquicksignal",
        "name": "RaedQuickSignal",
        "developer": "fairbird (رائد)",
        "category": "system_tools",
        "version": "19.0",
        "size": "1.9 MB",
        "description": "RaedQuickSignal by fairbird (رائد) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/RaedQuickSignal/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/fairbird/RaedQuickSignal/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "bootlogo-ramadan",
        "name": "Ramadan & Islamic Bootlogos",
        "developer": "ElieSat (إيلي سات)",
        "category": "bootlogos",
        "version": "1.0",
        "size": "3.7 MB",
        "description": "Ramadan & Islamic Bootlogos by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/display/-/raw/main/ramadan/bootlogos-ramadan.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/display/-/raw/main/ramadan/bootlogos-ramadan.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "revcam",
        "name": "RevCam V2 Universal (الراف كام)",
        "developer": "MOHAMED_OS",
        "category": "softcams",
        "version": "11950-sup",
        "size": "1.7 MB",
        "description": "RevCam V2 Universal (الراف كام) by MOHAMED_OS — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/softcams/-/raw/main/mohamed-os/supcam-oscam.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/softcams/-/raw/main/mohamed-os/supcam-oscam.sh -O - | /bin/sh",
        "restart": False,
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
        "id": "satvenus-panel",
        "name": "SatVenus Panel",
        "developer": "TunisiaSat & SatVenus Team",
        "category": "panels",
        "version": "7.3.3",
        "size": "1.9 MB",
        "description": "SatVenus Panel by TunisiaSat & SatVenus Team — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/satvenuspanel/satvenuspanel.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/satvenuspanel/satvenuspanel.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "screen-grab",
        "name": "Screen Grab (CiefpScreenGrab)",
        "developer": "Ciefp (CIFP)",
        "category": "plugins_hub",
        "version": "1.5",
        "size": "780 KB",
        "description": "Screen Grab (CiefpScreenGrab) by Ciefp (CIFP) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/ciefp/CiefpScreenGrab/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/ciefp/CiefpScreenGrab/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "screen-grabber",
        "name": "ScreenGrabber",
        "developer": "ElieSat (إيلي سات)",
        "category": "plugins_hub",
        "version": "3.2",
        "size": "640 KB",
        "description": "ScreenGrabber by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/screengrabber/screengrabber.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/screengrabber/screengrabber.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "server-eaglesat",
        "name": "Server EagleSat (Free Servers)",
        "developer": "ElieSat (إيلي سات)",
        "category": "softcams",
        "version": "1.1",
        "size": "740 KB",
        "description": "Server EagleSat (Free Servers) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/servereaglesat/servereaglesat.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/servereaglesat/servereaglesat.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "server-coloring",
        "name": "ServerColoring (Yassin7 / Fury)",
        "developer": "Yassin7 & Fury (ServerColoring)",
        "category": "plugins_hub",
        "version": "Latest",
        "size": "520 KB",
        "description": "ServerColoring (Yassin7 / Fury) by Yassin7 & Fury (ServerColoring) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/islam-2412/ServerColoring/main/fury/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/islam-2412/ServerColoring/main/fury/installer.sh -O - | /bin/sh",
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
        "id": "shoot-your-screen",
        "name": "ShootYourScreen",
        "developer": "ElieSat (إيلي سات)",
        "category": "plugins_hub",
        "version": "0.3",
        "size": "420 KB",
        "description": "ShootYourScreen by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/shootyourscreen/shootyourscreen.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/shootyourscreen/shootyourscreen.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "simple-zoom-panel",
        "name": "Simple Zoom Panel (Free Servers)",
        "developer": "ElieSat (إيلي سات)",
        "category": "softcams",
        "version": "2.3.2",
        "size": "1.3 MB",
        "description": "Simple Zoom Panel (Free Servers) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/simple-zoom-panel/simple-zoom-panel.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/simple-zoom-panel/simple-zoom-panel.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "skyblue-subtitle-e2",
        "name": "Sky Blue Subtitle E2 (Hybrid AI & Online Subtitles)",
        "developer": "Madhouse & DreamSat",
        "category": "epg_subtitles",
        "version": "1.0",
        "size": "1.6 MB",
        "description": "Sky Blue Subtitle E2 (Hybrid AI & Online Subtitles) by Madhouse & DreamSat — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/aisubtitle-hybrid/aisubtitle-hybrid.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/aisubtitle-hybrid/aisubtitle-hybrid.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "skyblue-boxtools",
        "name": "SkyBlue — BoxTools & System Optimizer",
        "developer": "Madhouse & DreamSat",
        "category": "plugins_hub",
        "version": "Latest",
        "size": "850 KB",
        "description": "SkyBlue — BoxTools & System Optimizer by Madhouse & DreamSat — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/boxtools/boxtools.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/boxtools/boxtools.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "skyblue-smartaddons",
        "name": "SkyBlue — SmartAddons & Plugins Hub",
        "developer": "Madhouse & DreamSat",
        "category": "plugins_hub",
        "version": "Latest",
        "size": "1.2 MB",
        "description": "SkyBlue — SmartAddons & Plugins Hub by Madhouse & DreamSat — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/smartaddonspanel/smartaddonspanel.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/smartaddonspanel/smartaddonspanel.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "skyblue-tvaddon",
        "name": "SkyBlue — TVAddon & Stream Suite",
        "developer": "Madhouse & DreamSat",
        "category": "plugins_hub",
        "version": "Latest",
        "size": "1.5 MB",
        "description": "SkyBlue — TVAddon & Stream Suite by Madhouse & DreamSat — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/tvaddon/tvaddon.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/tvaddon/tvaddon.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "skyblue-tvmanager",
        "name": "SkyBlue — TVManager & Softcam Control",
        "developer": "Madhouse & DreamSat",
        "category": "plugins_hub",
        "version": "Latest",
        "size": "980 KB",
        "description": "SkyBlue — TVManager & Softcam Control by Madhouse & DreamSat — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/tvmanager/tvmanager.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/tvmanager/tvmanager.sh -O - | /bin/sh",
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
        "id": "skyblue-player",
        "name": "SkyBlue Player (IPTV & VOD Media Player)",
        "developer": "Madhouse & DreamSat",
        "category": "iptv",
        "version": "2.5",
        "size": "1.4 MB",
        "description": "SkyBlue Player (IPTV & VOD Media Player) by Madhouse & DreamSat — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/zouplayer/zouplayer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/zouplayer/zouplayer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "slyk-1080-r19",
        "name": "Slyk 1080 R19",
        "developer": "KiddaC",
        "category": "skins",
        "version": "Latest",
        "size": "4.1 MB",
        "description": "Slyk 1080 R19 by KiddaC — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/skins/-/raw/main/all/slyk-q-1080/slyk-q-1080.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/skins/-/raw/main/all/slyk-q-1080/slyk-q-1080.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "slyk-onyx-1080",
        "name": "Slyk Onyx 1080",
        "developer": "KiddaC",
        "category": "skins",
        "version": "Latest",
        "size": "4.8 MB",
        "description": "Slyk Onyx 1080 by KiddaC — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://github.com/kiddac/Slyk_Onyx_1080/archive/refs/heads/master.tar.gz -O /tmp/slyk_onyx.tar.gz && tar -xzf /tmp/slyk_onyx.tar.gz -C /tmp && cp -rf /tmp/Slyk_Onyx_1080-master/Slyk_Onyx_1080/usr/* /usr/ && rm -rf /tmp/slyk_onyx.tar.gz /tmp/Slyk_Onyx_1080-master",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://github.com/kiddac/Slyk_Onyx_1080/archive/refs/heads/master.tar.gz -O /tmp/slyk_onyx.tar.gz && tar -xzf /tmp/slyk_onyx.tar.gz -C /tmp && cp -rf /tmp/Slyk_Onyx_1080-master/Slyk_Onyx_1080/usr/* /usr/ && rm -rf /tmp/slyk_onyx.tar.gz /tmp/Slyk_Onyx_1080-master",
        "restart": True,
    },
    {
        "id": "slyk-q-1080",
        "name": "Slyk Q 1080 (SkyQ)",
        "developer": "KiddaC",
        "category": "skins",
        "version": "Latest",
        "size": "5.2 MB",
        "description": "Slyk Q 1080 (SkyQ) by KiddaC — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/skins/-/raw/main/all/slyk-q-1080/slyk-q-1080.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/skins/-/raw/main/all/slyk-q-1080/slyk-q-1080.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "bootlogo-smart",
        "name": "Smart Minimal 4K Bootlogos",
        "developer": "ElieSat (إيلي سات)",
        "category": "bootlogos",
        "version": "1.0",
        "size": "3.4 MB",
        "description": "Smart Minimal 4K Bootlogos by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/display/-/raw/main/smart/bootlogos-smart.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/display/-/raw/main/smart/bootlogos-smart.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "subssupport",
        "name": "Subssupport (MOHAMED_OS Mod)",
        "developer": "MOHAMED_OS",
        "category": "epg_subtitles",
        "version": "Latest",
        "size": "1.6 MB",
        "description": "Subssupport (MOHAMED_OS Mod) by MOHAMED_OS — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/subssupport/subssupport.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/subssupport/subssupport.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "subsupport-hub",
        "name": "SubSupport",
        "developer": "ElieSat (إيلي سات)",
        "category": "epg_subtitles",
        "version": "1.7.0",
        "size": "1.4 MB",
        "description": "SubSupport by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/subssupport/subssupport.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/subssupport/subssupport.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "subsupport-pro",
        "name": "SubSupport Pro",
        "developer": "Lululla (Linuxsat)",
        "category": "epg_subtitles",
        "version": "2.4.0",
        "size": "2.1 MB",
        "description": "SubSupport Pro by Lululla (Linuxsat) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/popking159/SubsSupportPro/main/myinstaller.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/popking159/SubsSupportPro/main/myinstaller.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "theweather",
        "name": "TheWeather",
        "developer": "ElieSat (إيلي سات)",
        "category": "plugins_hub",
        "version": "5.5",
        "size": "1.4 MB",
        "description": "TheWeather by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/theweather/theweather.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/theweather/theweather.sh -O - | /bin/sh",
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
        "id": "translate-ai",
        "name": "Translate AI",
        "developer": "ElieSat (إيلي سات)",
        "category": "epg_subtitles",
        "version": "2.6.0",
        "size": "1.5 MB",
        "description": "Translate AI by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/translateai/translateai.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/translateai/translateai.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "tunisiasat-panel",
        "name": "TunisiaSat Panel (TSpanel)",
        "developer": "TunisiaSat & SatVenus Team",
        "category": "panels",
        "version": "Latest",
        "size": "2.1 MB",
        "description": "TunisiaSat Panel (TSpanel) by TunisiaSat & SatVenus Team — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/pluginspanel/pluginspanel.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/pluginspanel/pluginspanel.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "ultracam",
        "name": "UltraCam Universal (الألترا كام)",
        "developer": "MOHAMED_OS",
        "category": "softcams",
        "version": "1.0-11950",
        "size": "1.8 MB",
        "description": "UltraCam Universal (الألترا كام) by MOHAMED_OS — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/softcams/-/raw/main/mohamed-os/ultracam.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/softcams/-/raw/main/mohamed-os/ultracam.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "vavoo-live",
        "name": "Vavoo Stream Live",
        "developer": "Lululla (Linuxsat)",
        "category": "iptv",
        "version": "1.91",
        "size": "820 KB",
        "description": "Vavoo Stream Live by Lululla (Linuxsat) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/Belfagor2005/vavoo/main/installer.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://raw.githubusercontent.com/Belfagor2005/vavoo/main/installer.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "channels-vhannibal-autosetting",
        "name": "Vhannibal Autosetting Plugin",
        "developer": "Morpheus883 & Vhannibal",
        "category": "channels",
        "version": "2.9",
        "size": "680 KB",
        "description": "Vhannibal Autosetting Plugin by Morpheus883 & Vhannibal — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/vhannibal-settings-motor/vhannibal-settings-motor.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/vhannibal-settings-motor/vhannibal-settings-motor.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "channels-vhannibal-motor",
        "name": "Vhannibal Settings (Italian Motor & Dual)",
        "developer": "Morpheus883 & Vhannibal",
        "category": "channels",
        "version": "Latest",
        "size": "1.4 MB",
        "description": "Vhannibal Settings (Italian Motor & Dual) by Morpheus883 & Vhannibal — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/settings/-/raw/main/vhannibal/vhannibal-motor.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/settings/-/raw/main/vhannibal/vhannibal-motor.sh -O - | /bin/sh",
        "restart": False,
    },
    {
        "id": "visualweather",
        "name": "VisualWeather",
        "developer": "ElieSat (إيلي سات)",
        "category": "plugins_hub",
        "version": "1.12",
        "size": "1.3 MB",
        "description": "VisualWeather by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/visualweather/visualweather.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/visualweather/visualweather.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "image-vti",
        "name": "VTi Image (Vu+ Team 15.0.02 Official)",
        "developer": "fairbird (رائد)",
        "category": "images",
        "version": "15.0.02",
        "size": "Vu+ Official",
        "description": "VTi Image (Vu+ Team 15.0.02 Official) by fairbird (رائد) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "BOX=$(cat /proc/stb/info/boxtype 2>/dev/null || cat /proc/stb/info/model 2>/dev/null || hostname); echo \"[mizou1984] VTi 15.0.02 (Vu+ Exclusive) | Box: $BOX\"; echo \"Official Portal: https://www.vuplus-support.org/wbb4/vtisoftware/\"",
        "cmd_dpkg": "echo \"[mizou1984] VTi Official Portal: https://www.vuplus-support.org/wbb4/vtisoftware/\"",
        "restart": False,
    },
    {
        "id": "weatherplugin",
        "name": "WeatherPlugin (Classic)",
        "developer": "ElieSat (إيلي سات)",
        "category": "plugins_hub",
        "version": "2.4",
        "size": "480 KB",
        "description": "WeatherPlugin (Classic) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/weatherplugin/weatherplugin.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/weatherplugin/weatherplugin.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "wireguard-vpn",
        "name": "WireGuard VPN",
        "developer": "Madhouse & DreamSat",
        "category": "system_tools",
        "version": "Latest",
        "size": "1.3 MB",
        "description": "WireGuard VPN by Madhouse & DreamSat — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/wireguard-vpn/wireguard-vpn.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/wireguard-vpn/wireguard-vpn.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "xcplugin-iptv",
        "name": "XCplugin IPTV (XCPlugin Forever)",
        "developer": "Lululla (Linuxsat)",
        "category": "iptv",
        "version": "5.2",
        "size": "2.1 MB",
        "description": "XCplugin IPTV (XCPlugin Forever) by Lululla (Linuxsat) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/xcplugin-forever/xcplugin-forever.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/xcplugin-forever/xcplugin-forever.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "xklass",
        "name": "XKlass",
        "developer": "KiddaC",
        "category": "iptv",
        "version": "Latest",
        "size": "2.9 MB",
        "description": "XKlass by KiddaC — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/xklass/xklass.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/xklass/xklass.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "xstreamity",
        "name": "XStreamity",
        "developer": "KiddaC",
        "category": "iptv",
        "version": "Latest",
        "size": "3.2 MB",
        "description": "XStreamity by KiddaC — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/xstreamity/xstreamity.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/xstreamity/xstreamity.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "xtraevent-mnasr",
        "name": "XtraEvent Mod (by M.Nasr)",
        "developer": "Lululla (Linuxsat)",
        "category": "plugins_hub",
        "version": "Mod Latest",
        "size": "1.9 MB",
        "description": "XtraEvent Mod (by M.Nasr) by Lululla (Linuxsat) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://github.com/popking159/xtraeventplugin/raw/main/xtraevent-install.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://github.com/popking159/xtraeventplugin/raw/main/xtraevent-install.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "xtraevent",
        "name": "XtraEvent v4.2 (Classic Py2/Py3)",
        "developer": "ElieSat (إيلي سات)",
        "category": "plugins_hub",
        "version": "4.2",
        "size": "1.5 MB",
        "description": "XtraEvent v4.2 (Classic Py2/Py3) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/xtraevent/xtraevent-4.2.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/xtraevent/xtraevent-4.2.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "xtraevent-4-6",
        "name": "XtraEvent v4.6 (Py2/Py3)",
        "developer": "ElieSat (إيلي سات)",
        "category": "plugins_hub",
        "version": "4.6",
        "size": "1.3 MB",
        "description": "XtraEvent v4.6 (Py2/Py3) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://github.com/emil237/download-plugins/raw/main/Xtraevent-v4.6.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://github.com/emil237/download-plugins/raw/main/Xtraevent-v4.6.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "xtraevent-5-3",
        "name": "XtraEvent v5.3 (Light Edition)",
        "developer": "ElieSat (إيلي سات)",
        "category": "plugins_hub",
        "version": "5.3",
        "size": "1.4 MB",
        "description": "XtraEvent v5.3 (Light Edition) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/xtraevent/xtraevent-5.3.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/xtraevent/xtraevent-5.3.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "xtraevent-6-6",
        "name": "XtraEvent v6.6 (Stable)",
        "developer": "ElieSat (إيلي سات)",
        "category": "plugins_hub",
        "version": "6.6",
        "size": "1.6 MB",
        "description": "XtraEvent v6.6 (Stable) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/xtraevent/xtraevent-6.6.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/xtraevent/xtraevent-6.6.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "xtraevent-6-7",
        "name": "XtraEvent v6.7 (ElieSat Edition)",
        "developer": "ElieSat (إيلي سات)",
        "category": "plugins_hub",
        "version": "6.7",
        "size": "1.7 MB",
        "description": "XtraEvent v6.7 (ElieSat Edition) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/xtraevent/xtraevent-6.7.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/xtraevent/xtraevent-6.7.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "xtraevent-6-840",
        "name": "XtraEvent v6.840 (Python 3 Mod)",
        "developer": "ElieSat (إيلي سات)",
        "category": "plugins_hub",
        "version": "6.840",
        "size": "1.8 MB",
        "description": "XtraEvent v6.840 (Python 3 Mod) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://github.com/emilnabil/download-plugins/raw/refs/heads/main/xtraevent/xtraevent-6.840.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://github.com/emilnabil/download-plugins/raw/refs/heads/main/xtraevent/xtraevent-6.840.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "xtraevent-6-890",
        "name": "XtraEvent v6.890 (All-Python Latest)",
        "developer": "ElieSat (إيلي سات)",
        "category": "plugins_hub",
        "version": "6.890",
        "size": "1.9 MB",
        "description": "XtraEvent v6.890 (All-Python Latest) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://github.com/emilnabil/download-plugins/raw/refs/heads/main/xtraevent-6.890.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://github.com/emilnabil/download-plugins/raw/refs/heads/main/xtraevent-6.890.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "youchie-pli-fhd",
        "name": "Youchie-PLI-FHD Skin",
        "developer": "Madhouse & DreamSat",
        "category": "skins",
        "version": "Latest",
        "size": "6.2 MB",
        "description": "Youchie-PLI-FHD Skin by Madhouse & DreamSat — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/skins/-/raw/main/all/youchie-pli-fhd/youchie-pli-fhd.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/skins/-/raw/main/all/youchie-pli-fhd/youchie-pli-fhd.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "youtube-e2",
        "name": "YouTube-E2 (Taapat Mod)",
        "developer": "fairbird (رائد)",
        "category": "sports_media",
        "version": "Latest",
        "size": "680 KB",
        "description": "YouTube-E2 (Taapat Mod) by fairbird (رائد) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/youtube/youtube.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/youtube/youtube.sh -O - | /bin/sh",
        "restart": True,
    },
    {
        "id": "zoom-freeserver",
        "name": "Zoom FreeServer (CFG Zoom Final)",
        "developer": "ElieSat (إيلي سات)",
        "category": "softcams",
        "version": "1.1.2",
        "size": "1.4 MB",
        "description": "Zoom FreeServer (CFG Zoom Final) by ElieSat (إيلي سات) — Latest build pulled directly from official developer source with automatic updates.",
        "cmd_opkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/zoom/zoom.sh -O - | /bin/sh",
        "cmd_dpkg": "wget -q \"--no-check-certificate\" https://gitlab.com/eliesat/extensions/-/raw/main/zoom/zoom.sh -O - | /bin/sh",
        "restart": True,
    },
]


def to_e2_str(val):
    if sys.version_info[0] < 3:
        try:
            if isinstance(val, unicode):
                return val.encode("utf-8", "ignore")
        except Exception:
            pass
    return str(val)


def load_panel_settings():
    data = {
        "lang": DEFAULT_LANG,
        "theme": DEFAULT_THEME,
        "layout": DEFAULT_LAYOUT,
    }
    try:
        if os.path.exists(SETTINGS_FILE):
            with open(SETTINGS_FILE, "r") as f:
                raw = json.load(f)
            if isinstance(raw, dict):
                lang = to_e2_str(raw.get("lang", DEFAULT_LANG))
                theme = to_e2_str(raw.get("theme", DEFAULT_THEME))
                layout = to_e2_str(raw.get("layout", DEFAULT_LAYOUT))
                if lang in TRANSLATIONS:
                    data["lang"] = lang
                if theme in PANEL_THEMES:
                    data["theme"] = theme
                if layout in [x[0] for x in PANEL_LAYOUTS]:
                    data["layout"] = layout
    except Exception:
        pass
    return data


def save_panel_settings(lang, theme, layout):
    try:
        if not os.path.isdir(STATE_DIR):
            os.makedirs(STATE_DIR)
        payload = {"lang": lang, "theme": theme, "layout": layout}
        with open(SETTINGS_FILE, "w") as f:
            json.dump(payload, f)
    except Exception:
        pass


def tr_text(lang, key):
    pack = TRANSLATIONS.get(lang) or TRANSLATIONS["en"]
    return pack.get(key, TRANSLATIONS["en"].get(key, key))


def get_lang_name(lang_id):
    for lid, lname in PANEL_LANGUAGES:
        if lid == lang_id:
            return lname
    return "English"


def get_layout_name(layout_id):
    for lid, lname in PANEL_LAYOUTS:
        if lid == layout_id:
            return lname
    return "Classic Split"


def build_skin(theme_id, layout_id, desktop_width):
    t = PANEL_THEMES.get(theme_id, PANEL_THEMES["midnight_cyan"])
    bg = t["bg"]
    bar = t["bar"]
    panel = t["panel"]
    border = t["border"]
    accent = t["accent"]
    accent_l = t["accent_light"]
    txt = t["text"]
    muted = t["muted"]

    if desktop_width >= 1920:
        if layout_id == "mirror_split":
            body = """
            <eLabel position="60,152" size="630,788" backgroundColor="%(panel)s" zPosition="1" />
            <eLabel position="60,152" size="630,3" backgroundColor="%(accent)s" zPosition="2" />
            <eLabel position="60,938" size="630,2" backgroundColor="%(border)s" zPosition="2" />
            <widget name="detail_kicker" position="90,174" size="570,32" font="Regular;21" foregroundColor="%(accent_l)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            <widget name="detail_title" position="90,214" size="570,84" font="Regular;34" foregroundColor="%(txt)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            <eLabel position="90,308" size="570,1" backgroundColor="%(border)s" zPosition="2" />
            <widget name="detail_meta" position="90,326" size="570,110" font="Regular;23" foregroundColor="%(txt)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            <widget name="detail_desc" position="90,450" size="570,220" font="Regular;24" foregroundColor="%(muted)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            <eLabel position="90,695" size="570,1" backgroundColor="%(border)s" zPosition="2" />
            <widget name="detail_status" position="90,715" size="570,130" font="Regular;21" foregroundColor="%(accent_l)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            <widget name="detail_hint" position="90,868" size="570,50" font="Regular;20" foregroundColor="%(muted)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />

            <eLabel position="720,152" size="1140,788" backgroundColor="%(panel)s" zPosition="1" />
            <eLabel position="720,152" size="1140,2" backgroundColor="%(border)s" zPosition="2" />
            <eLabel position="720,938" size="1140,2" backgroundColor="%(border)s" zPosition="2" />
            <widget name="list_title" position="746,170" size="1088,42" font="Regular;26" foregroundColor="%(accent_l)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            <eLabel position="746,218" size="1088,1" backgroundColor="%(border)s" zPosition="2" />
            <widget name="list" position="738,232" size="1104,690" font="Regular;28" itemHeight="60" foregroundColor="%(txt)s" backgroundColor="%(panel)s" foregroundColorSelected="#ffffff" backgroundColorSelected="%(accent)s" scrollbarMode="showOnDemand" enableWrapAround="1" zPosition="3" />
            """
        elif layout_id == "cinema_wide":
            body = """
            <eLabel position="60,146" size="1800,520" backgroundColor="%(panel)s" zPosition="1" />
            <eLabel position="60,146" size="1800,3" backgroundColor="%(accent)s" zPosition="2" />
            <eLabel position="60,664" size="1800,2" backgroundColor="%(border)s" zPosition="2" />
            <widget name="list_title" position="86,162" size="1748,40" font="Regular;26" foregroundColor="%(accent_l)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            <eLabel position="86,208" size="1748,1" backgroundColor="%(border)s" zPosition="2" />
            <widget name="list" position="78,220" size="1764,432" font="Regular;28" itemHeight="54" foregroundColor="%(txt)s" backgroundColor="%(panel)s" foregroundColorSelected="#ffffff" backgroundColorSelected="%(accent)s" scrollbarMode="showOnDemand" enableWrapAround="1" zPosition="3" />

            <eLabel position="60,686" size="1800,260" backgroundColor="%(panel)s" zPosition="1" />
            <eLabel position="60,686" size="1800,3" backgroundColor="%(accent)s" zPosition="2" />
            <widget name="detail_kicker" position="88,700" size="860,28" font="Regular;20" foregroundColor="%(accent_l)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            <widget name="detail_title" position="88,732" size="860,46" font="Regular;32" foregroundColor="%(txt)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            <widget name="detail_desc" position="88,784" size="1120,104" font="Regular;22" foregroundColor="%(muted)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            <widget name="detail_hint" position="88,898" size="1120,34" font="Regular;20" foregroundColor="%(accent_l)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            <eLabel position="1232,704" size="2,224" backgroundColor="%(border)s" zPosition="2" />
            <widget name="detail_meta" position="1256,704" size="580,104" font="Regular;21" foregroundColor="%(txt)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            <widget name="detail_status" position="1256,822" size="580,108" font="Regular;20" foregroundColor="%(accent_l)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            """
        else:
            body = """
            <eLabel position="60,152" size="1140,788" backgroundColor="%(panel)s" zPosition="1" />
            <eLabel position="60,152" size="1140,2" backgroundColor="%(border)s" zPosition="2" />
            <eLabel position="60,938" size="1140,2" backgroundColor="%(border)s" zPosition="2" />
            <widget name="list_title" position="86,170" size="1088,42" font="Regular;26" foregroundColor="%(accent_l)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            <eLabel position="86,218" size="1088,1" backgroundColor="%(border)s" zPosition="2" />
            <widget name="list" position="78,232" size="1104,690" font="Regular;28" itemHeight="60" foregroundColor="%(txt)s" backgroundColor="%(panel)s" foregroundColorSelected="#ffffff" backgroundColorSelected="%(accent)s" scrollbarMode="showOnDemand" enableWrapAround="1" zPosition="3" />

            <eLabel position="1230,152" size="630,788" backgroundColor="%(panel)s" zPosition="1" />
            <eLabel position="1230,152" size="630,3" backgroundColor="%(accent)s" zPosition="2" />
            <eLabel position="1230,938" size="630,2" backgroundColor="%(border)s" zPosition="2" />
            <widget name="detail_kicker" position="1260,174" size="570,32" font="Regular;21" foregroundColor="%(accent_l)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            <widget name="detail_title" position="1260,214" size="570,84" font="Regular;34" foregroundColor="%(txt)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            <eLabel position="1260,308" size="570,1" backgroundColor="%(border)s" zPosition="2" />
            <widget name="detail_meta" position="1260,326" size="570,110" font="Regular;23" foregroundColor="%(txt)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            <widget name="detail_desc" position="1260,450" size="570,220" font="Regular;24" foregroundColor="%(muted)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            <eLabel position="1260,695" size="570,1" backgroundColor="%(border)s" zPosition="2" />
            <widget name="detail_status" position="1260,715" size="570,130" font="Regular;21" foregroundColor="%(accent_l)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            <widget name="detail_hint" position="1260,868" size="570,50" font="Regular;20" foregroundColor="%(muted)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            """

        tpl = """
        <screen name="Mizou1984StoreScreen" position="0,0" size="1920,1080" flags="wfNoBorder" backgroundColor="%(bg)s">
            <eLabel position="0,0" size="1920,1080" backgroundColor="%(bg)s" zPosition="0" />
            <eLabel position="0,0" size="1920,120" backgroundColor="%(bar)s" zPosition="1" />
            <eLabel position="0,120" size="1920,2" backgroundColor="%(border)s" zPosition="2" />

            <ePixmap pixmap="/usr/lib/enigma2/python/Plugins/Extensions/Mizou1984Store/plugin.png" position="50,12" size="250,98" alphatest="blend" scale="1" zPosition="3" />

            <widget name="header" position="324,22" size="980,48" font="Regular;38" foregroundColor="%(txt)s" backgroundColor="%(bar)s" transparent="1" zPosition="3" />
            <widget name="sysinfo" position="324,72" size="1020,34" font="Regular;22" foregroundColor="%(muted)s" backgroundColor="%(bar)s" transparent="1" zPosition="3" />
            <widget name="brand" position="1380,36" size="480,48" font="Regular;28" halign="right" foregroundColor="%(accent_l)s" backgroundColor="%(bar)s" transparent="1" zPosition="3" />
            """ + body + """
            <eLabel position="0,972" size="1920,108" backgroundColor="%(bar)s" zPosition="1" />
            <eLabel position="0,972" size="1920,2" backgroundColor="%(border)s" zPosition="2" />

            <eLabel position="60,992" size="350,6" backgroundColor="#dc2626" zPosition="2" />
            <widget name="key_red" position="60,1004" size="350,52" font="Regular;25" halign="center" valign="center" foregroundColor="%(txt)s" backgroundColor="%(panel)s" zPosition="3" />

            <eLabel position="440,992" size="350,6" backgroundColor="#16a34a" zPosition="2" />
            <widget name="key_green" position="440,1004" size="350,52" font="Regular;25" halign="center" valign="center" foregroundColor="%(txt)s" backgroundColor="%(panel)s" zPosition="3" />

            <eLabel position="820,992" size="350,6" backgroundColor="#d97706" zPosition="2" />
            <widget name="key_yellow" position="820,1004" size="350,52" font="Regular;25" halign="center" valign="center" foregroundColor="%(txt)s" backgroundColor="%(panel)s" zPosition="3" />

            <eLabel position="1200,992" size="320,6" backgroundColor="%(accent)s" zPosition="2" />
            <widget name="key_blue" position="1200,1004" size="320,52" font="Regular;25" halign="center" valign="center" foregroundColor="%(txt)s" backgroundColor="%(panel)s" zPosition="3" />

            <eLabel position="1550,992" size="310,6" backgroundColor="%(accent_l)s" zPosition="2" />
            <widget name="key_menu" position="1550,1004" size="310,52" font="Regular;23" halign="center" valign="center" foregroundColor="%(accent_l)s" backgroundColor="%(panel)s" zPosition="3" />
        </screen>
        """
    else:
        if layout_id == "mirror_split":
            body = """
            <eLabel position="36,104" size="434,524" backgroundColor="%(panel)s" zPosition="1" />
            <eLabel position="36,104" size="434,3" backgroundColor="%(accent)s" zPosition="2" />
            <widget name="detail_kicker" position="56,118" size="394,24" font="Regular;15" foregroundColor="%(accent_l)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            <widget name="detail_title" position="56,148" size="394,60" font="Regular;24" foregroundColor="%(txt)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            <widget name="detail_meta" position="56,218" size="394,80" font="Regular;17" foregroundColor="%(txt)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            <widget name="detail_desc" position="56,308" size="394,150" font="Regular;17" foregroundColor="%(muted)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            <widget name="detail_status" position="56,470" size="394,94" font="Regular;15" foregroundColor="%(accent_l)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            <widget name="detail_hint" position="56,576" size="394,38" font="Regular;15" foregroundColor="%(muted)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />

            <eLabel position="490,104" size="754,524" backgroundColor="%(panel)s" zPosition="1" />
            <widget name="list_title" position="506,116" size="720,30" font="Regular;19" foregroundColor="%(accent_l)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            <widget name="list" position="502,154" size="730,462" font="Regular;20" itemHeight="42" foregroundColor="%(txt)s" backgroundColor="%(panel)s" foregroundColorSelected="#ffffff" backgroundColorSelected="%(accent)s" scrollbarMode="showOnDemand" enableWrapAround="1" zPosition="3" />
            """
        elif layout_id == "cinema_wide":
            body = """
            <eLabel position="36,100" size="1208,348" backgroundColor="%(panel)s" zPosition="1" />
            <eLabel position="36,100" size="1208,3" backgroundColor="%(accent)s" zPosition="2" />
            <widget name="list_title" position="52,110" size="1176,28" font="Regular;19" foregroundColor="%(accent_l)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            <widget name="list" position="48,144" size="1184,296" font="Regular;20" itemHeight="37" foregroundColor="%(txt)s" backgroundColor="%(panel)s" foregroundColorSelected="#ffffff" backgroundColorSelected="%(accent)s" scrollbarMode="showOnDemand" enableWrapAround="1" zPosition="3" />

            <eLabel position="36,462" size="1208,168" backgroundColor="%(panel)s" zPosition="1" />
            <eLabel position="36,462" size="1208,3" backgroundColor="%(accent)s" zPosition="2" />
            <widget name="detail_kicker" position="54,472" size="720,22" font="Regular;14" foregroundColor="%(accent_l)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            <widget name="detail_title" position="54,496" size="720,34" font="Regular;22" foregroundColor="%(txt)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            <widget name="detail_desc" position="54,534" size="740,62" font="Regular;15" foregroundColor="%(muted)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            <widget name="detail_hint" position="54,600" size="740,24" font="Regular;14" foregroundColor="%(accent_l)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            <widget name="detail_meta" position="814,474" size="414,72" font="Regular;15" foregroundColor="%(txt)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            <widget name="detail_status" position="814,552" size="414,72" font="Regular;14" foregroundColor="%(accent_l)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            """
        else:
            body = """
            <eLabel position="36,104" size="754,524" backgroundColor="%(panel)s" zPosition="1" />
            <widget name="list_title" position="52,116" size="720,30" font="Regular;19" foregroundColor="%(accent_l)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            <widget name="list" position="48,154" size="730,462" font="Regular;20" itemHeight="42" foregroundColor="%(txt)s" backgroundColor="%(panel)s" foregroundColorSelected="#ffffff" backgroundColorSelected="%(accent)s" scrollbarMode="showOnDemand" enableWrapAround="1" zPosition="3" />

            <eLabel position="810,104" size="434,524" backgroundColor="%(panel)s" zPosition="1" />
            <eLabel position="810,104" size="434,3" backgroundColor="%(accent)s" zPosition="2" />
            <widget name="detail_kicker" position="830,118" size="394,24" font="Regular;15" foregroundColor="%(accent_l)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            <widget name="detail_title" position="830,148" size="394,60" font="Regular;24" foregroundColor="%(txt)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            <widget name="detail_meta" position="830,218" size="394,80" font="Regular;17" foregroundColor="%(txt)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            <widget name="detail_desc" position="830,308" size="394,150" font="Regular;17" foregroundColor="%(muted)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            <widget name="detail_status" position="830,470" size="394,94" font="Regular;15" foregroundColor="%(accent_l)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            <widget name="detail_hint" position="830,576" size="394,38" font="Regular;15" foregroundColor="%(muted)s" backgroundColor="%(panel)s" transparent="1" zPosition="3" />
            """

        tpl = """
        <screen name="Mizou1984StoreScreen" position="0,0" size="1280,720" flags="wfNoBorder" backgroundColor="%(bg)s">
            <eLabel position="0,0" size="1280,720" backgroundColor="%(bg)s" zPosition="0" />
            <eLabel position="0,0" size="1280,84" backgroundColor="%(bar)s" zPosition="1" />
            <eLabel position="0,84" size="1280,2" backgroundColor="%(border)s" zPosition="2" />

            <ePixmap pixmap="/usr/lib/enigma2/python/Plugins/Extensions/Mizou1984Store/plugin.png" position="30,8" size="176,68" alphatest="blend" scale="1" zPosition="3" />

            <widget name="header" position="222,14" size="660,34" font="Regular;26" foregroundColor="%(txt)s" backgroundColor="%(bar)s" transparent="1" zPosition="3" />
            <widget name="sysinfo" position="222,50" size="700,24" font="Regular;16" foregroundColor="%(muted)s" backgroundColor="%(bar)s" transparent="1" zPosition="3" />
            <widget name="brand" position="940,26" size="304,34" font="Regular;20" halign="right" foregroundColor="%(accent_l)s" backgroundColor="%(bar)s" transparent="1" zPosition="3" />
            """ + body + """
            <eLabel position="0,646" size="1280,74" backgroundColor="%(bar)s" zPosition="1" />
            <eLabel position="36,658" size="224,4" backgroundColor="#dc2626" zPosition="2" />
            <widget name="key_red" position="36,666" size="224,40" font="Regular;18" halign="center" valign="center" foregroundColor="%(txt)s" backgroundColor="%(panel)s" zPosition="3" />
            <eLabel position="276,658" size="224,4" backgroundColor="#16a34a" zPosition="2" />
            <widget name="key_green" position="276,666" size="224,40" font="Regular;18" halign="center" valign="center" foregroundColor="%(txt)s" backgroundColor="%(panel)s" zPosition="3" />
            <eLabel position="516,658" size="234,4" backgroundColor="#d97706" zPosition="2" />
            <widget name="key_yellow" position="516,666" size="234,40" font="Regular;18" halign="center" valign="center" foregroundColor="%(txt)s" backgroundColor="%(panel)s" zPosition="3" />
            <eLabel position="766,658" size="234,4" backgroundColor="%(accent)s" zPosition="2" />
            <widget name="key_blue" position="766,666" size="234,40" font="Regular;18" halign="center" valign="center" foregroundColor="%(txt)s" backgroundColor="%(panel)s" zPosition="3" />
            <eLabel position="1016,658" size="228,4" backgroundColor="%(accent_l)s" zPosition="2" />
            <widget name="key_menu" position="1016,666" size="228,40" font="Regular;17" halign="center" valign="center" foregroundColor="%(accent_l)s" backgroundColor="%(panel)s" zPosition="3" />
        </screen>
        """

    return tpl % {
        "bg": bg,
        "bar": bar,
        "panel": panel,
        "border": border,
        "accent": accent,
        "accent_l": accent_l,
        "txt": txt,
        "muted": muted,
    }


def is_valid_version(val):
    if not val:
        return False
    return bool(re.match(r"^[0-9A-Za-z._-]{1,24}$", val.strip()))


def is_safe_pkg_name(name):
    return bool(name and re.match(r"^[a-zA-Z0-9._+-]{2,128}$", name))


def is_safe_remove_path(path):
    if not path or ".." in path:
        return False
    allowed_roots = (
        "/usr/lib/enigma2/python/Plugins/Extensions/",
        "/usr/share/enigma2/",
        "/usr/bin/",
    )
    real_p = os.path.realpath(path)
    if "Mizou1984Store" in real_p:
        return False
    for root in allowed_roots:
        if real_p.startswith(root) and len(real_p) > len(root):
            base = real_p[len(root):]
            if "/" not in base and re.match(r"^[a-zA-Z0-9._+-]+$", base):
                return True
    return False


def run_cmd_capture(args):
    try:
        proc = subprocess.Popen(args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        out, _err = proc.communicate()
        if isinstance(out, bytes):
            return out.decode("utf-8", "ignore")
        return str(out)
    except Exception:
        return ""


def is_softcam_name(name):
    low = name.lower()
    for kw in SOFTCAM_KEYWORDS:
        if kw in low:
            return True
    return False


def scan_installed_items(filter_kind="all"):
    items = []
    seen_keys = set()

    # 1. Scan system packages (opkg or dpkg)
    if filter_kind != "manual":
        if IS_DREAMOS:
            raw = run_cmd_capture(["dpkg-query", "-W", "-f=${Package}\t${Version}\n"])
        else:
            raw = run_cmd_capture(["opkg", "list-installed"])

        for line in raw.splitlines():
            line = line.strip()
            if not line:
                continue
            pkg = ""
            ver = ""
            if IS_DREAMOS:
                parts = line.split("\t")
                pkg = parts[0].strip()
                ver = parts[1].strip() if len(parts) > 1 else ""
            else:
                if " - " in line:
                    parts = line.split(" - ", 1)
                    pkg = parts[0].strip()
                    ver = parts[1].strip()
                else:
                    parts = line.split()
                    pkg = parts[0].strip() if parts else ""
                    ver = parts[1].strip() if len(parts) > 1 else ""

            if not is_safe_pkg_name(pkg):
                continue
            low = pkg.lower()
            if "mizou1984" in low:
                continue

            is_cam = is_softcam_name(low)
            is_skin = low.startswith("enigma2-plugin-skins-")
            is_plugin = (
                low.startswith("enigma2-plugin-extensions-")
                or low.startswith("enigma2-plugin-systemplugins-")
                or low.startswith("enigma2-plugin-picons-")
                or low.startswith("enigma2-plugin-settings-")
                or low.startswith("enigma2-plugin-softcams-")
            )

            bucket = "other_pkg"
            if is_cam:
                bucket = "softcams"
            elif is_skin:
                bucket = "skins"
            elif is_plugin:
                bucket = "plugins"

            if filter_kind == "all":
                if not (is_cam or is_skin or is_plugin or low.startswith("enigma2-plugin-")):
                    continue
            elif filter_kind == "plugins" and bucket != "plugins":
                continue
            elif filter_kind == "softcams" and bucket != "softcams":
                continue
            elif filter_kind == "skins" and bucket != "skins":
                continue
            elif filter_kind == "other_pkg":
                if bucket != "other_pkg":
                    continue
                if not (low.startswith("enigma2-") or "feed" in low or "picon" in low or "panel" in low or "iptv" in low or "epg" in low or "wireguard" in low):
                    continue

            key = "pkg:" + pkg
            if key in seen_keys:
                continue
            seen_keys.add(key)
            tag = "[CAM]" if is_cam else ("[SKIN]" if is_skin else ("[PLUGIN]" if is_plugin else "[PKG]"))
            items.append({
                "kind": "pkg",
                "bucket": bucket,
                "name": pkg,
                "version": ver or "installed",
                "target": pkg,
                "tag": tag,
            })

    # 2. Scan manual folders & softcam binaries
    if filter_kind in ("all", "manual", "plugins", "softcams", "skins"):
        ext_root = "/usr/lib/enigma2/python/Plugins/Extensions"
        if filter_kind in ("all", "manual", "plugins") and os.path.isdir(ext_root):
            try:
                for entry in sorted(os.listdir(ext_root)):
                    if entry in ("Mizou1984Store", "__pycache__") or entry.startswith("."):
                        continue
                    full_p = os.path.join(ext_root, entry)
                    if os.path.isdir(full_p) and is_safe_remove_path(full_p):
                        key = "dir:" + full_p
                        if key not in seen_keys:
                            seen_keys.add(key)
                            items.append({
                                "kind": "dir",
                                "bucket": "manual",
                                "name": entry,
                                "version": "folder",
                                "target": full_p,
                                "tag": "[DIR]",
                            })
            except Exception:
                pass

        skin_root = "/usr/share/enigma2"
        if filter_kind in ("all", "manual", "skins") and os.path.isdir(skin_root):
            try:
                for entry in sorted(os.listdir(skin_root)):
                    if entry in PROTECTED_SKIN_DIRS or entry.startswith("."):
                        continue
                    full_p = os.path.join(skin_root, entry)
                    if os.path.isdir(full_p) and os.path.isfile(os.path.join(full_p, "skin.xml")) and is_safe_remove_path(full_p):
                        key = "dir:" + full_p
                        if key not in seen_keys:
                            seen_keys.add(key)
                            items.append({
                                "kind": "dir",
                                "bucket": "skins",
                                "name": entry,
                                "version": "skin-dir",
                                "target": full_p,
                                "tag": "[SKIN-DIR]",
                            })
            except Exception:
                pass

        bin_root = "/usr/bin"
        if filter_kind in ("all", "manual", "softcams") and os.path.isdir(bin_root):
            try:
                for entry in sorted(os.listdir(bin_root)):
                    low = entry.lower()
                    if any(low.startswith(k) for k in ("oscam", "ncam", "cccam", "gcam", "powercam", "revcam", "ultracam", "mgcamd", "wicardd", "doscam", "gbox")):
                        full_p = os.path.join(bin_root, entry)
                        if os.path.isfile(full_p) and is_safe_remove_path(full_p):
                            key = "bin:" + full_p
                            if key not in seen_keys:
                                seen_keys.add(key)
                                items.append({
                                    "kind": "bin",
                                    "bucket": "softcams",
                                    "name": entry,
                                    "version": "binary",
                                    "target": full_p,
                                    "tag": "[EMU-BIN]",
                                })
            except Exception:
                pass

    items.sort(key=lambda x: (x.get("tag", ""), x.get("name", "").lower()))
    return items


def build_remove_command(item):
    kind = item.get("kind")
    target = item.get("target", "")
    if kind == "pkg" and is_safe_pkg_name(target):
        if IS_DREAMOS:
            return 'dpkg --remove --force-depends "%s" || apt-get remove -y "%s"' % (target, target)
        return 'opkg remove --force-depends "%s"' % target
    if kind in ("dir", "bin") and is_safe_remove_path(target):
        return 'rm -rf "%s" && echo "[mizou1984] Removed %s successfully."' % (target, target)
    return 'echo "[mizou1984] Refused unsafe removal target."'


MODULE_TO_PKG = {
    "requests": "requests",
    "bs4": "beautifulsoup4",
    "lxml": "lxml",
    "PIL": "pillow",
    "six": "six",
    "urllib3": "urllib3",
    "Crypto": "pycryptodome",
    "Cryptodome": "pycryptodome",
    "twisted": "twisted-web",
    "sqlite3": "sqlite3",
    "rarfile": "rarfile",
    "dateutil": "dateutil",
    "certifi": "certifi",
    "chardet": "chardet",
    "charset_normalizer": "charset-normalizer",
    "idna": "idna",
    "future": "future",
    "html5lib": "html5lib",
    "aiohttp": "aiohttp",
    "cloudscraper": "cloudscraper",
    "yaml": "pyyaml",
    "pytz": "pytz",
    "simplejson": "simplejson",
    "feedparser": "feedparser",
    "socks": "pysocks",
    "websocket": "websocket-client",
    "mutagen": "mutagen",
    "psutil": "psutil",
    "pycurl": "pycurl",
    "OpenSSL": "pyopenssl",
    "cryptography": "cryptography",
    "attr": "attrs",
    "googletrans": "googletrans",
    "deep_translator": "deep-translator",
    "fuzzywuzzy": "fuzzywuzzy",
    "Levenshtein": "levenshtein",
    "xmltodict": "xmltodict",
    "unidecode": "unidecode",
}


def _get_py_magic():
    try:
        if sys.version_info[0] >= 3:
            import importlib.util
            return importlib.util.MAGIC_NUMBER[:4]
        import imp
        return imp.get_magic()[:4]
    except Exception:
        return None


def _check_mod_available(mod_name):
    try:
        if sys.version_info[0] >= 3:
            import importlib.util
            return importlib.util.find_spec(mod_name) is not None
        import imp
        imp.find_module(mod_name)
        return True
    except Exception:
        return False


def _read_recent_crash_errors():
    crash_map = {}
    search_dirs = ("/home/root/logs", "/media/hdd", "/tmp")
    files = []
    for d in search_dirs:
        if not os.path.isdir(d):
            continue
        try:
            for fn in os.listdir(d):
                low = fn.lower()
                if ("enigma2_crash" in low or low.startswith("crash")) and low.endswith(".log"):
                    fp = os.path.join(d, fn)
                    try:
                        files.append((os.path.getmtime(fp), fp))
                    except Exception:
                        pass
        except Exception:
            pass
    files.sort(key=lambda x: x[0], reverse=True)
    pat_plugin = re.compile(r"Plugins/(?:Extensions|SystemPlugins)/([A-Za-z0-9._-]+)")
    for _mt, fp in files[:3]:
        try:
            with open(fp, "rb") as f:
                data = f.read()[-16384:].decode("utf-8", "ignore")
            lines = data.splitlines()
            last_err = ""
            for ln in reversed(lines):
                s = ln.strip()
                if s and any(k in s for k in ("Error:", "Exception:", "No module named", "SyntaxError", "ImportError", "AttributeError", "KeyError")):
                    last_err = s[:120]
                    break
            if not last_err:
                continue
            for m in pat_plugin.finditer(data):
                folder = m.group(1)
                if folder and folder != "Mizou1984Store" and folder not in crash_map:
                    crash_map[folder] = last_err
        except Exception:
            pass
    return crash_map


def is_safe_plugin_dir(path):
    if not path or ".." in path:
        return False
    allowed_roots = (
        "/usr/lib/enigma2/python/Plugins/Extensions/",
        "/usr/lib/enigma2/python/Plugins/SystemPlugins/",
        "/usr/lib64/enigma2/python/Plugins/Extensions/",
        "/usr/lib64/enigma2/python/Plugins/SystemPlugins/",
    )
    real_p = os.path.realpath(path)
    for root in allowed_roots:
        if real_p.startswith(root) and len(real_p) > len(root):
            base = real_p[len(root):]
            if "/" not in base and re.match(r"^[a-zA-Z0-9._+-]+$", base):
                return True
    return False


def _get_broken_pkgs():
    broken = {}
    try:
        if IS_DREAMOS:
            out = run_cmd_capture(["dpkg", "-l"])
            for ln in out.splitlines():
                parts = ln.split()
                if len(parts) >= 2 and parts[0] in ("iU", "iF", "iH", "rc", "pH"):
                    if "enigma2-plugin-" in parts[1].lower():
                        broken[parts[1].lower()] = parts[0]
        else:
            out = run_cmd_capture(["opkg", "status"])
            cur_pkg = ""
            for ln in out.splitlines():
                if ln.startswith("Package:"):
                    cur_pkg = ln.split(":", 1)[1].strip().lower()
                elif ln.startswith("Status:") and cur_pkg:
                    st = ln.split(":", 1)[1].strip().lower()
                    if "enigma2-plugin-" in cur_pkg and any(w in st for w in ("half-installed", "half-configured", "unpacked", "not-installed")):
                        broken[cur_pkg] = st
                elif not ln.strip():
                    cur_pkg = ""
    except Exception:
        pass
    return broken


def _norm_key(s):
    return re.sub(r"[^a-z0-9]", "", to_e2_str(s).lower())


def _match_catalog_plugin(folder_name, catalog):
    fn_key = _norm_key(folder_name)
    if not fn_key or len(fn_key) < 3:
        return None
    best = None
    best_score = 0
    for p in catalog:
        pid_key = _norm_key(p.get("id", ""))
        pname_key = _norm_key(p.get("name", ""))
        if not pid_key:
            continue
        score = 0
        if fn_key == pid_key or fn_key == pname_key:
            score = 100
        elif fn_key in pname_key or fn_key in pid_key:
            score = 70
        elif len(pid_key) >= 5 and pid_key in fn_key:
            score = 60
        if score > best_score:
            best_score = score
            best = p
    return best if best_score >= 60 else None


def _extract_third_party_imports(py_path, local_names):
    found = []
    try:
        with open(py_path, "rb") as f:
            src = f.read(65536).decode("utf-8", "ignore")
        lines = src.splitlines()
        in_try = False
        try_indent = -1
        for raw_ln in lines:
            stripped = raw_ln.strip()
            if not stripped or stripped.startswith("#"):
                continue
            indent = len(raw_ln) - len(raw_ln.lstrip(" \t"))
            if stripped.startswith("try:"):
                in_try = True
                try_indent = indent
                continue
            if in_try and indent <= try_indent and not stripped.startswith(("except", "finally", "else:")):
                in_try = False
                try_indent = -1
            if in_try:
                continue
            m1 = re.match(r"^from\s+([A-Za-z0-9_]+)(?:\.[A-Za-z0-9_.]+)?\s+import\s+", stripped)
            m2 = re.match(r"^import\s+([A-Za-z0-9_]+)", stripped)
            mod = None
            if m1:
                mod = m1.group(1)
            elif m2:
                mod = m2.group(1)
            if mod and mod in MODULE_TO_PKG and mod not in local_names and mod not in found:
                found.append(mod)
    except Exception:
        pass
    return found


def scan_plugins_health(catalog=None, roots=None):
    if catalog is None:
        catalog = PLUGIN_CATALOG
    is_default_roots = roots is None
    if is_default_roots:
        roots = [
            ("Extensions", "/usr/lib/enigma2/python/Plugins/Extensions"),
            ("SystemPlugins", "/usr/lib/enigma2/python/Plugins/SystemPlugins"),
            ("Extensions", "/usr/lib64/enigma2/python/Plugins/Extensions"),
            ("SystemPlugins", "/usr/lib64/enigma2/python/Plugins/SystemPlugins"),
        ]
    py_magic = _get_py_magic()
    crash_map = _read_recent_crash_errors() if is_default_roots else {}
    broken_pkgs = _get_broken_pkgs() if is_default_roots else {}
    seen_paths = set()
    results = []

    for scope, root_dir in roots:
        if not os.path.isdir(root_dir):
            continue
        try:
            entries = sorted(os.listdir(root_dir))
        except Exception:
            continue
        for entry in entries:
            if entry.startswith(".") or entry == "__pycache__":
                continue
            full_p = os.path.join(root_dir, entry)
            if not os.path.isdir(full_p):
                continue
            real_p = os.path.realpath(full_p)
            if real_p in seen_paths:
                continue
            seen_paths.add(real_p)

            try:
                files = os.listdir(full_p)
            except Exception:
                files = []

            local_mods = set([os.path.splitext(fn)[0] for fn in files])
            has_plugin_py = os.path.isfile(os.path.join(full_p, "plugin.py"))
            has_plugin_pyc = os.path.isfile(os.path.join(full_p, "plugin.pyc")) or os.path.isfile(os.path.join(full_p, "plugin.pyo"))
            has_init = (
                os.path.isfile(os.path.join(full_p, "__init__.py"))
                or os.path.isfile(os.path.join(full_p, "__init__.pyc"))
                or os.path.isfile(os.path.join(full_p, "__init__.pyo"))
            )

            status = "healthy"
            reasons = []
            fixes = []
            fix_flags = []
            missing_mods = []
            matched_pkg = None
            entry_norm = _norm_key(entry)

            for bp_name, bp_st in broken_pkgs.items():
                if entry_norm and len(entry_norm) >= 4 and entry_norm in _norm_key(bp_name):
                    matched_pkg = bp_name
                    status = "broken"
                    reasons.append("Broken package state: %s (%s)" % (bp_name, bp_st))
                    fixes.append("Reconfigure & reinstall %s" % bp_name)
                    fix_flags.append("pkg_fix")
                    break

            if not files or (not has_plugin_py and not has_plugin_pyc):
                status = "broken"
                reasons.append("Missing core entry file (plugin.py / plugin.pyc)")
                fixes.append("Reinstall plugin from official source or clean leftover folder")
                fix_flags.append("reinstall")

            if has_plugin_py and os.path.getsize(os.path.join(full_p, "plugin.py")) == 0:
                status = "broken"
                reasons.append("Empty/corrupted plugin.py (0 bytes)")
                fixes.append("Reinstall plugin from official source")
                fix_flags.append("reinstall")

            stale_pyc = False
            bad_pyc_only = False
            if py_magic is not None:
                for fn in files:
                    if fn.endswith(".pyc"):
                        fp = os.path.join(full_p, fn)
                        try:
                            with open(fp, "rb") as f:
                                hdr = f.read(4)
                            if len(hdr) == 4 and hdr != py_magic:
                                py_counterpart = os.path.join(full_p, fn[:-1])
                                if os.path.isfile(py_counterpart):
                                    stale_pyc = True
                                else:
                                    bad_pyc_only = True
                        except Exception:
                            pass

            if bad_pyc_only:
                status = "broken"
                reasons.append("Incompatible compiled .pyc bytecode for Python %d.%d" % (sys.version_info[0], sys.version_info[1]))
                fixes.append("Reinstall Python %d.%d compatible version" % (sys.version_info[0], sys.version_info[1]))
                fix_flags.append("reinstall")
            elif stale_pyc:
                if status == "healthy":
                    status = "stopped"
                reasons.append("Stale .pyc bytecode from older Python version")
                fixes.append("Purge stale .pyc & recompile with current Python")
                fix_flags.append("clean_pyc")

            syntax_err = None
            py_files = [fn for fn in sorted(files) if fn.endswith(".py")][:12]
            if has_plugin_py and "plugin.py" in py_files:
                py_files.remove("plugin.py")
                py_files.insert(0, "plugin.py")
            for fn in py_files:
                fp = os.path.join(full_p, fn)
                try:
                    with open(fp, "rb") as f:
                        src = f.read()
                    compile(src, fp, "exec")
                except SyntaxError as se:
                    syntax_err = "%s line %s: %s" % (fn, getattr(se, "lineno", "?"), getattr(se, "msg", "SyntaxError"))
                    break
                except Exception:
                    pass

            if syntax_err:
                status = "broken"
                reasons.append("Python %d.%d syntax error (%s)" % (sys.version_info[0], sys.version_info[1], syntax_err))
                fixes.append("Reinstall updated Python %d compatible plugin" % sys.version_info[0])
                fix_flags.append("reinstall")

            if has_plugin_py:
                req_mods = _extract_third_party_imports(os.path.join(full_p, "plugin.py"), local_mods)
                for mname in req_mods:
                    if not _check_mod_available(mname):
                        missing_mods.append(mname)
                if missing_mods:
                    if status == "healthy":
                        status = "stopped"
                    pkgs_lbl = ", ".join([MODULE_TO_PKG.get(m, m) for m in missing_mods])
                    reasons.append("Missing Python module(s): %s" % ", ".join(missing_mods))
                    fixes.append("Install missing packages: %s" % pkgs_lbl)
                    fix_flags.append("install_deps")

            if (has_plugin_py or has_plugin_pyc) and not has_init:
                if status == "healthy":
                    status = "stopped"
                reasons.append("Missing __init__.py (Enigma2 cannot register plugin)")
                fixes.append("Create missing __init__.py file")
                fix_flags.append("create_init")

            bad_sh = []
            for fn in files:
                if fn.endswith(".sh"):
                    fp = os.path.join(full_p, fn)
                    try:
                        if os.path.isfile(fp) and not os.access(fp, os.X_OK):
                            bad_sh.append(fn)
                    except Exception:
                        pass
            if bad_sh:
                if status == "healthy":
                    status = "stopped"
                reasons.append("Non-executable script(s): %s" % ", ".join(bad_sh[:3]))
                fixes.append("Restore chmod +x execute permissions")
                fix_flags.append("chmod_sh")

            if entry in crash_map:
                if status == "healthy":
                    status = "stopped"
                reasons.append("Recent Enigma2 crash: %s" % crash_map[entry])
                fixes.append("Clean bytecode cache & reinstall latest version")
                fix_flags.append("clean_pyc")

            cat_match = _match_catalog_plugin(entry, catalog) if status != "healthy" else None
            if status == "healthy":
                reason_text = "All core files, syntax, Python dependencies & permissions verified OK."
                fix_summary = "No repair required."
            else:
                reason_text = " | ".join(reasons)
                if cat_match and ("reinstall" in fix_flags or entry in crash_map):
                    fixes.append("Official reinstall available: %s" % to_e2_str(cat_match.get("name", "")))
                fix_summary = " + ".join(fixes)

            results.append({
                "name": entry,
                "scope": scope,
                "path": full_p,
                "status": status,
                "reason": reason_text,
                "fix_summary": fix_summary,
                "fix_flags": fix_flags,
                "missing_mods": missing_mods,
                "matched_pkg": matched_pkg,
                "catalog_match": cat_match,
            })

    rank_map = {"broken": 0, "stopped": 1, "healthy": 2}
    results.sort(key=lambda x: (rank_map.get(x["status"], 9), x["name"].lower()))
    return results


def build_plugin_repair_cmd(item):
    path = item.get("path", "")
    name = item.get("name", "plugin")
    flags = item.get("fix_flags", [])
    missing_mods = item.get("missing_mods", [])
    matched_pkg = item.get("matched_pkg")
    cat_match = item.get("catalog_match")
    py_prefix = "python3-" if sys.version_info[0] >= 3 else "python-"
    py_bin = "python3" if sys.version_info[0] >= 3 else "python"
    steps = [
        'echo "============================================================"',
        'echo "[mizou1984 Doctor] Repairing: %s (%s)"' % (name, item.get("status", "")),
        'echo "============================================================"',
    ]

    if "create_init" in flags and path and is_safe_plugin_dir(path):
        steps.append('touch "%s/__init__.py" && echo "[OK] Created missing __init__.py"' % path)

    if "chmod_sh" in flags and path and is_safe_plugin_dir(path):
        steps.append('chmod 755 "%s"/*.sh 2>/dev/null; echo "[OK] Fixed .sh execute permissions"' % path)

    if ("clean_pyc" in flags or "reinstall" in flags) and path and is_safe_plugin_dir(path):
        steps.append(r'find "%s" \( -name "*.pyc" -o -name "*.pyo" \) -delete 2>/dev/null; rm -rf "%s/__pycache__" 2>/dev/null; %s -m compileall -q "%s" 2>/dev/null || true' % (path, path, py_bin, path))

    if "install_deps" in flags and missing_mods:
        pkgs = []
        for m in missing_mods:
            p = MODULE_TO_PKG.get(m, m.lower())
            if is_safe_pkg_name(p):
                pkgs.append(py_prefix + p)
        if pkgs:
            pkg_str = " ".join(pkgs)
            if IS_DREAMOS:
                steps.append('apt-get update && (apt-get install -y %s || pip3 install %s || true)' % (pkg_str, " ".join([MODULE_TO_PKG.get(m, m) for m in missing_mods])))
            else:
                steps.append('opkg update && (opkg install %s || pip3 install %s || true)' % (pkg_str, " ".join([MODULE_TO_PKG.get(m, m) for m in missing_mods])))

    if "pkg_fix" in flags:
        if IS_DREAMOS:
            steps.append('dpkg --configure -a && apt-get -f install -y')
            if matched_pkg and is_safe_pkg_name(matched_pkg):
                steps.append('apt-get install --reinstall -y "%s" || true' % matched_pkg)
        else:
            steps.append('opkg configure || true')
            if matched_pkg and is_safe_pkg_name(matched_pkg):
                steps.append('opkg install --force-reinstall "%s" || true' % matched_pkg)

    if "reinstall" in flags:
        if cat_match:
            cmd_install = cat_match.get("cmd_dpkg") if IS_DREAMOS else cat_match.get("cmd_opkg")
            if cmd_install:
                steps.append('echo "[mizou1984 Doctor] Reinstalling latest official %s..."' % to_e2_str(cat_match.get("name", name)))
                steps.append(cmd_install)
        elif matched_pkg and is_safe_pkg_name(matched_pkg):
            if IS_DREAMOS:
                steps.append('apt-get update && apt-get install --reinstall -y "%s"' % matched_pkg)
            else:
                steps.append('opkg update && opkg install --force-reinstall "%s"' % matched_pkg)
        elif path and is_safe_plugin_dir(path):
            pkg_guess = "enigma2-plugin-extensions-%s" % re.sub(r"[^a-z0-9.-]", "", name.lower())
            if IS_DREAMOS:
                steps.append('(dpkg --configure -a; apt-get -f install -y; apt-get install --reinstall -y "%s") || true' % pkg_guess)
            else:
                steps.append('(opkg configure; opkg update && opkg install --force-reinstall "%s") || true' % pkg_guess)

    steps.append('echo "[mizou1984 Doctor] Repair completed for %s!"' % name)
    return "; ".join(steps)


def build_repair_all_cmd(items):
    targets = [it for it in items if it.get("status") != "healthy"]
    if not targets:
        return 'echo "[mizou1984 Doctor] All plugins are healthy!"'
    cmds = [
        'echo "============================================================"',
        'echo "[mizou1984 Doctor] Running Full Auto-Repair for %d plugin(s)..."' % len(targets),
        'echo "============================================================"',
        'dpkg --configure -a && apt-get -f install -y || true' if IS_DREAMOS else 'opkg configure || true',
    ]
    for it in targets:
        cmds.append(build_plugin_repair_cmd(it))
    cmds.append('echo "[mizou1984 Doctor] ALL REPAIRS FINISHED! Restart Enigma2 GUI if prompted."')
    return "; ".join(cmds)


def format_update_message(lang, remote_ver, notes_list):
    lines = [tr_text(lang, "upd_avail") % remote_ver, ""]
    clean_notes = []
    if isinstance(notes_list, list):
        for item in notes_list[:6]:
            txt = to_e2_str(item).strip()
            if txt:
                if not txt.startswith("-"):
                    txt = "- " + txt
                clean_notes.append(txt)
    if clean_notes:
        lines.append(tr_text(lang, "whats_new") % remote_ver)
        lines.extend(clean_notes)
        lines.append("")
    lines.append(tr_text(lang, "upd_ask"))
    return "\n".join(lines)


def fetch_url_raw(url, timeout=9):
    if not url:
        return None
    try:
        req = Request(
            url,
            headers={
                "User-Agent": "Mozilla/5.0 (X11; Linux x86_64) mizou1984-e2-store/" + PLUGIN_VERSION,
                "Cache-Control": "no-cache",
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
            return raw.decode("utf-8", "ignore")
        return str(raw)
    except Exception:
        return None


def fetch_remote_text(url, timeout=4):
    if not url:
        return None
    sep = "&" if "?" in url else "?"
    nocache_url = "%s%st=%d" % (url, sep, int(time.time()))
    data = fetch_url_raw(nocache_url, timeout=timeout)
    return data.strip() if data is not None else None


def detect_box_info():
    box = ""
    brand = ""
    try:
        if os.path.exists("/proc/stb/info/vumodel"):
            v = open("/proc/stb/info/vumodel", "r").read().strip().lower()
            if v:
                box = v if v.startswith("vu") else ("vu" + v)
                brand = "vuplus"
    except Exception:
        pass
    if not box:
        for p in ("/proc/stb/info/boxtype", "/proc/stb/info/model", "/etc/hostname"):
            try:
                if os.path.exists(p):
                    v = open(p, "r").read().strip().lower()
                    if v and v not in ("localhost", "enigma2", "none"):
                        box = v
                        break
            except Exception:
                pass
    if not brand and box:
        if box.startswith("vu") or "duo" in box or "uno" in box or "solo" in box or "ultimo" in box:
            brand = "vuplus"
        elif "novaler" in box or "multibox" in box:
            brand = "novaler"
        elif "zgemma" in box or re.match(r"^h[0-9]", box):
            brand = "zgemma"
        elif "sf8008" in box or "sfx" in box or "octagon" in box:
            brand = "octagon"
        elif box.startswith("gb") or "gigablue" in box:
            brand = "gigablue"
        elif box.startswith("dm") or "dream" in box:
            brand = "dreambox"
        elif "ustym" in box or "uclan" in box:
            brand = "uclan"
        elif "pulse" in box or "abcom" in box:
            brand = "abcom"
        elif "qviart" in box or "dual" in box:
            brand = "qviart"
        elif "edision" in box or "osmini" in box or "osmio" in box:
            brand = "edision"
    return (box, brand)


LIVE_IMAGE_IDS = set([
    "image-openatv",
    "image-openpli",
    "image-openbh",
    "image-blackhole",
    "image-egami",
    "image-openvix",
    "image-openspa",
    "image-pure2",
    "image-openhdf",
    "image-opendroid",
    "image-hdsatelit",
    "image-hyperion",
])

INTERACTIVE_BACKUP_IDS = set([
    "backup-all-in-one-now",
    "backup-full-image-now",
    "backup-channels-now",
    "backup-emus-subs-now",
    "backup-restore-now",
])

_OPENSPA_TREE_CACHE = None
_LIVE_VER_CACHE = {}


def _ver_sort_key(v):
    nums = re.findall(r"[0-9]+", str(v))
    return tuple([int(x) for x in nums]) if nums else (0,)


def _pin_my_box(items, my_box, my_brand):
    if not items:
        return items
    pinned = []
    rest = []
    b_low = (my_box or "").lower()
    br_low = (my_brand or "").lower()
    b_short = b_low[2:] if b_low.startswith("vu") else b_low
    for it in items:
        k = (it.get("key") or "").lower()
        lbl = (it.get("label") or "").lower()
        k_clean = re.sub(r"[^a-z0-9]", "", k)
        l_clean = re.sub(r"[^a-z0-9]", "", lbl)
        is_match = False
        if b_low and (k == b_low or k_clean == b_low or (b_short and len(b_short) >= 4 and (b_short in k_clean or b_short in l_clean))):
            is_match = True
        elif br_low and (k == br_low or br_low in k_clean or (br_low == "vuplus" and ("vu+" in lbl or "vuplus" in k_clean))):
            is_match = True
        if is_match:
            cp = dict(it)
            if not cp["label"].startswith("* "):
                cp["label"] = "* [MY BOX] " + cp["label"]
            pinned.append(cp)
        else:
            rest.append(it)
    return pinned + rest


def fetch_image_step1(image_id):
    my_box, my_brand = detect_box_info()
    global _OPENSPA_TREE_CACHE

    if image_id == "image-openatv":
        html = fetch_url_raw("https://images.mynonpublic.com/openatv/8.0/", timeout=10)
        if not html:
            html = fetch_url_raw("https://images.mynonpublic.com/openatv/7.6/", timeout=10) or ""
        boxes = sorted(set(re.findall(r"[?&]open=([a-zA-Z0-9_-]+)", html)))
        items = [{"label": b, "key": b, "extra": ""} for b in boxes]
        return ("image_boxes", _pin_my_box(items, my_box, ""), "OpenATV 8.0 / 8.1 — Select Receiver (%d)" % len(items))

    if image_id == "image-egami":
        root = fetch_url_raw("https://image.egami-image.com/", timeout=8) or ""
        vers = sorted(set(re.findall(r"image\.egami-image\.com/([0-9]+\.[0-9]+)/", root)), key=_ver_sort_key, reverse=True)
        latest_ver = vers[0] if vers else "11.0"
        html = fetch_url_raw("https://image.egami-image.com/%s/" % latest_ver, timeout=10) or ""
        boxes = sorted(set(re.findall(r"index\.php\?open=([a-zA-Z0-9_-]+)", html)))
        items = [{"label": b, "key": b, "extra": latest_ver} for b in boxes]
        return ("image_boxes", _pin_my_box(items, my_box, ""), "EGAMI %s — Select Receiver (%d)" % (latest_ver, len(items)))

    if image_id == "image-openvix":
        html = fetch_url_raw("https://www.openvix.co.uk/openvix-builds/", timeout=10) or ""
        raw_dirs = re.findall(r'''href=["']([a-zA-Z0-9._-]+/)["']''', html)
        skip = set(["Bootloaders/", "Softcams/", "icons/"])
        boxes = sorted(set([d.strip("/") for d in raw_dirs if d not in skip and not d.startswith(".")]))
        items = [{"label": b, "key": b, "extra": ""} for b in boxes]
        return ("image_boxes", _pin_my_box(items, my_box, ""), "OpenViX Live — Select Receiver (%d)" % len(items))

    if image_id == "image-openhdf":
        html = fetch_url_raw("https://v75.hdfreaks.cc/menu.html", timeout=10) or ""
        raw_b = re.findall(r'''href=["']([a-zA-Z0-9_-]+)["']''', html)
        boxes = sorted(set([b for b in raw_b if b not in ("index",) and not b.endswith(".php")]))
        items = [{"label": b, "key": b, "extra": "7.5"} for b in boxes]
        return ("image_boxes", _pin_my_box(items, my_box, ""), "OpenHDF 7.5 — Select Receiver (%d)" % len(items))

    if image_id == "image-openpli":
        html = fetch_url_raw("https://openpli.org/download/", timeout=10) or ""
        brands = sorted(set(re.findall(r'''href=["']/download/([a-zA-Z0-9_-]+)/["']''', html)))
        items = [{"label": b.upper(), "key": b, "extra": ""} for b in brands]
        return ("image_brands", _pin_my_box(items, "", my_brand), "OpenPLi 9.2 — Select Brand (%d)" % len(items))

    if image_id == "image-openbh":
        root = fetch_url_raw("https://images.openbh.net/", timeout=10) or ""
        vers = sorted(set(re.findall(r"\?b=([0-9]+\.[0-9]+(?:\.[0-9]+)?)", root)), key=_ver_sort_key, reverse=True)
        latest_ver = vers[0] if vers else "6.0"
        html = fetch_url_raw("https://images.openbh.net/?b=%s" % latest_ver, timeout=10) or ""
        brands = sorted(set(re.findall(r"\?b=%s(?:%%2F|/)([a-zA-Z0-9_-]+)" % re.escape(latest_ver), html)))
        items = [{"label": b.upper(), "key": b, "extra": latest_ver} for b in brands]
        return ("image_brands", _pin_my_box(items, "", my_brand), "OpenBH %s — Select Brand (%d)" % (latest_ver, len(items)))

    if image_id == "image-blackhole":
        root = fetch_url_raw("https://images.openbh.net/", timeout=10) or ""
        vers = sorted(set(re.findall(r"\?b=([0-9]+\.[0-9]+(?:\.[0-9]+)?)", root)), key=_ver_sort_key, reverse=True)
        latest_ver = vers[0] if vers else "6.0"
        html = fetch_url_raw("https://images.openbh.net/?b=%s%%2Fvuplus" % latest_ver, timeout=10) or ""
        boxes = sorted(set(re.findall(r"\?b=%s(?:%%2F|/)vuplus(?:%%2F|/)([a-zA-Z0-9_-]+)" % re.escape(latest_ver), html)))
        items = [{"label": b, "key": b, "extra": latest_ver + "|vuplus"} for b in boxes]
        return ("image_boxes", _pin_my_box(items, my_box, ""), "BlackHole / OpenBH %s Vu+ (%d)" % (latest_ver, len(items)))

    if image_id == "image-openspa":
        if _OPENSPA_TREE_CACHE is None:
            raw = fetch_url_raw("https://openspa.webhop.info/scan.php", timeout=12)
            if raw:
                try:
                    _OPENSPA_TREE_CACHE = json.loads(raw)
                except Exception:
                    _OPENSPA_TREE_CACHE = None
        brands = []
        if isinstance(_OPENSPA_TREE_CACHE, dict):
            for node in _OPENSPA_TREE_CACHE.get("items", []):
                if node.get("type") == "folder":
                    brands.append({"label": to_e2_str(node.get("name", "")), "key": to_e2_str(node.get("name", "")), "extra": node})
        return ("image_brands", _pin_my_box(brands, "", my_brand), "OpenSPA Live — Select Brand (%d)" % len(brands))

    if image_id == "image-pure2":
        root = fetch_url_raw("https://www.pur-e2.club/OU/images/index.php", timeout=10) or ""
        vers = sorted(set(re.findall(r"dir=([0-9]+\.[0-9]+)/", root)), key=_ver_sort_key, reverse=True)
        latest_ver = vers[0] if vers else "7.6"
        html = fetch_url_raw("https://www.pur-e2.club/OU/images/index.php?dir=%s/" % latest_ver, timeout=10) or ""
        brands = sorted(set(re.findall(r"dir=%s/([a-zA-Z0-9_-]+)" % re.escape(latest_ver), html)))
        items = [{"label": b.upper(), "key": b, "extra": latest_ver} for b in brands]
        return ("image_brands", _pin_my_box(items, "", my_brand), "PurE2 %s — Select Brand (%d)" % (latest_ver, len(items)))

    if image_id == "image-opendroid":
        root = fetch_url_raw("https://opendroid.org/", timeout=10) or ""
        vers = sorted(set(re.findall(r'''href=["']([0-9]+\.[0-9]+(?:\.[0-9]+)?)["']''', root)), key=_ver_sort_key, reverse=True)
        latest_ver = vers[0] if vers else "8.1.2"
        html = fetch_url_raw("https://opendroid.org/%s/" % latest_ver, timeout=10) or ""
        raw_links = re.findall(r'''href=["']([^"']+)["']''', html)
        brands = []
        seen = set()
        for l in raw_links:
            if l.startswith("http") or "." in l or l.startswith("/") or l.startswith("?"):
                continue
            if l not in seen:
                seen.add(l)
                brands.append({"label": l, "key": l, "extra": latest_ver})
        return ("image_brands", _pin_my_box(brands, "", my_brand), "OpenDroid %s — Select Brand (%d)" % (latest_ver, len(brands)))

    if image_id == "image-hdsatelit":
        html = fetch_url_raw("https://stb.hdsatelit.com/en/receptoare/", timeout=12) or ""
        rows = re.findall(r"<tr[^>]*>.*?</tr>", html, re.S)
        items = []
        seen = set()
        for r in rows:
            m = re.search(r'''href=["'](/en/receptoare/([a-z0-9-]+)/)["'][^>]*>([^<]+)<''', r)
            v = re.search(r'''data-eticheta="Version"[^>]*>(.*?)</td>''', r, re.S)
            if not m or not v:
                continue
            vtxt = re.sub(r"<[^>]+>", "", v.group(1)).strip()
            if not vtxt or not re.search(r"[0-9]+\.[0-9]+", vtxt):
                continue
            slug = m.group(2)
            if slug in seen:
                continue
            seen.add(slug)
            mfr = re.search(r'''data-eticheta="Manufacturer"[^>]*>([^<]+)<''', r)
            mfr_txt = (mfr.group(1).strip() + " ") if mfr else ""
            nice = (mfr_txt + m.group(3).strip()).strip()
            items.append({"label": "%s  [v%s]" % (nice, vtxt), "key": slug, "extra": vtxt})
        return ("image_boxes", _pin_my_box(items, my_box, my_brand), "HDSatelit Live — Select Receiver (%d)" % len(items))

    if image_id == "image-hyperion":
        html = fetch_url_raw("https://zukon.pl/app.php/downloadsystem", timeout=12) or ""
        cats = re.findall(r'''href=["'](/app\.php/downloadsystemcat\?id=([0-9]+))[^"']*["'][^>]*>([^<]+)<''', html)
        items = []
        seen = set()
        for _path, cid, title in cats:
            if cid in ("1", "2") or cid in seen:
                continue
            seen.add(cid)
            clean_title = title.strip()
            items.append({"label": clean_title, "key": clean_title, "extra": cid})
        return ("image_boxes", _pin_my_box(items, my_box, my_brand), "Hyperion zukonMOD — Select Receiver (%d)" % len(items))

    return ("image_boxes", [], "Official Images")


def fetch_image_boxes_for_brand(image_id, brand_item):
    my_box, _ = detect_box_info()
    bkey = brand_item["key"]
    extra = brand_item.get("extra", "")

    if image_id == "image-openpli":
        html = fetch_url_raw("https://openpli.org/download/%s/" % bkey, timeout=10) or ""
        models = sorted(set(re.findall(r'''href=["'](/download/%s/[^"'/]+)["']''' % re.escape(bkey), html)))
        items = []
        for m in models:
            slug = m.split("/")[-1]
            nice = url_unquote(slug.replace("+", " "))
            items.append({"label": nice, "key": slug, "extra": m})
        return ("image_boxes", _pin_my_box(items, my_box, ""), "OpenPLi — %s (%d)" % (bkey.upper(), len(items)))

    if image_id == "image-openbh":
        ver = extra or "6.0"
        html = fetch_url_raw("https://images.openbh.net/?b=%s%%2F%s" % (ver, bkey), timeout=10) or ""
        boxes = sorted(set(re.findall(r"\?b=%s(?:%%2F|/)%s(?:%%2F|/)([a-zA-Z0-9_-]+)" % (re.escape(ver), re.escape(bkey)), html)))
        items = [{"label": b, "key": b, "extra": ver + "|" + bkey} for b in boxes]
        return ("image_boxes", _pin_my_box(items, my_box, ""), "OpenBH %s — %s (%d)" % (ver, bkey.upper(), len(items)))

    if image_id == "image-openspa":
        items = []
        if isinstance(extra, dict):
            for node in extra.get("items", []):
                if node.get("type") == "folder":
                    items.append({"label": to_e2_str(node.get("name", "")), "key": to_e2_str(node.get("name", "")), "extra": node})
        return ("image_boxes", _pin_my_box(items, my_box, ""), "OpenSPA — %s (%d)" % (bkey, len(items)))

    if image_id == "image-pure2":
        ver = extra or "7.6"
        builds = fetch_image_builds("image-pure2", {"label": bkey, "key": bkey, "extra": ver})
        return ("image_builds", builds, "PurE2 %s — %s (%d)" % (ver, bkey.upper(), len(builds)))

    if image_id == "image-opendroid":
        ver = extra or "8.1.2"
        html = fetch_url_raw("https://opendroid.org/%s/%s/" % (ver, url_quote(bkey)), timeout=10) or ""
        boxes = sorted(set(re.findall(r"index\.php\?open=([a-zA-Z0-9_-]+)", html)))
        items = [{"label": b, "key": b, "extra": ver + "|" + bkey} for b in boxes]
        return ("image_boxes", _pin_my_box(items, my_box, ""), "OpenDroid %s — %s (%d)" % (ver, bkey, len(items)))

    return ("image_boxes", [], "Select Receiver")


def fetch_image_builds(image_id, box_item):
    bkey = box_item["key"]
    extra = box_item.get("extra", "")
    builds = []

    if image_id == "image-openatv":
        raw = fetch_url_raw("https://images.mynonpublic.com/openatv/json/%s" % bkey, timeout=10)
        if raw:
            try:
                data = json.loads(raw)
                ver_keys = sorted(data.keys(), key=lambda k: (0 if "EOL" in k else 1, _ver_sort_key(k)), reverse=True)
                for vk in ver_keys:
                    entry_map = data.get(vk)
                    if not isinstance(entry_map, dict):
                        continue
                    sorted_files = sorted(entry_map.values(), key=lambda x: x.get("date", 0) if isinstance(x, dict) else 0, reverse=True)
                    for f in sorted_files[:4]:
                        if not isinstance(f, dict) or not f.get("link"):
                            continue
                        fname = to_e2_str(f.get("name", f["link"].split("/")[-1]))
                        sz_mb = "%.1f MB" % (float(f.get("size", 0)) / 1048576.0) if f.get("size") else "Official ZIP"
                        builds.append({"filename": fname, "url": to_e2_str(f["link"]), "label": "[%s] %s (%s)" % (vk, fname, sz_mb), "size": sz_mb})
            except Exception:
                pass
        return builds[:20]

    if image_id == "image-openpli":
        path = extra if extra else ("/download/vuplus/" + bkey)
        html = fetch_url_raw("https://openpli.org" + path, timeout=10) or ""
        zips = re.findall(r'''(https?://downloads\.openpli\.org/[^\s"'<>]+\.zip)''', html)
        seen = set()
        for u in zips:
            if u not in seen:
                seen.add(u)
                fname = u.split("/")[-1]
                builds.append({"filename": fname, "url": u, "label": fname, "size": "Official ZIP"})
        return builds[:15]

    if image_id in ("image-openbh", "image-blackhole"):
        parts = extra.split("|") if "|" in str(extra) else ["6.0", "vuplus"]
        ver, brand = parts[0], parts[1]
        html = fetch_url_raw("https://images.openbh.net/?b=%s%%2F%s%%2F%s" % (ver, brand, bkey), timeout=10) or ""
        links = re.findall(r'''href=["'](/download\.php\?file=[^"']+\.zip)["']''', html)
        seen = set()
        for l in links:
            full = "https://images.openbh.net" + l
            if full not in seen:
                seen.add(full)
                fname = l.split("/")[-1]
                builds.append({"filename": fname, "url": full, "label": fname, "size": "Official ZIP"})
        return builds[:15]

    if image_id == "image-egami":
        ver = extra or "11.0"
        html = fetch_url_raw("https://image.egami-image.com/%s/index.php?open=%s" % (ver, bkey), timeout=10) or ""
        links = re.findall(r'''href=["']([^"']+\.zip)["']''', html)
        seen = set()
        for l in links:
            if "egami" not in l.lower():
                continue
            full = l if l.startswith("http") else ("https://image.egami-image.com/%s/%s" % (ver, l.lstrip("/")))
            if full not in seen:
                seen.add(full)
                fname = full.split("/")[-1]
                builds.append({"filename": fname, "url": full, "label": fname, "size": "Official ZIP"})
        return builds[:15]

    if image_id == "image-openvix":
        html = fetch_url_raw("https://www.openvix.co.uk/openvix-builds/%s/" % bkey, timeout=10) or ""
        links = re.findall(r'''href=["']([^"']+\.zip)["']''', html)
        for l in reversed(links):
            fname = l.split("/")[-1]
            full = l if l.startswith("http") else ("https://www.openvix.co.uk/openvix-builds/%s/%s" % (bkey, l.lstrip("/")))
            builds.append({"filename": fname, "url": full, "label": fname, "size": "Official ZIP"})
        return builds[:15]

    if image_id == "image-openhdf":
        html = fetch_url_raw("https://v75.hdfreaks.cc/%s/" % bkey, timeout=10) or ""
        links = re.findall(r'''href=["']([^"']+\.zip)["']''', html)
        for l in reversed(links):
            fname = l.split("/")[-1]
            full = l if l.startswith("http") else ("https://v75.hdfreaks.cc/%s/%s" % (bkey, l.lstrip("/")))
            builds.append({"filename": fname, "url": full, "label": fname, "size": "Official ZIP"})
        return builds[:15]

    if image_id == "image-openspa":
        if isinstance(extra, dict):
            files = [n for n in extra.get("items", []) if n.get("type") == "file" and str(n.get("name", "")).endswith(".zip")]
            files.sort(key=lambda x: str(x.get("name", "")), reverse=True)
            for f in files[:15]:
                fname = to_e2_str(f.get("name", ""))
                fpath = to_e2_str(f.get("path", ""))
                encoded = "/".join([url_quote(seg) for seg in fpath.split("/")])
                sz_mb = "%.1f MB" % (float(f.get("size", 0)) / 1048576.0) if f.get("size") else "Official ZIP"
                builds.append({"filename": fname, "url": "https://openspa.webhop.info/" + encoded, "label": "%s (%s)" % (fname, sz_mb), "size": sz_mb})
        return builds

    if image_id == "image-pure2":
        ver = extra or "7.6"
        html = fetch_url_raw("https://www.pur-e2.club/OU/images/index.php?dir=%s/%s/" % (ver, bkey), timeout=10) or ""
        fnames = re.findall(r'''file=([^"'&]+\.zip)''', html)
        seen = set()
        for fn in reversed(fnames):
            if fn not in seen:
                seen.add(fn)
                full = "https://www.pur-e2.club/OU/images/%s/%s/%s" % (ver, bkey, url_quote(fn))
                builds.append({"filename": fn, "url": full, "label": fn, "size": "Official ZIP"})
        return builds[:25]

    if image_id == "image-opendroid":
        parts = extra.split("|") if "|" in str(extra) else ["8.1.2", "Vu+"]
        ver, brand = parts[0], parts[1]
        html = fetch_url_raw("https://opendroid.org/%s/%s/index.php?open=%s" % (ver, url_quote(brand), bkey), timeout=10) or ""
        links = re.findall(r'''href=["']([^"']+\.zip)["']''', html)
        seen = set()
        for l in links:
            full = l if l.startswith("http") else ("https://opendroid.org/%s/%s/%s" % (ver, url_quote(brand), l.lstrip("/")))
            if full not in seen:
                seen.add(full)
                fname = full.split("/")[-1]
                builds.append({"filename": fname, "url": full, "label": fname, "size": "Official ZIP"})
        return builds[:15]

    if image_id == "image-hdsatelit":
        html = fetch_url_raw("https://stb.hdsatelit.com/en/receptoare/%s/" % bkey, timeout=12) or ""
        links = re.findall(r'''href=["'](/descarcari/[^"']+\.zip)["']''', html)
        seen = set()
        for l in links:
            full = "https://stb.hdsatelit.com" + l
            if full not in seen:
                seen.add(full)
                fname = l.split("/")[-1]
                builds.append({"filename": fname, "url": full, "label": fname, "size": "Official ZIP"})
        return builds[:15]

    if image_id == "image-hyperion":
        cid = str(extra or "3")
        html = fetch_url_raw("https://zukon.pl/app.php/downloadsystemcat?id=%s" % cid, timeout=12) or ""
        dl_ids = re.findall(r'''href=["'](/app\.php/downloadsystemdownload\?id=([0-9]+))[^"']*["']''', html)
        raw_zips = re.findall(r'''(hyperion-[^"'<\s]+\.zip)''', html, re.I)
        unique_zips = []
        for z in raw_zips:
            if not unique_zips or unique_zips[-1] != z:
                unique_zips.append(z)
        paired = []
        for idx, (_p, fid) in enumerate(dl_ids):
            fname = unique_zips[idx] if idx < len(unique_zips) else ("hyperion_zukonmod_%s.zip" % fid)
            full = "https://zukon.pl/app.php/downloadsystemdownload?id=%s" % fid
            paired.append({"filename": fname, "url": full, "label": fname, "size": "Official ZIP"})
        paired.reverse()
        return paired[:15]

    return builds


def get_free_flash_mb(path="/"):
    candidates = []
    check_paths = [path]
    if path == "/" and os.path.isdir("/usr"):
        check_paths.append("/usr")
    for p in check_paths:
        try:
            st = os.statvfs(p)
            free_bytes = float(st.f_bavail) * float(st.f_frsize)
            candidates.append(round(free_bytes / (1024.0 * 1024.0), 1))
        except Exception:
            pass
    if not candidates:
        return None
    return min(candidates)


def get_free_ram_mb():
    try:
        info = {}
        with open("/proc/meminfo", "r") as f:
            for ln in f:
                parts = ln.split()
                if len(parts) >= 2:
                    key = parts[0].rstrip(":")
                    if key in ("MemAvailable", "MemFree", "Buffers", "Cached"):
                        info[key] = float(parts[1])
        if "MemAvailable" in info:
            return round(info["MemAvailable"] / 1024.0, 1)
        if "MemFree" in info:
            kb = info.get("MemFree", 0.0) + info.get("Buffers", 0.0) + info.get("Cached", 0.0)
            return round(kb / 1024.0, 1)
    except Exception:
        pass
    return None


def _clean_live_version(raw_val):
    if not raw_val:
        return None
    v = to_e2_str(raw_val).strip().strip('"').strip("'").strip()
    if v.lower().startswith("v") and len(v) > 1 and v[1].isdigit():
        v = v[1:]
    if not v or len(v) > 24 or "<html" in v.lower() or "404" == v or "not found" in v.lower():
        return None
    if not re.match(r"^[0-9A-Za-z._+-]{1,24}$", v):
        return None
    if not any(ch.isdigit() for ch in v):
        return None
    return v


def resolve_live_version_url(plugin):
    cmd = str(plugin.get("cmd_opkg", "") or "") + " " + str(plugin.get("cmd_dpkg", "") or "")
    pid = str(plugin.get("id", "") or "").lower()
    urls = []

    if "islam-2412/IPKS" in cmd or "fury" in pid:
        urls.append(("text", "https://raw.githubusercontent.com/islam-2412/IPKS/main/fury/furyversion.txt"))
    if "mido00020/MohammedSkin" in cmd or "mohammedskin" in pid:
        urls.append(("text", "https://raw.githubusercontent.com/mido00020/MohammedSkin/main/version.txt"))
    if "biko-73/AjPanel" in cmd or "AMA-Team/AJPanel" in cmd or pid == "ajpanel":
        urls.append(("text", "https://raw.githubusercontent.com/AMA-Team/AJPanel/main/version"))
        urls.append(("text", "https://raw.githubusercontent.com/biko-73/AjPanel/main/version"))
    if "quran_mizouh" in cmd or pid == "quran-mizouh":
        urls.append(("json", "https://raw.githubusercontent.com/mizouh1984/quran_mizouh/main/version.json"))
    if "KravenHD/KravenHD" in cmd or pid == "kraven-hd":
        urls.append(("control", "https://raw.githubusercontent.com/KravenHD/KravenHD/master/CONTROL/control"))
    if "KravenHD/KravenFHD" in cmd or pid == "kraven-fhd":
        urls.append(("control", "https://raw.githubusercontent.com/KravenHD/KravenFHD/master/CONTROL/control"))

    m = re.search(r'''(https://gitlab\.com/eliesat/extensions/-/raw/main/[^/\s"']+)/[^/\s"']+\.sh''', cmd)
    if m:
        urls.append(("text", m.group(1) + "/version"))
    m2 = re.search(r'''(https://gitlab\.com/eliesat/skins/-/raw/main/all/([^/\s"']+))/[^/\s"']+\.sh''', cmd)
    if m2:
        urls.append(("text", m2.group(1) + "/" + m2.group(2) + "/version"))
        urls.append(("text", m2.group(1) + "/version"))
    m3 = re.search(r'''(https://gitlab\.com/eliesat/(?:softcams|display|settings|scripts|drivers)/-/raw/main/[^/\s"']+)/[^/\s"']+\.sh''', cmd)
    if m3:
        urls.append(("text", m3.group(1) + "/version"))
    if "eliesat/eliesatpanel/-/raw/main/eliesatpanel.sh" in cmd:
        urls.append(("text", "https://gitlab.com/eliesat/eliesatpanel/-/raw/main/version.txt"))

    m_sh = re.search(r'''(https?://[^\s"'<>]+\.sh)''', cmd)
    if m_sh:
        sh_url = m_sh.group(1)
        if ("github.com/" in sh_url or "raw.githubusercontent.com/" in sh_url or "gitlab.com/" in sh_url):
            urls.append(("script", sh_url))

    return urls


def _parse_version_from_script(script_text):
    if not script_text:
        return None
    head = script_text[:10240]
    patterns = (
        r'''(?m)^\s*(?:version|VERSION|ver|VER|PACKAGE_VERSION|PLUGIN_VER|PKG_VER|rel|RELEASE)\s*=\s*["']?([^"'\s#;]+)["']?''',
        r'''(?i)(?:version|ver)[\s:=]+v?([0-9]+\.[0-9][0-9A-Za-z._-]*)''',
        r'''[_-]v?([0-9]+\.[0-9]+(?:\.[0-9A-Za-z-]+)?)(?:[-_](?:all|py3|py2|arm|mipsel|aarch64|r[0-9]+))?\.(?:ipk|deb|tar\.gz)''',
    )
    for pat in patterns:
        m = re.search(pat, head)
        if m:
            cleaned = _clean_live_version(m.group(1))
            if cleaned:
                return cleaned
    return None


def fetch_live_plugin_version(plugin):
    pid = plugin.get("id", "")
    if pid in _LIVE_VER_CACHE:
        return _LIVE_VER_CACHE[pid]
    candidates = resolve_live_version_url(plugin)
    if not candidates:
        _LIVE_VER_CACHE[pid] = None
        return None
    for kind, vurl in candidates:
        txt = fetch_url_raw(vurl, timeout=3)
        if not txt:
            continue
        if kind == "text":
            lines = [ln.strip() for ln in txt.strip().splitlines() if ln.strip()]
            if lines:
                first = lines[0].split("#")[0].strip()
                if "=" in first:
                    first = first.split("=", 1)[1].strip()
                cleaned = _clean_live_version(first)
                if cleaned:
                    _LIVE_VER_CACHE[pid] = cleaned
                    return cleaned
        elif kind == "json":
            try:
                parsed = json.loads(txt)
                if isinstance(parsed, dict):
                    cleaned = _clean_live_version(parsed.get("version") or parsed.get("ver"))
                    if cleaned:
                        _LIVE_VER_CACHE[pid] = cleaned
                        return cleaned
            except Exception:
                pass
        elif kind == "control":
            m_ctrl = re.search(r"(?m)^Version:\s*(\S+)", txt)
            if m_ctrl:
                cleaned = _clean_live_version(m_ctrl.group(1))
                if cleaned:
                    _LIVE_VER_CACHE[pid] = cleaned
                    return cleaned
        elif kind == "script":
            cleaned = _parse_version_from_script(txt)
            if cleaned:
                _LIVE_VER_CACHE[pid] = cleaned
                return cleaned
    _LIVE_VER_CACHE[pid] = None
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
    def __init__(self, session):
        prefs = load_panel_settings()
        self.lang = prefs["lang"]
        self.theme_id = prefs["theme"]
        self.layout_id = prefs["layout"]
        self.skin = build_skin(self.theme_id, self.layout_id, DESKTOP_WIDTH)

        Screen.__init__(self, session)
        self.session = session
        self.mode = "categories"
        self.current_category = "all"
        self.current_uninstall_filter = "all"
        self.pending_remove_item = None
        self.doctor_items = []
        self.pending_repair_item = None
        self.pending_install_plugin = None
        self.pending_update_ver = ""
        self.current_image_id = None
        self.current_image_title = ""
        self.current_image_brand = None
        self.current_image_box = None
        self.image_has_brands = False
        self.pending_image_build = None
        self.detected_box, self.detected_brand = detect_box_info()
        self.catalog = list(PLUGIN_CATALOG)
        self.remote_changelog = []
        self.is_cloud_synced = False

        self["header"] = Label("mizou1984 E2 Store")
        self["brand"] = Label("%s  |  v%s" % (BRAND_MARK, PLUGIN_VERSION))
        self["sysinfo"] = Label("")
        self["list_title"] = Label("")
        self["list"] = MenuList([])

        self["detail_kicker"] = Label("")
        self["detail_title"] = Label("mizou1984 E2 Store")
        self["detail_meta"] = Label("")
        self["detail_desc"] = Label("")
        self["detail_status"] = Label("")
        self["detail_hint"] = Label("")

        self["key_red"] = Label("")
        self["key_green"] = Label("")
        self["key_yellow"] = Label("")
        self["key_blue"] = Label("")
        self["key_menu"] = Label("")

        try:
            self["list"].onSelectionChanged.append(self.updateInspector)
        except Exception:
            pass

        self.verTimer = eTimer()
        try:
            self.verTimer.callback.append(self.refreshSelectedPluginLiveVersion)
        except AttributeError:
            self.verTimer_conn = self.verTimer.timeout.connect(self.refreshSelectedPluginLiveVersion)

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
                "menu": self.onOpenMenu,
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

        self.applyStaticLabels()
        self.refreshHeaderInfo()
        self.loadCategories()
        if UPDATE_FEED_BASE:
            self.onLayoutFinish.append(self.startSilentCheck)

    def t(self, key):
        return tr_text(self.lang, key)

    def applyStaticLabels(self):
        if self.mode == "doctor_list":
            self["key_yellow"].setText(self.t("doctor_repair_all"))
            self["detail_hint"].setText(self.t("doctor_hint"))
        elif self.mode in ("uninstall_menu", "uninstall_list"):
            self["key_yellow"].setText(self.t("auto_update"))
            self["detail_hint"].setText(self.t("hint_uninstall"))
        else:
            self["key_yellow"].setText(self.t("auto_update"))
            self["detail_hint"].setText(self.t("hint_main"))
        self["key_blue"].setText(self.t("update_store"))
        self["key_menu"].setText(self.t("menu_btn"))

    def startSilentCheck(self):
        self.syncTimer.start(600, True)

    def silentBackgroundCheck(self):
        if not UPDATE_FEED_BASE:
            return
        raw_cat = fetch_remote_text(UPDATE_FEED_BASE + "/catalog.json", timeout=3)
        if raw_cat:
            try:
                parsed = json.loads(raw_cat)
                changelog = parsed.get("changelog")
                if isinstance(changelog, list):
                    self.remote_changelog = changelog
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

        remote_ver = fetch_remote_text(UPDATE_FEED_BASE + "/version.txt", timeout=3)
        if is_valid_version(remote_ver) and remote_ver.strip() != PLUGIN_VERSION:
            self.pending_update_ver = remote_ver.strip()
            self.session.openWithCallback(
                self.confirmStoreUpdate,
                MessageBox,
                format_update_message(self.lang, self.pending_update_ver, self.remote_changelog),
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
                self.t("unreachable"),
                MessageBox.TYPE_WARNING,
            )
        elif remote_ver.strip() == PLUGIN_VERSION:
            self.session.open(
                MessageBox,
                self.t("up_to_date") % PLUGIN_VERSION,
                MessageBox.TYPE_INFO,
            )
        else:
            self.pending_update_ver = remote_ver.strip()
            notes = list(self.remote_changelog)
            raw_cat = fetch_remote_text(UPDATE_FEED_BASE + "/catalog.json", timeout=4)
            if raw_cat:
                try:
                    parsed = json.loads(raw_cat)
                    if isinstance(parsed.get("changelog"), list):
                        notes = parsed.get("changelog")
                        self.remote_changelog = notes
                except Exception:
                    pass
            self.session.openWithCallback(
                self.confirmStoreUpdate,
                MessageBox,
                format_update_message(self.lang, self.pending_update_ver, notes),
                MessageBox.TYPE_YESNO,
            )

    def confirmStoreUpdate(self, answer):
        if answer and UPDATE_FEED_BASE:
            ts = int(time.time())
            raw_url = "%s/installer.sh?t=%d" % (UPDATE_FEED_BASE, ts)
            py_url = "%s/plugin.py?t=%d" % (UPDATE_FEED_BASE, ts)
            exp_ver = to_e2_str(getattr(self, "pending_update_ver", "") or "")
            cmd = (
                'rm -f /tmp/mizou1984_update.sh /tmp/mizou1984_update.clean /tmp/mizou1984_plugin_new.py; '
                'echo "============================================================"; '
                'echo "[mizou1984] Downloading Store Update (Expected: v%s)..."; '
                'echo "============================================================"; '
                '(curl -fsSLk -H "Cache-Control: no-cache" -o /tmp/mizou1984_update.sh "%s" 2>/dev/null '
                '|| wget --no-check-certificate -q -O /tmp/mizou1984_update.sh "%s"); '
                'if [ -s /tmp/mizou1984_update.sh ]; then '
                r'tr -d "\015" < /tmp/mizou1984_update.sh > /tmp/mizou1984_update.clean && mv -f /tmp/mizou1984_update.clean /tmp/mizou1984_update.sh; '
                """DL_VER=$(awk -F'"' '/^PLUGIN_VERSION = /{print $2; exit}' /tmp/mizou1984_update.sh 2>/dev/null); """
                'echo "[mizou1984] Downloaded installer.sh version: v$DL_VER"; '
                'if grep -q "EOF_MIZOU1984_UPDATER" /tmp/mizou1984_update.sh 2>/dev/null && [ -n "$DL_VER" ] && [ "$DL_VER" != "%s" ]; then '
                'chmod +x /tmp/mizou1984_update.sh && /bin/sh /tmp/mizou1984_update.sh; '
                'else '
                'echo "[mizou1984] installer.sh on server is still v$DL_VER (expected v%s) or incomplete — checking direct plugin.py..."; '
                '(curl -fsSLk -H "Cache-Control: no-cache" -o /tmp/mizou1984_plugin_new.py "%s" 2>/dev/null '
                '|| wget --no-check-certificate -q -O /tmp/mizou1984_plugin_new.py "%s"); '
                'if [ -s /tmp/mizou1984_plugin_new.py ] && grep -q "Mizou1984StoreScreen" /tmp/mizou1984_plugin_new.py 2>/dev/null; then '
                r'tr -d "\015" < /tmp/mizou1984_plugin_new.py > "%s/plugin.py"; '
                'rm -rf "%s/__pycache__" "%s"/*.pyc "%s"/*.pyo; '
                '(python3 -m py_compile "%s/plugin.py" 2>/dev/null || python -m py_compile "%s/plugin.py" 2>/dev/null || true); '
                '[ -n "%s" ] && echo "%s" > "%s/store_version.txt"; '
                'echo "[mizou1984] Updated plugin.py directly! Restarting Enigma2 GUI..."; '
                'sync; sleep 1; '
                '(wget -qO- "http://127.0.0.1/web/powerstate?newstate=3" >/dev/null 2>&1 || true); '
                '(sleep 2; if [ -f /var/lib/dpkg/status ]; then systemctl restart enigma2; else killall -9 enigma2; fi) >/dev/null 2>&1 & '
                'else '
                'echo "[mizou1984] ERROR: installer.sh on GitHub is still v$DL_VER! Please upload the new v%s installer.sh to your repo."; '
                'fi; fi; '
                'else echo "[mizou1984] Update download failed — check internet connection."; fi'
            ) % (
                exp_ver,
                raw_url,
                raw_url,
                PLUGIN_VERSION,
                exp_ver,
                py_url,
                py_url,
                PLUGIN_DIR,
                PLUGIN_DIR,
                PLUGIN_DIR,
                PLUGIN_DIR,
                PLUGIN_DIR,
                PLUGIN_DIR,
                exp_ver,
                exp_ver,
                STATE_DIR,
                exp_ver,
            )
            self.session.open(
                Console,
                title="Updating mizou1984 Exclusive E2 Store -> v%s..." % (exp_ver or "Latest"),
                cmdlist=[cmd],
            )

    def refreshHeaderInfo(self):
        py_ver = "%d.%d" % (sys.version_info[0], sys.version_info[1])
        pkg_short = "DreamOS" if IS_DREAMOS else "OE2/opkg"
        sync_label = self.t("cloud_synced") if self.is_cloud_synced else self.t("direct_sources")
        theme_name = PANEL_THEMES.get(self.theme_id, PANEL_THEMES["midnight_cyan"])["name"]
        free_mb = get_free_flash_mb("/")
        ram_mb = get_free_ram_mb()
        parts = [pkg_short, "Py %s" % py_ver]
        if free_mb is not None:
            parts.append((self.t("flash_low_lbl") if free_mb < 25.0 else self.t("flash_free_lbl")) % free_mb)
        if ram_mb is not None:
            parts.append(self.t("ram_free_lbl") % ram_mb)
        parts.append(sync_label)
        self["sysinfo"].setText("  |  ".join(parts))
        self["detail_status"].setText(
            self.t("status_line")
            % (BRAND_MARK, PLUGIN_VERSION, AUTO_SCHEDULE, theme_name, get_lang_name(self.lang))
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
            if cat_id == "__doctor__":
                self["detail_kicker"].setText(self.t("doctor_kicker"))
                self["detail_title"].setText(self.t("cat_doctor"))
                self["detail_meta"].setText(
                    "%s\n%s" % (self.t("compat"), "Python Syntax | Missing Modules | __init__.py | .pyc | Crash Logs | opkg/dpkg")
                )
                self["detail_desc"].setText(self.t("cat_doctor_desc"))
                return
            if cat_id == "__uninstall__":
                self["detail_kicker"].setText(self.t("uninstall_kicker"))
                self["detail_title"].setText(self.t("cat_uninstall"))
                self["detail_meta"].setText(
                    "%s\n%s" % (self.t("compat"), "opkg / dpkg / /Extensions / /skins / /usr/bin")
                )
                self["detail_desc"].setText(self.t("cat_uninstall_desc"))
                return
            cat_meta = [c for c in CATEGORIES if c[0] == cat_id]
            title = self.t(cat_meta[0][1]) if cat_meta else cat_id
            desc = cat_meta[0][2] if cat_meta else ""
            count = len(self.catalog) if cat_id == "all" else len([p for p in self.catalog if p.get("category") == cat_id])
            self["detail_kicker"].setText(self.t("cat_overview"))
            self["detail_title"].setText(title)
            self["detail_meta"].setText(
                "%s\n%s\n%s"
                % (self.t("plugins_avail") % count, self.t("source_mode"), self.t("compat"))
            )
            self["detail_desc"].setText(desc)
        elif self.mode == "plugins":
            p = sel[1]
            dev = to_e2_str(p.get("developer", "Official Developer"))
            pid = p.get("id", "")
            cached_v = _LIVE_VER_CACHE.get(pid)
            ver = to_e2_str(cached_v if cached_v else p.get("version", "Latest"))
            ver_display = "%s [%s]" % (ver, self.t("ver_live_tag")) if cached_v else ver
            size = to_e2_str(p.get("size", "Auto"))
            desc = to_e2_str(p.get("description", "Official Enigma2 plugin updated automatically from its developer source."))
            self["detail_kicker"].setText(self.t("plugin_details"))
            self["detail_title"].setText(to_e2_str(p.get("name", pid)))
            self["detail_meta"].setText(
                "%s\n%s\n%s"
                % (
                    self.t("dev_label") % dev,
                    self.t("ver_size") % (ver_display, size),
                    self.t("fmt_label") % (".deb (DreamOS)" if IS_DREAMOS else ".ipk (opkg)"),
                )
            )
            self["detail_desc"].setText(desc)
            if pid not in _LIVE_VER_CACHE and pid not in LIVE_IMAGE_IDS and pid not in INTERACTIVE_BACKUP_IDS:
                try:
                    self.verTimer.stop()
                    self.verTimer.start(250, True)
                except Exception:
                    pass
        elif self.mode in ("image_brands", "image_boxes", "image_builds"):
            item = sel[1]
            my_box_lbl = self.detected_box if self.detected_box else "Auto"
            self["detail_kicker"].setText("OFFICIAL IMAGE BROWSER  |  LIVE MIRROR")
            if not item:
                self["detail_title"].setText(self.current_image_title or "No builds found")
                self["detail_meta"].setText("Detected Receiver: %s" % my_box_lbl)
                self["detail_desc"].setText("Press RED to go back and try another brand or receiver.")
                return
            if self.mode == "image_builds":
                self["detail_title"].setText(to_e2_str(item.get("filename", "")))
                self["detail_meta"].setText(
                    "Image: %s\nSize: %s\nReceiver: %s"
                    % (self.current_image_title, to_e2_str(item.get("size", "Official ZIP")), my_box_lbl)
                )
                self["detail_desc"].setText("Press OK / GREEN to choose save folder (/media/hdd/images or /media/usb/images) and download this official image directly.")
            else:
                self["detail_title"].setText(to_e2_str(item.get("label", "")))
                self["detail_meta"].setText(
                    "Image: %s\nYour Receiver: %s\nSource: Official Live Mirror"
                    % (self.current_image_title, my_box_lbl)
                )
                self["detail_desc"].setText("Press OK to browse all available latest official builds for this receiver and download directly to HDD / USB.")
        elif self.mode == "uninstall_menu":
            bucket_id = sel[1]
            self["detail_kicker"].setText(self.t("uninstall_kicker"))
            self["detail_title"].setText(sel[0].strip())
            self["detail_meta"].setText(
                "Filter: %s\nManager: %s" % (bucket_id.upper(), "dpkg (DreamOS)" if IS_DREAMOS else "opkg + Filesystem")
            )
            self["detail_desc"].setText(self.t("cat_uninstall_desc"))
        elif self.mode == "uninstall_list":
            item = sel[1]
            if not item:
                self["detail_kicker"].setText(self.t("uninstall_kicker"))
                self["detail_title"].setText(self.t("u_empty"))
                self["detail_meta"].setText("")
                self["detail_desc"].setText("")
                return
            kind = item.get("kind")
            if kind == "pkg":
                type_label = self.t("u_type_pkg") % ("dpkg" if IS_DREAMOS else "opkg")
            elif kind == "bin":
                type_label = self.t("u_type_bin")
            else:
                type_label = self.t("u_type_dir")
            self["detail_kicker"].setText(self.t("uninstall_kicker"))
            self["detail_title"].setText(to_e2_str(item.get("name", "")))
            self["detail_meta"].setText(
                "Type: %s\nVersion: %s\nTarget: %s"
                % (type_label, to_e2_str(item.get("version", "")), to_e2_str(item.get("target", "")))
            )
            self["detail_desc"].setText(self.t("hint_uninstall"))
        elif self.mode == "doctor_list":
            item = sel[1]
            self["detail_kicker"].setText(self.t("doctor_kicker"))
            if not item:
                self["detail_title"].setText(self.t("d_empty"))
                self["detail_meta"].setText("")
                self["detail_desc"].setText("")
                return
            st = item.get("status", "healthy")
            st_lbl = self.t("d_broken") if st == "broken" else (self.t("d_stopped") if st == "stopped" else self.t("d_healthy"))
            self["detail_title"].setText("%s  [%s]" % (to_e2_str(item.get("name", "")), st_lbl))
            self["detail_meta"].setText(
                "Status: %s   |   Scope: %s\nPath: %s"
                % (st_lbl, to_e2_str(item.get("scope", "Extensions")), to_e2_str(item.get("path", "")))
            )
            self["detail_desc"].setText(
                "Cause: %s\nAuto-Fix: %s"
                % (to_e2_str(item.get("reason", "")), to_e2_str(item.get("fix_summary", "")))
            )

    def refreshSelectedPluginLiveVersion(self):
        if self.mode != "plugins":
            return
        sel = self["list"].getCurrent()
        if not sel or not isinstance(sel[1], dict):
            return
        p = sel[1]
        live_v = fetch_live_plugin_version(p)
        if live_v:
            p["version"] = live_v
            try:
                idx = self["list"].getSelectedIndex()
                cur_list = list(self["list"].list)
                if 0 <= idx < len(cur_list):
                    dev = to_e2_str(p.get("developer", ""))
                    pname = to_e2_str(p.get("name", p.get("id")))
                    live_tag = self.t("ver_live_tag")
                    new_lbl = "  %s  v%s [%s]  (%s)" % (pname, to_e2_str(live_v), live_tag, dev) if dev else "  %s  v%s" % (pname, to_e2_str(live_v))
                    cur_list[idx] = (new_lbl, p)
                    self["list"].setList(cur_list)
                    self["list"].moveToIndex(idx)
            except Exception:
                pass
            self.updateInspector()

    def loadCategories(self):
        self.mode = "categories"
        entries = []
        for cat_id, cat_key, _desc in CATEGORIES:
            count = len(self.catalog) if cat_id == "all" else len([p for p in self.catalog if p.get("category") == cat_id])
            if count > 0:
                entries.append(("  %s   [%d]" % (self.t(cat_key), count), cat_id))
        entries.append(("  [+]  %s" % self.t("cat_doctor"), "__doctor__"))
        entries.append(("  [X]  %s" % self.t("cat_uninstall"), "__uninstall__"))
        self["list_title"].setText(self.t("store_categories") % len(self.catalog))
        self["list"].setList(entries)
        self["key_red"].setText(self.t("exit"))
        self["key_green"].setText(self.t("open_cat"))
        self.applyStaticLabels()
        self.updateInspector()

    def loadDoctorScan(self):
        self.mode = "doctor_list"
        self.doctor_items = scan_plugins_health(self.catalog)
        n_broken = len([x for x in self.doctor_items if x["status"] == "broken"])
        n_stopped = len([x for x in self.doctor_items if x["status"] == "stopped"])
        n_ok = len([x for x in self.doctor_items if x["status"] == "healthy"])
        entries = []
        for it in self.doctor_items:
            st = it["status"]
            if st == "broken":
                badge = "[! %s]" % self.t("d_broken")
            elif st == "stopped":
                badge = "[~ %s]" % self.t("d_stopped")
            else:
                badge = "[OK %s]" % self.t("d_healthy")
            short_reason = to_e2_str(it.get("reason", ""))
            if len(short_reason) > 48:
                short_reason = short_reason[:45] + "..."
            label = "  %s  %s  —  %s" % (badge, it["name"], short_reason) if st != "healthy" else "  %s  %s" % (badge, it["name"])
            entries.append((label, it))
        if not entries:
            entries.append(("  %s" % self.t("d_empty"), None))
        self["list_title"].setText(self.t("doctor_title") % (n_broken, n_stopped, n_ok))
        self["list"].setList(entries)
        self["key_red"].setText(self.t("back"))
        self["key_green"].setText(self.t("doctor_repair"))
        self.applyStaticLabels()
        self.updateInspector()

    def onDoctorRepairFinished(self, *args):
        self.loadDoctorScan()

    def confirmRepairOne(self, answer):
        item = self.pending_repair_item
        self.pending_repair_item = None
        if not answer or not item:
            return
        cmd = build_plugin_repair_cmd(item)
        self.session.openWithCallback(
            self.onDoctorRepairFinished,
            Console,
            title="mizou1984 Doctor — Repairing %s" % to_e2_str(item.get("name", "")),
            cmdlist=[cmd],
        )

    def confirmRepairAll(self, answer):
        if not answer:
            return
        cmd = build_repair_all_cmd(self.doctor_items)
        self.session.openWithCallback(
            self.onDoctorRepairFinished,
            Console,
            title="mizou1984 Doctor — Auto-Repairing All Issues",
            cmdlist=[cmd],
        )

    def loadPlugins(self, cat_id):
        self.mode = "plugins"
        self.current_category = cat_id
        filtered = list(self.catalog) if cat_id == "all" else [p for p in self.catalog if p.get("category") == cat_id]
        filtered.sort(key=lambda p: to_e2_str(p.get("name", p.get("id", ""))).lower())
        entries = []
        for p in filtered:
            dev = to_e2_str(p.get("developer", ""))
            ver = to_e2_str(p.get("version", ""))
            pname = to_e2_str(p.get("name", p.get("id")))
            label = "  %s  v%s  (%s)" % (pname, ver, dev) if dev else "  %s" % pname
            entries.append((label, p))
        self["list_title"].setText(self.t("plugins_in_cat") % len(entries))
        self["list"].setList(entries)
        self["key_red"].setText(self.t("back"))
        self["key_green"].setText(self.t("install"))
        self.applyStaticLabels()
        self.updateInspector()

    def loadUninstallMenu(self):
        self.mode = "uninstall_menu"
        entries = [
            ("  %s" % self.t("u_all"), "all"),
            ("  %s" % self.t("u_plugins"), "plugins"),
            ("  %s" % self.t("u_softcams"), "softcams"),
            ("  %s" % self.t("u_skins"), "skins"),
            ("  %s" % self.t("u_other"), "other_pkg"),
            ("  %s" % self.t("u_manual"), "manual"),
        ]
        self["list_title"].setText(self.t("uninstall_title"))
        self["list"].setList(entries)
        self["key_red"].setText(self.t("back"))
        self["key_green"].setText(self.t("open_cat"))
        self.applyStaticLabels()
        self.updateInspector()

    def loadUninstallList(self, filter_kind):
        self.mode = "uninstall_list"
        self.current_uninstall_filter = filter_kind
        found = scan_installed_items(filter_kind)
        entries = []
        for item in found:
            label = "  %s  %s  (%s)" % (item["tag"], item["name"], item["version"])
            entries.append((label, item))
        if not entries:
            entries.append(("  %s" % self.t("u_empty"), None))
        self["list_title"].setText(self.t("uninstall_list_title") % len(found))
        self["list"].setList(entries)
        self["key_red"].setText(self.t("back"))
        self["key_green"].setText(self.t("remove"))
        self.applyStaticLabels()
        self.updateInspector()

    def onUninstallFinished(self, *args):
        self.loadUninstallList(self.current_uninstall_filter)

    def confirmRemoveItem(self, answer):
        item = self.pending_remove_item
        self.pending_remove_item = None
        if not answer or not item:
            return
        cmd = build_remove_command(item)
        self.session.openWithCallback(
            self.onUninstallFinished,
            Console,
            title=self.t("u_console_title") % to_e2_str(item.get("name", "")),
            cmdlist=[cmd],
        )

    def onOpenMenu(self):
        theme_name = PANEL_THEMES.get(self.theme_id, PANEL_THEMES["midnight_cyan"])["name"]
        choices = [
            (self.t("m_doctor"), "doctor"),
            (self.t("m_uninstall"), "uninstall"),
            (self.t("m_quick_filter"), "quick_filter"),
            (self.t("m_ram_boost"), "ram_boost"),
            (self.t("m_clean_junk"), "clean_junk"),
            (self.t("m_lang") % get_lang_name(self.lang), "lang"),
            (self.t("m_theme") % theme_name, "theme"),
            (self.t("m_layout") % get_layout_name(self.layout_id), "layout"),
            (self.t("m_update"), "update"),
            (self.t("m_upgrade"), "upgrade"),
            (self.t("m_restart_gui"), "restart_gui"),
            (self.t("m_about"), "about"),
        ]
        self.session.openWithCallback(
            self.onMenuChoice,
            ChoiceBox,
            title=self.t("menu_title"),
            list=choices,
        )

    def onMenuChoice(self, choice):
        if not choice:
            return
        action = choice[1]
        if action == "doctor":
            self.loadDoctorScan()
        elif action == "uninstall":
            self.loadUninstallMenu()
        elif action == "quick_filter":
            self.onQuickFilter()
        elif action == "ram_boost":
            self.onRamBoost()
        elif action == "clean_junk":
            self.onCleanJunk()
        elif action == "lang":
            opts = [
                ("%s  %s" % ("*" if lid == self.lang else " ", lname), lid)
                for lid, lname in PANEL_LANGUAGES
            ]
            self.session.openWithCallback(
                self.onLanguageSelected,
                ChoiceBox,
                title=self.t("choose_lang"),
                list=opts,
            )
        elif action == "theme":
            opts = [
                ("%s  %s" % ("*" if tid == self.theme_id else " ", PANEL_THEMES[tid]["name"]), tid)
                for tid in PANEL_THEME_ORDER
            ]
            self.session.openWithCallback(
                self.onThemeSelected,
                ChoiceBox,
                title=self.t("choose_theme"),
                list=opts,
            )
        elif action == "layout":
            opts = [
                ("%s  %s" % ("*" if lid == self.layout_id else " ", lname), lid)
                for lid, lname in PANEL_LAYOUTS
            ]
            self.session.openWithCallback(
                self.onLayoutSelected,
                ChoiceBox,
                title=self.t("choose_layout"),
                list=opts,
            )
        elif action == "update":
            self.onCheckStoreUpdate()
        elif action == "upgrade":
            self.onSystemUpgrade()
        elif action == "restart_gui":
            self.onRestartGui()
        elif action == "about":
            self.onShowAbout()

    def onQuickFilter(self):
        opts = [
            ("A - E  (Alphabetical)", "ae"),
            ("F - K  (Alphabetical)", "fk"),
            ("L - R  (Alphabetical)", "lr"),
            ("S - Z  (Alphabetical)", "sz"),
            ("Quran & Islamic  (mizouh / Mawaqit / Ramadan)", "quran"),
            ("Skins  (HD Glass 17 / KravenHD / Fury / MohammedSkin)", "skins"),
            ("IPTV  (JediMakerXtream / XCplugin / XStreamity)", "iptv"),
            ("Softcams & Free Servers  (OSCam / NCam / CCcam)", "softcams"),
        ]
        self.session.openWithCallback(
            self.onQuickFilterSelected,
            ChoiceBox,
            title=self.t("choose_filter"),
            list=opts,
        )

    def onQuickFilterSelected(self, choice):
        if not choice:
            return
        label_txt, fkey = choice[0], choice[1]
        items = []
        for p in self.catalog:
            pname = to_e2_str(p.get("name", p.get("id", ""))).strip()
            low = (pname + " " + to_e2_str(p.get("id", ""))).lower()
            first = pname[0].upper() if pname else ""
            if fkey == "ae" and "A" <= first <= "E":
                items.append(p)
            elif fkey == "fk" and "F" <= first <= "K":
                items.append(p)
            elif fkey == "lr" and "L" <= first <= "R":
                items.append(p)
            elif fkey == "sz" and "S" <= first <= "Z":
                items.append(p)
            elif fkey == "quran" and any(k in low for k in ("quran", "mawaqit", "ramadan", "islamic")):
                items.append(p)
            elif fkey == "skins" and p.get("category") == "skins":
                items.append(p)
            elif fkey == "iptv" and p.get("category") == "iptv":
                items.append(p)
            elif fkey == "softcams" and p.get("category") == "softcams":
                items.append(p)
        items.sort(key=lambda p: to_e2_str(p.get("name", p.get("id", ""))).lower())
        self.mode = "plugins"
        self.current_category = "all"
        entries = []
        for p in items:
            dev = to_e2_str(p.get("developer", ""))
            ver = to_e2_str(p.get("version", ""))
            pname = to_e2_str(p.get("name", p.get("id")))
            lbl = "  %s  v%s  (%s)" % (pname, ver, dev) if dev else "  %s" % pname
            entries.append((lbl, p))
        self["list_title"].setText(self.t("filter_title") % (label_txt.split("  ")[0], len(entries)))
        self["list"].setList(entries)
        self["key_red"].setText(self.t("back"))
        self["key_green"].setText(self.t("install"))
        self.applyStaticLabels()
        self.updateInspector()

    def onMaintenanceFinished(self, *args):
        self.refreshHeaderInfo()

    def onRamBoost(self):
        cmd = (
            'echo "============================================================"; '
            'echo "[mizou1984] RAM & Cache Booster — Freeing Memory..."; '
            'echo "============================================================"; '
            'echo "[Before] Memory:"; '
            '(free -m 2>/dev/null || free 2>/dev/null || true); '
            'sync; '
            'echo 3 > /proc/sys/vm/drop_caches 2>/dev/null || true; '
            'echo "------------------------------------------------------------"; '
            'echo "[After] Memory:"; '
            '(free -m 2>/dev/null || free 2>/dev/null || true); '
            'echo "[mizou1984] RAM & Cache Boost Complete!"'
        )
        self.session.openWithCallback(
            self.onMaintenanceFinished,
            Console,
            title="mizou1984 — RAM & Cache Booster",
            cmdlist=[cmd],
        )

    def onCleanJunk(self):
        cmd = (
            'echo "============================================================"; '
            'echo "[mizou1984] Cleaning Temp, Package Cache & Old Crash Logs..."; '
            'echo "============================================================"; '
            'echo "[Before] Internal Flash:"; '
            'df -h / /usr 2>/dev/null | head -n 4; '
            'rm -f /tmp/*.ipk /tmp/*.deb /tmp/*.tar.gz /tmp/*.tgz /tmp/*.sh /tmp/mizou1984_*.log /tmp/mizou1984_*.tmp 2>/dev/null || true; '
            'rm -rf /var/cache/opkg/* /var/lib/opkg/tmp/* 2>/dev/null || true; '
            'if command -v apt-get >/dev/null 2>&1; then apt-get clean 2>/dev/null || true; fi; '
            'for d in /home/root/logs /media/hdd /tmp; do '
            'if [ -d "$d" ]; then '
            'ls -1t "$d"/enigma2_crash_*.log 2>/dev/null | tail -n +2 | while IFS= read -r f; do rm -f "$f"; done; '
            'fi; done; '
            'sync; '
            'echo "------------------------------------------------------------"; '
            'echo "[After] Internal Flash:"; '
            'df -h / /usr 2>/dev/null | head -n 4; '
            'echo "[mizou1984] Temp, Cache & Old Crash Logs Cleaned!"'
        )
        self.session.openWithCallback(
            self.onMaintenanceFinished,
            Console,
            title="mizou1984 — Flash & Junk Cleaner",
            cmdlist=[cmd],
        )

    def onRestartGui(self):
        self.session.openWithCallback(
            self.confirmRestartGui,
            MessageBox,
            self.t("restart_confirm"),
            MessageBox.TYPE_YESNO,
        )

    def confirmRestartGui(self, answer):
        if not answer:
            return
        cmd = (
            'echo "[mizou1984] Restarting Enigma2 GUI cleanly..."; '
            'sync; sleep 1; '
            '(wget -qO- "http://127.0.0.1/web/powerstate?newstate=3" >/dev/null 2>&1 || true); '
            '(sleep 2; if [ -f /var/lib/dpkg/status ]; then systemctl restart enigma2; else killall -9 enigma2; fi) >/dev/null 2>&1 &'
        )
        self.session.open(
            Console,
            title="mizou1984 — Restarting Enigma2 GUI",
            cmdlist=[cmd],
        )

    def onLanguageSelected(self, choice):
        if not choice:
            return
        new_lang = choice[1]
        if new_lang in TRANSLATIONS:
            self.lang = new_lang
            save_panel_settings(self.lang, self.theme_id, self.layout_id)
            self.applyStaticLabels()
            self.refreshHeaderInfo()
            if self.mode == "categories":
                self.loadCategories()
            elif self.mode == "plugins":
                self.loadPlugins(self.current_category)
            elif self.mode == "doctor_list":
                self.loadDoctorScan()
            elif self.mode == "uninstall_menu":
                self.loadUninstallMenu()
            elif self.mode == "uninstall_list":
                self.loadUninstallList(self.current_uninstall_filter)

    def onThemeSelected(self, choice):
        if not choice:
            return
        new_theme = choice[1]
        if new_theme in PANEL_THEMES and new_theme != self.theme_id:
            self.theme_id = new_theme
            save_panel_settings(self.lang, self.theme_id, self.layout_id)
            self.close("reopen")

    def onLayoutSelected(self, choice):
        if not choice:
            return
        new_layout = choice[1]
        if new_layout in [x[0] for x in PANEL_LAYOUTS] and new_layout != self.layout_id:
            self.layout_id = new_layout
            save_panel_settings(self.lang, self.theme_id, self.layout_id)
            self.close("reopen")

    def onShowAbout(self):
        py_ver = "%d.%d" % (sys.version_info[0], sys.version_info[1])
        pkg_type = "DreamOS (dpkg)" if IS_DREAMOS else "OE-Alliance / OpenPLi (opkg)"
        theme_name = PANEL_THEMES.get(self.theme_id, PANEL_THEMES["midnight_cyan"])["name"]
        self.session.open(
            MessageBox,
            "mizou1984 E2 Store v%s\n%s\n\nPlugins: %d verified official sources\nSystem: %s | Python %s\nLanguage: %s | Theme: %s\nLayout: %s\nAuto-Update: Active (%s)"
            % (
                PLUGIN_VERSION,
                BRAND_MARK,
                len(self.catalog),
                pkg_type,
                py_ver,
                get_lang_name(self.lang),
                theme_name,
                get_layout_name(self.layout_id),
                AUTO_SCHEDULE,
            ),
            MessageBox.TYPE_INFO,
        )

    def onSystemUpgrade(self):
        cmd = "apt-get update && apt-get upgrade -y" if IS_DREAMOS else "opkg update && opkg upgrade"
        self.session.open(
            Console,
            title="mizou1984 Store — System Feed Upgrade",
            cmdlist=[cmd],
        )

    def openImageBrowser(self, plugin):
        self.current_image_id = plugin.get("id")
        self.current_image_title = to_e2_str(plugin.get("name", self.current_image_id))
        self.current_image_brand = None
        self.current_image_box = None
        next_mode, items, title = fetch_image_step1(self.current_image_id)
        self.image_has_brands = (next_mode == "image_brands")
        self.mode = next_mode
        entries = [("  %s" % to_e2_str(it["label"]), it) for it in items]
        if not entries:
            entries = [("  No receivers returned — check internet connection", None)]
        self["list_title"].setText(title)
        self["list"].setList(entries)
        self["key_red"].setText(self.t("back"))
        self["key_green"].setText(self.t("open_cat"))
        self.applyStaticLabels()
        self.updateInspector()

    def openImageBrand(self, brand_item):
        self.current_image_brand = brand_item
        next_mode, items, title = fetch_image_boxes_for_brand(self.current_image_id, brand_item)
        self.mode = next_mode
        entries = [("  %s" % to_e2_str(it["label"]), it) for it in items]
        if not entries:
            entries = [("  No receivers found for this brand", None)]
        self["list_title"].setText(title)
        self["list"].setList(entries)
        self["key_red"].setText(self.t("back"))
        self["key_green"].setText(self.t("install") if next_mode == "image_builds" else self.t("open_cat"))
        self.applyStaticLabels()
        self.updateInspector()

    def openImageBuilds(self, box_item):
        self.current_image_box = box_item
        builds = fetch_image_builds(self.current_image_id, box_item)
        self.mode = "image_builds"
        entries = [("  %s" % to_e2_str(b["label"]), b) for b in builds]
        if not entries:
            entries = [("  No .zip builds found for %s" % to_e2_str(box_item.get("label", "")), None)]
        self["list_title"].setText("%s — %s (%d)" % (self.current_image_title, to_e2_str(box_item.get("key", "")), len(builds)))
        self["list"].setList(entries)
        self["key_red"].setText(self.t("back"))
        self["key_green"].setText(self.t("install"))
        self.applyStaticLabels()
        self.updateInspector()

    def askImageSaveDir(self, build_item):
        self.pending_image_build = build_item
        dirs = []
        if os.path.isdir("/media/hdd"):
            dirs.append(("/media/hdd/images  (HDD — FlashOnline / MultiBoot)", "/media/hdd/images"))
            dirs.append(("/media/hdd/imagebackups  (EGAMI / OpenBH MultiBoot)", "/media/hdd/imagebackups"))
        if os.path.isdir("/media/usb"):
            dirs.append(("/media/usb/images  (USB — FlashOnline / MultiBoot)", "/media/usb/images"))
        dirs.append(("/tmp  (Temporary RAM)", "/tmp"))
        self.session.openWithCallback(
            self.onImageSaveDirChosen,
            ChoiceBox,
            title="Save %s to:" % to_e2_str(build_item.get("filename", "image.zip")),
            list=dirs,
        )

    def onImageSaveDirChosen(self, choice):
        build_item = self.pending_image_build
        self.pending_image_build = None
        if not choice or not build_item:
            return
        target_dir = choice[1]
        fname = re.sub(r"[^A-Za-z0-9._-]", "_", to_e2_str(build_item.get("filename", "enigma2_image.zip")))
        url = to_e2_str(build_item.get("url", ""))
        dest = os.path.join(target_dir, fname)
        cmd = (
            'mkdir -p "%s" && '
            'echo "============================================================" && '
            'echo "[mizou1984] Downloading Official Image: %s" && '
            'echo "[mizou1984] Destination: %s" && '
            'echo "============================================================" && '
            '(curl -fSLk --connect-timeout 25 -o "%s" "%s" || wget --no-check-certificate -O "%s" "%s") && '
            'ls -lh "%s" && '
            'echo "[mizou1984] DOWNLOAD COMPLETE! Ready to flash via FlashOnline / MultiBoot!"'
        ) % (target_dir, fname, dest, dest, url, dest, url, dest)
        self.session.open(
            Console,
            title="mizou1984 — Downloading %s" % fname,
            cmdlist=[cmd],
        )

    def handleBackupAction(self, plugin):
        pid = plugin.get("id", "")
        if pid == "backup-restore-now":
            archives = []
            for base_dir in ("/media/hdd/mizou1984_backups", "/media/usb/mizou1984_backups", "/tmp/mizou1984_backups"):
                if os.path.isdir(base_dir):
                    try:
                        for fn in os.listdir(base_dir):
                            if fn.endswith(".tar.gz"):
                                full = os.path.join(base_dir, fn)
                                try:
                                    st = os.stat(full)
                                    sz_kb = max(1, int(st.st_size // 1024))
                                    archives.append((st.st_mtime, "%s  (%d KB)  [%s]" % (fn, sz_kb, base_dir), full))
                                except Exception:
                                    archives.append((0, "%s  [%s]" % (fn, base_dir), full))
                    except Exception:
                        pass
            archives.sort(key=lambda x: x[0], reverse=True)
            if not archives:
                self.session.open(
                    MessageBox,
                    "No saved backup archives found in:\n/media/hdd/mizou1984_backups\n/media/usb/mizou1984_backups\n\nCreate a backup first from the Backup category.",
                    MessageBox.TYPE_INFO,
                    timeout=7,
                )
                return
            choices = [(label, path) for _mt, label, path in archives[:25]]
            self.session.openWithCallback(
                self.onRestoreArchiveSelected,
                ChoiceBox,
                title="mizou1984 Restore — Select Backup Archive",
                list=choices,
            )
            return

        self.pending_backup_plugin = plugin
        if pid == "backup-full-image-now":
            targets = []
            if os.path.isdir("/media/hdd"):
                targets.append(("Full Image Backup -> /media/hdd (HDD)", "hdd"))
            if os.path.isdir("/media/usb"):
                targets.append(("Full Image Backup -> /media/usb (USB)", "usb"))
            if not targets:
                targets.append(("Install / Run BackupSuite (Auto)", "hdd"))
            self.session.openWithCallback(
                self.onBackupTargetChosen,
                ChoiceBox,
                title="Full Image Backup — Select Destination",
                list=targets,
            )
            return

        dirs = []
        if os.path.isdir("/media/hdd"):
            dirs.append(("/media/hdd/mizou1984_backups  (HDD — Recommended)", "/media/hdd/mizou1984_backups"))
        if os.path.isdir("/media/usb"):
            dirs.append(("/media/usb/mizou1984_backups  (USB)", "/media/usb/mizou1984_backups"))
        dirs.append(("/tmp/mizou1984_backups  (Temporary RAM)", "/tmp/mizou1984_backups"))
        self.session.openWithCallback(
            self.onBackupTargetChosen,
            ChoiceBox,
            title="%s — Save Backup To:" % to_e2_str(plugin.get("name", "Backup")),
            list=dirs,
        )

    def onBackupTargetChosen(self, choice):
        plugin = getattr(self, "pending_backup_plugin", None)
        self.pending_backup_plugin = None
        if not choice or not plugin:
            return
        pid = plugin.get("id", "")
        target = choice[1]
        if pid == "backup-full-image-now":
            cmd = (
                'if [ -x /usr/lib/enigma2/python/Plugins/Extensions/BackupSuite/backup.sh ]; then '
                'echo "[mizou1984] Starting Full Image Backup to %s..."; '
                'sh /usr/lib/enigma2/python/Plugins/Extensions/BackupSuite/backup.sh %s; '
                'else echo "[mizou1984] Installing BackupSuite for Full Image Backup..."; '
                'wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/backupsuite/backupsuite.sh -O - | /bin/sh; '
                'if [ -x /usr/lib/enigma2/python/Plugins/Extensions/BackupSuite/backup.sh ]; then '
                'sh /usr/lib/enigma2/python/Plugins/Extensions/BackupSuite/backup.sh %s; fi; fi'
            ) % (target, target, target)
            self.session.open(Console, title="mizou1984 — Full Image Backup (%s)" % target.upper(), cmdlist=[cmd])
            return

        if pid == "backup-channels-now":
            prefix = "mizou_channels"
            paths = "/etc/enigma2/lamedb* /etc/enigma2/*.tv /etc/enigma2/*.radio /etc/enigma2/bouquets.* /etc/enigma2/blacklist /etc/enigma2/whitelist /etc/tuxbox/satellites.xml"
            prep = ""
        elif pid == "backup-emus-subs-now":
            prefix = "mizou_emus_subs"
            paths = "/etc/tuxbox/config /usr/keys /var/keys /etc/CCcam.cfg /etc/enigma2/xstreamity /etc/enigma2/jediplaylists /etc/enigma2/MultiStalkerPro.json /etc/enigma2/iptosat.json /etc/enigma2/e2m3u2bouquet"
            prep = ""
        else:
            prefix = "mizou_all_backup"
            paths = "/etc/enigma2 /etc/tuxbox/config /usr/keys /var/keys /etc/CCcam.cfg /etc/mizou1984_store"
            prep = "(opkg list-installed > /etc/enigma2/installed_packages.txt 2>/dev/null || dpkg -l > /etc/enigma2/installed_packages.txt 2>/dev/null || true); "

        cmd = (
            'mkdir -p "%s"; TS=$(date +%%Y%%m%%d_%%H%%M); OUT="%s/%s_$TS.tar.gz"; '
            '%s'
            'echo "[mizou1984] Creating backup: $OUT ..."; '
            'tar -czf "$OUT" %s 2>/dev/null || true; '
            'if [ -s "$OUT" ]; then ls -lh "$OUT" && echo "[mizou1984] BACKUP COMPLETE! Saved safely."; '
            'else echo "[mizou1984] Backup failed — check free space on %s"; fi'
        ) % (target, target, prefix, prep, paths, target)
        self.session.open(Console, title="mizou1984 — %s" % to_e2_str(plugin.get("name", "Backup")), cmdlist=[cmd])

    def onRestoreArchiveSelected(self, choice):
        if not choice:
            return
        self.pending_restore_path = choice[1]
        self.session.openWithCallback(
            self.confirmRestoreArchive,
            MessageBox,
            "Restore backup archive:\n\n%s\n\nExisting channel lists / configs in this archive will be restored. Continue?" % choice[1],
            MessageBox.TYPE_YESNO,
        )

    def confirmRestoreArchive(self, answer):
        path = getattr(self, "pending_restore_path", None)
        self.pending_restore_path = None
        if not answer or not path:
            return
        cmd = (
            'echo "[mizou1984] Restoring backup: %s ..."; '
            'tar -xzf "%s" -C / && '
            '(wget -qO- "http://127.0.0.1/web/servicelistreload?mode=0" >/dev/null 2>&1 || true) && '
            'echo "[mizou1984] RESTORE COMPLETE! Restart Enigma2 GUI if needed."'
        ) % (path, path)
        self.session.open(Console, title="mizou1984 — Restoring Backup", cmdlist=[cmd])

    def onOk(self):
        sel = self["list"].getCurrent()
        if not sel:
            return
        if self.mode == "categories":
            if sel[1] == "__doctor__":
                self.loadDoctorScan()
            elif sel[1] == "__uninstall__":
                self.loadUninstallMenu()
            else:
                self.loadPlugins(sel[1])
        elif self.mode == "plugins":
            plugin = sel[1]
            if plugin.get("id") in LIVE_IMAGE_IDS:
                self.openImageBrowser(plugin)
                return
            if plugin.get("id") in INTERACTIVE_BACKUP_IDS:
                self.handleBackupAction(plugin)
                return
            free_mb = get_free_flash_mb("/")
            heavy_cats = ("skins", "picons_feeds", "bootlogos", "multiboot", "panels", "images")
            min_mb = 25 if plugin.get("category") in heavy_cats else 15
            if free_mb is not None and free_mb < float(min_mb):
                self.pending_install_plugin = plugin
                self.session.openWithCallback(
                    self.confirmLowFlashInstall,
                    MessageBox,
                    self.t("flash_low_warn") % (free_mb, min_mb, to_e2_str(plugin.get("name", plugin.get("id", "")))),
                    MessageBox.TYPE_YESNO,
                )
                return
            self._executePluginInstall(plugin)
        elif self.mode == "image_brands":
            if sel[1]:
                self.openImageBrand(sel[1])
        elif self.mode == "image_boxes":
            if sel[1]:
                self.openImageBuilds(sel[1])
        elif self.mode == "image_builds":
            if sel[1]:
                self.askImageSaveDir(sel[1])
        elif self.mode == "doctor_list":
            item = sel[1]
            if not item:
                return
            st = item.get("status", "healthy")
            if st == "healthy":
                self.session.open(
                    MessageBox,
                    "%s: %s\n\n%s" % (item["name"], self.t("d_healthy"), item.get("reason", "")),
                    MessageBox.TYPE_INFO,
                    timeout=5,
                )
                return
            self.pending_repair_item = item
            st_lbl = self.t("d_broken") if st == "broken" else self.t("d_stopped")
            self.session.openWithCallback(
                self.confirmRepairOne,
                MessageBox,
                self.t("d_confirm_one") % (item["name"], st_lbl, item.get("reason", ""), item.get("fix_summary", "")),
                MessageBox.TYPE_YESNO,
            )
        elif self.mode == "uninstall_menu":
            self.loadUninstallList(sel[1])
        elif self.mode == "uninstall_list":
            item = sel[1]
            if not item:
                return
            self.pending_remove_item = item
            kind = item.get("kind")
            if kind == "pkg":
                type_label = self.t("u_type_pkg") % ("dpkg" if IS_DREAMOS else "opkg")
            elif kind == "bin":
                type_label = self.t("u_type_bin")
            else:
                type_label = self.t("u_type_dir")
            self.session.openWithCallback(
                self.confirmRemoveItem,
                MessageBox,
                self.t("u_confirm") % (item["name"], type_label, item["target"]),
                MessageBox.TYPE_YESNO,
            )

    def confirmLowFlashInstall(self, answer):
        plugin = getattr(self, "pending_install_plugin", None)
        self.pending_install_plugin = None
        if answer and plugin:
            self._executePluginInstall(plugin)

    def _executePluginInstall(self, plugin):
        register_installed_plugin(plugin["id"])
        cmd = plugin["cmd_dpkg"] if IS_DREAMOS else plugin["cmd_opkg"]
        stripped_cmd = cmd.strip()
        if stripped_cmd.startswith("wget ") or stripped_cmd.startswith("curl ") or stripped_cmd.startswith("rm -rf "):
            full_cmd = cmd
        else:
            prefix = "(apt-get update >/dev/null 2>&1 || true); " if IS_DREAMOS else "(opkg update >/dev/null 2>&1 || true); "
            full_cmd = prefix + cmd
        self.session.openWithCallback(
            self.onInstallFinished,
            Console,
            title="mizou1984 Store — Installing %s" % to_e2_str(plugin["name"]),
            cmdlist=[full_cmd],
        )

    def onInstallFinished(self, *args):
        self.refreshHeaderInfo()

    def onBack(self):
        if self.mode == "image_builds":
            if self.image_has_brands and self.current_image_id == "image-pure2":
                self.openImageBrowser({"id": self.current_image_id, "name": self.current_image_title})
            elif self.image_has_brands and self.current_image_brand:
                self.openImageBrand(self.current_image_brand)
            else:
                self.openImageBrowser({"id": self.current_image_id, "name": self.current_image_title})
        elif self.mode == "image_boxes":
            if self.image_has_brands:
                self.openImageBrowser({"id": self.current_image_id, "name": self.current_image_title})
            else:
                self.loadPlugins(self.current_category)
        elif self.mode == "image_brands":
            self.loadPlugins(self.current_category)
        elif self.mode == "plugins" or self.mode == "uninstall_menu" or self.mode == "doctor_list":
            self.loadCategories()
        elif self.mode == "uninstall_list":
            self.loadUninstallMenu()
        else:
            self.close()

    def onAutoUpdateAll(self):
        if self.mode == "doctor_list":
            issues = [x for x in self.doctor_items if x.get("status") != "healthy"]
            if not issues:
                self.session.open(
                    MessageBox,
                    self.t("d_all_ok") % len(self.doctor_items),
                    MessageBox.TYPE_INFO,
                    timeout=5,
                )
                return
            n_broken = len([x for x in issues if x.get("status") == "broken"])
            n_stopped = len([x for x in issues if x.get("status") == "stopped"])
            self.session.openWithCallback(
                self.confirmRepairAll,
                MessageBox,
                self.t("d_confirm_all") % (len(issues), n_broken, n_stopped),
                MessageBox.TYPE_YESNO,
            )
            return
        if os.path.exists(AUTO_UPDATER_BIN):
            self.session.open(
                Console,
                title="mizou1984 Auto-Updater — Syncing Store & Official Sources",
                cmdlist=["sh %s" % AUTO_UPDATER_BIN],
            )
        else:
            self.onSystemUpgrade()


def _reopen_callback(session, result=None):
    if result == "reopen":
        session.openWithCallback(lambda res=None: _reopen_callback(session, res), Mizou1984StoreScreen)


def main(session, **kwargs):
    session.openWithCallback(lambda res=None: _reopen_callback(session, res), Mizou1984StoreScreen)


def Plugins(**kwargs):
    return [
        PluginDescriptor(
            name="mizou1984 E2 Store",
            description="Exclusive Enigma2 Store, Uninstaller & Auto-Updater by mizou1984",
            where=[PluginDescriptor.WHERE_PLUGINMENU, PluginDescriptor.WHERE_EXTENSIONSMENU],
            icon="plugin.png",
            fnc=main,
        )
    ]

EOF_MIZOU1984_PY

cat << 'EOF_MIZOU1984_UPDATER' > "$PLUGIN_DIR/auto_updater.sh"
#!/bin/sh
# ==============================================================================
# mizou1984 Exclusive E2 Store — Autonomous Background Auto-Updater (v5.7.0)
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
  rm -f /tmp/mizou1984_selfupdate.sh /tmp/mizou1984_selfupdate.clean
  if command -v curl >/dev/null 2>&1; then
    curl -fsSLk -H "Cache-Control: no-cache" "https://raw.githubusercontent.com/mizouh1984/E2Store/main/installer.sh?t=$CB_TS" -o /tmp/mizou1984_selfupdate.sh 2>/dev/null
  fi
  if [ ! -s /tmp/mizou1984_selfupdate.sh ]; then
    wget -q --no-check-certificate "https://raw.githubusercontent.com/mizouh1984/E2Store/main/installer.sh?t=$CB_TS" -O /tmp/mizou1984_selfupdate.sh 2>/dev/null
  fi
  if [ -s /tmp/mizou1984_selfupdate.sh ]; then
    tr -d '\015' < /tmp/mizou1984_selfupdate.sh > /tmp/mizou1984_selfupdate.clean 2>/dev/null && mv -f /tmp/mizou1984_selfupdate.clean /tmp/mizou1984_selfupdate.sh
    DL_VER=$(awk -F'"' '/^PLUGIN_VERSION = /{print $2; exit}' /tmp/mizou1984_selfupdate.sh 2>/dev/null)
    if [ -n "$DL_VER" ] && [ "$DL_VER" = "$REMOTE_STORE_VER" ] && grep -q 'EOF_MIZOU1984_UPDATER' /tmp/mizou1984_selfupdate.sh 2>/dev/null; then
      chmod +x /tmp/mizou1984_selfupdate.sh
      /bin/sh /tmp/mizou1984_selfupdate.sh --no-restart >> "$LOG_FILE" 2>&1
      rm -f /tmp/mizou1984_selfupdate.sh
      log "mizou1984 Store updated silently to v$REMOTE_STORE_VER."
    else
      log "installer.sh version ($DL_VER) != version.txt ($REMOTE_STORE_VER); trying direct plugin.py fallback..."
      rm -f /tmp/mizou1984_plugin_new.py
      (curl -fsSLk -H "Cache-Control: no-cache" "https://raw.githubusercontent.com/mizouh1984/E2Store/main/plugin.py?t=$CB_TS" -o /tmp/mizou1984_plugin_new.py 2>/dev/null || wget -q --no-check-certificate "https://raw.githubusercontent.com/mizouh1984/E2Store/main/plugin.py?t=$CB_TS" -O /tmp/mizou1984_plugin_new.py 2>/dev/null)
      if [ -s /tmp/mizou1984_plugin_new.py ] && grep -q 'Mizou1984StoreScreen' /tmp/mizou1984_plugin_new.py 2>/dev/null; then
        tr -d '\015' < /tmp/mizou1984_plugin_new.py > /usr/lib/enigma2/python/Plugins/Extensions/Mizou1984Store/plugin.py
        rm -rf /usr/lib/enigma2/python/Plugins/Extensions/Mizou1984Store/__pycache__ /usr/lib/enigma2/python/Plugins/Extensions/Mizou1984Store/*.pyc /usr/lib/enigma2/python/Plugins/Extensions/Mizou1984Store/*.pyo
        echo "$REMOTE_STORE_VER" > "$STORE_VER_FILE"
        log "Updated plugin.py directly to v$REMOTE_STORE_VER."
      fi
      rm -f /tmp/mizou1984_selfupdate.sh /tmp/mizou1984_plugin_new.py
    fi
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
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/ajpanel/ajpanel.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/ajpanel/ajpanel.sh -O - | /bin/sh'
      PLUGIN_NAME="AJPanel"
      ;;
    "linuxsat-panel")
      API_URL="https://api.github.com/repos/Belfagor2005/LinuxsatPanel/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/linuxsat-panel/linuxsat-panel.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/linuxsat-panel/linuxsat-panel.sh -O - | /bin/sh'
      PLUGIN_NAME="Linuxsat-Panel"
      ;;
    "dreamsat-panel")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/emilpanel/emilpanel.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/emilpanel/emilpanel.sh -O - | /bin/sh'
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
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/panelaio/panelaio.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/panelaio/panelaio.sh -O - | /bin/sh'
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
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/pluginspanel/pluginspanel.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/pluginspanel/pluginspanel.sh -O - | /bin/sh'
      PLUGIN_NAME="TunisiaSat Panel (TSpanel)"
      ;;
    "satvenus-panel")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/satvenuspanel/satvenuspanel.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/satvenuspanel/satvenuspanel.sh -O - | /bin/sh'
      PLUGIN_NAME="SatVenus Panel"
      ;;
    "eliesat-panel")
      API_URL="https://api.github.com/repos/eliesat/eliesatpanel/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/eliesatpanel/-/raw/main/eliesatpanel.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/eliesatpanel/-/raw/main/eliesatpanel.sh -O - | /bin/sh'
      PLUGIN_NAME="ElieSat Panel"
      ;;
    "alayer-plugin")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/alajre/alajre.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/alajre/alajre.sh -O - | /bin/sh'
      PLUGIN_NAME="Alayer (Alaire)"
      ;;
    "ansite-plugin")
      API_URL="https://api.github.com/repos/MOHAMED19OS/Enigma2_Store/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/ansite/ansite.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/ansite/ansite.sh -O - | /bin/sh'
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
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/bootlogoswapper/bootlogoswapper-eliesat-special-edition.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/bootlogoswapper/bootlogoswapper-eliesat-special-edition.sh -O - | /bin/sh'
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
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/ipaudiopro/ipaudiopro.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/ipaudiopro/ipaudiopro.sh -O - | /bin/sh'
      PLUGIN_NAME="IPAudioPlus / IPAudio Pro"
      ;;
    "xtraevent")
      API_URL="https://api.github.com/repos/digiteng/xtra/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/xtraevent/xtraevent-4.2.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/xtraevent/xtraevent-4.2.sh -O - | /bin/sh'
      PLUGIN_NAME="XtraEvent v4.2 (Classic Py2/Py3)"
      ;;
    "quran-karim")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/quran-karim/quran-karim.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/quran-karim/quran-karim.sh -O - | /bin/sh'
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
    "fury-biss")
      API_URL="https://api.github.com/repos/islam-2412/FuryBiss/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/islam-2412/FuryBiss/refs/heads/main/fury/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/islam-2412/FuryBiss/refs/heads/main/fury/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="FuryBiss (Auto Feed BISS)"
      ;;
    "ai-fury")
      API_URL="https://api.github.com/repos/islam-2412/IPKS/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/islam-2412/IPKS/refs/heads/main/fury/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/islam-2412/IPKS/refs/heads/main/fury/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="AIFury (AI EPG Translator & Tools)"
      ;;
    "fury-posterx")
      API_URL="https://api.github.com/repos/islam-2412/IPKS/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/islam-2412/IPKS/refs/heads/main/fury/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/islam-2412/IPKS/refs/heads/main/fury/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="FuryPosterX"
      ;;
    "fury-setup-plugin")
      API_URL="https://api.github.com/repos/islam-2412/IPKS/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/islam-2412/IPKS/refs/heads/main/fury/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/islam-2412/IPKS/refs/heads/main/fury/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="Fury-FHD Setup & Control"
      ;;
    "oscam-emu-mohamed")
      API_URL="https://api.github.com/repos/MOHAMED19OS/Enigma2_Store/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/softcams/-/raw/main/mohamed-os/oscam.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/softcams/-/raw/main/mohamed-os/oscam.sh -O - | /bin/sh'
      PLUGIN_NAME="OSCam-Emu Universal"
      ;;
    "ncam-emu-mohamed")
      API_URL="https://api.github.com/repos/MOHAMED19OS/Enigma2_Store/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/softcams/-/raw/main/mohamed-os/ncam.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/softcams/-/raw/main/mohamed-os/ncam.sh -O - | /bin/sh'
      PLUGIN_NAME="NCam-Emu Universal"
      ;;
    "levi45-multicam")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/softcams/-/raw/main/levi/oscam.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/softcams/-/raw/main/levi/oscam.sh -O - | /bin/sh'
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
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/softcams/-/raw/main/kite888/oscamicamall-kite888.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/softcams/-/raw/main/kite888/oscamicamall-kite888.sh -O - | /bin/sh'
      PLUGIN_NAME="OSCam-ICam (Sky DE/IT/UK)"
      ;;
    "oscam-smod")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/softcams/-/raw/main/audi06_19/oscam.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/softcams/-/raw/main/audi06_19/oscam.sh -O - | /bin/sh'
      PLUGIN_NAME="OSCam-Smod Universal"
      ;;
    "oscam-samur")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/softcams/-/raw/main/samur/oscam.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/softcams/-/raw/main/samur/oscam.sh -O - | /bin/sh'
      PLUGIN_NAME="OSCam Samur Edition"
      ;;
    "ncam-icam")
      API_URL="https://api.github.com/repos/MOHAMED19OS/Enigma2_Store/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/softcams/-/raw/main/mohamed-os/ncam.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/softcams/-/raw/main/mohamed-os/ncam.sh -O - | /bin/sh'
      PLUGIN_NAME="NCam-ICam Universal"
      ;;
    "ncam-fairbird")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/softcams/-/raw/main/raed/ncam.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/softcams/-/raw/main/raed/ncam.sh -O - | /bin/sh'
      PLUGIN_NAME="NCam Fairbird (Raed Edition)"
      ;;
    "gosat-gcam")
      API_URL="https://api.github.com/repos/MOHAMED19OS/Enigma2_Store/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/softcams/-/raw/main/mohamed-os/gosatplus.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/softcams/-/raw/main/mohamed-os/gosatplus.sh -O - | /bin/sh'
      PLUGIN_NAME="Gosat / GCam Universal (القوسات)"
      ;;
    "powercam")
      API_URL="https://api.github.com/repos/MOHAMED19OS/Enigma2_Store/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/softcams/-/raw/main/mohamed-os/powercam.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/softcams/-/raw/main/mohamed-os/powercam.sh -O - | /bin/sh'
      PLUGIN_NAME="PowerCam Universal (الباور كام)"
      ;;
    "cccam-universal")
      API_URL="https://api.github.com/repos/MOHAMED19OS/Enigma2_Store/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/softcams/-/raw/main/cccam/cccam.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/softcams/-/raw/main/cccam/cccam.sh -O - | /bin/sh'
      PLUGIN_NAME="CCcam 2.3.9 / 2.3.8 / 2.3.2 (السيس كام)"
      ;;
    "revcam")
      API_URL="https://api.github.com/repos/MOHAMED19OS/Enigma2_Store/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/softcams/-/raw/main/mohamed-os/supcam-oscam.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/softcams/-/raw/main/mohamed-os/supcam-oscam.sh -O - | /bin/sh'
      PLUGIN_NAME="RevCam V2 Universal (الراف كام)"
      ;;
    "ultracam")
      API_URL="https://api.github.com/repos/MOHAMED19OS/Enigma2_Store/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/softcams/-/raw/main/mohamed-os/ultracam.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/softcams/-/raw/main/mohamed-os/ultracam.sh -O - | /bin/sh'
      PLUGIN_NAME="UltraCam Universal (الألترا كام)"
      ;;
    "xstreamity")
      API_URL="https://api.github.com/repos/kiddac/XStreamity/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/xstreamity/xstreamity.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/xstreamity/xstreamity.sh -O - | /bin/sh'
      PLUGIN_NAME="XStreamity"
      ;;
    "xklass")
      API_URL="https://api.github.com/repos/kiddac/XKlass/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/xklass/xklass.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/xklass/xklass.sh -O - | /bin/sh'
      PLUGIN_NAME="XKlass"
      ;;
    "bouquetmakerxtream")
      API_URL="https://api.github.com/repos/kiddac/BouquetMakerXtream/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/bouquetmakerxtream/bouquetmakerxtream.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/bouquetmakerxtream/bouquetmakerxtream.sh -O - | /bin/sh'
      PLUGIN_NAME="BouquetMakerXtream"
      ;;
    "multistalker-pro")
      API_URL="https://api.github.com/repos/ziko-ZR1/Multi-StalkerPro/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/multistalker-pro/multistalkerpro.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/multistalker-pro/multistalkerpro.sh -O - | /bin/sh'
      PLUGIN_NAME="MultiStalker Pro"
      ;;
    "e2m3u2bouquet")
      API_URL="https://api.github.com/repos/pepsik-kiev/e2m3u2bouquet/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/e2m3u2bouquet/e2m3u2bouquet.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/e2m3u2bouquet/e2m3u2bouquet.sh -O - | /bin/sh'
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
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/e2iplayer/e2iplayer-main.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/e2iplayer/e2iplayer-main.sh -O - | /bin/sh'
      PLUGIN_NAME="E2iPlayer (ZadMario / MOHAMED_OS)"
      ;;
    "youtube-e2")
      API_URL="https://api.github.com/repos/Taapat/enigma2-plugin-youtube/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/youtube/youtube.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/youtube/youtube.sh -O - | /bin/sh'
      PLUGIN_NAME="YouTube-E2 (Taapat Mod)"
      ;;
    "subssupport")
      API_URL="https://api.github.com/repos/MOHAMED19OS/Enigma2_Store/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/subssupport/subssupport.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/subssupport/subssupport.sh -O - | /bin/sh'
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
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/epgimport-mod-dorik1972/epgimport-mod-dorik1972.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/epgimport-mod-dorik1972/epgimport-mod-dorik1972.sh -O - | /bin/sh'
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
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/skins/-/raw/main/all/aglare-fhd/aglare-fhd.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/skins/-/raw/main/all/aglare-fhd/aglare-fhd.sh -O - | /bin/sh'
      PLUGIN_NAME="Aglare-FHD Skin"
      ;;
    "nitroadvance-fhd")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/skins/-/raw/main/all/nitro/nitro-fhd.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/skins/-/raw/main/all/nitro/nitro-fhd.sh -O - | /bin/sh'
      PLUGIN_NAME="NitroAdvance FHD"
      ;;
    "slyk-1080-r19")
      API_URL="https://api.github.com/repos/kiddac/Slyk_1080_R19/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/skins/-/raw/main/all/slyk-q-1080/slyk-q-1080.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/skins/-/raw/main/all/slyk-q-1080/slyk-q-1080.sh -O - | /bin/sh'
      PLUGIN_NAME="Slyk 1080 R19"
      ;;
    "fullhdline")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/skins/-/raw/main/all/fullhdglass17/fullhdglass17.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/skins/-/raw/main/all/fullhdglass17/fullhdglass17.sh -O - | /bin/sh'
      PLUGIN_NAME="FullHDLine Skin"
      ;;
    "slyk-q-1080")
      API_URL="https://api.github.com/repos/kiddac/Slyk_Q_1080/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/skins/-/raw/main/all/slyk-q-1080/slyk-q-1080.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/skins/-/raw/main/all/slyk-q-1080/slyk-q-1080.sh -O - | /bin/sh'
      PLUGIN_NAME="Slyk Q 1080 (SkyQ)"
      ;;
    "slyk-onyx-1080")
      API_URL="https://api.github.com/repos/kiddac/Slyk_Onyx_1080/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://github.com/kiddac/Slyk_Onyx_1080/archive/refs/heads/master.tar.gz -O /tmp/slyk_onyx.tar.gz && tar -xzf /tmp/slyk_onyx.tar.gz -C /tmp && cp -rf /tmp/Slyk_Onyx_1080-master/Slyk_Onyx_1080/usr/* /usr/ && rm -rf /tmp/slyk_onyx.tar.gz /tmp/Slyk_Onyx_1080-master'
      CMD_DPKG='wget -q "--no-check-certificate" https://github.com/kiddac/Slyk_Onyx_1080/archive/refs/heads/master.tar.gz -O /tmp/slyk_onyx.tar.gz && tar -xzf /tmp/slyk_onyx.tar.gz -C /tmp && cp -rf /tmp/Slyk_Onyx_1080-master/Slyk_Onyx_1080/usr/* /usr/ && rm -rf /tmp/slyk_onyx.tar.gz /tmp/Slyk_Onyx_1080-master'
      PLUGIN_NAME="Slyk Onyx 1080"
      ;;
    "glamour-aura-fhd")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/skins/-/raw/main/all/xdreamy/xdreamy.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/skins/-/raw/main/all/xdreamy/xdreamy.sh -O - | /bin/sh'
      PLUGIN_NAME="Glamour Aura FHD"
      ;;
    "odreamy-fhd")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/skins/-/raw/main/all/odreamy/odreamy.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/skins/-/raw/main/all/odreamy/odreamy.sh -O - | /bin/sh'
      PLUGIN_NAME="oDreamy-FHD Skin"
      ;;
    "youchie-pli-fhd")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/skins/-/raw/main/all/youchie-pli-fhd/youchie-pli-fhd.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/skins/-/raw/main/all/youchie-pli-fhd/youchie-pli-fhd.sh -O - | /bin/sh'
      PLUGIN_NAME="Youchie-PLI-FHD Skin"
      ;;
    "blackharmony-fhd")
      API_URL="https://api.github.com/repos/j00zek/BlackHarmony/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/skins/-/raw/main/all/black-neon/black-neon.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/skins/-/raw/main/all/black-neon/black-neon.sh -O - | /bin/sh'
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
    "fury-fhd-skin")
      API_URL="https://api.github.com/repos/islam-2412/IPKS/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/islam-2412/IPKS/refs/heads/main/fury/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/islam-2412/IPKS/refs/heads/main/fury/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="Fury-FHD Skin (Official)"
      ;;
    "wireguard-vpn")
      API_URL="https://api.github.com/repos/m4dhouse/WireGuard/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/wireguard-vpn/wireguard-vpn.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/wireguard-vpn/wireguard-vpn.sh -O - | /bin/sh'
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
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/backupsuite/backupsuite.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/backupsuite/backupsuite.sh -O - | /bin/sh'
      PLUGIN_NAME="BackupSuite (Full Image Backup)"
      ;;
    "foreca-weather")
      API_URL="https://api.github.com/repos/Belfagor2005/Foreca/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/foreca/foreca.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/foreca/foreca.sh -O - | /bin/sh'
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
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/scripts/-/raw/main/feed/eliesat-feed.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/scripts/-/raw/main/feed/eliesat-feed.sh -O - | /bin/sh'
      PLUGIN_NAME="MOHAMED_OS Universal Feed"
      ;;
    "subsupport-hub")
      API_URL="https://gitlab.com/api/v4/projects/eliesat%2Fextensions/repository/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/subssupport/subssupport.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/subssupport/subssupport.sh -O - | /bin/sh'
      PLUGIN_NAME="SubSupport"
      ;;
    "subsupport-pro")
      API_URL="https://api.github.com/repos/popking159/SubsSupportPro/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/popking159/SubsSupportPro/main/myinstaller.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/popking159/SubsSupportPro/main/myinstaller.sh -O - | /bin/sh'
      PLUGIN_NAME="SubSupport Pro"
      ;;
    "ai-subtitle")
      API_URL="https://gitlab.com/api/v4/projects/eliesat%2Fextensions/repository/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/aisubtitles/aisubtitles.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/aisubtitles/aisubtitles.sh -O - | /bin/sh'
      PLUGIN_NAME="AI Subtitle (AISubtitles)"
      ;;
    "translate-ai")
      API_URL="https://gitlab.com/api/v4/projects/eliesat%2Fextensions/repository/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/translateai/translateai.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/translateai/translateai.sh -O - | /bin/sh'
      PLUGIN_NAME="Translate AI"
      ;;
    "mawaqit")
      API_URL="https://gitlab.com/api/v4/projects/eliesat%2Fextensions/repository/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/mawaqit/mawaqit.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/mawaqit/mawaqit.sh -O - | /bin/sh'
      PLUGIN_NAME="Mawaqit (بلوجن مواقيت)"
      ;;
    "e2-picons")
      API_URL="https://api.github.com/repos/kiddac/E2_Piconizer/commits?per_page=1"
      CMD_OPKG='rm -rf /tmp/e2piconizer.tar.gz /tmp/E2_Piconizer-master && wget -q "--no-check-certificate" https://github.com/kiddac/E2_Piconizer/archive/refs/heads/master.tar.gz -O /tmp/e2piconizer.tar.gz && tar -xzf /tmp/e2piconizer.tar.gz -C /tmp && cp -rf /tmp/E2_Piconizer-master/E2Piconizer/usr/* /usr/ && rm -rf /tmp/e2piconizer.tar.gz /tmp/E2_Piconizer-master'
      CMD_DPKG='rm -rf /tmp/e2piconizer.tar.gz /tmp/E2_Piconizer-master && wget -q "--no-check-certificate" https://github.com/kiddac/E2_Piconizer/archive/refs/heads/master.tar.gz -O /tmp/e2piconizer.tar.gz && tar -xzf /tmp/e2piconizer.tar.gz -C /tmp && cp -rf /tmp/E2_Piconizer-master/E2Piconizer/usr/* /usr/ && rm -rf /tmp/e2piconizer.tar.gz /tmp/E2_Piconizer-master'
      PLUGIN_NAME="E2Picons (E2Piconizer)"
      ;;
    "ch-logo-changer")
      API_URL="https://gitlab.com/api/v4/projects/eliesat%2Fextensions/repository/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/chlogochanger/chlogochanger.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/chlogochanger/chlogochanger.sh -O - | /bin/sh'
      PLUGIN_NAME="Ch Logo Changer"
      ;;
    "ciefp-picon-manager")
      API_URL="https://api.github.com/repos/ciefp/CiefpPiconManager/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/ciefp/CiefpPiconManager/main/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/ciefp/CiefpPiconManager/main/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="ciefp Picon Manager"
      ;;
    "picon-updater")
      API_URL="https://gitlab.com/api/v4/projects/eliesat%2Fextensions/repository/commits?per_page=1"
      CMD_OPKG='opkg install enigma2-plugin-extensions-piconsupdater || wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/piconinstaller/piconinstaller.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/piconinstaller/piconinstaller.sh -O - | /bin/sh'
      PLUGIN_NAME="Picon Updater"
      ;;
    "raed-black-picon")
      API_URL="https://api.github.com/repos/fairbird/RaedQuickSignal/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/fairbird/RaedQuickSignal/main/picons/installerBlackPicons.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/fairbird/RaedQuickSignal/main/picons/installerBlackPicons.sh -O - | /bin/sh'
      PLUGIN_NAME="Raed Black Picon (Read Black Picon)"
      ;;
    "raed-white-picon")
      API_URL="https://api.github.com/repos/fairbird/RaedQuickSignal/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/fairbird/RaedQuickSignal/main/picons/installerWhitePicons.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/fairbird/RaedQuickSignal/main/picons/installerWhitePicons.sh -O - | /bin/sh'
      PLUGIN_NAME="Raed White Picon (Read White Picon)"
      ;;
    "image-downloader-plugin")
      API_URL="https://gitlab.com/api/v4/projects/eliesat%2Fextensions/repository/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/image-downloader/image-downloader.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/image-downloader/image-downloader.sh -O - | /bin/sh'
      PLUGIN_NAME="Image Downloader (Flash Online)"
      ;;
    "multiboot-flashonline")
      API_URL="https://gitlab.com/api/v4/projects/eliesat%2Fextensions/repository/commits?per_page=1"
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/multiboot-flashonline/multiboot-flashonline.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/multiboot-flashonline/multiboot-flashonline.sh -O - | /bin/sh'
      PLUGIN_NAME="MultiBoot FlashOnline"
      ;;
    "image-egami")
      API_URL=""
      CMD_OPKG='BOX=$(cat /proc/stb/info/boxtype 2>/dev/null || cat /proc/stb/info/model 2>/dev/null || hostname); DIR=/media/hdd/images; [ -d /media/hdd ] || DIR=/media/usb/images; [ -d /media/usb ] || [ -d /media/hdd ] || DIR=/tmp/images; mkdir -p $DIR; echo "[mizou1984] EGAMI Image Fetcher | Box: $BOX | Save: $DIR"; FILE=$(wget -qO- --no-check-certificate https://image.egami-image.com/index.php?open=$BOX | grep -oE "egami-[0-9A-Za-z._-]+\.zip" | head -n 1); if [ -n "$FILE" ]; then echo "[mizou1984] Downloading $FILE ..."; wget --no-check-certificate -O "$DIR/$FILE" "https://image.egami-image.com/$BOX/$FILE" && echo "[mizou1984] Saved to $DIR/$FILE — Flash via Image Manager / Flash Online!"; else echo "[mizou1984] Box $BOX: Visit https://egami-image.com or install Image Downloader plugin from this Images menu."; fi'
      CMD_DPKG='echo "[mizou1984] EGAMI Official Portal: https://egami-image.com — Install Image Downloader plugin from this menu for online flashing."'
      PLUGIN_NAME="EGAMI Image (11.0 Live — Select Box)"
      ;;
    "image-openpli")
      API_URL=""
      CMD_OPKG='BOX=$(cat /proc/stb/info/boxtype 2>/dev/null || cat /proc/stb/info/model 2>/dev/null || hostname); DIR=/media/hdd/images; [ -d /media/hdd ] || DIR=/media/usb/images; [ -d /media/usb ] || [ -d /media/hdd ] || DIR=/tmp/images; mkdir -p $DIR; echo "[mizou1984] OpenPLi Image Fetcher | Box: $BOX | Save: $DIR"; FILE=$(wget -qO- --no-check-certificate https://downloads.openpli.org/builds/$BOX/ | grep -oE "openpli-[0-9A-Za-z._-]+\.zip" | head -n 1); if [ -n "$FILE" ]; then echo "[mizou1984] Downloading $FILE ..."; wget --no-check-certificate -O "$DIR/$FILE" "https://downloads.openpli.org/builds/$BOX/$FILE" && echo "[mizou1984] Saved to $DIR/$FILE — Flash via Image Manager / ofgwrite!"; else echo "[mizou1984] Box $BOX: Visit https://openpli.org/download or use Image Downloader plugin in this menu."; fi'
      CMD_DPKG='echo "[mizou1984] OpenPLi Official Portal: https://openpli.org/download"'
      PLUGIN_NAME="OpenPLi Image (9.2 Live — All Boxes)"
      ;;
    "image-openbh")
      API_URL=""
      CMD_OPKG='BOX=$(cat /proc/stb/info/boxtype 2>/dev/null || cat /proc/stb/info/model 2>/dev/null || hostname); DIR=/media/hdd/images; [ -d /media/hdd ] || DIR=/media/usb/images; [ -d /media/usb ] || [ -d /media/hdd ] || DIR=/tmp/images; mkdir -p $DIR; echo "[mizou1984] OpenBH Image Fetcher | Box: $BOX | Save: $DIR"; FILE=$(wget -qO- --no-check-certificate https://images.openbh.net/index.php?open=$BOX | grep -oE "openbh-[0-9A-Za-z._-]+\.zip" | head -n 1); if [ -n "$FILE" ]; then echo "[mizou1984] Downloading $FILE ..."; wget --no-check-certificate -O "$DIR/$FILE" "https://images.openbh.net/$BOX/$FILE" && echo "[mizou1984] Saved to $DIR/$FILE — Flash via Image Manager / Flash Online!"; else echo "[mizou1984] Box $BOX: Visit https://images.openbh.net or install Image Downloader plugin from this menu."; fi'
      CMD_DPKG='echo "[mizou1984] OpenBH Official Portal: https://images.openbh.net"'
      PLUGIN_NAME="OpenBH Image (6.0 Live — All Boxes)"
      ;;
    "image-blackhole")
      API_URL=""
      CMD_OPKG='BOX=$(cat /proc/stb/info/boxtype 2>/dev/null || cat /proc/stb/info/model 2>/dev/null || hostname); echo "===================================================="; echo "[mizou1984] BlackHole Official Image (Vu+ Receivers)"; echo "Detected Box: $BOX | Arch: $(uname -m)"; echo "Official Vu+ BlackHole Portal: https://www.vuplus-community.net"; echo "OpenBlackHole Modern Py3 Portal: https://images.openbh.net"; echo "Tip: For direct TV flashing install Image Downloader plugin above."; echo "===================================================="'
      CMD_DPKG='echo "[mizou1984] BlackHole Official Portal: https://www.vuplus-community.net (Vu+ receivers only)"'
      PLUGIN_NAME="BlackHole / OpenBH Vu+ (Live — All Vu+)"
      ;;
    "image-openatv")
      API_URL=""
      CMD_OPKG='BOX=$(cat /proc/stb/info/boxtype 2>/dev/null || cat /proc/stb/info/model 2>/dev/null || hostname); DIR=/media/hdd/images; [ -d /media/hdd ] || DIR=/media/usb/images; [ -d /media/usb ] || [ -d /media/hdd ] || DIR=/tmp/images; mkdir -p $DIR; echo "[mizou1984] OpenATV Image Fetcher | Box: $BOX | Save: $DIR"; FILE=$(wget -qO- --no-check-certificate https://images.mynonpublic.com/openatv/7.5.1/index.php?open=$BOX | grep -oE "openatv-7\.5\.1-[0-9A-Za-z._-]+\.zip" | head -n 1); if [ -n "$FILE" ]; then echo "[mizou1984] Downloading $FILE ..."; wget --no-check-certificate -O "$DIR/$FILE" "https://images.mynonpublic.com/openatv/7.5.1/$BOX/$FILE" && echo "[mizou1984] Saved to $DIR/$FILE — Flash via Menu > Setup > Software Management > Flash Online!"; else echo "[mizou1984] Box $BOX: Visit https://images.mynonpublic.com/openatv/7.5.1/index.php?open=$BOX"; fi'
      CMD_DPKG='echo "[mizou1984] OpenATV Official Portal: https://images.mynonpublic.com/openatv/7.5.1/"'
      PLUGIN_NAME="OpenATV Image (8.0 / 8.1 Live — 336+ Boxes)"
      ;;
    "image-openspa")
      API_URL=""
      CMD_OPKG='BOX=$(cat /proc/stb/info/boxtype 2>/dev/null || cat /proc/stb/info/model 2>/dev/null || hostname); DIR=/media/hdd/images; [ -d /media/hdd ] || DIR=/media/usb/images; [ -d /media/usb ] || [ -d /media/hdd ] || DIR=/tmp/images; mkdir -p $DIR; echo "[mizou1984] OpenSPA 8.4 | Box: $BOX | Portal: https://openspa.webhop.info"; echo "Install Image Downloader plugin above to flash OpenSPA directly online."'
      CMD_DPKG='echo "[mizou1984] OpenSPA Official Portal: https://openspa.webhop.info"'
      PLUGIN_NAME="OpenSPA Image (Live — All Boxes)"
      ;;
    "image-openvix")
      API_URL=""
      CMD_OPKG='BOX=$(cat /proc/stb/info/boxtype 2>/dev/null || cat /proc/stb/info/model 2>/dev/null || hostname); echo "[mizou1984] OpenViX 6.7 | Box: $BOX | Official Downloads: https://www.openvix.co.uk/index.php/downloads/"; echo "Install Image Downloader plugin in this menu for one-click online flashing."'
      CMD_DPKG='echo "[mizou1984] OpenViX Official Portal: https://www.openvix.co.uk/index.php/downloads/"'
      PLUGIN_NAME="OpenViX Image (6.9 Live — 71+ Boxes)"
      ;;
    "image-pure2")
      API_URL=""
      CMD_OPKG='BOX=$(cat /proc/stb/info/boxtype 2>/dev/null || cat /proc/stb/info/model 2>/dev/null || hostname); echo "[mizou1984] PurE2 7.4 | Box: $BOX | Official Portal: https://www.pur-e2.club/OU/images/7.4/"; echo "Tip: Use Image Downloader plugin above to flash PurE2 directly from TV."'
      CMD_DPKG='echo "[mizou1984] PurE2 Official Portal: https://www.pur-e2.club/OU/images/7.4/"'
      PLUGIN_NAME="PurE2 Image (7.6 Live — All Boxes)"
      ;;
    "image-openhdf")
      API_URL=""
      CMD_OPKG='BOX=$(cat /proc/stb/info/boxtype 2>/dev/null || cat /proc/stb/info/model 2>/dev/null || hostname); DIR=/media/hdd/images; [ -d /media/hdd ] || DIR=/media/usb/images; [ -d /media/usb ] || [ -d /media/hdd ] || DIR=/tmp/images; mkdir -p $DIR; echo "[mizou1984] OpenHDF Fetcher | Box: $BOX | Save: $DIR"; FILE=$(wget -qO- --no-check-certificate https://v73.hdfreaks.cc/$BOX/ | grep -oE "openhdf-[0-9A-Za-z._-]+\.zip" | tail -n 1); if [ -n "$FILE" ]; then echo "[mizou1984] Downloading $FILE ..."; wget --no-check-certificate -O "$DIR/$FILE" "https://v73.hdfreaks.cc/$BOX/$FILE" && echo "[mizou1984] Saved to $DIR/$FILE!"; else echo "[mizou1984] Box $BOX: Visit https://v73.hdfreaks.cc/$BOX/"; fi'
      CMD_DPKG='echo "[mizou1984] OpenHDF Official Portal: https://v73.hdfreaks.cc/"'
      PLUGIN_NAME="OpenHDF Image (7.5 Live — 74+ Boxes)"
      ;;
    "image-opendroid")
      API_URL=""
      CMD_OPKG='BOX=$(cat /proc/stb/info/boxtype 2>/dev/null || cat /proc/stb/info/model 2>/dev/null || hostname); echo "[mizou1984] OpenDroid 7.5 | Box: $BOX | Official Portal: https://opendroid.org"; echo "Install Image Downloader plugin above for direct TV flashing."'
      CMD_DPKG='echo "[mizou1984] OpenDroid Official Portal: https://opendroid.org"'
      PLUGIN_NAME="OpenDroid Image (8.1.2 Live — All Boxes)"
      ;;
    "image-vti")
      API_URL=""
      CMD_OPKG='BOX=$(cat /proc/stb/info/boxtype 2>/dev/null || cat /proc/stb/info/model 2>/dev/null || hostname); echo "[mizou1984] VTi 15.0.02 (Vu+ Exclusive) | Box: $BOX"; echo "Official Portal: https://www.vuplus-support.org/wbb4/vtisoftware/"'
      CMD_DPKG='echo "[mizou1984] VTi Official Portal: https://www.vuplus-support.org/wbb4/vtisoftware/"'
      PLUGIN_NAME="VTi Image (Vu+ Team 15.0.02 Official)"
      ;;
    "image-dreamos")
      API_URL=""
      CMD_OPKG='BOX=$(cat /proc/stb/info/model 2>/dev/null || hostname); echo "[mizou1984] DreamOS / GP4.2 | Box: $BOX | Portal: https://dreamboxupdate.com"'
      CMD_DPKG='BOX=$(cat /proc/stb/info/model 2>/dev/null || hostname); echo "[mizou1984] DreamOS / GP4.2 | Box: $BOX | Portal: https://dreamboxupdate.com"'
      PLUGIN_NAME="DreamOS / GP4.2 (Dreambox Official)"
      ;;
    "image-hdsatelit")
      API_URL=""
      CMD_OPKG='echo "[mizou1984] Open HDSatelit inside mizou1984 TV Store to browse all boxes & download latest .zip from https://stb.hdsatelit.com/en/receptoare/"'
      CMD_DPKG='echo "[mizou1984] HDSatelit Official Portal: https://stb.hdsatelit.com/en/receptoare/"'
      PLUGIN_NAME="HDSatelit Image (0.7.8 Live — All Boxes)"
      ;;
    "image-hyperion")
      API_URL=""
      CMD_OPKG='echo "[mizou1984] Open Hyperion zukonMOD inside mizou1984 TV Store to browse all boxes & download latest .zip from https://zukon.pl/app.php/downloadsystem"'
      CMD_DPKG='echo "[mizou1984] Hyperion zukonMOD Portal: https://zukon.pl/app.php/downloadsystem"'
      PLUGIN_NAME="Hyperion zukonMOD (PKTeam X.2 Live — All Boxes)"
      ;;
    "neoboot")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/neoboot/neoboot-9.65.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/neoboot/neoboot-9.65.sh -O - | /bin/sh'
      PLUGIN_NAME="NeoBoot (MultiBoot)"
      ;;
    "neoboot-duo4k")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/neoboot/neoboot-duo4k.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/neoboot/neoboot-duo4k.sh -O - | /bin/sh'
      PLUGIN_NAME="NeoBoot (Vu+ Duo 4K / 4K SE Edition)"
      ;;
    "egamiboot")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/egamiboot/egamiboot.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/egamiboot/egamiboot.sh -O - | /bin/sh'
      PLUGIN_NAME="EGAMI Boot (MultiBoot)"
      ;;
    "openmultiboot")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/openmultiboot/openmultiboot-2.6.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/openmultiboot/openmultiboot-2.6.sh -O - | /bin/sh'
      PLUGIN_NAME="OpenMultiboot"
      ;;
    "barryallen")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/barryallen/barryallen.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/barryallen/barryallen.sh -O - | /bin/sh'
      PLUGIN_NAME="BarryAllen MultiBoot (DreamOS)"
      ;;
    "iptosat")
      API_URL=""
      CMD_OPKG='wget -q --no-check-certificate -O /tmp/iptosat.tar.gz https://github.com/zKhadiri/IPtoSAT/archive/refs/heads/main.tar.gz && tar -xzf /tmp/iptosat.tar.gz -C /tmp && mkdir -p /usr/lib/enigma2/python/Plugins/Extensions/IPtoSAT && cp -rf /tmp/IPtoSAT-main/src/IPtoSAT/* /usr/lib/enigma2/python/Plugins/Extensions/IPtoSAT/ && [ -f /etc/enigma2/iptosat.json ] || cp -f /tmp/IPtoSAT-main/src/etc/enigma2/iptosat.json /etc/enigma2/iptosat.json 2>/dev/null; rm -rf /tmp/iptosat.tar.gz /tmp/IPtoSAT-main && echo "[mizou1984] IPtoSAT installed! Restart Enigma2 GUI."'
      CMD_DPKG='wget -q --no-check-certificate -O /tmp/iptosat.tar.gz https://github.com/zKhadiri/IPtoSAT/archive/refs/heads/main.tar.gz && tar -xzf /tmp/iptosat.tar.gz -C /tmp && mkdir -p /usr/lib/enigma2/python/Plugins/Extensions/IPtoSAT && cp -rf /tmp/IPtoSAT-main/src/IPtoSAT/* /usr/lib/enigma2/python/Plugins/Extensions/IPtoSAT/ && [ -f /etc/enigma2/iptosat.json ] || cp -f /tmp/IPtoSAT-main/src/etc/enigma2/iptosat.json /etc/enigma2/iptosat.json 2>/dev/null; rm -rf /tmp/iptosat.tar.gz /tmp/IPtoSAT-main && echo "[mizou1984] IPtoSAT installed! Restart Enigma2 GUI."'
      PLUGIN_NAME="IPtoSAT"
      ;;
    "jedimakerxtream")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/jedimakerxtream/jedimakerxtream.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/jedimakerxtream/jedimakerxtream.sh -O - | /bin/sh'
      PLUGIN_NAME="JediMakerXtream"
      ;;
    "server-coloring")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/islam-2412/ServerColoring/main/fury/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/islam-2412/ServerColoring/main/fury/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="ServerColoring (Yassin7 / Fury)"
      ;;
    "oaweather")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/oaweather/oaweather.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/oaweather/oaweather.sh -O - | /bin/sh'
      PLUGIN_NAME="OAWeather (Weather Plugin)"
      ;;
    "weather-msn")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/weathermsn/weathermsn.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/weathermsn/weathermsn.sh -O - | /bin/sh'
      PLUGIN_NAME="MSN Weather"
      ;;
    "theweather")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/theweather/theweather.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/theweather/theweather.sh -O - | /bin/sh'
      PLUGIN_NAME="TheWeather"
      ;;
    "visualweather")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/visualweather/visualweather.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/visualweather/visualweather.sh -O - | /bin/sh'
      PLUGIN_NAME="VisualWeather"
      ;;
    "weatherplugin")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/weatherplugin/weatherplugin.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/weatherplugin/weatherplugin.sh -O - | /bin/sh'
      PLUGIN_NAME="WeatherPlugin (Classic)"
      ;;
    "skyblue-smartaddons")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/smartaddonspanel/smartaddonspanel.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/smartaddonspanel/smartaddonspanel.sh -O - | /bin/sh'
      PLUGIN_NAME="SkyBlue — SmartAddons & Plugins Hub"
      ;;
    "skyblue-boxtools")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/boxtools/boxtools.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/boxtools/boxtools.sh -O - | /bin/sh'
      PLUGIN_NAME="SkyBlue — BoxTools & System Optimizer"
      ;;
    "skyblue-tvaddon")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/tvaddon/tvaddon.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/tvaddon/tvaddon.sh -O - | /bin/sh'
      PLUGIN_NAME="SkyBlue — TVAddon & Stream Suite"
      ;;
    "skyblue-tvmanager")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/tvmanager/tvmanager.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/tvmanager/tvmanager.sh -O - | /bin/sh'
      PLUGIN_NAME="SkyBlue — TVManager & Softcam Control"
      ;;
    "mohammed-skin")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/mido00020/MohammedSkin/main/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/mido00020/MohammedSkin/main/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="MohammedSkin FHD"
      ;;
    "advanced-bootlogo")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/advancedbootlogo/advancedbootlogo.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/advancedbootlogo/advancedbootlogo.sh -O - | /bin/sh'
      PLUGIN_NAME="Advanced Bootlogo Manager"
      ;;
    "bootlogo-eliesat")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/display/-/raw/main/eliesat/bootlogos-eliesat-special-edition-1.0.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/display/-/raw/main/eliesat/bootlogos-eliesat-special-edition-1.0.sh -O - | /bin/sh'
      PLUGIN_NAME="ElieSat Special Edition 4K Bootlogos"
      ;;
    "bootlogo-euro-sports")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/display/-/raw/main/euro2024/bootlogos-euro2024.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/display/-/raw/main/euro2024/bootlogos-euro2024.sh -O - | /bin/sh'
      PLUGIN_NAME="Euro & Football Sports Bootlogos"
      ;;
    "bootlogo-nature")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/display/-/raw/main/nature/bootlogos-nature.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/display/-/raw/main/nature/bootlogos-nature.sh -O - | /bin/sh'
      PLUGIN_NAME="Nature 4K UHD Bootlogos"
      ;;
    "bootlogo-city")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/display/-/raw/main/city/bootlogos-city.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/display/-/raw/main/city/bootlogos-city.sh -O - | /bin/sh'
      PLUGIN_NAME="City Night 4K Bootlogos"
      ;;
    "bootlogo-moon")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/display/-/raw/main/moon/bootlogos-moon.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/display/-/raw/main/moon/bootlogos-moon.sh -O - | /bin/sh'
      PLUGIN_NAME="Moon & Space 4K Bootlogos"
      ;;
    "bootlogo-ramadan")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/display/-/raw/main/ramadan/bootlogos-ramadan.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/display/-/raw/main/ramadan/bootlogos-ramadan.sh -O - | /bin/sh'
      PLUGIN_NAME="Ramadan & Islamic Bootlogos"
      ;;
    "bootlogo-smart")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/display/-/raw/main/smart/bootlogos-smart.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/display/-/raw/main/smart/bootlogos-smart.sh -O - | /bin/sh'
      PLUGIN_NAME="Smart Minimal 4K Bootlogos"
      ;;
    "bootlogo-kids")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/bootlogokids/bootlogokids-stony272.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/bootlogokids/bootlogokids-stony272.sh -O - | /bin/sh'
      PLUGIN_NAME="Kids & Animation Bootlogos (Stony272)"
      ;;
    "channels-ciefp-motor")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/settings/-/raw/main/ciefp-motor/ciefp-motor.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/settings/-/raw/main/ciefp-motor/ciefp-motor.sh -O - | /bin/sh'
      PLUGIN_NAME="Ciefp Settings — All Satellites Motor"
      ;;
    "channels-ciefp-panel")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/ciefpsettingspanel/ciefpsettingspanel.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/ciefpsettingspanel/ciefpsettingspanel.sh -O - | /bin/sh'
      PLUGIN_NAME="Ciefp Settings Panel (Auto-Updater)"
      ;;
    "channels-morph883")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/settings/-/raw/main/morpheus883/morpheus883-motor.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/settings/-/raw/main/morpheus883/morpheus883-motor.sh -O - | /bin/sh'
      PLUGIN_NAME="Morpheus883 Settings (Pro Motor)"
      ;;
    "channels-vhannibal-motor")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/settings/-/raw/main/vhannibal/vhannibal-motor.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/settings/-/raw/main/vhannibal/vhannibal-motor.sh -O - | /bin/sh'
      PLUGIN_NAME="Vhannibal Settings (Italian Motor & Dual)"
      ;;
    "channels-vhannibal-autosetting")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/vhannibal-settings-motor/vhannibal-settings-motor.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/vhannibal-settings-motor/vhannibal-settings-motor.sh -O - | /bin/sh'
      PLUGIN_NAME="Vhannibal Autosetting Plugin"
      ;;
    "channels-mohamed-os")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/settings/-/raw/main/mohamed-os/mohamed-os-motor.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/settings/-/raw/main/mohamed-os/mohamed-os-motor.sh -O - | /bin/sh'
      PLUGIN_NAME="MOHAMED_OS Settings (Nilesat + Motor)"
      ;;
    "channels-novaler-motor")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/settings/-/raw/main/novaler-motor/novaler-motor.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/settings/-/raw/main/novaler-motor/novaler-motor.sh -O - | /bin/sh'
      PLUGIN_NAME="Novaler Motor Settings (All Satellites)"
      ;;
    "channels-gioppygio")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/settings/-/raw/main/gioppygio/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/settings/-/raw/main/gioppygio/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="GioppyGio Settings & Satellites.xml"
      ;;
    "backup-all-in-one-now")
      API_URL=""
      CMD_OPKG='DIR=/media/hdd/mizou1984_backups; [ -d /media/hdd ] || DIR=/media/usb/mizou1984_backups; [ -d /media/hdd ] || [ -d /media/usb ] || DIR=/tmp/mizou1984_backups; mkdir -p "$DIR"; TS=$(date +%Y%m%d_%H%M); OUT="$DIR/mizou_all_backup_$TS.tar.gz"; opkg list-installed > /etc/enigma2/installed_packages.txt 2>/dev/null || true; tar -czf "$OUT" /etc/enigma2 /etc/tuxbox/config /usr/keys /var/keys /etc/CCcam.cfg /etc/mizou1984_store 2>/dev/null || true; ls -lh "$OUT" && echo "[mizou1984] ALL-IN-ONE BACKUP SAVED TO $OUT"'
      CMD_DPKG='DIR=/media/hdd/mizou1984_backups; [ -d /media/hdd ] || DIR=/media/usb/mizou1984_backups; [ -d /media/hdd ] || [ -d /media/usb ] || DIR=/tmp/mizou1984_backups; mkdir -p "$DIR"; TS=$(date +%Y%m%d_%H%M); OUT="$DIR/mizou_all_backup_$TS.tar.gz"; tar -czf "$OUT" /etc/enigma2 /etc/tuxbox/config /usr/keys /var/keys /etc/CCcam.cfg /etc/mizou1984_store 2>/dev/null || true; ls -lh "$OUT" && echo "[mizou1984] ALL-IN-ONE BACKUP SAVED TO $OUT"'
      PLUGIN_NAME="[Backup] All-in-One Backup (Channels + Emus + Subs + Settings)"
      ;;
    "backup-full-image-now")
      API_URL=""
      CMD_OPKG='if [ -x /usr/lib/enigma2/python/Plugins/Extensions/BackupSuite/backup.sh ]; then sh /usr/lib/enigma2/python/Plugins/Extensions/BackupSuite/backup.sh hdd; else echo "[mizou1984] Installing BackupSuite for Full Image Backup..."; wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/backupsuite/backupsuite.sh -O - | /bin/sh; fi'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/backupsuite/backupsuite.sh -O - | /bin/sh'
      PLUGIN_NAME="[Backup] Full Image Backup (الصورة كاملة)"
      ;;
    "backup-channels-now")
      API_URL=""
      CMD_OPKG='DIR=/media/hdd/mizou1984_backups; [ -d /media/hdd ] || DIR=/media/usb/mizou1984_backups; [ -d /media/hdd ] || [ -d /media/usb ] || DIR=/tmp/mizou1984_backups; mkdir -p "$DIR"; TS=$(date +%Y%m%d_%H%M); OUT="$DIR/mizou_channels_$TS.tar.gz"; tar -czf "$OUT" /etc/enigma2/lamedb* /etc/enigma2/*.tv /etc/enigma2/*.radio /etc/enigma2/bouquets.* /etc/enigma2/blacklist /etc/enigma2/whitelist /etc/tuxbox/satellites.xml 2>/dev/null || true; ls -lh "$OUT" && echo "[mizou1984] CHANNELS BACKUP SAVED TO $OUT"'
      CMD_DPKG='DIR=/media/hdd/mizou1984_backups; [ -d /media/hdd ] || DIR=/media/usb/mizou1984_backups; [ -d /media/hdd ] || [ -d /media/usb ] || DIR=/tmp/mizou1984_backups; mkdir -p "$DIR"; TS=$(date +%Y%m%d_%H%M); OUT="$DIR/mizou_channels_$TS.tar.gz"; tar -czf "$OUT" /etc/enigma2/lamedb* /etc/enigma2/*.tv /etc/enigma2/*.radio /etc/enigma2/bouquets.* /etc/enigma2/blacklist /etc/enigma2/whitelist /etc/tuxbox/satellites.xml 2>/dev/null || true; ls -lh "$OUT" && echo "[mizou1984] CHANNELS BACKUP SAVED TO $OUT"'
      PLUGIN_NAME="[Backup] Channels & Bouquets Backup (باك اب القنوات)"
      ;;
    "backup-emus-subs-now")
      API_URL=""
      CMD_OPKG='DIR=/media/hdd/mizou1984_backups; [ -d /media/hdd ] || DIR=/media/usb/mizou1984_backups; [ -d /media/hdd ] || [ -d /media/usb ] || DIR=/tmp/mizou1984_backups; mkdir -p "$DIR"; TS=$(date +%Y%m%d_%H%M); OUT="$DIR/mizou_emus_subs_$TS.tar.gz"; tar -czf "$OUT" /etc/tuxbox/config /usr/keys /var/keys /etc/CCcam.cfg /etc/enigma2/xstreamity /etc/enigma2/jediplaylists /etc/enigma2/MultiStalkerPro.json /etc/enigma2/iptosat.json /etc/enigma2/e2m3u2bouquet 2>/dev/null || true; ls -lh "$OUT" && echo "[mizou1984] EMUS & SUBSCRIPTIONS BACKUP SAVED TO $OUT"'
      CMD_DPKG='DIR=/media/hdd/mizou1984_backups; [ -d /media/hdd ] || DIR=/media/usb/mizou1984_backups; [ -d /media/hdd ] || [ -d /media/usb ] || DIR=/tmp/mizou1984_backups; mkdir -p "$DIR"; TS=$(date +%Y%m%d_%H%M); OUT="$DIR/mizou_emus_subs_$TS.tar.gz"; tar -czf "$OUT" /etc/tuxbox/config /usr/keys /var/keys /etc/CCcam.cfg /etc/enigma2/xstreamity /etc/enigma2/jediplaylists /etc/enigma2/MultiStalkerPro.json /etc/enigma2/iptosat.json /etc/enigma2/e2m3u2bouquet 2>/dev/null || true; ls -lh "$OUT" && echo "[mizou1984] EMUS & SUBSCRIPTIONS BACKUP SAVED TO $OUT"'
      PLUGIN_NAME="[Backup] Emus & Subscriptions Backup (الاشتراكات والإيمو)"
      ;;
    "backup-restore-now")
      API_URL=""
      CMD_OPKG='LATEST=$(ls -t /media/hdd/mizou1984_backups/*.tar.gz /media/usb/mizou1984_backups/*.tar.gz /tmp/mizou1984_backups/*.tar.gz 2>/dev/null | head -n 1); if [ -n "$LATEST" ]; then echo "[mizou1984] Restoring $LATEST ..."; tar -xzf "$LATEST" -C / && echo "[mizou1984] RESTORE COMPLETE! Restart Enigma2 GUI."; else echo "[mizou1984] No backup archives found yet."; fi'
      CMD_DPKG='LATEST=$(ls -t /media/hdd/mizou1984_backups/*.tar.gz /media/usb/mizou1984_backups/*.tar.gz /tmp/mizou1984_backups/*.tar.gz 2>/dev/null | head -n 1); if [ -n "$LATEST" ]; then echo "[mizou1984] Restoring $LATEST ..."; tar -xzf "$LATEST" -C / && echo "[mizou1984] RESTORE COMPLETE! Restart Enigma2 GUI."; else echo "[mizou1984] No backup archives found yet."; fi'
      PLUGIN_NAME="[Restore] Restore Saved Backup (استعادة نسخة احتياطية)"
      ;;
    "backup-flash")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/backupflashe/backupflashe.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/backupflashe/backupflashe.sh -O - | /bin/sh'
      PLUGIN_NAME="BackupFlash (Full Image & Online Flash)"
      ;;
    "cccam-adder")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/emil237/plugins/refs/heads/main/easy-cccam/easy-cccam.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/emil237/plugins/refs/heads/main/easy-cccam/easy-cccam.sh -O - | /bin/sh'
      PLUGIN_NAME="CCcam Adder (Easy-CCcam)"
      ;;
    "multicam-adder")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/emilnabil/download-plugins/refs/heads/main/MultiCamAdder/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/emilnabil/download-plugins/refs/heads/main/MultiCamAdder/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="MultiCamAdder (CCcam / OSCam / NCam)"
      ;;
    "enigma2-reader-adder")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/emilnabil/download-plugins/refs/heads/main/enigma2readeradder/enigma2readeradder.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/emilnabil/download-plugins/refs/heads/main/enigma2readeradder/enigma2readeradder.sh -O - | /bin/sh'
      PLUGIN_NAME="Enigma2 Reader Adder (OSCam / NCam / CCcam)"
      ;;
    "dreamosat-xline")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/dreamosatxline/dreamosatxline.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/dreamosatxline/dreamosatxline.sh -O - | /bin/sh'
      PLUGIN_NAME="DreamOSat XLine (CCcam / OSCam Line Adder)"
      ;;
    "cccam-info")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/cccaminfo/cccaminfo.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/cccaminfo/cccaminfo.sh -O - | /bin/sh'
      PLUGIN_NAME="CCcam Info"
      ;;
    "oscam-status")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/oscam-status/oscam-status.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/oscam-status/oscam-status.sh -O - | /bin/sh'
      PLUGIN_NAME="OSCam Status Viewer"
      ;;
    "freeserver-mino60")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/freeserver/freeserver.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/freeserver/freeserver.sh -O - | /bin/sh'
      PLUGIN_NAME="FreeServer (Mino60 Free CCcam / OSCam)"
      ;;
    "levi45-freeserver")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/levi45-freeserver/levi45-freeserver.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/levi45-freeserver/levi45-freeserver.sh -O - | /bin/sh'
      PLUGIN_NAME="Levi45 FreeServer"
      ;;
    "simple-zoom-panel")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/simple-zoom-panel/simple-zoom-panel.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/simple-zoom-panel/simple-zoom-panel.sh -O - | /bin/sh'
      PLUGIN_NAME="Simple Zoom Panel (Free Servers)"
      ;;
    "zoom-freeserver")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/zoom/zoom.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/zoom/zoom.sh -O - | /bin/sh'
      PLUGIN_NAME="Zoom FreeServer (CFG Zoom Final)"
      ;;
    "server-eaglesat")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/servereaglesat/servereaglesat.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/servereaglesat/servereaglesat.sh -O - | /bin/sh'
      PLUGIN_NAME="Server EagleSat (Free Servers)"
      ;;
    "skyblue-player")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/zouplayer/zouplayer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/zouplayer/zouplayer.sh -O - | /bin/sh'
      PLUGIN_NAME="SkyBlue Player (IPTV & VOD Media Player)"
      ;;
    "skyblue-subtitle-e2")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/aisubtitle-hybrid/aisubtitle-hybrid.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/aisubtitle-hybrid/aisubtitle-hybrid.sh -O - | /bin/sh'
      PLUGIN_NAME="Sky Blue Subtitle E2 (Hybrid AI & Online Subtitles)"
      ;;
    "ciefp-opensubtitles")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/ciefp/CiefpOpenSubtitles/main/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/ciefp/CiefpOpenSubtitles/main/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="Ciefp OpenSubtitles"
      ;;
    "dish-pointer")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/ciefp/CiefpDishPointer/main/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/ciefp/CiefpDishPointer/main/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="Dish Pointer (CiefpDishPointer)"
      ;;
    "screen-grab")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/ciefp/CiefpScreenGrab/main/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/ciefp/CiefpScreenGrab/main/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="Screen Grab (CiefpScreenGrab)"
      ;;
    "screen-grabber")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/screengrabber/screengrabber.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/screengrabber/screengrabber.sh -O - | /bin/sh'
      PLUGIN_NAME="ScreenGrabber"
      ;;
    "shoot-your-screen")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/shootyourscreen/shootyourscreen.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/shootyourscreen/shootyourscreen.sh -O - | /bin/sh'
      PLUGIN_NAME="ShootYourScreen"
      ;;
    "internet-speedtest")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/internetspeedtest/internet-speed-test.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/internetspeedtest/internet-speed-test.sh -O - | /bin/sh'
      PLUGIN_NAME="Internet SpeedTest"
      ;;
    "e2-doctor")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/OliOli2013/E2-Doctor-Plugin/main/installer.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/OliOli2013/E2-Doctor-Plugin/main/installer.sh -O - | /bin/sh'
      PLUGIN_NAME="E2 Doctor (System Diagnostic & Auto-Repair)"
      ;;
    "xcplugin-iptv")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/xcplugin-forever/xcplugin-forever.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/xcplugin-forever/xcplugin-forever.sh -O - | /bin/sh'
      PLUGIN_NAME="XCplugin IPTV (XCPlugin Forever)"
      ;;
    "xtraevent-6-890")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://github.com/emilnabil/download-plugins/raw/refs/heads/main/xtraevent-6.890.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://github.com/emilnabil/download-plugins/raw/refs/heads/main/xtraevent-6.890.sh -O - | /bin/sh'
      PLUGIN_NAME="XtraEvent v6.890 (All-Python Latest)"
      ;;
    "xtraevent-6-840")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://github.com/emilnabil/download-plugins/raw/refs/heads/main/xtraevent/xtraevent-6.840.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://github.com/emilnabil/download-plugins/raw/refs/heads/main/xtraevent/xtraevent-6.840.sh -O - | /bin/sh'
      PLUGIN_NAME="XtraEvent v6.840 (Python 3 Mod)"
      ;;
    "xtraevent-6-7")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/xtraevent/xtraevent-6.7.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/xtraevent/xtraevent-6.7.sh -O - | /bin/sh'
      PLUGIN_NAME="XtraEvent v6.7 (ElieSat Edition)"
      ;;
    "xtraevent-6-6")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/xtraevent/xtraevent-6.6.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/xtraevent/xtraevent-6.6.sh -O - | /bin/sh'
      PLUGIN_NAME="XtraEvent v6.6 (Stable)"
      ;;
    "xtraevent-5-3")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/xtraevent/xtraevent-5.3.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/extensions/-/raw/main/xtraevent/xtraevent-5.3.sh -O - | /bin/sh'
      PLUGIN_NAME="XtraEvent v5.3 (Light Edition)"
      ;;
    "xtraevent-4-6")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://github.com/emil237/download-plugins/raw/main/Xtraevent-v4.6.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://github.com/emil237/download-plugins/raw/main/Xtraevent-v4.6.sh -O - | /bin/sh'
      PLUGIN_NAME="XtraEvent v4.6 (Py2/Py3)"
      ;;
    "xtraevent-mnasr")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://github.com/popking159/xtraeventplugin/raw/main/xtraevent-install.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://github.com/popking159/xtraeventplugin/raw/main/xtraevent-install.sh -O - | /bin/sh'
      PLUGIN_NAME="XtraEvent Mod (by M.Nasr)"
      ;;
    "quran-mizouh")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/mizouh1984/quran_mizouh/main/install_quran_mizouh_allinone.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://raw.githubusercontent.com/mizouh1984/quran_mizouh/main/install_quran_mizouh_allinone.sh -O - | /bin/sh'
      PLUGIN_NAME="Quran Reader - mizouh (قارئ القرآن)"
      ;;
    "hd-glass-17")
      API_URL=""
      CMD_OPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/skins/-/raw/main/all/fullhdglass17/fullhdglass17.sh -O - | /bin/sh'
      CMD_DPKG='wget -q "--no-check-certificate" https://gitlab.com/eliesat/skins/-/raw/main/all/fullhdglass17/fullhdglass17.sh -O - | /bin/sh'
      PLUGIN_NAME="HD Glass 17 (FullHDGlass17)"
      ;;
    "kraven-hd")
      API_URL=""
      CMD_OPKG='rm -rf /tmp/kravenhd.tar.gz /tmp/kravenhd_extract && mkdir -p /tmp/kravenhd_extract && (wget --no-check-certificate -q -O /tmp/kravenhd.tar.gz https://codeload.github.com/KravenHD/KravenHD/tar.gz/refs/heads/master || curl -fsSLk -o /tmp/kravenhd.tar.gz https://codeload.github.com/KravenHD/KravenHD/tar.gz/refs/heads/master) && tar -xzf /tmp/kravenhd.tar.gz -C /tmp/kravenhd_extract && cp -rf /tmp/kravenhd_extract/KravenHD-master/usr / && ([ -d /tmp/kravenhd_extract/KravenHD-master/etc ] && cp -rf /tmp/kravenhd_extract/KravenHD-master/etc / || true) && rm -rf /tmp/kravenhd.tar.gz /tmp/kravenhd_extract && echo "[mizou1984] KravenHD installed! Open KravenHD plugin & press GREEN to activate."'
      CMD_DPKG='rm -rf /tmp/kravenhd.tar.gz /tmp/kravenhd_extract && mkdir -p /tmp/kravenhd_extract && (wget --no-check-certificate -q -O /tmp/kravenhd.tar.gz https://codeload.github.com/KravenHD/KravenHD/tar.gz/refs/heads/master || curl -fsSLk -o /tmp/kravenhd.tar.gz https://codeload.github.com/KravenHD/KravenHD/tar.gz/refs/heads/master) && tar -xzf /tmp/kravenhd.tar.gz -C /tmp/kravenhd_extract && cp -rf /tmp/kravenhd_extract/KravenHD-master/usr / && ([ -d /tmp/kravenhd_extract/KravenHD-master/etc ] && cp -rf /tmp/kravenhd_extract/KravenHD-master/etc / || true) && rm -rf /tmp/kravenhd.tar.gz /tmp/kravenhd_extract && echo "[mizou1984] KravenHD installed! Open KravenHD plugin & press GREEN to activate."'
      PLUGIN_NAME="KravenHD Skin"
      ;;
    "kraven-fhd")
      API_URL=""
      CMD_OPKG='rm -rf /tmp/kravenfhd.tar.gz /tmp/kravenfhd_extract && mkdir -p /tmp/kravenfhd_extract && (wget --no-check-certificate -q -O /tmp/kravenfhd.tar.gz https://codeload.github.com/KravenHD/KravenFHD/tar.gz/refs/heads/master || curl -fsSLk -o /tmp/kravenfhd.tar.gz https://codeload.github.com/KravenHD/KravenFHD/tar.gz/refs/heads/master) && tar -xzf /tmp/kravenfhd.tar.gz -C /tmp/kravenfhd_extract && cp -rf /tmp/kravenfhd_extract/KravenFHD-master/usr / && ([ -d /tmp/kravenfhd_extract/KravenFHD-master/etc ] && cp -rf /tmp/kravenfhd_extract/KravenFHD-master/etc / || true) && rm -rf /tmp/kravenfhd.tar.gz /tmp/kravenfhd_extract && echo "[mizou1984] KravenFHD installed! Open KravenFHD plugin & press GREEN to activate."'
      CMD_DPKG='rm -rf /tmp/kravenfhd.tar.gz /tmp/kravenfhd_extract && mkdir -p /tmp/kravenfhd_extract && (wget --no-check-certificate -q -O /tmp/kravenfhd.tar.gz https://codeload.github.com/KravenHD/KravenFHD/tar.gz/refs/heads/master || curl -fsSLk -o /tmp/kravenfhd.tar.gz https://codeload.github.com/KravenHD/KravenFHD/tar.gz/refs/heads/master) && tar -xzf /tmp/kravenfhd.tar.gz -C /tmp/kravenfhd_extract && cp -rf /tmp/kravenfhd_extract/KravenFHD-master/usr / && ([ -d /tmp/kravenfhd_extract/KravenFHD-master/etc ] && cp -rf /tmp/kravenfhd_extract/KravenFHD-master/etc / || true) && rm -rf /tmp/kravenfhd.tar.gz /tmp/kravenfhd_extract && echo "[mizou1984] KravenFHD installed! Open KravenFHD plugin & press GREEN to activate."'
      PLUGIN_NAME="KravenFHD Skin (1080p)"
      ;;
    *)
      continue
      ;;
  esac

  if [ -z "$API_URL" ]; then
    continue
  fi

  REMOTE_SHA=$(wget -q --no-check-certificate -U "mizou1984-e2-updater/5.7.0" -O - "$API_URL" 2>/dev/null | grep -oE '"(sha|short_id)"[[:space:]]*:[[:space:]]*"[0-9a-f]+"' | head -n 1 | sed -E 's/.*"([0-9a-f]+)"/\1/' | cut -c1-12)

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

# Purge any stale bytecode & pre-compile fresh plugin.py
rm -rf "$PLUGIN_DIR/__pycache__" "$PLUGIN_DIR"/*.pyc "$PLUGIN_DIR"/*.pyo 2>/dev/null || true
if command -v python3 >/dev/null 2>&1; then
  python3 -m py_compile "$PLUGIN_DIR/plugin.py" 2>/dev/null || true
elif command -v python >/dev/null 2>&1; then
  python -m py_compile "$PLUGIN_DIR/plugin.py" 2>/dev/null || true
fi

# Mirror to /usr/lib64 only if it is a separate non-symlink Enigma2 plugin directory
if [ -d "/usr/lib64/enigma2/python/Plugins/Extensions" ] && [ ! -L "/usr/lib64" ] && [ "$(readlink -f /usr/lib64/enigma2/python/Plugins/Extensions 2>/dev/null)" != "$(readlink -f /usr/lib/enigma2/python/Plugins/Extensions 2>/dev/null)" ]; then
  cp -a "$PLUGIN_DIR" "$PLUGIN_DIR64" 2>/dev/null || true
fi

# Sync opkg status version if originally installed via .ipk
if [ -f /var/lib/opkg/status ] && grep -q "Package: enigma2-plugin-extensions-mizou1984store" /var/lib/opkg/status 2>/dev/null; then
  awk '/^Package: enigma2-plugin-extensions-mizou1984store$/{f=1} f&&/^Version:/{$0="Version: 5.7.0"; f=0} {print}' /var/lib/opkg/status > /tmp/opkg_status.mizou && mv -f /tmp/opkg_status.mizou /var/lib/opkg/status 2>/dev/null || true
fi

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

INSTALLED_VER=$(awk -F'"' '/^PLUGIN_VERSION = /{print $2; exit}' "$PLUGIN_DIR/plugin.py" 2>/dev/null)
echo "[mizou1984] Verified installed version: v${INSTALLED_VER:-5.7.0}"
echo "[mizou1984] Auto-Updater scheduled: 0 4 * * *"

if [ "$1" = "--no-restart" ]; then
  echo "[mizou1984] Background update complete (GUI restart deferred)."
  exit 0
fi

echo "[mizou1984] Restarting Enigma2 GUI to load v${INSTALLED_VER:-5.7.0}..."
sync
sleep 1

if [ -f /var/lib/dpkg/status ]; then
  (sleep 2; systemctl restart enigma2) >/dev/null 2>&1 &
else
  (wget -qO- "http://127.0.0.1/web/powerstate?newstate=3" >/dev/null 2>&1 || true)
  (sleep 3; killall -9 enigma2) >/dev/null 2>&1 &
fi

exit 0
