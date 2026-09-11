# ssh-agent runs a systemd service, this exports the socket path
export SSH_AUTH_SOCK=${XDG_RUNTIME_DIR}/ssh-agent.socket

# =GNOME is a fix for electron secrets decryption, see here: https://github.com/electron/electron/issues/32598#issuecomment-1648615204
export XDG_CURRENT_DESKTOP=GNOME # xdg-desktop-portal
export XDG_SESSION_DESKTOP=sway # systemd
export XDG_SESSION_TYPE=wayland # xdg/systemd
systemctl --user import-environment XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP XDG_SESSION_TYPE

# https://www.electronjs.org/docs/latest/api/environment-variables#electron_ozone_platform_hint-linux
export ELECTRON_OZONE_PLATFORM_HINT=auto

export QT_QPA_PLATFORM=xcb

# Fix missing cursor on nvidia
export WLR_NO_HARDWARE_CURSORS=1

[ "$(tty)" = "/dev/tty1" ] && exec sway --unsupported-gpu
