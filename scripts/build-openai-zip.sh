#!/usr/bin/env bash
# Build the ZIP for the OpenAI plugin directory (ChatGPT and Codex).
# The ZIP holds the portable package only: plugin.json, mcp.json, skills/, assets/.
set -euo pipefail
cd "$(dirname "$0")/.."
version=$(python3 -c "import json;print(json.load(open('plugin.json'))['version'])")
out="dist/urantia-papers-openai-${version}.zip"
mkdir -p dist
rm -f "$out"
zip -r -q -X "$out" plugin.json mcp.json skills assets/icon.png assets/icon-dark.png assets/logo.png assets/logo-dark.png README.md LICENSE -x '*.DS_Store'
echo "$out"
