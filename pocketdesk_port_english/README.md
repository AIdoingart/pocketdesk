# PocketDesk - README 1.0

PocketDesk e um conjunto de ferramentas offline para o R36S, feito para dArkOS RE via PortMaster usando Love2D 11.5.

A proposta e transformar o R36S em um pequeno PDA retro com visual pixelado, abas no topo, wallpaper com filtro de cor e controles pensados para D-pad, L1/R1 e botoes A/B/X/Y.

## Versao atual

Pacote mais recente gerado:

```text
pocketdesk-portmaster-love-1.0.zip
```

Arquivo no projeto:

```text
outputs/pocketdesk-portmaster-love-1.0.zip
```

## Como instalar no R36S

Copie o conteudo do zip para a pasta de ports do cartao SD.

Estrutura esperada:

```text
/roms/ports/PocketDesk.sh
/roms/ports/pocketdesk/pocketdesk.gptk
/roms/ports/pocketdesk/lovegame/main.lua
/roms/ports/pocketdesk/lovegame/conf.lua
/roms/ports/pocketdesk/lovegame/assets/fonts/PressStart2P-Regular.ttf
/roms/ports/pocketdesk/lovegame/assets/wallpapers/galaxy.png
/roms/ports/pocketdesk/media/cover.png
```

O port precisa do runtime:

```text
Love2D 11.5
```

Se nao abrir, verificar:

```text
/roms/ports/pocketdesk/log.txt
```

O log com linhas parecidas com `Killed GPTOKEYB` ao sair do app tem sido normal no R36S, pois acontece quando o PortMaster encerra o mapeamento de controle.

## Controles gerais

```text
L1              Aba anterior
R1              Proxima aba
A               Selecionar / confirmar
B               Voltar / apagar / resetar onde existir
X               Acao alternativa da tela
Y               Acao alternativa da tela
Start           Menu ou funcao extra da tela
D-pad           Navegar e ajustar campos
Analogicos      Tambem navegam, com cooldown
Select + Start  Saida pelo helper do PortMaster
```

## Visual definido

- Fonte unica no projeto inteiro: `PressStart2P-Regular.ttf`.
- Tela inicial sempre abre em `Hora`.
- Wallpaper atual em preto e branco com filtro roxo escuro.
- Filtros disponiveis em `Config`: Roxo, Noite, Azul, Rosa, Verde, PB.
- Abas no topo sem barra branca, texto centralizado, aba selecionada em amarelo.
- Indicadores de troca de aba no topo: `L1 <` e `> R1`.
- Rodape mantem nome da aba a esquerda e relogio pequeno a direita nas ferramentas.
- Todos os textos do app estao sem acento para evitar problema de fonte no R36S.

## Abas prontas

### Hora

- Relogio grande centralizado.
- Dois pontos piscam para indicar a passagem do tempo.
- Data aparece abaixo.
- Sempre e a tela inicial ao abrir o PocketDesk.

### Notas

- Lista de notas local.
- Criar, editar e apagar notas.
- Teclado virtual QWERTY com numeros na primeira linha.
- Linha final do teclado:

```text
- / : < ESP > + # OK
```

- `ESP` ocupa espaco maior no centro.
- `OK` fecha o editor e volta para lista.
- `B` apaga apenas um caractere.
- `Y` quebra linha.
- `Start` abre formatacao.
- Formatacoes atuais:

```text
Titulo
Lista
Check
Negrito
Data/Hora
Limpar
```

- O titulo da nota na lista usa a primeira linha com Markdown `#`, quando existir.

### To Do

Implementado na versao v19.

Funcoes:

- Criar tarefa.
- Editar tarefa com o mesmo teclado virtual das Notas.
- Marcar/desmarcar como feita.
- Apagar tarefa.
- Prioridade: Baixa, Media, Alta.
- Prazo simples: Sem Data, Hoje, Amanha.
- Filtros: Todas, Pendentes, Feitas.
- Salvamento local junto com o resto do PocketDesk.

Controles na lista:

```text
A       Edita
X       Nova
Y       Feito / Nao feito
Start   Muda filtro
B       Apaga tarefa
```

Controles no editor:

```text
A       Escolhe letra no teclado
B       Apaga caractere
Y       Muda prazo
Start   Muda prioridade
OK      Volta para lista
```

### Agenda

