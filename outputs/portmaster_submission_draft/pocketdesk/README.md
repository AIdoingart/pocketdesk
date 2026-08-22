# PocketDesk

PocketDesk is an offline pocket productivity toolkit for Linux handhelds, initially built for the R36S running dArkOS RE through PortMaster.

The project was created as a guided learning build: Gabriel Freitas directed the concept, interface decisions, real-device testing, and feature roadmap; Codex was used as a technical partner to help turn those decisions into code, packaging, and documentation.

## Concept

PocketDesk turns a retro handheld into a small pixel-style PDA. It is not meant to replace a phone or computer. Instead, it focuses on fast, readable, offline tools designed around physical controls.

## Version 1.0 Features

- Clock with large centered time, date, and blinking colon.
- Notes with a QWERTY virtual keyboard, line breaks, and simple formatting.
- To Do with tasks, filters, priority, and simple due options.
- Agenda with monthly calendar, events, day event list, and 3-day view.
- Calculator with basic operations, decimal input, percent, square root, and memory.
- Timer with 5/10/15/20/25 minute presets and minute-by-minute adjustment.
- MTG life counter with Normal and Commander modes, 1 to 6 players, names, colors, and solo Commander support.
- Settings for time, date, and wallpaper color filter.
- Short tab-switch animation.
- Local offline saving.

## Platform

- R36S
- dArkOS RE / ArkOS-like systems
- PortMaster
- Love2D 11.5 runtime

## General Controls

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

## Visual Identity

- Font: Press Start 2P
- Pixel-style UI
- Monochrome wallpaper with dark purple filter
- In-app text avoids accented characters to prevent font rendering issues
- Centered tab bar
- Small clock in the footer while using tools

## Credits

Project directed by Gabriel Freitas.

Development assisted by Codex as a programming, review, and packaging partner.

Press Start 2P font by CodeMan38, via Google Fonts.

## Note

PocketDesk was built as a guided learning project. Its development history prioritized real testing on the R36S, iterative refinements, and interface decisions made from actual handheld use.

