#!/usr/bin/env bash
# SessionStart hook: tells the user which build of dziebowski-hooks is loaded.
# Installed copies live in a directory named after their version (the commit SHA);
# with --plugin-dir the directory name is the plugin name.
jq -n --arg v "$(basename "$CLAUDE_PLUGIN_ROOT")" '{systemMessage: "dziebowski-hooks loaded (\($v))"}'
