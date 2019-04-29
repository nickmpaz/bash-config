cd bash-config

echo "copying"
cp ./.bashrc ~/.bashrc
cp ./.bash_aliases ~/.bash_aliases
cp ./vimrc ~/.vimrc
cp -r ./.functions/ ~/.functions/
echo "sourcing"
. ~/.bashrc && . ~/.vimrc && . ~/.bash_aliases
