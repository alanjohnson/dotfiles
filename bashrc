#Default EDitor of choice
export EDITOR=vim

###Color settings
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# increase Terminal history storage (for ctrl-r command)
HISTFILESIZE=1000000000 HISTSIZE=1000000

# run the git auto-completion script, to auto-complete things like git branch names
# to get it run:
# curl https://raw.github.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

###set up my prompt
#Add git Branch Support
parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ →\ \1/'
}

# fix bundle exe is not install error on some git repos
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Options used are listed below:
#\[\e[32m\] = set color to green
#\u@ = display user (/u) and append the @ sign after it
#\h = display the hostname
#\[\e[33m\] = changecolor to yellow
#\w show current directory
#\w$(__git_ps1 "(%s)") >  show current git branch
#\[\e[0m\] set color to white
#\$(parse_git_branch) = Show current git Branch
#\n = add a newline
#\$ = sow $ as the prompt on the new line

export PS1="\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\$(parse_git_branch)\n\$"

