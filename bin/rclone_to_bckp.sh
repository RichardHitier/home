#!/bin/bash

# Script de synchronisation rclone
# Ajout de logs avec horodatage

LOG_FILE="$HOME/rclone-sync.log"

echo -e "=== Début synchronisation $(date) ===\n" > "$LOG_FILE"

# Vérification de la connexion réseau
echo -e "\n== Vérification réseau ==" >> "$LOG_FILE"
echo -e "== ------------------- ==\n" >> "$LOG_FILE"
if ping -c 1 google.com &>/dev/null; then
    echo -e "Connexion réseau OK" >> "$LOG_FILE"
else
    echo -e "Erreur : pas de connexion réseau, synchronisation annulée." >> "$LOG_FILE"
    exit 1
fi

echo -e "\n==  Synchronisation de ~/00PRO ==" >> "$LOG_FILE"
echo -e "==  -------------------------- ==\n" >> "$LOG_FILE"
rclone sync --log-level INFO  00PRO gdrive:backup/00PRO 2>&1 | tee -a "$LOG_FILE"

echo -e "\n==  Synchronisation de ~/00COMMON ==" >> "$LOG_FILE"
echo -e "==  ----------------------------- ==\n" >> "$LOG_FILE"
rclone sync --log-level INFO  03COMMON gdrive:backup/03COMMON 2>&1 | tee -a "$LOG_FILE"

echo -e "\n==  Synchronisation de ~/Bureau ==" >> "$LOG_FILE"
echo -e "==  --------------------------- ==\n" >> "$LOG_FILE"
rclone sync --log-level INFO  Bureau gdrive:backup/Bureau 2>&1 | tee -a "$LOG_FILE"

echo -e "\n=== Fin synchronisation $(date) ===" >> "$LOG_FILE"
echo -e "" >> "$LOG_FILE"
