# vim-dotfiles

Assuming the repo is checked out to `~/git/vim-dotfiles`, one just needs to checkout submodules and create symlinks to the repo.

```
cd ~/git/vim-dotfiles
git submodule update --init
cd ~
ln -s git/vim-dotfiles .vim
ln -s git/vim-dotfiles/vimrc .vimrc
```
