# Colorize grep output
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

if [ -f "/usr/bin/lsd" ]; then
    alias l="lsd -l"
    alias la="lsd -la"
    alias lt="lsd --tree"
else
    echo "lsd is not installed."
    alias l="ls -l"
    alias la="ls -la"
fi

# neovim
alias n="nvim"
alias nv="nvim"
alias v="nvim"

# joshuto
# alias j="joshuto"

# tmux
alias t="tmux"
alias tn="tmux new -s"
alias td="tmux detach"
alias ta="tmux attach -t"
alias tk="tmux kill-session -t"

# lazygit
alias lzg="lazygit"

#lazy docker
alias lzd="lazydocker"

# dotnet CLI
alias dotnet-w="dotnet watch --no-hot-reload"
alias dotnet-r='dotnet run'
alias dotnet-b='dotnet build'

# dos2unix
alias d2u="source ~/.config/zsh/scripts/d2u.sh" # for whole directory file

# logoff
# alias logoff="gnome-session-quit" # need to change by the user name

source "$HOME/.config/zsh/scripts/fzf-utils.sh"

# k8s clusters
alias master="ssh master@192.168.122.54"
alias worker1="ssh worker1@192.168.122.187"
alias worker2="ssh worker2@192.168.122.134"
