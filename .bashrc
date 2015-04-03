# Enable git branch information
. /etc/bash_completion.d/git
export PS1="\t \[\e[01;33m\]\w\[\e[01;31m\]\$(__git_ps1)\[\e[01;32m\]\$ \[\e[0m\]"

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
alias gbr='git br'
alias gbrall='git br -a'
alias gcherryp='git cherry-pick'
alias gclone='git clone'
alias gco='git co'
alias gcob='git co -b'
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
alias gremote='git remotes'
alias greset='git reset HEAD'
alias grm='git rm'
alias gst='git st'
alias gstash='git stash'
alias gsync='git sync'

# JIVA related automation
# =======================
# Aliases for newer versions
alias rbo='./usr/bin/buildout -c linux_dev.cfg'
alias rmongo='./bin/mongodb_svc start'
alias rmc='./bin/memcached_svc start'
alias rzeo='./bin/zeo_svc start'
alias szeo='./bin/zeo_svc stop'
alias smongo='./bin/mongodb_svc stop'
alias smc='./bin/memcached_svc stop'

# Aliases for older versions
alias rbop='./bin/buildout -c linux_dev.cfg'
alias rmongop='./bin/start_mongodb_master.sh'
alias rmcp='./bin/memcached_startcluster.sh'
alias rzeop='./bin/zeo_srv start'

# Alias for Running zope
alias rzp='./bin/zope_c1 fg'

# Run the entire setup (5.7)
startzope() {
    echo "pwd: $1"
    cd $1 ;
    source ./bin/mssql_odbc.sh ;
    echo "##### Executed : ./bin/mssql_odbc.sh #####"
    rzeo ;
    echo "##### Executed : ./bin/zeo_svc start #####"
    rmc ;
    echo "##### Executed : ./bin/memcached_svc start #####"
    rmongo ;
    echo "##### Executed : ./bin/mongodb_svc start #####"
    echo "##### Running : ./bin/zope_c1 fg #####"
    rzp ;
}

startzopeold() {
    echo "pwd: $1"
    cd $1 ;
    source ./bin/mssql_odbc.sh ;
    echo "##### Executed ./bin/mssql_odbc.sh #####"
    rzeop ;
    echo "##### Executed ./bin/zeo_srv start #####"
    rmcp ;
    echo "##### Executed ./bin/memcached_startcluster.sh #####"
    rmongop ;
    echo "##### Executed ./bin/start_mongodb_master.sh #####"
    echo "##### Running ./bin/zope_c1 fg #####"
    rzp ;
}

# Kill all Zope related processes
killzope() {
    pgrep -l "python" ;
    echo "Killing all python processes ..."
    pkill "python" ;

    pgrep -l "mongo" ;
    echo "Killing all mongodb processes ..."
    pkill "mongo" ;

    pgrep -l "memca" ;
    echo "Killing all memcache processes ..."
    pkill "memca" ;
}

# Unlock the mongodb
# $1 must point to the base jiva_buildout directory!
mongounlock() {
    rm -rf $1/var/mongodb/data/* ;
    rm -rf $1/var/mongodb/mongodb.pid ;
    echo "Mongo Unlocked ... "
    rmongo ;
    echo "Mongo Restarted ...."
}

