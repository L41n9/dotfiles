#!/bin/env bash

# sets wallpaper using feh
#bash $HOME/.xmonad/.fehbg
#feh --bg-scale /usr/share/backgrounds/downloads/pc.jpg &
feh --bg-fill /usr/share/backgrounds/downloads/wallpaper.jpg &

# polybar
$HOME/.xmonad/bin/launchbar.sh

# Fix cursor
xsetroot -cursor_name left_ptr

# kill if already running
killall -9 picom xfce4-power-manager ksuperkey dunst sxhkd eww

## Launch Conkeww
#sed -i "s/colors\/color-.*/colors\/color-gruvbox.yuck\")/g" $HOME/.config/conkeww/eww.yuck
#eww --config $HOME/.config/conkeww/ open conkeww-main

# killing eww
killall eww

# starting mpd
#mpd --no-daemon --stdout --verbose &
# sets superkey
#ksuperkey -e 'Super_L=Alt_L|F1' &
#ksuperkey -e 'Super_R=Alt_L|F1' &

# start hotkey daemon
sxhkd &

# Launch notification daemon
dunst -config $HOME/.xmonad/dunstrc &

# start compositor and power manager
xfce4-power-manager &

/usr/bin/vmware-user &

#while pgrep -u $UID -x picom >/dev/null; do sleep 1; done
picom --config $HOME/.xmonad/picom.conf --experimental-backends &

wmname LG3D &
# start polkit
if [[ ! `pidof xfce-polkit` ]]; then
    /usr/lib/xfce-polkit/xfce-polkit &
fi

# start udiskie
#udiskie &

# replace neovim colorscheme
#sed -i "s/theme =.*$/theme = \"gruvchad\",/g" $HOME/.config/nvim/lua/chadrc.lua

# change xfce4-terminal colorscheme
XFCE_TERM_PATH="$HOME/.config/xfce4/terminal"
cp "$XFCE_TERM_PATH"/colorschemes/gruvbox-material "$XFCE_TERM_PATH"/terminalrc
