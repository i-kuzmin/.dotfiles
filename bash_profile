export EDITOR=vim
PATH+=":~/.bin"

#function scan()
#{
#    file=$1
#    if [ -z "$file" ]; then
#        file=scan.$RANDOM.png
#    fi
#
#    echo write to $file
#    scanimage -p -v -d snapscan \
#        --quality-cal=no |pnm2png >$file
#
#}

###############################################################################
# ls/tree colors
###############################################################################
function join_by { local IFS="$1"; shift; echo "$*"; }
#dircolors
read -d '' ls_basic <<END_COLORS
bd=40;33;01  ca=30;41  cd=40;33;01  di=01;34     do=01;35  ex=01;32
ln=01;36     mh=00     mi=00        or=40;31;01  ow=34;42  pi=40;33
rs=0         sg=30;43  so=01;35     st=37;44     su=37;41  tw=30;42
END_COLORS

read -d '' ls_files <<END_COLORS
*.tar=01;31   *.tgz=01;31   *.arc=01;31    *.arj=01;31   *.taz=01;31   *.lha=01;31
*.lz4=01;31   *.lzh=01;31   *.lzma=01;31   *.tlz=01;31   *.txz=01;31   *.tzo=01;31
*.t7z=01;31   *.zip=01;31   *.z=01;31      *.Z=01;31     *.dz=01;31    *.gz=01;31
*.lrz=01;31   *.lz=01;31    *.lzo=01;31    *.xz=01;31    *.zst=01;31   *.tzst=01;31
*.bz2=01;31   *.bz=01;31    *.tbz=01;31    *.tbz2=01;31  *.tz=01;31    *.deb=01;31
*.rpm=01;31   *.jar=01;31   *.war=01;31    *.ear=01;31   *.sar=01;31   *.rar=01;31
*.alz=01;31   *.ace=01;31   *.zoo=01;31    *.cpio=01;31  *.7z=01;31    *.rz=01;31
*.cab=01;31   *.wim=01;31   *.swm=01;31    *.dwm=01;31   *.esd=01;31   *.jpg=01;35
*.jpeg=01;35  *.mjpg=01;35  *.mjpeg=01;35  *.gif=01;35   *.bmp=01;35   *.pbm=01;35
*.pgm=01;35   *.ppm=01;35   *.tga=01;35    *.xbm=01;35   *.xpm=01;35   *.tif=01;35
*.tiff=01;35  *.png=01;35   *.svg=01;35    *.svgz=01;35  *.mng=01;35   *.pcx=01;35
*.mov=01;35   *.mpg=01;35   *.mpeg=01;35   *.m2v=01;35   *.mkv=01;35   *.webm=01;35
*.ogm=01;35   *.mp4=01;35   *.m4v=01;35    *.mp4v=01;35  *.vob=01;35   *.qt=01;35
*.nuv=01;35   *.wmv=01;35   *.asf=01;35    *.rm=01;35    *.rmvb=01;35  *.flc=01;35
*.avi=01;35   *.fli=01;35   *.flv=01;35    *.gl=01;35    *.dl=01;35    *.xcf=01;35
*.xwd=01;35   *.yuv=01;35   *.cgm=01;35    *.emf=01;35   *.ogv=01;35   *.ogx=01;35
*.aac=00;36   *.au=00;36    *.flac=00;36   *.m4a=00;36   *.mid=00;36   *.midi=00;36
*.mka=00;36   *.mp3=00;36   *.mpc=00;36    *.ogg=00;36   *.ra=00;36    *.wav=00;36
*.oga=00;36   *.opus=00;36  *.spx=00;36    *.xspf=00;36                
END_COLORS

export LS_COLORS=$(join_by ':' $ls_basic $ls_files)

###############################################################################
# Go language environment
###############################################################################
export GOPATH="$HOME/src/golang"

PATH+=:$GOPATH/bin

###############################################################################
# Java environment 
###############################################################################
#export JAVA_HOME=/usr/lib/jvm/java-8-openjdk/
#PATH+=:$JAVA_HOME/bin

###############################################################################
# Ruby environment 
###############################################################################
RUBY_HOME=$HOME/.gem
PATH+=:$RUBY_HOME/ruby/2.5.0/bin

###############################################################################
# Perl environment 
###############################################################################

export PERL5LIB=~/.cpan/install:$PERL5LIB

###############################################################################
# Aliases
###############################################################################
#alias chromium='chromium --force-device-scale-factor=1'
alias grep='grep --color=auto'
alias ls='ls --color=auto'

alias o='nohup xdg-open &>/dev/null'
alias mimetype='xdg-mime query filetype'
alias l='ls --color=auto -S'
alias md='ronn -r -m'
alias ssh='ssh -XC'

export PAGER=less

chromium_proxy() {
    killall chromium
    export http_proxy=http://victoria.tbricks.com:3128/
    chromium
}

export amazon='-i .ssh/amazon_webserver.pem ubuntu@ec2-54-72-107-237.eu-west-1.compute.amazonaws.com'
amazon()
{
    ssh $amazon
}


###############################################################################
# Bash completion
###############################################################################
if [ -e /usr/share/bash-completion/bash_completion ];
then
    source /usr/share/bash-completion/bash_completion
fi

export PATH
