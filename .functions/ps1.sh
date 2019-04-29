
function set_ps1 {
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\][\[\033[38;5;14m\]\W\[\033[01;32m\]]$(set_ps1_helper) : \[$(tput sgr0)\]'
}


function set_ps1_helper {
	
	if [ -d .git ]; then

		branch=$(git branch 2> /dev/null | grep \* | cut -d ' ' -f2)
		yellow='\033[38;5;11m'
		red='\033[38;5;1m'
		green='\033[01;32m'
		pink='\033[38;5;200m'
		cyan='\033[38;5;14m'

		#if no changes to be committed
		if output=$(git status --porcelain) && [ -z "$output" ]; then
			#working directory clean
			echo -e "[$cyan$branch$green]"
			return
		else
			# unstaged changes
			git diff --exit-code > /dev/null 2>&1
			if [ $? -eq 1 ] ; then
				echo -e "[$pink$branch$green]"
				return
			fi
			# staged changes
			git diff --cached --exit-code > /dev/null 2>&1
			if [ $? -eq 1 ]; then
				echo -e "[$yellow$branch$green]"
				return
			fi
			echo -e "[$red$branch$green]"
			return
		fi


    else
        echo -e ""
    fi

}
	

