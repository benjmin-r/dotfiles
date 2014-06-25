# vim:ft=sh

set -o vi

source ~/.dotfiles/shell/alias
source ~/.dotfiles/shell/rbenv-completion.bash
source ~/.dotfiles/shell/env.bash
source ~/.dotfiles/shell/functions.bash
source ~/.dotfiles/shell/prompt.bash
source ~/.dotfiles/shell/git-completion.bash
source ~/.dotfiles/shell/pip-completion.bash
source ~/.dotfiles/shell/ssh-completion.bash
source ~/.dotfiles/shell/knife-completion.bash
source ~/.dotfiles/shell/homebrew-completion.bash
source ~/.dotfiles/shell/trousseau-completion.bash
source ~/.dotfiles/shell/gpg.bash
source ~/.dotfiles/autoenv/activate.sh

[ -f /usr/local/bin/virtualenvwrapper.sh ] && source /usr/local/bin/virtualenvwrapper.sh
[ -f /Users/benjamin/.travis/travis.sh ] && source /Users/benjamin/.travis/travis.sh

eval "$(tmuxifier init -)"

SSHAGENT=/usr/bin/ssh-agent
SSHAGENTARGS="-s"
if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
  eval $($SSHAGENT $SSHAGENTARGS) > /dev/null
  trap "kill $SSH_AGENT_PID" 0
fi



