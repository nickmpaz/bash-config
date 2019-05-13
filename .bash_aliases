# ssh


alias sshlab='ssh pi@pi-lab-sensor.local' #treeline lab sensor
alias sshtako='ssh -i ~/Treeline/aws_login/tako_dev.pem ubuntu@ec2-54-200-227-26.us-west-2.compute.amazonaws.com' #virtual device portal server

# docs
alias bashrc='vim ~/.bashrc'
alias vimrc='vim ~/.vimrc'
alias bashaliases='vim ~/.bash_aliases'
alias notes='vim ~/Documents/notes.txt'
alias srcdocs='. ~/.bashrc && . ~/.vimrc && . ~/.bash_aliases'

# virtualbox
alias vms='VBoxManage list runningvms'

# git
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -m'
alias gps='git push'
alias gpl='git pull'
alias gd='git diff'
alias gl='git log --graph --full-history --all --color --pretty=tformat:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s%x20%x1b[33m(%an)%x1b[0m"'

# docker-compose
alias dc='docker-compose'
