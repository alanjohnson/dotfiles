# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles # dotfiles directory
olddir=~/dotfiles_old # old dotfiles backup directory
files="bash_profile profile bashrc gitconfig gitignore git-completion git-completion.bash vim vimrc eslintrc zshrc zshenv" # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
	echo "Moving any existing dotfiles from ~ to $olddir"
	mv ~/.$file ~/dotfiles_old/
	echo "Creating symlink to $file in home directory."
	ln -s $dir/$file ~/.$file
done

echo "Creating symlinks for neovim"
mkdir -p ~/.config
ln -s ~/dotfiles/vim ~/.config/nvim
ln -s ~/dotfiles/vim ~/.nvim
ln -s ~/dotfiles/vimrc ~/.nvimrc
ln -s ~/dotfiles/vimrc ~/.config/nvim/init.vim
#ln -s ~/dotfiles/vimrc ~/dotfiles/vim/init.vim

echo "Creating symlinks for eslinterrc"
ln -s ~/dotfiles/eslintrc.json ~/.eslintrc.json

echo "Creating symlinks nd setup for oh-my-zsh"
mv ~/.oh-my-zsh ~/dotfiles/oh-my-zsh
ln -s ~/dotfiles/oh-my-zsh ~/.oh-my-zsh
ln -s ~/dotfiles/zshrc ~/.zshrc