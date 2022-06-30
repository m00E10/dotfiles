export EDITOR=/usr/local/bin/vim
export GOBIN=~/go/bin
export GOPATH=~/go
export PATH=~/.local/bin:/usr/sandbox/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:$PATH:$GOBIN
export TERM=screen-256color
#export TERM=screen
#export TERM=xterm-16color
export LESSHISTFILE=/dev/null 
export _JAVA_AWT_WM_NONREPARENTING=1 # To fix Java apps on wayland

# Cant be bothered to re-color vim and others, sticking with 8color for now
PS1="\[\e[0;31m\][\[\e[0;37m\]\u\[\e[0;33m\]@\[\e[0;36m\]\h\[\e[0;31m\]]\[\e[0;31m\]\[\e[0;33m\]-\[\e[0;31m\][\[\e[0;32m\]\W\[\e[0;31m\]]\[\e[0;33m\] $ \[\e[0m\]"

#change blinking block to blinking |
echo -e -n "\x1b[\x35 q"

# Dont save bash history
unset HISTFILE

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Colored Prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

# Set 'man' colors
if [ "$color_prompt" = yes ]; then
        man() {
        env \
        LESS_TERMCAP_mb=$'\e[01;31m' \
        LESS_TERMCAP_md=$'\e[01;31m' \
        LESS_TERMCAP_me=$'\e[0m' \
        LESS_TERMCAP_se=$'\e[0m' \
        LESS_TERMCAP_so=$'\e[01;44;33m' \
        LESS_TERMCAP_ue=$'\e[0m' \
        LESS_TERMCAP_us=$'\e[01;32m' \
        man "$@"
        }
fi

unset color_prompt force_color_prompt

# Aliases! Get yer aliases here!
alias ls='ls --color=auto'
alias dir='ls --color=auto'
alias ll='ls --group-directories-first -lhF --color=auto'
alias la='ls --group-directories-first -laF --color=auto'
alias l='ls --group-directories-first -CF --color=auto'
alias em='emacs -nw'
alias dd='dd status=progress'
alias sudo='doas'
alias please='doas'
alias fucking='doas'
alias x='exit'
alias c='clear'
alias n='neofetch'
alias hn='lynx news.ycombinator.com'
alias wget='wget --hsts-file=/dev/null'
alias dsway='dbus-launch --exit-with-session sway'
alias tmx='tmuxp load 2'
alias tunes='vlc --intf ncurses --no-color ~/Documents/music'

# vim alias to force it to run with just 8 colors
v() {
    export TERM=screen
    vim "$1"
    export TERM=screen-256color
}

# man alias to view it with colored output
m() {
	man "$1" | most
}

upload() {
	curl --upload-file ./$1 https://transfer.sh/$1 
}

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# for sway
XDG_CONFIG_HOME=~/.config
# for local binaries / scripts
export PATH="~/bin:$PATH"

# For ANSI posting on irc
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# change what terminals are labeled as
echo -e -n "\e]2;thiccpad\e\\"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
