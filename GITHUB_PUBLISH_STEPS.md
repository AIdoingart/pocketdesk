# Publicando PocketDesk no GitHub

Este repositório local já foi inicializado e contém o commit inicial:

```text
Initial PocketDesk 1.0 release
```

## 1. Criar o repositório no GitHub

No GitHub, crie um novo repositório chamado:

```text
pocketdesk
```

Sugestão:

- Owner: Gabriel Freitas
- Visibility: Public
- Não marcar "Add README"
- Não marcar "Add .gitignore"
- Não marcar "Choose a license" ainda, a menos que a licença já esteja decidida

## 2. Conectar este repositório local ao GitHub

Depois de criar o repositório, copie a URL HTTPS ou SSH.

Exemplo HTTPS:

```text
git remote add origin https://github.com/SEU_USUARIO/pocketdesk.git
git push -u origin main
```

Exemplo SSH:

```text
git remote add origin git@github.com:SEU_USUARIO/pocketdesk.git
git push -u origin main
```

## 3. Ajustar autor do commit, se quiser

O commit inicial foi criado localmente como:

```text
Gabriel Freitas <gabriel.freitas@users.noreply.github.com>
```

Se quiser trocar para o e-mail correto da sua conta GitHub antes do push:

```text
git config user.name "Gabriel Freitas"
git config user.email "SEU_EMAIL_DO_GITHUB"
git commit --amend --reset-author --no-edit
```

Depois:

```text
git push -u origin main
```

## 4. Depois do push

No GitHub, revisar:

- README principal
- PROCESSO_PT.md
- PROCESS_EN.md
- PORTMASTER_PUBLICATION.md
- CREDITS.md
- pasta `pocketdesk_port/`
- pasta `outputs/portmaster_publication/`

## 5. Release sugerida

Criar uma release:

```text
Tag: v1.0
Title: PocketDesk 1.0
```

Anexar:

```text
outputs/pocketdesk-portmaster-love-1.0.zip
outputs/PocketDesk_publication_docs.zip
outputs/PocketDesk_PortMaster_submission_draft.zip
```

