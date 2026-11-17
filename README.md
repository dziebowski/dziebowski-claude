# dziebowski-claude

Prywatny marketplace pluginów Claude Code — jedno miejsce na moje skille i hooki, dostępne na każdym urządzeniu i w claude.ai.

## Pluginy

| Plugin | Zawartość | Wywołanie |
|---|---|---|
| `dziebowski-skills` | skille (działają w Claude Code, claude.ai i Cowork) | `/dziebowski-skills:<nazwa>` |
| `dziebowski-hooks` | hooki (tylko Claude Code i Cowork) | automatycznie |

## Skille

| Skill | Do czego |
|---|---|
| `hello` | sprawdzenie, czy plugin działa |
| `task-title` | tytuł taska/issue/PR nazywający weryfikowalny efekt zmiany, poprawny bez zmian w trackerze, changelogu i temacie commita |

## Struktura

```
.claude-plugin/marketplace.json            # katalog marketplace
plugins/dziebowski-skills/
  .claude-plugin/plugin.json               # manifest z polem version (semver)
  skills/<nazwa>/SKILL.md
plugins/dziebowski-hooks/
  .claude-plugin/plugin.json
  hooks/hooks.json                         # rejestracja hooków
  hooks/scripts/                           # skrypty hooków
```

## Instalacja (raz, na koncie)

claude.ai → **Customize → Plugins → Add marketplace** → `dziebowski/dziebowski-claude` (przy pierwszym razie połącz GitHub i daj aplikacji Claude dostęp do tego repo), następnie zainstaluj oba pluginy.

Każde urządzenie z Claude Code zalogowanym na to konto dostaje je automatycznie jako `<plugin>@synced`. Nie instaluj ich dodatkowo lokalnie z marketplace — lokalna kopia przykrywa wersję z konta.

## Workflow

1. Zmień lub dodaj skill/hook (najprościej poproś o to Claude w tym repo).
2. Przetestuj lokalnie — `--plugin-dir` przykrywa wersję z konta na czas sesji:
   ```bash
   claude --plugin-dir plugins/dziebowski-skills --plugin-dir plugins/dziebowski-hooks
   ```
3. Podbij `version` w `plugin.json` zmienionego pluginu (patch: poprawki, minor: nowe/zmienione skille lub hooki) — bez tego urządzenia nie zobaczą aktualizacji.
4. `claude plugin validate .`, commit, `git push` na `main` — to jest wydanie.
5. Nowa wersja dociera na urządzenia przy kolejnym starcie Claude Code (`/reload-plugins`), a w claude.ai po synchronizacji (**Check for updates**, aby wymusić).

Wyłączenie hooków na jednym urządzeniu: `claude plugin disable dziebowski-hooks@synced`.
