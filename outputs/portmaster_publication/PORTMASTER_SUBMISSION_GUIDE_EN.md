# Preparing PocketDesk for PortMaster Submission

This document summarizes how to turn PocketDesk 1.0 into an official PortMaster submission.

## Official Sources Checked

- PortMaster packaging documentation: https://portmaster.games/packaging.html
- Current submission repository: https://github.com/PortsMaster/PortMaster-New
- `port.json` / Harbourmaster documentation: https://portmaster.games/harbourmaster.html

## Expected PortMaster Structure

According to current PortMaster documentation, official ports live inside the `PortsMaster/PortMaster-New` repository under `ports/`, with one directory per port.

For an official submission, PocketDesk should become something like:

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

Note: the current test package already runs on the R36S, but the official submission should follow the structure required by the PortMaster repository.

## Suggested Submission Flow

1. Create a GitHub account if needed.
2. Fork `PortsMaster/PortMaster-New`.
3. Disable GitHub Actions in your fork, as recommended by the repository documentation.
4. Clone your fork.
5. Run the official preparation script:

```text
tools/prepare_repo.sh
```

6. Create:

```text
ports/pocketdesk/
```

7. Copy the PocketDesk files into that folder.
8. Add a real `screenshot.png`.
9. Review `port.json`, `README.md`, and `gameinfo.xml`.
10. Run the official checker:

```text
python3 tools/build_release.py --do-check
```

11. Fix any checker warnings.
12. Open a Pull Request to PortMaster-New.

## Before Opening the PR

- Add a real `screenshot.png` from the R36S or an equivalent capture.
- Confirm the exact accepted metadata format with the official checker.
- Validate `utility` genre and `love_11.5` runtime.
- Confirm the wallpaper license.
- Confirm and credit the Press Start 2P font license.
- Test on more firmware/device combinations if possible.

## Project Positioning

Suggested text:

PocketDesk is a guided learning productivity toolkit for retro handhelds, directed by Gabriel Freitas and developed with Codex as a technical programming partner. It turns the R36S into a small offline pixel PDA with Clock, Notes, To Do, Agenda, Calculator, Timer, MTG counter, and Settings.

