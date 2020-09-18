# Since .nvm/ is a symlink, we have to get the real path
# https://stackoverflow.com/a/29789399/9165387
export NVM_DIR=$(cd -P $HOME/.nvm && pwd)
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
