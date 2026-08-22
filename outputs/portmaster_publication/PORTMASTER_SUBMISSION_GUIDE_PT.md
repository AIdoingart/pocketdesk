# Como preparar o PocketDesk para submissao ao PortMaster

Este documento resume o caminho para transformar o PocketDesk 1.0 em uma submissao oficial ao PortMaster.

## Fontes oficiais consultadas

- Documentacao de empacotamento do PortMaster: https://portmaster.games/packaging.html
- Repositorio atual de submissao: https://github.com/PortsMaster/PortMaster-New
- Documentacao sobre `port.json` / Harbourmaster: https://portmaster.games/harbourmaster.html

## Estrutura esperada pelo PortMaster

Segundo a documentacao atual, os ports oficiais ficam no repositorio `PortsMaster/PortMaster-New`, dentro de `ports/`, cada um em sua propria pasta.

Para uma submissao oficial, o PocketDesk deve virar algo como:

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

Observacao: nosso pacote atual de teste ja roda no R36S, mas a submissao oficial precisa seguir a estrutura exigida pelo repositorio do PortMaster.

## Passo a passo sugerido

1. Criar uma conta no GitHub, se ainda nao tiver.
2. Fazer fork do repositorio `PortsMaster/PortMaster-New`.
3. Desativar GitHub Actions no fork, como a documentacao do repositorio recomenda.
4. Clonar o fork.
5. Rodar o script oficial de preparacao:

```text
tools/prepare_repo.sh
```

6. Criar a pasta:

```text
ports/pocketdesk/
```

7. Copiar os arquivos do PocketDesk para essa pasta.
8. Adicionar `screenshot.png` em formato 640x480 ou outro formato aceito pelo PortMaster.
9. Revisar `port.json`, `README.md` e `gameinfo.xml`.
10. Rodar o check oficial:

```text
python3 tools/build_release.py --do-check
```

11. Corrigir os avisos do checker.
12. Abrir Pull Request para o PortMaster-New.

## Pontos que ainda precisam ser feitos antes do PR

- Criar um `screenshot.png` real da tela do PocketDesk no R36S ou captura equivalente.
- Revisar se o nome do arquivo `port.json` deve permanecer `port.json` dentro da estrutura nova ou se o fluxo local pede tambem metadata Harbourmaster adicional.
- Validar se `genre: utility` e `runtime: love_11.5` estao corretos no check oficial.
- Conferir a licenca do wallpaper usado.
- Conferir a licenca da fonte Press Start 2P e incluir credito.
- Rodar o app em mais de um firmware/dispositivo, se possivel.

## Posicionamento do projeto

Texto sugerido:

PocketDesk is a guided learning productivity toolkit for retro handhelds, directed by Gabriel Freitas and developed with Codex as a technical programming partner. It turns the R36S into a small offline pixel PDA with Clock, Notes, To Do, Agenda, Calculator, Timer, MTG counter, and Settings.

