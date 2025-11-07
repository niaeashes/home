[[ -s "$HOME/.zshrc-external" && -z $REVEAL ]] && source "$HOME/.zshrc-external"
export PATH="$PATH:$HOME/sh"

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=100000
export SAVEHIST=100000

autoload -U compinit
autoload -U compaudit

if ! compaudit | grep -q .; then
  compinit
else
  echo "⚠️  insecure completion directories detected!"
  compaudit
  compinit -i
fi

autoload colors
colors

setopt auto_cd
setopt auto_pushd
setopt correct
setopt extended_history
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt hist_reduce_blanks
setopt hist_ignore_space

zstyle ':completion:*:default' menu select=1

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '  %b'
zstyle ':vcs_info:*' actionformats '  %b (%a)'

# Needs Nerd Fonts for icons
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
PROMPT="%f╭─ %# %{$fg[yellow]%} %T%f %n@%m %{$fg[cyan]%} %c%f%1(v|%{$fg[green]%}%1v%f|)"

if [[ $REVEAL ]]; then
  # add 'REVEAL MODE' badge
  PROMPT="$PROMPT %{$fg[red]%}%{$bg[red]%}%{$fg[black]%} REVEAL MODE%{$fg[red]}%k%f"
fi
local ARROWS=$(printf '%*s' $SHLVL '' | tr ' ' '❯')
PROMPT="${PROMPT}
%f╰─ ${ARROWS} "

if [[ $REVEAL ]]; then
  alias reveal='echo "Already in reveal mode, exit (Ctrl+D) to leave"'
  readonly REVEAL
  # Security: disable history logging in reveal mode
  unset HISTFILE
  export HISTSIZE=0
  export SAVEHIST=0
else
  alias reveal='REVEAL=1 op run --no-masking -- zsh'
fi

alias rrr='reveal'
alias eee='exit'

setopt nobeep
