# macOS
if [[ $OSTYPE =~ ^darwin ]]; then
    source "$HOME/.config/zsh/macos-export.zsh"
fi

# linux
if [[ $OSTYPE =~ ^linux ]]; then
    source "$HOME/.config/zsh/linux-export.zsh"
fi

# default app
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="firefox"

# for the system varaible
export PATH="$PATH:/usr/bin:/usr/sbin:/usr/local/bin"

# npm install global path
# export NPM_CONFIG_PREFIX=~/.npm-global # use nvm instead


# pnpm
export PNPM_HOME="/home/liam/.local/share/pnpm"
case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
esac


# setting local binary path
export PATH="$PATH:$HOME/.local/bin"

# snap app
export PATH="$PATH:/snap/bin"

# rust env
export PATH="$PATH:$HOME/.cargo/env"

# dotnet sdk path
export DOTNET_ROOT=$HOME/.local/dotnet
export PATH="$PATH:$DOTNET_ROOT"
export PATH="$PATH:$DOTNET_ROOT/sdk/8.0.100" # for vscode c# dev extension

# dotnet tool
export PATH="$PATH:$HOME/.dotnet/tools"

# rust evn
export PATH="$PATH:$HOME/.cargo/bin"
# export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# nvim mason exe path
export PAHT="$PATH:$HOME/.local/share/nvim/mason/bin"

# go env
export GOROOT="$HOME/.local/go"
export PATH="$PATH:$GOROOT/bin:$HOME/go/bin"

# risc-v toolchain
export RISCV="$HOME/.local/riscv"
export PATH="$PATH:$RISCV/tools/bin:$RISCV/qemu/bin"

# fly.io
export FLYCTL_INSTALL="$HOME/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# oh-my-posh
# eval "$(oh-my-posh --init --shell zsh --config $HOME/.config/oh-my-posh/liam.omp.json)"

# srarship prop (need locale UTF8)
export STARSHIP_CONFIG=~/.config/starship.toml
eval "$(starship init zsh)"

# zoxide init
eval "$(zoxide init zsh)"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm




