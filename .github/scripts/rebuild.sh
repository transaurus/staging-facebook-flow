#!/usr/bin/env bash
set -euo pipefail

# Rebuild script for facebook/flow
# Runs from website/ in the existing source tree (no clone).
# Installs deps, runs pre-build steps, builds the Docusaurus site.

# --- Node version ---
export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
if [ -f "$NVM_DIR/nvm.sh" ]; then
    . "$NVM_DIR/nvm.sh"
    nvm install 20
    nvm use 20
fi
echo "[INFO] Node: $(node --version)"

# --- Package manager: Yarn classic (v1) ---
npm install -g yarn@1.22.19 --quiet
echo "[INFO] Yarn: $(yarn --version)"

# --- Install dependencies ---
yarn install --frozen-lockfile

# --- Build Docusaurus site ---
# NO_INLINE_FLOW_ERRORS=1 skips flow type-checking of code snippets (requires flow binary otherwise)
NO_INLINE_FLOW_ERRORS=1 yarn build

echo "[DONE] Build complete."
