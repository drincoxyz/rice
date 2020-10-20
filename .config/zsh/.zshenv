# local user binaries
export PATH="$HOME"/.bin:"$PATH"

# XDG base directories
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.data

# default programs
export EDITOR=vim
export TERMINAL=st
export BROWSER=brave
export LAUNCHER=dmenu_run

# X11
export XINITRC="$XDG_CONFIG_HOME"/xinit/xinitrc
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export XRESOURCES="$XDG_CONFIG_HOME"/xrdb/Xresources

# wine
export WINEPREFIX="$XDG_DATA_HOME"/wine
export STEAM_COMPAT_DATA_PATH="$XDG_DATA_HOME"/proton

# misc
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export VIMINIT='source $XDG_CONFIG_HOME/vim/vimrc'
export LESSHISTFILE="$XDG_CACHE_HOME"/less/lesshst
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_DATA_HOME"/java
