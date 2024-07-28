# Fix missing cursor on nvidia
export WLR_NO_HARDWARE_CURSORS=1
[ "$(tty)" = "/dev/tty1" ] && exec sway
