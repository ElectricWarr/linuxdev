# --------------------------
# Script to package linuxdev
# Author: Michael Warr
# Version: 0.1.0
# Requirements:
#   makeself
# --------------------------

usage () {
  printf 'usage: package.sh RELEASE\n'
  printf 'RELEASE   Version of current release, like 1.1.1\n'
  printf '\n'
}

if [[ $# -ne 1 ]] || [[ ! "$1" =~ [0-9]\.[0-9]\.[0-9] ]]; then
  usage
  exit 1
fi

release="$1"

# Prepare release in a temporary directory
temp_dir="$(mktemp -d)"
release_dir="$temp_dir"'/'"$release"

mkdir "$release_dir"
cp ../source/* "$release_dir"
cp 'install.sh' "$release_dir"

# Add a version file for reference
echo "$release" > "$release_dir"'/release'

# Package using makeself
makeself "$release_dir" '../releases/linuxdev_'"$release"'.run' 'linuxdev v'"$release" './install.sh'

# Cleanup
rm -rf "$temp_dir"

