# zsh options
# origin: https://scriptingosx.com/2019/06/moving-to-zsh-part-3-shell-options/
# case-insensitive globbing
setopt NO_CASE_GLOB

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
# ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# https://jdhao.github.io/2021/03/24/zsh_history_setup/#history-settings
# the detailed meaning of the below three variable can be found in `man zshparam`.
export HISTFILE=~/.histfile
export HISTSIZE=1000000   # the number of items for the internal history list
export SAVEHIST=1000000   # maximum number of items for the history file
# The meaning of these options can be found in man page of `zshoptions`.
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY  # record command start time

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

# Add git completion
zstyle ':completion:*:*:git:*' script ~/.git-completion.bash
fpath=(~/.zsh $fpath)

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
# load bashcompinit for some old bash completions
autoload bashcompinit && bashcompinit

# Start the completion system
autoload -Uz compinit && compinit

# Better history search
# https://unix.stackexchange.com/a/97844
# https://unix.stackexchange.com/a/405358
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "$key[Up]" history-beginning-search-backward-end
bindkey "$key[Down]" history-beginning-search-forward-end

# nvm
if [ -f ~/.nvm_init ]; then
    . ~/.nvm_init
fi

# Set bat as the MANPAGER if it exists
if command -v bat &> /dev/null; then
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

# pyenv
if [ -f ~/.pyenv_init ]; then
    . ~/.pyenv_init
fi

# Bitwarden CLI tab completion
if command -v bw &> /dev/null; then
    eval "$(bw completion --shell zsh); compdef _bw bw;"
fi

# SSH Agent
if [ -f ~/.ssh-agent ]; then
    . ~/.ssh-agent
fi
