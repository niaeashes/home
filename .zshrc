export PATH=$PATH:/usr/local/sbin:$HOME/sh
[[ -s "$HOME/.zshrc-external" ]] && source "$HOME/.zshrc-external"
export HISTFILE="$HOME/.zsh_history"
export HISTIGNORE="ls:ls -[la]*:"
export HISTTIMEFORMAT='%F %T '
export HISTSIZE=100000
export SAVEHIST=100000

autoload -U compinit
compinit

autoload colors
colors

setopt auto_cd
setopt auto_pushd
setopt correct
setopt extended_history

zstyle ':completion:*:default' menu select=1

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '  %b'
zstyle ':vcs_info:*' actionformats '  %b (%a)'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
PROMPT="%f╭─ %# %{$fg[yellow]%} %T%f %n@%m %{$fg[cyan]%} %c%f%1(v|$fg[green]%1v%f|)"

if [ $REVEAL ]; then
  alias reveal='echo "Already in reveal mode, exit (Ctrl+D) to leave"'
  PROMPT="$PROMPT %{$fg[red]%}%{$bg[red]$fg[black]%} REVEAL MODE%{$fg[red]}%k%f"
else
  alias reveal='REVEAL=1 op run -- zsh'
fi
PROMPT="$PROMPT
%f╰─ ❯ "

export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
setopt nobeep
