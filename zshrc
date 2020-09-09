# Change default zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

unsetopt NO_CLOBBER
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS
setopt NO_SHARE_HISTORY
MARK_DIRS="true"

alias urlencode='python -c "import sys;\
    from requests.utils import requote_uri;\
    print(requote_uri(sys.argv[1]))"'

#alias urldecode='python -c "import ##sys, urllib as ul; \
    ##print ul.unquote_plus(sys.argv[1])"'
#alias urlencode='python -c "import sys, ur#llib as ul; \
    #print ul.quote_plus(sys.argv[1])"'

alias vim="nvim"
alias vi="nvim"
alias oldvim="vim"

# autocorrect exceptions
alias sudo='nocorrect sudo'
alias totem='totem --fullscreen'

source $(pew shell_config)
emulate sh -c ". $HOME/.profile"

#bindkey "${terminfo[khome]}" beginning-of-line
#bindkey "${terminfo[kend]}" end-of-line

bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[1;5D' emacs-backward-word
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line

#function zle-line-init () { echoti smkx }
#function zle-line-finish () { echoti rmkx }
#zle -N zle-line-init
#zle -N zle-line-finish

# Add coursier
export PATH="$PATH:/home/magma/.local/share/coursier/bin"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR=${HOME}/.sdkman
[[ -s ${SDKMAN_DIR}/bin/sdkman-init.sh ]] && source ${SDKMAN_DIR}/bin/sdkman-init.sh
#compdef pio
_pio() {
  eval $(env COMMANDLINE="${words[1,$CURRENT]}" _PIO_COMPLETE=complete-zsh  pio)
}
if [[ "$(basename -- ${(%):-%x})" != "_pio" ]]; then
  compdef _pio pio
fi
