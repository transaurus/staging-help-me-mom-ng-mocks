#!/usr/bin/env bash
set -euo pipefail

# Rebuild script for help-me-mom/ng-mocks
# Runs on existing source tree (no clone). Installs deps and builds.
# Run from the docs/ directory (docusaurusRoot).

# --- Node version ---
# Node 24.14.0 from .nvmrc; required for npm@11.12.0 + Docusaurus 3.9.2
NODE_VERSION="24.14.0"
export NVM_DIR="${HOME}/.nvm"
if [ ! -f "${NVM_DIR}/nvm.sh" ]; then
    curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
fi
# shellcheck source=/dev/null
source "${NVM_DIR}/nvm.sh"
nvm install "${NODE_VERSION}"
nvm use "${NODE_VERSION}"

# Install required npm version
npm install -g npm@11.12.0

echo "Node: $(node --version)"
echo "npm: $(npm --version)"

# --- Package manager + dependencies ---
npm install

# --- Build ---
npm run build

echo "[DONE] Build complete."
