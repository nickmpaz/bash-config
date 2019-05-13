: '

# Custom Bash Functions

Clone in home directory.

Source with

    for f in ~/.functions/*; do
        . $f
    done

Bash functions:

    set_ps1: sets custom ps1 that shows base directory. If in git 
    directory, the active branch is also shown in a color that reflects 
    the state of the directory
        
        cyan    - clean working tree 
        pink    - unstaged changes
        yellow  - staged changes
        red     - untracked changes

    time_of_day: print time to console in ascii art.

    prcs: upgraded pgrep. creates a string from the arguments
    given and searches for processes that match that string.

    kprcs: prcs with option to kill processes listed.

    killvms: destroys all virtual box machines.

    & custom aliases

'
