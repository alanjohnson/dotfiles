# dotfiles

These are all my dotfile settings.  This repo will set up my system preferences for me, without having to manually do everything on each system.  or when setting up a new macbook.

To setup my system, All I do is
1) clone this repo into my root folder ~
```zsh
$ cd ~
$ git clone --recursive -j4 git@github.com:alanjohnson/dotfiles.git
```
2) Backup old files and create the symlinks (** see below for details):
```zsh
$ sh ~/dotfiles/makesymlinks.sh
```
3) Update the submodules:
```zsh
git submodule update --recursive --remote
```

TROUBLESHOOTING:
IF the submdoules are missing, navigate to the empty folder and run:
```zsh
git submodule update --init --recursive
```

** The makesymlinks script will:
1) backup all the existing dotfiles
2) create a dotfiles/ folder with all my dotfiles in it.
3) create symlinks in ~ to the files in the /dotfiles repo.
4) adds git autocompletion (tab will autocomplete git branches)
5) adds Git custom log for easier viewing of commits.
6) adds fancy terminal prompt to include active git branch.
7) adds all my vim customization/ and settings
8) add symlinks for neovim

## IF YOU FORK THIS YOU MUST:
Update the gitconfig file with your own name and email.

#ZSH
Apple has changed their default shell to ZSH.  So I'm going to split this into 2 sections. ZSH, and the original one BASH below.

oh-my-zsh allows you to use a customs folder outside it's own.  This is important to do, IF you want to have a repo for all your plugins and custom themes.
In my case, I made a folder: /dotfiles/zsh-customizations.

any plugin/theme install you do should point to THIS folder.  not the oh-my-zsh custom folder.

THE BELOW SHOULD BE INSTALLED ALREADY IF YOU ARE USING THIS REPO.
###Syntax highlighting in terminal:
make the command green if typed right, red if not, and underline existent folders/files
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/dotfiles/zsh-customizations/plugins/zsh-syntax-highlighting
```
###Auto suggestions, like recently typed commands
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ~/dotfiles/zsh-customizations/plugins/zsh-autosuggestions
```
###Fuzzy finder in terminal!  Oh yeah. CTRL+T to do search
```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
```

##powerline
the powerline theme is installed, but if you want to use it you will need fonts.
Nerd fonts are good.
https://github.com/ryanoasis/nerd-fonts
https://github.com/powerline/fonts

in iTerm2 setup, you can use any font you want, and select the powerline font as the fallback.

#BASH
## To Manually add git completion:
```bash
$ brew install wget
$ wget https://raw.github.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion
$ vim ~/.profile
```
Add this to your ~/.profile file:
```
$ source ~/.git-completion
```
then run:
```bash
$ source ~/.profile
```
## manually add custom gitlog
```bash
git config --global alias.mylog "log --pretty=format:'%C(yellow)%h%Creset %C(bold blue)<%an>%Creset %C(red)%d%Creset %s %Cgreen(%cr) ' --abbrev-commit --date=short --branches"
```
to use, just run:
```bash
$ git mylog
```
## manually add custom prompt
add this to your .bashrc file
```bash
###set up my prompt
#Add git Branch Support
parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ →\ \1/'
}

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
```
