#if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#    exec Hyprland
#fi

alias ls='eza -F --icons --hyperlink'
alias tree='tree -F -C --hyperlink'
alias cat='bat'
alias find='fd'
alias ff='fastfetch'
alias grep='grep --color=auto'

export EDITOR='nvim'

export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000

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
