# PocketDesk

PocketDesk is an offline retro PDA toolkit for handheld Linux devices, built first for the R36S running dArkOS RE through PortMaster.

This repository documents the first complete version of the project and the guided learning process behind it.

## Guided Learning Project

PocketDesk was directed by **Gabriel Freitas** as a guided learning project.

Gabriel defined the idea, tested the app on real R36S hardware, chose the interface direction, requested each feature, and guided every revision. Codex assisted as a technical programming partner for implementation, debugging, packaging, and documentation.

## Version 1.0

PocketDesk 1.0 includes:

- Clock with large centered time and blinking colon
- Notes with QWERTY virtual keyboard and formatting
- To Do with tasks, priority, due options, and filters
- Agenda with monthly calendar, events, event selection, editing, deletion, and 3-day view
- Calculator with basic operations, percent, square root, and memory
- Timer with presets and minute-by-minute adjustment
- MTG counter with Normal/Commander modes, 1 to 6 players, player names, colors, and solo Commander tracking
- Settings for time, date, and wallpaper color filter

## Target Platform

- R36S
- dArkOS RE / ArkOS-like systems
- PortMaster
- Love2D 11.5 runtime

## Repository Layout

```text
pocketdesk_port/                 PortMaster-ready package source
pocketdesk_port/pocketdesk/      PocketDesk runtime folder
pocketdesk_port/pocketdesk/lovegame/
                                 Love2D app source
outputs/portmaster_publication/  Publication and submission docs
outputs/pocketdesk-portmaster-love-1.0.zip
                                 Built 1.0 test package
```

## Controls

```text
L1              Previous tab
R1              Next tab
A               Select / confirm
B               Back / delete / reset where available
X               Screen-specific secondary action
Y               Screen-specific secondary action
Start           Menu or screen-specific extra action
D-pad           Navigate and adjust fields
Analog sticks   Also navigate, with cooldown
```

## Credits

Project direction: Gabriel Freitas

Development assistance: Codex

Font: Press Start 2P by CodeMan38, via Google Fonts

## Portuguese Summary

PocketDesk e um conjunto de ferramentas offline para o R36S, feito como um PDA retro em pixel art. O projeto foi dirigido por Gabriel Freitas em um processo de aprendizado guiado, com Codex ajudando como parceiro tecnico para programacao, revisao, empacotamento e documentacao.

Veja tambem:

- [PROCESSO_PT.md](PROCESSO_PT.md)
- [PROCESS_EN.md](PROCESS_EN.md)
- [PORTMASTER_PUBLICATION.md](PORTMASTER_PUBLICATION.md)

