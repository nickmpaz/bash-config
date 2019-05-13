#list all processes with arguments-> string as match argument 
#no more pgrep with quotes!
function prcs() {

  prefix="pgrep -fa "
  str="\"$*\""
  cmd=$prefix$str
  eval $cmd

}

#prcs command with option to kill 
function kprcs() {

  prefix1="pgrep -fa "
  prefix2="pkill -f "
  str="\"$*\""
  cmd=$prefix1$str
  eval $cmd
  echo -e ""
  read -p "Would you like to kill these processes? (y/N) " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || return
  echo "killing..."
  cmd=$prefix2$str
  eval $cmd

}

