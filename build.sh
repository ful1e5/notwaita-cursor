#!/bin/bash
# A script for preparing binaries of Notwaita Cursors, created by Abdulkaiz Khatri.

version="v1.0.0"

error() (
  set -o pipefail
  "$@" 2> >(sed $'s,.*,\e[31m&\e[m,' >&2)
)

get_config_file() {
  local key="${1}"
  local cfg_file="build.toml"

  if [[ $key == *"Right"* ]]; then
    cfg_file="build.right.toml"
  fi

  echo $cfg_file
}

with_version() {
  local comment="${1}"
  echo "$comment ($version)"
}

if ! type -p ctgen >/dev/null; then
  error ctgen
  exit 127 # exit program with "command not found" error code
fi

declare -A names
names["Notwaita-Black"]=$(with_version "Black Notwaita")
names["Notwaita-Gray"]=$(with_version "Gray Notwaita")
names["Notwaita-White"]=$(with_version "White Notwaita")

# Cleanup old builds
rm -rf themes bin

# Building Apple XCursor binaries
for key in "${!names[@]}"; do
  comment="${names[$key]}"
  cfg=$(get_config_file key)

  ctgen "configs/x.$cfg" -p x11 -d "bitmaps/$key" -n "$key" -c "$comment  Xcursors - @ful1e5 fork" &
  PID=$!
  wait $PID
done

# Building macOS Windows binaries
for key in "${!names[@]}"; do
  comment="${names[$key]}"
  cfg=$(get_config_file key)

  ctgen "configs/win_rg.$cfg" -d "bitmaps/$key" -n "$key-Regular" -c "$comment Regular Windows Cursors - @ful1e5 fork" &
  ctgen "configs/win_lg.$cfg" -d "bitmaps/$key" -n "$key-Large" -c "$comment Large Windows Cursors - @ful1e5 fork" &
  ctgen "configs/win_xl.$cfg" -d "bitmaps/$key" -n "$key-Extra-Large" -c "$comment Extra Large Windows Cursors - @ful1e5 fork" &
  PID=$!
  wait $PID
done

# Compressing Binaries
mkdir -p bin
cd themes || exit

for key in "${!names[@]}"; do
  tar -cJvf "../bin/${key}.tar.xz" "${key}" &
  PID=$!
  wait $PID
done

# Compressing macOS.tar.xz
cp ../LICENSE .
tar -cJvf "../bin/macOS.tar.xz" --exclude="*-Windows" . &
PID=$!
wait $PID

# Compressing macOS-*-Windows
for key in "${!names[@]}"; do
  zip -rv "../bin/${key}-Windows.zip" "${key}-Regular-Windows" "${key}-Large-Windows" "${key}-Extra-Large-Windows" &
  PID=$!
  wait $PID
done

cd ..

# Copying License File for 'bitmaps'
cp LICENSE bitmaps/
zip -rv bin/bitmaps.zip bitmaps
