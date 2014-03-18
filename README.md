##Installation##
`git clone https://zdkroot@github.com/zdkroot/dotvim.git ~/.vim`

#####On windows clone into vim's install dir - default is 'c:\program files\vim\vim73'#####
`git clone https://zdkroot@github.com/zdkroot/dotvim.git c:\program files\vim\vim73`

##Create symlinks##

`ln -s ~/.vim/vimrc ~/.vimrc && ln -s ~/.vim/gvimrc ~/.gvimrc`
	
`mklink /H C:/Program Files (x86)/Vim/_vimrc vim73\vimrc && mklink /H C:/Program Files (x86)/Vim/_gvimrc vim73\gvimrc`

##Install and run vundle##
`git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle`
`vim +BundleInstall +qall`
