# Brewfile — deklarativ lista över allt som installeras via Homebrew.
# Skapad från din nuvarande Mac 2026-09-21 med `brew bundle dump`.
#
# På nya datorn:  brew bundle install --file=Brewfile
# Kontrollera diff: brew bundle check --file=Brewfile
#
# OBS: Erlang & Elixir installeras INTE här — de hanteras av asdf via
# .tool-versions så att du kan ha olika versioner per projekt.

# ── Version manager ────────────────────────────────────────────────
# Extendable version manager (Erlang, Elixir, Node m.m.)
brew "asdf"

# ── Byggverktyg / toolchain (behövs bl.a. för att bygga Erlang via asdf) ──
brew "autoconf"        # Automatic configure script builder
brew "automake"        # GNU Standards-compliant Makefiles
brew "bison"           # Parser generator
brew "pkgconf"         # Package compiler/linker metadata toolkit
brew "re2c"            # Generate C-based recognizers from regular expressions

# ── Bibliotek (systemberoenden för språk/verktyg ovan) ─────────────
brew "gettext"         # i18n/l10n library
brew "freetype"        # Font rendering
brew "gmp"             # GNU multiple precision arithmetic
brew "gd"              # Graphics library
brew "icu4c@77"        # Unicode/globalization
brew "libzip"          # zip archive library
brew "jpeg"            # JPEG image library
brew "krb5"            # Kerberos network authentication
brew "libedit"         # BSD-licensed readline alternative
brew "libiconv"        # Charset conversion
brew "libsodium"       # NaCl networking/crypto
brew "oniguruma"       # Regular expressions library
brew "vips"            # Image processing library
brew "zlib"            # zlib compression

# ── Databaser ──────────────────────────────────────────────────────
brew "mariadb"                                        # MySQL-kompatibel DB
brew "postgresql@14", restart_service: :changed      # PostgreSQL

# ── Språk / runtimes ───────────────────────────────────────────────
brew "php"             # PHP scripting language

# ── CLI-verktyg ────────────────────────────────────────────────────
brew "gemini-cli"      # Google Gemini från terminalen
brew "mas"             # Mac App Store CLI (behövs för mas-raderna nedan)
brew "mkcert"          # Lokalt betrodda dev-certifikat
brew "wget"            # Internet file retriever
brew "wireguard-tools" # WireGuard VPN-verktyg

# ── Zsh ────────────────────────────────────────────────────────────
brew "zsh-syntax-highlighting"

# ── Appar (casks) ──────────────────────────────────────────────────
cask "claude"                 # Claude AI desktop-app
cask "db-browser-for-sqlite"  # SQLite-browser

# Jobbrelevanta appar (fanns installerade men inte via brew):
cask "docker-desktop"         # Docker Desktop (containers)
cask "iterm2"                 # Terminal
cask "figma"                  # Design
cask "zoom"                   # Videomöten
cask "google-chrome"          # Browser
# cask "brave-browser"        # Alternativ browser (du hade även Brave)

# ── Mac App Store-appar (kräver att du är inloggad i App Store) ─────
# Jobbrelevant / produktivitet:
mas "1Password 7", id: 1333542190
mas "Keynote",     id: 409183694
mas "Numbers",     id: 409203825
mas "Pages",       id: 409201541
mas "PDFgear",     id: 6469021132
# Personligt — avkommentera om du vill ha dem på jobbdatorn:
# mas "GarageBand", id: 682658836
# mas "iMovie",     id: 408981434
# mas "WhatsApp",   id: 310633997

# ── Editor/IDE (lägg till det du använder) ─────────────────────────
# cask "visual-studio-code"
# cask "zed"
# cask "intellij-idea-ce"     # ElixirLS/Erlang-plugins finns för IntelliJ
#
# VS Code var inte installerat på källdatorn, så inga extensions kunde
# fångas. När du kört VS Code på nya datorn kan du spara dem med:
#   code --list-extensions | sed 's/^/vscode "/;s/$/"/' >> Brewfile
# Exempel för Elixir-utveckling:
# vscode "jakebecker.elixir-ls"
# vscode "pgourlain.erlang"

# ── Övrigt via brew bundle (kräver att cargo/npm finns) ────────────
# cargo installeras via `rustup`/asdf; npm via node (asdf).
cargo "mdbook"                 # Bygg böcker/docs i Markdown
npm "@anthropic-ai/claude-code"
npm "corepack"
