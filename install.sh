#!/usr/bin/env bash
#
# install.sh — sätt upp en ny Mac för Erlang/Elixir-utveckling.
# Idempotent: går att köra om utan att ställa till det.
#
#   Kör:  ./install.sh
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

log()  { printf '\033[1;34m==>\033[0m %s\n' "$*"; }
warn() { printf '\033[1;33m!! \033[0m %s\n' "$*"; }

# ── 1. Xcode Command Line Tools ────────────────────────────────────
if ! xcode-select -p >/dev/null 2>&1; then
  log "Installerar Xcode Command Line Tools (bekräfta i dialogrutan)..."
  xcode-select --install || true
  log "Vänta tills installationen är klar och kör sedan skriptet igen."
  exit 0
else
  log "Xcode Command Line Tools finns redan."
fi

# ── 2. Homebrew ────────────────────────────────────────────────────
if ! command -v brew >/dev/null 2>&1; then
  log "Installerar Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Lägg brew i PATH för resten av skriptet (Apple Silicon).
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi
log "Homebrew: $(brew --version | head -1)"

# ── 3. Installera allt i Brewfile ──────────────────────────────────
log "Kör brew bundle..."
brew bundle install --file="$SCRIPT_DIR/Brewfile"

# ── 4. asdf: plugins + språkversioner från .tool-versions ──────────
if command -v asdf >/dev/null 2>&1; then
  log "Ställer in asdf-plugins..."

  # Bygg-beroenden för att kompilera Erlang (via kerl).
  export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac --with-ssl=$(brew --prefix openssl@3 2>/dev/null || brew --prefix openssl 2>/dev/null || echo /opt/homebrew/opt/openssl@3)"

  add_plugin() {
    local name="$1" url="$2"
    if ! asdf plugin list 2>/dev/null | grep -qx "$name"; then
      log "Lägger till asdf-plugin: $name"
      asdf plugin add "$name" "$url"
    fi
  }
  add_plugin erlang https://github.com/asdf-vm/asdf-erlang.git
  add_plugin elixir https://github.com/asdf-vm/asdf-elixir.git

  log "Installerar språkversioner (kan ta några minuter — Erlang kompileras)..."
  ( cd "$SCRIPT_DIR" && asdf install )

  log "asdf klar. Installerade versioner:"
  asdf current || true
else
  warn "asdf hittades inte på PATH — hoppar över Erlang/Elixir-installation."
  warn "Öppna en ny terminal (så asdf laddas) och kör: cd '$SCRIPT_DIR' && asdf install"
fi

# ── 5. Kopiera .tool-versions globalt (valfritt) ───────────────────
if [ ! -f "$HOME/.tool-versions" ]; then
  log "Kopierar .tool-versions till hemkatalogen som global default."
  cp "$SCRIPT_DIR/.tool-versions" "$HOME/.tool-versions"
fi

log "Klart! 🎉"
echo
echo "Nästa steg (om inte redan gjort i din .zshrc):"
echo "  • asdf laddas normalt av Homebrews asdf; se 'brew info asdf' för rad att lägga i ~/.zshrc"
echo "  • Verifiera: elixir --version"
