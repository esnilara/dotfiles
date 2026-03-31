# . files

My personal dotfiles managed with [yadm](https://yadm.io). (⊙_☉)

## 🚀 Setup on a new machine

### 1. Install yadm

#### macOS (Homebrew)

```bash
brew install yadm
```

#### Linux (Debian/Ubuntu)

```bash
sudo apt install yadm # or your package manager
```

### 2. Clone dotfiles

```bash
yadm clone git@github.com:esnilara/dotfiles.git
```

### 3. Run bootstrap script

```bash
yadm bootstrap
```

This will:
- Install Homebrew (if needed)
- Install all packages from .Brewfile
- Install Oh My Zsh
- Configure Ghostty
- Set up fonts
- Configure shell environment

---

#### 🔑 SSH setup (per machine)

This repo does not include private SSH keys.
After cloning, generate a new key:

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```
Start the agent and add the key:

```bash
eval "$(ssh-agent -s)"
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
```
Then copy the public key:

```bash
cat ~/.ssh/id_ed25519.pub
```

Add it to GitHub:
👉 https://github.com/settings/keys

---

#### 🧠 Notes

Shell config is located in:

```bash
~/.config/zsh/
```

Ghostty config:

```bash
~/.config/ghostty/config.ghostty
```

Machine-specific overrides

```bash
~/.zprofile.local
~/.zshrc.local
```
---

#### 🔄 Updating

To update packages:

```bash
brew bundle
```

To update dotfiles:

```bash
yadm pull
```
---

#### 🛠 Troubleshooting

Restart Shell (After bootstrap)

```bash
exec zsh
```

Check installed tools

```bash
command -v tmux mise rg fzf pnpm
```

---

#### 📦 Included tools

- [neovim](https://neovim.io/)
- [ripgrep](https://github.com/burntsushi/ripgrep)
- [fzf](https://github.com/junegunn/fzf)
- [mise](https://github.com/jdx/mise)
- [lazygit](https://github.com/jesseduffield/lazygit)
- [overmind](https://github.com/DarthSim/overmind)
- [tmux](https://github.com/tmux/tmux)
- [JetBrains Mono Nerd Fonts](https://www.jetbrains.com/lp/mono/)

