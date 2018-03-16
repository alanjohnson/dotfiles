#source bash.rc
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

if [ -f ~/.profile ]; then
  source ~/.profile
fi
#mysql path
#export PATH=~/bin:/usr/local/bin:/usr/local/mysql/bin:$PATH
export PATH=/usr/local/Cellar/mysql55/5.5.30:$PATH
alias mysql='/usr/local/Cellar/mysql55/5.5.30/bin/mysql'
alias mysqladmin='/usr/local/Cellar/mysql55/5.5.30/bin/mysqladmin'

#nodejs
export NODE_PATH=/usr/local/lib/node_modules

###Rails MYSQL server setup
#export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"

###Aliases
alias swgreek='sass --watch "/Users/alan/sites/aj/gematria_greek/sass/":"/Users/alan/sites/aj/gematria_greek/css/" -t compact --unix-newlines'
alias swfs='sass --watch "/Users/alan/sites/aj/www_fancyscribbles/sass/":"/Users/alan/sites/aj/www_fancyscribbles/css/" -t compact --unix-newlines'
#alias vim='mvim -v' #use macvim instead of default vim
alias be="bundle exec"

# Use bundler always
export USE_BUNDLER=force

#  load up the virtualenvwrapper.sh script into your terminal windows. This will give you the power of virtualenvwrapper.
#nano ~/.bashrc

# set where virutal environments will live
# export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
# ensure all new environments are isolated from the site-packages directory
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
# use the same directory for virtualenvs as virtualenvwrapper
export PIP_VIRTUALENV_BASE=$WORKON_HOME
# makes pip detect an active virtualenv and install to it
export PIP_RESPECT_VIRTUALENV=true
if [[ -r /usr/local/bin/virtualenvwrapper.sh ]]; then
  source /usr/local/bin/virtualenvwrapper.sh
else
  echo "WARNING: Can't find virtualenvwrapper.sh"
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
