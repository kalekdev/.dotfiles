# =GNOME is a fix for electron secrets decryption, see here: https://github.com/electron/electron/issues/32598#issuecomment-1648615204
export XDG_CURRENT_DESKTOP=GNOME # xdg-desktop-portal
export XDG_SESSION_DESKTOP=sway # systemd
export XDG_SESSION_TYPE=wayland # xdg/systemd
systemctl --user import-environment XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP XDG_SESSION_TYPE

# Fix missing cursor on nvidia
export WLR_NO_HARDWARE_CURSORS=1
[ "$(tty)" = "/dev/tty1" ] && exec sway