- Calendario mensal real.
- Usa a data ajustada na aba `Config`.
- D-pad muda o dia selecionado.
- Ao passar do limite do mes, muda para o mes anterior/proximo.
- `A` cria evento no dia selecionado.
- Editor de evento usa o mesmo teclado virtual das Notas.
- `X` abre a visao de 3 dias.
- `B` no calendario abre a lista de eventos do dia.
- Na lista de eventos, `A` edita e `B` apaga o evento selecionado.
- `X` volta da lista de eventos.
- Dias com evento aparecem marcados no calendario.

### Timer

- Timer com presets.
- Presets: 5, 10, 15, 20 e 25 minutos.
- `Esq/Dir` muda o preset quando nao esta rodando.
- `Cima/Baixo` ajusta minuto a minuto quando nao esta rodando.
- `A` inicia/pausa.
- `B` reinicia.

### Calc

Implementada na versao v22.

Funcoes:

- Soma.
- Subtracao.
- Multiplicacao.
- Divisao.
- Decimal.
- Apagar ultimo digito.
- Limpar tudo.
- Trocar sinal.
- Porcentagem.
- Raiz quadrada.
- Memoria simples com `MC`, `MR` e `M+`.

Controles:

```text
D-pad   Navega pelos botoes
A       Aperta o botao selecionado
B       Apaga ultimo digito
X       Limpa tudo
Y       Troca sinal
```

### MTG

- Modo Normal.
- Modo Commander.
- Normal e Commander aceitam de 1 a 6 jogadores.
- `Start` no jogo abre editor de nome do jogador selecionado.
- Nome usa o mesmo teclado virtual das Notas.
- Com 4 jogadores, layout fica 2 em cima e 2 em baixo.
- Commander com 1 jogador mostra vida grande e 3 caixas de dano de comandante recebido.
- No Commander solo, `Esq/Dir` alterna entre `Vida`, `CMD 1`, `CMD 2` e `CMD 3`.
- Com `Vida` selecionado, `Cima/Baixo` ajusta dano normal ou ganho de vida.
- Dano de comandante recebido tambem reduz a vida do jogador.
- Cada jogador pode ter cor baseada nas cores de Magic:

```text
Branco
Azul
Preto
Vermelho
Verde
```

- `X` muda a cor do jogador selecionado.
- Dano/vida muda de 1 em 1.
- Relogio pequeno continua aparecendo no rodape.

### Config

- Ajuste de hora.
- Ajuste de minuto.
- Ajuste de dia.
- Ajuste de mes.
- Ajuste de ano.
- Escolha de filtro de cor do wallpaper.

## Arquivos importantes

```text
pocketdesk_port/PocketDesk.sh
pocketdesk_port/gameinfo.xml
pocketdesk_port/port.json
pocketdesk_port/pocketdesk/pocketdesk.gptk
pocketdesk_port/pocketdesk/lovegame/main.lua
pocketdesk_port/pocketdesk/lovegame/conf.lua
pocketdesk_port/pocketdesk/lovegame/assets/fonts/PressStart2P-Regular.ttf
pocketdesk_port/pocketdesk/lovegame/assets/wallpapers/galaxy.png
pocketdesk_port/pocketdesk/media/cover.png
```

## O que ja foi corrigido

- Corrigido erro inicial de pasta `lovegame` nao encontrada.
- Corrigido mapeamento do `pocketdesk.gptk`.
- Corrigido botoes A/B/X/Y sem resposta.
- Corrigido dano do MTG que mudava de 2 em 2.
- Corrigido analogico direito funcionando estranho como D-pad principal.
- Corrigido relogio fora do centro.
- Corrigido teclado das Notas apagando dois caracteres.
- Corrigido teclado virtual desalinhado.
- Corrigido duplicacao de `ESP` e `OK`.
- Corrigido texto `Start / Formato` sobrepondo o botao `ESPACO`.
- Corrigida barra superior branca; agora o topo e mais limpo.
- Adicionada capa para aparecer no menu do R36S via `gameinfo.xml`.

## Estado da versao 1.0

- Todas as abas principais estao funcionais.
- O app abre sempre na aba `Hora`.
- O teclado virtual e reaproveitado em Notas, To Do, Agenda e MTG.
- Troca de abas tem animacao curta.
- O salvamento local fica em `save.txt` na pasta de dados do PocketDesk.
- Nao trocar a fonte: usar somente `PressStart2P-Regular.ttf`.
- Manter textos sem acento dentro do app para evitar problema de renderizacao.

## Futuro pos-1.0

- Ordenar To Do com pendentes antes de feitas.
- Permitir prazo com data real no To Do.
- Adicionar eventos com horario na Agenda.
- Adicionar som/alerta no Timer se o PortMaster permitir.
- Refinar visual geral depois de testes longos no R36S.

