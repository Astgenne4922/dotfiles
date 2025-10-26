#if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#    exec Hyprland
#fi

alias ls='eza -F --icons --hyperlink'
alias tree='tree -F -C --hyperlink'
alias cat='bat'
alias find='fd'
alias ff='fastfetch'
alias grep='grep --color=auto'
alias calc='python -q'
alias npm+'pnpm'

export EDITOR='nvim'
export GIT_REPOS=${HOME}'/Desktop/Git_Repos'

export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY

source ~/.config/user-dirs.dirs

unsetopt PROMPT_CR
unsetopt PROMPT_SP
export PROMPT_EOL_MARK=''

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

precmd() {
  precmd() {
    echo
  }
}

eval "$(starship init zsh)"
