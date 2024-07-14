# kalek's .dotfiles

### Installation
Tutorial: https://www.atlassian.com/git/tutorials/dotfiles

1. Delete any conflicting dotfiles
2. `git clone --bare git@github.com:kalekdev/.dotfiles.git $HOME/.cfg`
3. Restart shell
4. Manage dotfiles using config alias

### System information
Debian 12 "bookworm"

Installed:
sway
zsh
pure (manually, npm package installation didnt work)
nvm
firefox - using their apt repository rather than the slowly updated in debian packages
pipewire - 
spotify_player - using pulseaudio backend, works fine with pipewire 
vscode
apt install network-manager for nmcli / nmtui commands

TODO:
pipewire - need to add volume controls to sway config https://www.reddit.com/r/swaywm/comments/qei3oh/how_can_i_set_up_keybindgs_with_sway_for_volume/ https://wiki.archlinux.org/title/WirePlumber#Keyboard_volume_control
nvim - todo configure kickstart.nvim
zsh plugins for additional autocompletion
tmux vs control through sway?
install notification daemon to handle firefox properly
Discord web client or CLI / wayland compatible alternative? (check arch suggestions)
setup ssh server securely for use between my laptop / pc (only key auth)
