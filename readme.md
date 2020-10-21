# rice

These are the configuration files that make up my personal GNU/Linux experience.

## zshenv

In this rice, `zshenv` is located in `$ZDOTDIR/.zshenv` instead of `$HOME/.zshenv`. As explained to great detail in [this section](#xdg-base-directory), this was done in the attempt to minimize the amount of dot files and folders in the home directory as possible.

This presents an initial problem, however. `$ZDOTDIR` must be set in `zshenv`, since it's the first script ran by the shell. But since zsh uses `$ZDOTDIR="$HOME"` by default, the `zshenv` used in this rice wont be sourced, and neither will the rest of the zsh dot files.

There are two solutions to this:

1. Move `$ZDOTDIR/.zshenv` in this rice to `$HOME/.zshenv` (non-root solution, but adds an additional dot file to the home directory)
2. Edit `/etc/zsh/zshenv` (or whatever it is on your system) to set `$ZDOTDIR="$HOME"/.config/zsh` (root solution, recommended if the privilege is available)

## User Binaries

Local user binaries are found in `$HOME/.bin`, and take precedence over other `$PATH` binaries before logging in. These are mostly for scripts and wrappers for existing programs.

## Fonts

The main font family used in this rice is [Liberation](https://en.wikipedia.org/wiki/Liberation_fonts), which is used for the `sans`, `serif`, `sans-serif` and `monospace` default fonts in [fontconfig](.config/fontconfig/fonts.conf). This font family is available for pretty much every GNU/Linux distribution in existence. In fact, you may even have it installed right now, since [some packages](https://www.archlinux.org/packages/community/any/ttf-liberation) may pull it as a dependency of some kind.

The only other font used in this rice is [JoyPixels](https://www.joypixels.com/), a free colored emoji font set that covers a wide range of unicode characters that most other font sets don't. This font is used for the `emoji` default font in [fontconfig](.config/fontconfig/fonts.conf), as well as a fallback to all the other fonts when an emoji character needs to be displayed.

## xdg-utils

This rice has a [config file](.config/busking/config) for [busking](https://github.com/supplantr/busking), a simple regex-based file opener as a drop-in replacement for `xdg-open`. Because of this, busking is incompatible with the [xdg-utils](https://www.archlinux.org/packages/extra/x86_64/xdg-utils/) package in most cases.

## XDG Base Directory

[This specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html) is used to tell programs where they should store their files. It's designed in such a way that your home folder should, in theory, only have 3 dot directories in it (with the exception of `$HOME/.bin`, which is specific to this rice), and 0 dot files. However, the unfortunate reality is that, by default, you'll eventually get this instead:

<img src=readme/dotfilehell.webp>

And even to this day, with the specification being nearly 2 decades old now, there are [many programs](https://wiki.archlinux.org/index.php/XDG_Base_Directory#Support) that either don't use the specification by default, or *still* don't support the specification, with [some even refusing to support it](https://bugzilla.mindrot.org/show_bug.cgi?id=2050), forcing its users to go out of their way to hack them to support it somewhat.

And that's exactly what this rice does. For programs that are basically hardcoded to store their files in the home directory, [wrapper scripts](.bin) are made to work around this.

The directories used in this specification are configured as such:

+ `$XDG_CONFIG_HOME="$HOME"/.config` - Where programs store their configuration files.
+ `$XDG_CACHE_HOME="HOME"/.cache` - Where programs store temporary data.
+ `$XDG_DATA_HOME="$HOME"/.data` - Where programs store permanent data. Traditionally, this is usually `$HOME/.local/share` on most systems, which is supposed to be analogous to `/usr/local/share`. But I figured it was inconsistent with the other directories in this list, and the extra directory level is unnecessary.

There's also `$XDG_RUNTIME_DIR`, which is similar to `$XDG_CACHE_HOME` but used more for stuff like named pipes and sockets. Also, `$XDG_RUNTIME_DIR` is often set automatically by the system, but if it isn't, make sure it's set somehow, because this rice doesn't set it.

### Incompatibilities

There are some programs that are basically impossible to have them respect the specification (beyond my capabilities as a user, anyway). Here's a list that I have to deal with when using my rice:

+ [Brave](https://brave.com/) - Not specifically a Brave issue, but since most chromium-based browsers use [NSS](https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS) for handling SSL certificates. There will always be a `$HOME/.pki` directory when using these browsers, which is used by NSS.

## XDG User Directory

Similar to the the [base directories](#xdg-base-directory), there's also [user directories](https://www.freedesktop.org/wiki/Software/xdg-user-dirs/), which are your everyday directories for stuff like downloads, pictures, videos etc.

See [user-dirs.dirs](.config/user-dirs.dirs) to see what these directories are. They're basically the defaults, but all lowercase.

Also, you might need [this package](https://www.archlinux.org/packages/extra/x86_64/xdg-user-dirs/) from your distro for these directories to actually be used by most programs. It also provides a shell utility to get these directories.
