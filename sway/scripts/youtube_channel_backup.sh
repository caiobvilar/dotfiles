#!/bin/bash

# Usage check
if [ -z "$1" ]; then
  echo "Usage: $0 USERNAME_OR_HANDLE"
  echo "Example: $0 SomeChannel or $0 @SomeChannel"
  exit 1
fi

USERNAME="$1"

# Normalize handle: if it doesn't start with '@', prepend it
if [[ "$USERNAME" != @* ]]; then
  USERNAME="@$USERNAME"
fi

# Set channel URL and output directory
CHANNEL_URL="https://www.youtube.com/${USERNAME}"

BACKUP_DIR="$HOME/youtube_backup"
ARCHIVE_FILE="$HOME/youtube_backup.tar.xz"

# Create backup directory if missing
mkdir -p "$BACKUP_DIR"

# Download all channel videos with yt-dlp
yt-dlp \
  --output "$BACKUP_DIR/%(upload_date)s - %(title)s.%(ext)s" \
  --download-archive "$BACKUP_DIR/archive.txt" \
  --embed-metadata \
  --embed-thumbnail \
  --embed-subs \
  --all-subs \
  "$CHANNEL_URL"

# Compress using tar + xz (maximum ratio)
tar -cJvf "$ARCHIVE_FILE" -C "$BACKUP_DIR" .

# Get archive size in bytes
SIZE=$(stat -c%s "$ARCHIVE_FILE")

# Size threshold: 10 GB = 10737418240 bytes
THRESHOLD=10737418240

if [ "$SIZE" -gt "$THRESHOLD" ]; then
  echo "WARNING: Archive file is larger than 10 GB ($(du -h "$ARCHIVE_FILE" | cut -f1))."
  echo -n "Continue and keep the archive? (y/n): "
  read RESP
  case "$RESP" in
  [Yy]*)
    echo "Backup complete. Archive: $ARCHIVE_FILE"
    ;;
  *)
    rm -f "$ARCHIVE_FILE"
    echo "Archive deleted as requested."
    ;;
  esac
else
  echo "Backup complete. Archive: $ARCHIVE_FILE"
fi
