#!/bin/bash

# Script de synchronisation rclone
# Ajout de logs avec horodatage

LOG_FILE="$HOME/rclone-sync.log"

echo "=== Début synchronisation $(date) ===" >> "$LOG_FILE"

rclone sync --progress rhi.txt  gdrive:backup/

#rclone sync --progress 00PRO gdrive:backup/00PRO 2>&1 | tee -a "$LOG_FILE"
#rclone sync --progress 03COMMON gdrive:backup/03COMMON 2>&1 | tee -a "$LOG_FILE"
#rclone sync --progress Bureau gdrive:backup/Bureau 2>&1 | tee -a "$LOG_FILE"

echo "=== Fin synchronisation $(date) ===" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"
