## Files
.vim
    directory of file type configurations and plugins
.vimrc
    my vim configuration
.screenrc
    my screen configuration
.weechat
    my configuration for weechat, a great irc client
.gimp
    my tweaks/additions to gimp (fonts, brushes, etc)

## Instructions
### Creating source files
Any file which matches the shell glob `_*` will be linked into `$HOME` as a symlink with the first `_`  replaced with a `.`

For example:

    _bashrc

becomes

    ${HOME}/.bashrc

### Install softwares 

This suit configurations need the following softwares:

* git, vim, screen, tmux 
* mutt, offlineimap, msmtp, python, keyring(python module) 
* ssh, irssi, gnupg 

### Setting passord for mail client

This step is mainly for offlineimap and mstp, and the parameters are based on
the configuration files(.msmtprc and .offlineimaprc). For instance: 

	$ python -c "import keyring; keyring.set_password('mstp.gmail.com', 'user', 'PASSWORD')"
	# Test that the password is successfully stored:
	$ python -c "import keyring; print keyring.get_password('mstp.gmail.com', 'user')"
	PASSWORD

### Installing source files
It's as simple as running:

    ./install.sh

From this top-level directory.

### Only install and build vim Files
Because this bit is pretty portable

    ./install.sh vim

### Restore old source Files
To replace installed files with the originals:

    ./install.sh restore

Note that if there was not an original version, the installed links will not be removed.

## Requirements
### Python
* keyring

Because it save password by python module keyring, so you must install it, and set the
password first:

	$ pip install keyring
	$ python -c "import keyring; keyring.set_password('server', 'username', 'PASSWORD')"
	# Test that the password is successfully stored:
	$ python -c "import keyring; print keyring.get_password('server', 'username')"
	PASSWORD

### Shell
* bash

### Vim
* python
  * python-mode 
