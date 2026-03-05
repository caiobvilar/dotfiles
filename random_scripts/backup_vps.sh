#!/bin/bash

# Customize paths for local and remote storage
LOCAL_BACKUP_DIR="/mnt/caa4e931-513a-4ba6-974e-92bd13499a68/VPS_BKP/vps-backup-$(date +%Y-%m-%d)"
REMOTE_TMP_DIR="~/tmp-vps-backup"
STEPS=7
CUR=1

function progress {
  local total=$STEPS
  local current=$CUR
  local percent=$((100 * current / total))
  local filled=$((40 * current / total))
  local empty=$((40 - filled))
  printf "\r["
  for ((i = 0; i < filled; i++)); do printf "#"; done
  for ((i = 0; i < empty; i++)); do printf "-"; done
  printf "] %3d%%  Step %d/%d: %s\n" "$percent" "$current" "$total" "$1"
  CUR=$((CUR + 1))
}

CUR=1
echo "Starting automated VPS backup to $LOCAL_BACKUP_DIR"
mkdir -p "$LOCAL_BACKUP_DIR"

progress "Creating remote temp backup folder"
ssh ionos-vps "mkdir -p $REMOTE_TMP_DIR"

progress "Copying YAML/Compose/Config files"
ssh ionos-vps bash -c "'
for f in \
  certbot-compose.yml \
  cloudflared-compose.yml \
  nginx.log \
  changedetect-compose.yml \
  chrome.json \
  cloudflared-config-check.yml \
  config.yml \
  server.yml \
  scripts \
  playwrightufcg.py \
  cloudflared-compose.yml \
  couchdb-compose.yml \
  docker.ini \
  letsencrypt \
  accounts \
  acme-v02.api.letsencrypt.org \
  directory \
  nginx.conf \
  reverse-proxy.conf \
  ntfy-compose.yml \
  syncthing-compose.yml ; do
[ -e \$f ] && cp -r \$f $REMOTE_TMP_DIR/
done
'"

progress "Copying CouchDB and database files"
ssh ionos-vps bash -c "'
for d in \
  couchdb-data \
  couchdb-certs \
  couchdb-etc \
  dbs.couch \
  nodes.couch \
  shards \
  users.*.couch ; do
[ -e \$d ] && cp -r \$d $REMOTE_TMP_DIR/
done
'"

progress "Copying SSL certificates and keys"
ssh ionos-vps bash -c "'
for f in \
  ca.crt.out \
  cloudflare.ini \
  fedora.crt fedora.csr fedora.key \
  cert1.pem chain1.pem fullchain1.pem privkey1.pem \
  cert.pem privkey.pem chain.pem ; do
[ -e \$f ] && cp -r \$f $REMOTE_TMP_DIR/
done
'"

progress "Copying user and personal data"
ssh ionos-vps bash -c "'
for d in \
  webroot \
  archive \
  scripts \
  data ; do
[ -e \$d ] && cp -r \$d $REMOTE_TMP_DIR/
done
'"

progress "Copying Podman volumes (if any)"
VOLS=$(ssh ionos-vps "podman volume ls -q")
for VOL in $VOLS; do
  ssh ionos-vps "podman volume export $VOL > $REMOTE_TMP_DIR/volume-$VOL.tar"
  rsync -ah -e ssh ionos-vps:$REMOTE_TMP_DIR/volume-$VOL.tar "$LOCAL_BACKUP_DIR/"
done

progress "Copying dpkg package list"
ssh ionos-vps "dpkg --get-selections > ~/tmp-vps-backup/dpkg-selections.txt"
rsync -ah -e ssh ionos-vps:~/tmp-vps-backup/dpkg-selections.txt "$LOCAL_BACKUP_DIR/"
progress "Copying all files to local backup directory"
rsync -ah --delete -e ssh ionos-vps:$REMOTE_TMP_DIR/ "$LOCAL_BACKUP_DIR/"

# Clean up remote temp backup
ssh ionos-vps "rm -rf $REMOTE_TMP_DIR"

echo
echo "Backup complete! All files saved in: $LOCAL_BACKUP_DIR"
