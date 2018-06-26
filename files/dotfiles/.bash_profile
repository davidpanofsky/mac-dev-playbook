#set -x
export VISUAL=vim
export EDITOR=vim
export HISTFILESIZE=50000
export HISTSIZE=10000
export HISTIGNORE=ignorespace:erasedups
export HISTTIMEFORMAT="%Y%m%d %T  "

export VAGRANT_DOTFILE_PATH="${HOME}/.vagrant"

export PATH="/usr/local/bin:/usr/local/opt/mysql-client/bin:$PATH"

# Only load Liquid Prompt in interactive shells, not from a script or from scp
#[[ $- = *i* ]] && [ -f /usr/local/bin/liquidprompt ] && source /usr/local/bin/liquidprompt
[ -f /usr/local/share/liquidprompt ] && . /usr/local/share/liquidprompt

#export PYENV_VIRTUALENV_DISABLE_PROMPT=1
#export PYENV_ROOT=/usr/local/var/pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

alias more=less
alias vi=vim

# note: this must happen after liquidprompt
[ -e "${HOME}/.iterm2_shell_integration.bash" ] && source "${HOME}/.iterm2_shell_integration.bash"

# autocompletion stuff
complete -C aws_completer aws
eval "$(pip completion --bash)"
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

