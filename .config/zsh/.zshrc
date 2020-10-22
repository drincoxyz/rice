# less formatting
export LESS_TERMCAP_md=$'\e[01;33m'
export LESS_TERMCAP_us=$'\e[01;32m'

# colored output
alias ls='ls -A --color=auto'
alias grep='grep --color=auto'

# syntax highlighting
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# completions
autoload -U compinit && compinit -d "$XDG_DATA_HOME"/zsh/zcompdump

# updates rice
mkrice(){
	# fair warning
	echo -e "\033[33;5m! ! ! WARNING ! ! !\033[0m"
	echo "This will update everything from the rice to the home directory of the '$USER' user. By continuing, any conflicting files will be overwritten by this process."
	echo -n 'Continue? (y/N): ' && \
	read CONT
	case "$CONT" in
		y|Y) ;;
		*) return 1
	esac

	# setup XDG base dirs
	mkdir -pv "$XDG_CONFIG_HOME"
	mkdir -pv "$XDG_CACHE_HOME" && \
	chmod -v 700 "$XDG_CACHE_HOME"
	mkdir -pv "$XDG_DATA_HOME" && \
	chmod -v 700 "$XDG_DATA_HOME"

	# setup GnuPG home dir
	mkdir -pv "$GNUPGHOME" && \
	chmod -v 700 "$GNUPGHOME"

	# setup OpenSSH dirs
	mkdir -pv "$XDG_DATA_HOME"/ssh && \
	mkdir -pv "$XDG_CACHE_HOME"/ssh && \
	chmod -v 700 "$XDG_DATA_HOME"/ssh

	# setup isync data dir
	mkdir -pv "$XDG_DATA_HOME"/mbsync && \
	chmod -v 700 "$XDG_DATA_HOME"/mbsync

	# setup user binaries
	ln -sfv "$HOME"/git/rice/.bin "$HOME" && \
	chmod -v 755 "$HOME"/.bin/*

	# link config/data files
	ln -sfv "$HOME"/git/rice/"`basename "$XDG_CONFIG_HOME"`"/* "$XDG_CONFIG_HOME"
	ln -sfv "$HOME"/git/rice/"`basename "$XDG_DATA_HOME"`"/* "$XDG_DATA_HOME"

	# link zshenv
	ln -sfv "$HOME"/git/rice/.zshenv "$HOME"
}

# compiles suckless programs
mksuckless(){
	# remove dupe config
	rm -fv config.h blocks.h

	# make, install and clean
	make && \
	sudo make install && \
	make clean

	# remove dupe config (again)
	rm -fv config.h blocks.h
}
