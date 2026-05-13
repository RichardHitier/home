#!/bin/bash

LOG_FILE="$HOME/rclone-sync.log"

exec 9>/tmp/rclone_to_bckp.lock
flock -n 9 || { echo "$(date): sync déjà en cours, abandon." >> "$LOG_FILE"; exit 1; }

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

    rclone sync --log-level INFO \
        --exclude 'venv/**' --exclude '.git/**' --exclude 'node_modules/**' \
        "$HOME/$dir" "gdrive:backup/$dir" >> "$LOG_FILE" 2>&1 9>&-
done

echo -e "\n=== Fin synchronisation $(date) ===" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"
