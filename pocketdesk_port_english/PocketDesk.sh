#!/bin/bash

XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}

if [ -d "/opt/system/Tools/PortMaster/" ]; then
  controlfolder="/opt/system/Tools/PortMaster"
elif [ -d "/opt/tools/PortMaster/" ]; then
  controlfolder="/opt/tools/PortMaster"
elif [ -d "$XDG_DATA_HOME/PortMaster/" ]; then
  controlfolder="$XDG_DATA_HOME/PortMaster"
else
  controlfolder="/roms/ports/PortMaster"
fi

source "$controlfolder/control.txt"
[ -f "${controlfolder}/mod_${CFW_NAME}.txt" ] && source "${controlfolder}/mod_${CFW_NAME}.txt"

get_controls

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DEFAULT_GAMEDIR="/$directory/ports/pocketdesk"
GAMEDIR=""

for candidate in \
  "$SCRIPT_DIR/pocketdesk" \
  "$DEFAULT_GAMEDIR" \
  "$SCRIPT_DIR" \
  "$SCRIPT_DIR/pocketdesk_port/pocketdesk"
do
  if [ -d "$candidate/lovegame" ]; then
    GAMEDIR="$candidate"
    break
  fi
done

if [ -z "$GAMEDIR" ]; then
  LOGDIR="$SCRIPT_DIR"
  [ -w "$DEFAULT_GAMEDIR" ] && LOGDIR="$DEFAULT_GAMEDIR"
  > "$LOGDIR/pocketdesk-launch-error.txt" && exec > >(tee "$LOGDIR/pocketdesk-launch-error.txt") 2>&1
  echo "Starting PocketDesk"
  echo "ERROR: PocketDesk game folder not found."
  echo "Expected one of these folders to contain lovegame:"
  echo "- $SCRIPT_DIR/pocketdesk"
  echo "- $DEFAULT_GAMEDIR"
  echo "- $SCRIPT_DIR"
  echo "- $SCRIPT_DIR/pocketdesk_port/pocketdesk"
  echo ""
  echo "Install layout should be:"
  echo "/roms/ports/PocketDesk.sh"
  echo "/roms/ports/pocketdesk/lovegame/main.lua"
  echo "/roms/ports/pocketdesk/pocketdesk.gptk"
  sleep 8
  exit 1
fi

CONFDIR="$GAMEDIR/conf"

mkdir -p "$CONFDIR"
cd "$GAMEDIR" || exit 1

> "$GAMEDIR/log.txt" && exec > >(tee "$GAMEDIR/log.txt") 2>&1

echo "Starting PocketDesk"
echo "Device arch: $DEVICE_ARCH"
echo "CFW: $CFW_NAME"
echo "Script dir: $SCRIPT_DIR"
echo "Game dir: $GAMEDIR"

export XDG_DATA_HOME="$CONFDIR"
export SDL_GAMECONTROLLERCONFIG="$sdl_controllerconfig"
export LD_LIBRARY_PATH="$GAMEDIR/libs.${DEVICE_ARCH}:$LD_LIBRARY_PATH"

if [ ! -f "$controlfolder/runtimes/love_11.5/love.txt" ]; then
  echo "Missing Love2D runtime: love_11.5"
  if command -v pm_message >/dev/null 2>&1; then
    pm_message "PocketDesk precisa do runtime Love2D 11.5 no PortMaster Runtime Manager."
  fi
  sleep 5
  exit 1
fi

source "$controlfolder/runtimes/love_11.5/love.txt"

if [ -f "$GAMEDIR/pocketdesk.gptk" ]; then
  $GPTOKEYB "$LOVE_GPTK" -c "$GAMEDIR/pocketdesk.gptk" &
else
  echo "Warning: pocketdesk.gptk not found, launching without custom GPTK mapping."
  $GPTOKEYB "$LOVE_GPTK" &
fi

pm_platform_helper "$LOVE_BINARY"
$LOVE_RUN "$GAMEDIR/lovegame"

pm_finish
