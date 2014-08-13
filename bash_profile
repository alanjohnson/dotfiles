#source bash.rc
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
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

# This loads RVM into a shell session.
[[ -s "/Users/alanj/.rvm/scripts/rvm" ]] && source "/Users/alanj/.rvm/scripts/rvm"

# Use bundler always
export USE_BUNDLER=force

source ~/.rvm/scripts/rvm
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/usr/local/sbin # Add RVM to PATH for scripting

