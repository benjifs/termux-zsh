# basic .zshrc

autoload -U colors && colors
PS1="%F{005}%n%F{003}@%F{006}%m%F{003}:%F{004}%0~ %F{003}%(!.#.%%)%{$reset_color%} "

HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
