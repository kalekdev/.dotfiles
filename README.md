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
- ripgrep
- fonts-recommended
- typst
- nvm
- go
- firefox - using their apt repository rather than the slowly updated in debian packages
- pipewire
- spotify_player - using pulseaudio backend, works fine with pipewire 
- vscode - with microsoft apt repo
- bemenu - make sure to use new version for vim bindings to work
- grimshot
- mako-notifier
- imv - sudo mv /usr/libexec/imv/imv /usr/bin/imv
- mpv
- zathura
- xdg-desktop-portal-wlr for screen sharing
- sc-im: https://github.com/andmarti1424/sc-im/wiki/Installing-on-Debian
- a2ln: apt install pipx libcairo2-dev libgirepository1.0-dev gir1.2-notify-0.7

TODO:
- Clipboard history: https://www.reddit.com/r/swaywm/comments/ov2v5c/what_are_your_bests_shortcuts_scripts_config/
- Check out helix text editor
- Extend nvim text objects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects or https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-ai.md
- Disable laptop keyboard upon udev rule not in sway config: https://www.reddit.com/r/swaywm/comments/y3wnrx/key_shortcut_to_disablepower_off_notebook_keyboard/ https://www.reddit.com/r/swaywm/comments/nui8gg/how_to_disable_laptop_keyboard_when_external/
- investigate swaybar-protocol for asynchronous bar
- zsh plugins for additional autocompletion
- tmux vs control through sway? https://github.com/jabirali/tmux-tilish one thing i miss from tmux is the copy mode...
- Discord web client or CLI / wayland compatible alternative? (check arch suggestions)
- setup ssh server securely for use between my laptop / pc (only key auth)
- debloat zsh, investigate if ohmyzsh is needed at all. key is to reduce dependencies and ready to go on any pc just like that https://thevaluable.dev/zsh-install-configure-mouseless/
- makoctl, add mute notifications keybind to toggle do-not-disturb mode
- nix

Nvidia proprietary driver "Found 0 GPUS, cannot created bakend" fixes (DRM kernel mode setting specifically)
https://wiki.hyprland.org/Nvidia/#drm-kernel-mode-setting

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

Bluetooth USB dongle fix: https://askubuntu.com/questions/1339825/ubuntu-21-04-bluetooth-5-0-dongle-does-not-work-and-says-theres-no-firmware

Firefox audio playback fix: https://wiki.debian.org/ffmpeg

Battery life test:
Normal usage from 100% HP Pavilion - 2 hours 25 mins
TLP normal usage - 2 hours 45 mins
