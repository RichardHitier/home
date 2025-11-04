#!/bin/bash

# Script de synchronisation rclone
# Ajout de logs avec horodatage

LOG_FILE="$HOME/rclone-sync.log"

echo "=== Début synchronisation $(date) ===\n" > "$LOG_FILE"


echo "==  Synchronisation de ~/00PRO ==" >> "$LOG_FILE"
echo "==  -------------------------- ==\n" >> "$LOG_FILE"
rclone sync --log-level INFO  00PRO gdrive:backup/00PRO 2>&1 | tee -a "$LOG_FILE"

echo "==  Synchronisation de ~/00COMMON ==" >> "$LOG_FILE"
echo "==  ----------------------------- ==\n" >> "$LOG_FILE"
rclone sync --log-level INFO  03COMMON gdrive:backup/03COMMON 2>&1 | tee -a "$LOG_FILE"

echo "==  Synchronisation de ~/Bureau ==" >> "$LOG_FILE"
echo "==  --------------------------- ==\n" >> "$LOG_FILE"
rclone sync --log-level INFO  Bureau gdrive:backup/Bureau 2>&1 | tee -a "$LOG_FILE"

echo "=== Fin synchronisation $(date) ===" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"
