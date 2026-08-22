# Processo do PocketDesk

PocketDesk nasceu da ideia de transformar o R36S em um pequeno computador de bolso retro, com ferramentas simples e uteis para uso offline.

O processo foi guiado por Gabriel Freitas. A cada etapa, Gabriel testava no R36S real, trazia logs, apontava problemas de controle, alinhamento, visual e fluxo de uso, e decidia o proximo passo. Codex atuou como parceiro tecnico para implementar, revisar e empacotar as versoes.

## Linha geral do processo

1. Definimos a identidade visual: pixel UI, fonte Press Start 2P, wallpaper com filtro roxo escuro e abas no topo.
2. Criamos o port inicial em Love2D para rodar pelo PortMaster.
3. Corrigimos o empacotamento para o R36S, incluindo estrutura `lovegame`, script de launch e `pocketdesk.gptk`.
4. Implementamos a Home como `Hora`, com relogio grande, data e dois pontos piscando.
5. Criamos placeholders funcionais para todas as abas.
6. Evoluimos cada ferramenta uma por uma: Notas, To Do, Agenda, Calc, Timer, MTG e Config.
7. Reaproveitamos o teclado virtual nas telas que precisam de texto.
8. Ajustamos controles para evitar acoes duplicadas no R36S.
9. Criamos capa e metadata para aparecer melhor no menu.
10. Fechamos uma versao 1.0 com README, pacote e documentacao.

## O que aprendemos no caminho

- Testar no hardware real foi essencial.
- O R36S pode enviar entrada por mais de um caminho, entao alguns botoes precisaram de protecao contra duplicacao.
- Textos sem acento ajudam a evitar falhas com fonte pixelada.
- UI pequena precisa de palavras curtas e rodape limpo.
- Um teclado virtual reutilizavel economizou retrabalho em Notas, To Do, Agenda e MTG.
- Cada ferramenta ficou melhor quando foi pensada para D-pad e botoes, nao para mouse ou toque.

## Papel de Gabriel Freitas

Gabriel Freitas dirigiu o projeto:

- escolheu a proposta
- definiu a identidade visual
- testou no R36S
- enviou logs
- pediu ajustes funcionais
- decidiu o escopo da 1.0
- orientou a evolucao como projeto de aprendizado

## Papel do Codex

Codex ajudou como parceiro tecnico:

- implementacao em Love2D
- revisao de bugs
- ajustes de controles
- empacotamento PortMaster
- documentacao
- organizacao para GitHub e futura submissao

## Estado 1.0

A versao 1.0 esta funcional e inclui:

- Hora
- Notas
- To Do
- Agenda
- Calc
- Timer
- MTG
- Config

O pacote final de teste esta em:

```text
outputs/pocketdesk-portmaster-love-1.0.zip
```

