# --------------------------
# Script to install linuxdev
# Author: Michael Warr
# Version: 0.0.0
# --------------------------

# Functions
datetimestamp () {
  # Only down to the second :(
  date +%Y%m%d%H%M%S
}

backup_file () {
  local source="$1"
  mkdir -p "$backup_dir"
  cp "$source" "$backup_dir"
}

move_and_backup () {
  local source="$1"
  local target="$2"
  [[ -f "$target" ]] && backup_file "$target"
  mv -f "$source" "$target"
}

# Variables
linuxdev_dir="$HOME/.linuxdev"
backup_dir="$linuxdev_dir"/backup_$(datetimestamp)
release="$(cat release)"

# Create .linuxdev
mkdir -p "$linuxdev_dir"

# Deploy, backuping up any files as necessary
move_and_backup 'Dockerfile' "$linuxdev_dir"'/Dockerfile'
move_and_backup 'docker-compose.yml' "$linuxdev_dir"'/docker-compose.yml'
move_and_backup 'linuxdev' "$linuxdev_dir"'/linuxdev'

# Link to the linuxdev tool from somewhere already on the path **REQUIRES SUDO**
ln -s "$linuxdev_dir/linuxdev" '/usr/local/bin/linuxdev'

