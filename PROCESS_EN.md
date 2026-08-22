# PocketDesk Development Process

PocketDesk started as the idea of turning the R36S into a small retro pocket computer with simple offline tools.

The process was directed by Gabriel Freitas. At each step, Gabriel tested the app on real R36S hardware, shared logs, pointed out control issues, layout problems, visual details, and workflow improvements, then decided what should come next. Codex acted as the technical partner for implementation, review, packaging, and documentation.

## Process Overview

1. Defined the visual identity: pixel UI, Press Start 2P font, dark purple filtered wallpaper, and top tabs.
2. Created the initial Love2D PortMaster app.
3. Fixed the R36S packaging structure, including `lovegame`, launch script, and `pocketdesk.gptk`.
4. Built the Home tab as `Hora`, with large clock, date, and blinking colon.
5. Added functional placeholders for every tab.
6. Built each tool step by step: Notes, To Do, Agenda, Calc, Timer, MTG, and Config.
7. Reused the virtual keyboard across text-entry screens.
8. Adjusted input handling to avoid duplicate button actions on the R36S.
9. Added cover art and metadata for the menu.
10. Closed version 1.0 with README, package, and publication documentation.

## Lessons Learned

- Real hardware testing was essential.
- The R36S can send input through more than one path, so some buttons needed duplicate-action protection.
- Accent-free UI text helped avoid pixel font rendering issues.
- Small-screen UI needs short labels and clean footer text.
- A reusable virtual keyboard reduced repeated work.
- Every tool improved when designed around D-pad and buttons instead of mouse or touch.

## Gabriel Freitas' Role

Gabriel Freitas directed the project:

- concept
- visual direction
- real-device testing
- log sharing
- feature requests
- 1.0 scope decisions
- guided learning direction

## Codex's Role

Codex assisted as a technical partner:

- Love2D implementation
- bug review
- input adjustments
- PortMaster packaging
- documentation
- GitHub and publication preparation

## Version 1.0 State

Version 1.0 includes:

- Clock
- Notes
- To Do
- Agenda
- Calc
- Timer
- MTG
- Settings

The final test package is:

```text
outputs/pocketdesk-portmaster-love-1.0.zip
```

