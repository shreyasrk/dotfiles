# Enable git branch information
# If this file is not present or if you face `__git_ps1 () not found` Error,
# overwrite git_completion.sh to /etc/bash_completion.d/git
. /etc/bash_completion.d/git
export PS1="\t \[\e[01;33m\]\w\[\e[01;31m\]\$(__git_ps1)\[\e[01;32m\]\$ \[\e[0m\]"

# Adding JIVA Related Information
. ~/.bashrc_jiva

# Listing files and folders
alias la='ls -al'
alias lf='ls -CFlh'
alias laf='ls -alF'
alias lah='ls -alh'
alias ll='ls -l'

# alias diskspace usage
alias diskspace="du -S | sort -n -r |more"

# Extract all types of files
extract() {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2)  tar xvjf $1     ;;
            *.tar.gz)   tar xvzf $1     ;;
            *.bz2)      bunzip2 $1      ;;
            *.rar)      unrar x $1      ;;
            *.gz)       gunzip $1       ;;
            *.tar)      tar xvf $1      ;;
            *.tbz2)     tar xvjf $1     ;;
            *.tgz)      tar xvzf $1     ;;
            *.zip)      unzip $1        ;;
            *.Z)        uncompress $1   ;;
            *.7z)       7z x $1         ;;
            *)          echo "don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

# Makes directory then moves into it
function mkcdr {
    mkdir -p -v $1
    cd $1
}

# Command substitution
alias ff='find / -name $1'
alias trash="rm -fr ~/.Trash"
alias df='df -h -x tmpfs -x usbfs'
alias psg='ps -ef | grep $1'
alias h='history | grep $1'
alias ..='cd ..'

# Coloring the manual (man command)
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#netinfo - shows network information for your system
netinfo ()
{
    echo "--------------- Network Information ---------------"
    /sbin/ifconfig | awk /'inet addr/ {print $2}'
    /sbin/ifconfig | awk /'Bcast/ {print $3}'
    /sbin/ifconfig | awk /'inet addr/ {print $4}'
    /sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
    myip=`lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g' `
    echo "${myip}"
    echo "---------------------------------------------------"
}

# Git Command Aliasing
alias ga='git add'
alias gau='git add -u'
alias gbr='git branch'
alias gcpick='git cherry-pick'
alias gclone='git clone'
alias gco='git checkout'
alias gcommit='git commit'
alias gcommita='git commit -a'
alias gdf='git df'
alias gfetch='git fetch --all'
alias ggui='gitk --all'
alias gl='git log'
alias glg='git lg'
alias gll='git ll'
alias gpullo='git pull origin'
alias gpusho='git push origin'
alias grebase='git rebase'
alias grebasei='git rebase --interactive'
alias gremote='git remote -v'
alias grename='git rename'
alias greset='git unstage'
alias grm='git rm'
alias gst='git status'
alias gstash='git stash'
alias gsync='git sync'
