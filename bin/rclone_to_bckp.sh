#!/bin/bash

LOG_FILE="$HOME/rclone-sync.log"

echo -e "=== Début synchronisation $(date) ===\n" > "$LOG_FILE"

echo -e "\n== Vérification réseau ==" >> "$LOG_FILE"
echo -e "== ------------------- ==\n" >> "$LOG_FILE"

if ping -c 1 google.com &>/dev/null; then
    echo "Connexion réseau OK" >> "$LOG_FILE"
else
    echo "Erreur : pas de connexion réseau, synchronisation annulée." >> "$LOG_FILE"
    exit 1
fi

DIRS=(
    "00PRO"
    "01DEV"
    "03COMMON"
    "Bureau"
)

for dir in "${DIRS[@]}"; do
    echo -e "\n== Synchronisation de ~/$dir ==" >> "$LOG_FILE"
    echo -e "== --------------------------- ==\n" >> "$LOG_FILE"

    rclone sync --log-level INFO "$dir" "gdrive:backup/$dir" 2>&1 | tee -a "$LOG_FILE"
done

echo -e "\n=== Fin synchronisation $(date) ===" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"
