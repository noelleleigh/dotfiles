# zsh options
# origin: https://scriptingosx.com/2019/06/moving-to-zsh-part-3-shell-options/
# case-insensitive globbing
setopt NO_CASE_GLOB
# don't require cd to move
setopt AUTO_CD

SAVEHIST=5000
HISTSIZE=2000
# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST
# do not store duplications
setopt HIST_IGNORE_DUPS
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

setopt CORRECT
setopt CORRECT_ALL

# Set Editor
VISUAL=code

# Useful aliases
alias ll="ls -lhaGF"
alias profile_reload="source ~/.zshrc"

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 
# load bashcompinit for some old bash completions
autoload bashcompinit && bashcompinit

# Start the completion system
autoload -Uz compinit && compinit

# Setup prompt
PROMPT='%B%F{178}>%f%b %F{63}%~%f %F{129}%#%f '
RPROMPT='%*'

source ~/.zsh-nvm/zsh-nvm.plugin.zsh
