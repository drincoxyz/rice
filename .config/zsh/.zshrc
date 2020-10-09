export LESS_TERMCAP_md=$'\e[01;33m'
export LESS_TERMCAP_us=$'\e[01;32m'

alias ls='ls -A --color=auto'
alias grep='grep --color=auto'
alias uprice='ln -sfv "$HOME"/git/rice/.config/* "$HOME"/.config && chmod -v +x "$HOME"/.bin/*'
alias mksuckless='rm -fv config.h && make && sudo make install && make clean && rm -fv config.h'
alias mkdwmblocks='rm -fv blocks.h && make && sudo make install && make clean && rm -fv blocks.h'
