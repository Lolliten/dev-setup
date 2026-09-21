# Ny Mac — dev-setup (Erlang/Elixir)

Reproducerbar uppsättning av en ny Mac. Istället för Migration Assistant
klonar du det här repot och kör ett skript.

## Innehåll

| Fil              | Vad det gör                                              |
|------------------|---------------------------------------------------------|
| `Brewfile`       | Alla program/bibliotek/appar som installeras via Homebrew |
| `.tool-versions` | Erlang- & Elixir-versioner (installeras av asdf)        |
| `install.sh`     | Kör hela setupet från början, idempotent                |

## Använda på nya datorn

```bash
git clone <ditt-repo-url> ~/dev-setup
cd ~/dev-setup
./install.sh
```

Skriptet:
1. Installerar Xcode Command Line Tools
2. Installerar Homebrew
3. Kör `brew bundle` (allt i `Brewfile`)
4. Lägger till asdf-plugins för erlang/elixir och installerar versionerna i `.tool-versions`

> **Logga in i App Store först** om du vill att `mas`-apparna (1Password,
> Pages, Numbers m.m.) ska installeras — annars hoppas de över.

## Underhåll (på gamla/nuvarande datorn)

Uppdatera listan när du installerat nåt nytt:

```bash
brew bundle dump --file=Brewfile --force
git add Brewfile && git commit -m "Uppdatera Brewfile"
```

## Att lägga till senare

- **Dotfiles** (`.zshrc`, `.gitconfig` m.m.) — lägg i en `dotfiles/`-mapp och
  symlinka in dem, t.ex. med [GNU Stow](https://www.gnu.org/software/stow/).
- **Editor/IDE** — avkommentera raden i `Brewfile` (VS Code, Zed, IntelliJ …).
- **Projekt** — dina kodrepon klonar du separat; lägg gärna en egen
  `.tool-versions` i varje projekt för rätt språkversion.

## Varför inte Migration Assistant?

- Blandar personligt och jobb på en jobbmaskin
- Släpar med gammal cruft och trasiga inställningar
- Inte reproducerbart — det här repot är det

> Erlang/Elixir installeras **inte** via Homebrew utan via asdf, så att varje
> projekt kan låsa sin egen version via `.tool-versions`.
