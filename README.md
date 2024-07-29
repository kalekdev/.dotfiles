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
- swaylock
- brightness-ctl
- apt install network-manager for nmcli / nmtui commands - https://stackoverflow.com/a/51282646/12320544 fixed wpa_supplicant conflict
- zsh
- pure (manually, npm package installation didnt work)
- nvm
- go
- firefox - using their apt repository rather than the slowly updated in debian packages
- pipewire
- spotify_player - using pulseaudio backend, works fine with pipewire 
- vscode - with microsoft apt repo
- bemenu
- grimshot
- mako
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

Firefox add apt registry:
```bash
sudo install -d -m 0755 /etc/apt/keyrings
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
gpg -n -q --import --import-options import-show /etc/apt/keyrings/packages.mozilla.org.asc | awk '/pub/{getline; gsub(/^ +| +$/,""); if($0 == "35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3") print "\nThe key fingerprint matches ("$0").\n"; else print "\nVerification failed: the fingerprint ("$0") does not match the expected one.\n"}'
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null
echo '
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
' | sudo tee /etc/apt/preferences.d/mozilla 
sudo apt-get update && sudo apt-get install firefox
```
