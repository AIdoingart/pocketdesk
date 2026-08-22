# PortMaster Publication Notes

PocketDesk 1.0 is ready as a local test package, but an official PortMaster submission should follow the PortMaster repository workflow.

Official references checked:

- PortMaster Packaging: https://portmaster.games/packaging.html
- PortMaster-New repository: https://github.com/PortsMaster/PortMaster-New
- Harbourmaster / port.json: https://portmaster.games/harbourmaster.html

## Suggested Official Structure

```text
ports/pocketdesk/
  port.json
  README.md
  gameinfo.xml
  screenshot.png
  cover.png
  PocketDesk.sh
  pocketdesk/
    pocketdesk.gptk
    lovegame/
      conf.lua
      main.lua
      assets/
        fonts/
        wallpapers/
    media/
```

## Before a Pull Request

- Add a real `screenshot.png`.
- Confirm wallpaper license.
- Confirm and credit Press Start 2P font license.
- Run the official PortMaster checker:

```text
python3 tools/build_release.py --do-check
```

- Fix any checker warnings.
- Test from a clean install on the R36S.

## Positioning

Suggested short description:

PocketDesk is a guided learning productivity toolkit for retro handhelds, directed by Gabriel Freitas and developed with Codex as a technical programming partner.

