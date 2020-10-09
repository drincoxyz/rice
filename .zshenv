export PATH="$HOME"/.bin:"$PATH"

export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.data

export EDITOR=vim
export TERMINAL=st
export BROWSER=brave
export LAUNCHER=dmenu_run

export STEAMLIB="$HOME"/games/steam
export STEAMHOME="$XDG_DATA_HOME"/Steam
export STEAMDATA="$STEAMHOME"/`basename "$XDG_DATA_HOME"`

export SSHCONFIG="$XDG_CONFIG_HOME"/ssh/config
export SSHIDENTITY="$XDG_DATA_HOME"/ssh/id_rsa
export SSHKNOWNHOSTS="$XDG_CACHE_HOME"/ssh/known_hosts

export XINITRC="$XDG_CONFIG_HOME"/xinit/xinitrc
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export XRESOURCES="$XDG_CONFIG_HOME"/xrdb/Xresources

export ZDOTDIR="$XDG_CONFIG_HOME"/zsh
export VIMINIT='source $XDG_CONFIG_HOME/vim/vimrc'
export LESSHISTFILE="$XDG_CACHE_HOME"/less/lesshst
export NVIDIARC="$XDG_CONFIG_HOME"/nvidia/nvidia-settings-rc
