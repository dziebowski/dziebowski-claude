# dziebowski-claude

Personal Claude Code plugin marketplace with two plugins: `dziebowski-skills` (skills) and `dziebowski-hooks` (hooks). Distributed through the claude.ai account (synced to every device as `<plugin>@synced`); `git push` to `main` is a release. See README.md.

## Conventions

- Skills go in `plugins/dziebowski-skills/skills/<name>/SKILL.md`; hooks are registered in `plugins/dziebowski-hooks/hooks/hooks.json` and call scripts in `hooks/scripts/` via `"${CLAUDE_PLUGIN_ROOT}/..."` (quoted).
- Skill names are English kebab-case. Skill content may be English or Polish, one language per skill, no parallel `-pl`/`-en` variants.
- Never commit company names, internal system names, hosts, credentials or other sensitive data. Machine- or employer-specific values go in `userConfig` in plugin.json (`sensitive: true` for secrets); hook scripts read them from `CLAUDE_PLUGIN_OPTION_<KEY>`.
- Skills must also work in claude.ai: no top-level `bin/` in `dziebowski-skills`, and don't depend on Claude Code-only features without need.
- Each plugin has a semver `version` in plugin.json (started at 0.1.0). Bump it in every release that changes that plugin: installs update only when the version changes. Patch for fixes, minor for new or changed skills/hooks.
- Hook scripts must be executable, read the hook payload as JSON on stdin, and keep comments in English.
- Before committing, run `claude plugin validate .` and test with `claude --plugin-dir plugins/<plugin>`.
- README.md is written in Polish.
