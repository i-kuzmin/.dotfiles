#!/bin/bash

# If not running interactively, don't do anything
#[[ $- != *i* ]] && return

base=$(dirname ${BASH_SOURCE[0]})
# =============================================================================
# ls/tree colors --- {{{

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
# }}} --- ls/tree colors
# -----------------------------------------------------------------------------
# =============================================================================
# Ruby environment
RUBY_HOME=$HOME/.gem
if [ -d $RUBY_HOME ]; then
    export PATH+=:$RUBY_HOME/ruby/2.5.0/bin
fi
# -----------------------------------------------------------------------------
# =============================================================================
# Perl environment
eval "$(perl -I$HOME/.perl5/lib/perl5 -Mlocal::lib=$HOME/.perl5)"
# -----------------------------------------------------------------------------
# =============================================================================
# i3 tools
if [ -d "$base/i3/bin" ]; then
    export PATH+=:$base/i3/bin
fi
# -----------------------------------------------------------------------------
# =============================================================================
# Aliases
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias acpp='ack --cpp --cc'
alias o='nohup xdg-open &>/dev/null'
alias ssh='ssh -XC'
# -----------------------------------------------------------------------------
# =============================================================================
# Environments
export EDITOR=vim
if [ -d $base/bin ]; then
    export PATH+=:$base/bin
fi

export PAGER=less
export PS1="\[\033[02;39m\][\t \[\033[32m\]\u\[\033[00m\]@\[\033[36m\]\h\[\033[00m\]:\[\033[01;39m\]\W\[\033[02;m\]]\[\033[00m\]$ "
# -----------------------------------------------------------------------------

# vim: foldmethod=marker
