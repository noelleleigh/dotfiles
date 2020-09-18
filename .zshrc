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

# Crostini support (https://www.reddit.com/r/Crostini/comments/8ghl1a/x11_apps_dont_work_if_you_change_the_default_shell/dybtuzs?utm_source=share&utm_medium=web2x)
export DISPLAY=:0

# Set Editor
VISUAL=code

# Aliases
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

autoload -Uz promptinit
promptinit

# Prompt
if [ -f ~/.zsh_prompt ]; then
    precmd() {
        . ~/.zsh_prompt
    }
fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 
# load bashcompinit for some old bash completions
autoload bashcompinit && bashcompinit

# Start the completion system
autoload -Uz compinit && compinit
