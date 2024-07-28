# kalek's .dotfiles

### Installation
Tutorial: https://www.atlassian.com/git/tutorials/dotfiles

Firstly install git, zsh and pure.

1. Delete any conflicting dotfiles
2. `git clone --bare git@github.com:kalekdev/.dotfiles.git $HOME/.cfg`
3. `git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout`
4. Restart shell
5. `config config --local status.showUntrackedFiles no`
6. Good to go! Manage dotfiles using the config alias.

### System information
Debian 12 "bookworm"

Installed:
- sway
- brightness-ctl
- apt install network-manager for nmcli / nmtui commands - https://stackoverflow.com/a/51282646/12320544 fixed wpa_supplicant conflict
- zsh
- pure (manually, npm package installation didnt work)
- nvm
- firefox - using their apt repository rather than the slowly updated in debian packages
- pipewire
- spotify_player - using pulseaudio backend, works fine with pipewire 
- vscode - with microsoft apt repo
- bemenu
- grimshot
- imv - sudo mv /usr/libexec/imv/imv /usr/bin/imv
- zathura

TODO:
- nvim - todo configure kickstart.nvim
- zsh plugins for additional autocompletion
- tmux vs control through sway?
- install notification daemon to handle firefox properly
- Discord web client or CLI / wayland compatible alternative? (check arch suggestions)
- setup ssh server securely for use between my laptop / pc (only key auth)
- debloat zsh, investigate if ohmyzsh is needed at all. key is to reduce dependencies and ready to go on any pc just like that https://thevaluable.dev/zsh-install-configure-mouseless/
