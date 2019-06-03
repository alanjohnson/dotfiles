# dotfiles

These all all my dotfile settings.  I use this repo to easily sharing between computers, or when setting up a new system with my prefered settings.

To setup my system, All I do is 
1) clone this repo into my root folder ~
```bash
$ cd ~
$ git clone https://skittlyoaten@bitbucket.org/skittlyoaten/dotfiles.git
```
2) and then just run:
```bash
$ sh ~/dotfiles/makesymlinks.sh
```

The script will:
1) backup all the existing dotfiles
2) create a dotfiles/ folder with all my dotfiles in it.
3) create symlinks in ~ to the files in the /dotfiles repo.
4) adds git autocompletion (tab will autocomplete git branches)
5) adds Git custom log for easier viewing of commits.


## To Manually add git completion:
```bash
$ brew install wget
$ wget https://raw.github.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion
$ vim ~/.profile
```
Add this to your ~/.profile file:
```
source ~/.git-completion
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
