#!/bin/bash

LOG_FILE="$HOME/rclone-from-gdrive.log"

exec 9>/tmp/rclone_from_gdrive.lock
flock -n 9 || { echo "$(date): copy already running, abort." >> "$LOG_FILE"; exit 1; }

echo -e "=== Début copie Drive → PC $(date) ===\n" > "$LOG_FILE"

if ! ping -c 1 google.com &>/dev/null; then
    echo "Erreur : pas de connexion réseau, copie annulée." >> "$LOG_FILE"
    exit 1
fi

# Drive stores the accent as a combining character (e + U+0301),
# so a typed "é" does not match: build the exact byte sequence.
SRC="gdrive:LES CARANGUES/"$'Comptabilité'
DEST="$HOME/03COMMON/000carangues/drive_bckp/Comptabilite"
# Overwritten files are moved here instead of being lost.
BACKUP_DIR="$HOME/03COMMON/000carangues/drive_bckp/_versions/$(date +%F_%H%M)"

rclone copy --log-level INFO \
    --drive-shared-with-me \
    --drive-export-formats docx,xlsx,pptx,svg \
    --backup-dir "$BACKUP_DIR" \
    "$SRC" "$DEST" >> "$LOG_FILE" 2>&1 9>&-

echo -e "\n=== Fin copie $(date) ===\n" >> "$LOG_FILE"
