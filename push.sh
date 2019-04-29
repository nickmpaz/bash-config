cd bash-config

cp ./.bashrc ~/.bashrc
cp ./.bash_aliases ~/.bash_aliases
cp ./.vimrc ~/.vimrc
cp -r ./.functions/ ~/.functions/

. ~/.bashrc && . ~/.vimrc && . ~/.bash_aliases

cd ..

