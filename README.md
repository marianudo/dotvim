DotVim
========

Repository to hold my shared vim configuration.

Plugins are installed as a [Pathogen] (https://github.com/tpope/vim-pathogen) bundles inside bundle/ directory.

They have been configured as git submodules to easy their installation in other machines, and also to facilitate keep them updated.

Installation instructions:

* cd ~
* git clone git@github.com:marianudo/dotvim.git .vim
* ln -s .vim/vimrc .vimrc
* git submodule init
* git submodule update

To learn about what plugins have I installed have a look at the bundle/ directory.
