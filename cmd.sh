#!/usr/bin/env sh

HERE=$(dirname `realpath -LP "$0"`)

# file by symbolic link
LINKS=$(cat <<EOF
# shared
shared/bash_profile:.bash_profile
shared/bashrc:.bashrc
shared/profile:.profile

# display server
shared/wprofile:.wprofile
shared/xinitrc:.xinitrc
shared/xprofile:.xprofile

# dev
git/config:.gitconfig
vim/vimrc:.vimrc
config/mimeapps.list:.config/mimeapps.list

# app
alacritty/alacritty.toml:.config/alacritty/alacritty.toml
eww/:.config/eww/
fcitx5/:.config/fcitx5/
fontconfig/fonts.conf:.config/fontconfig/fonts.conf
handlr/handlr.toml:.config/handlr/handlr.toml
hypr/:.config/hypr/
i3/:.config/i3/
keepassxc/keepassxc.ini:.config/keepassxc/keepassxc.ini
lf/lfrc:.config/lf/lfrc
libinpt-gestures/libinput-gestures.conf:.config/libinput-gestures.conf
mako/:.config/mako/
mpv/mpv.conf:.config/mpv/mpv.conf
neomutt/:.config/neomutt/
rofi/:.config/rofi/
streamlink/:.config/streamlink/
sway/:.config/sway/
tmux/tmux.conf:.config/tmux/tmux.conf
waybar/:.config/waybar/
wayfire/:.config/wayfire/
wayvnc/:.config/wayvnc/
wf-shell/:.config/wf-shell/
EOF
)

# file by copy
COPIES=$(cat <<EOF
EOF
)

# file by git
REPOS=$(cat <<EOF
https://github.com/tmux-plugins/tpm:.config/tmux/plugins/tpm/
https://github.com/alacritty/alacritty-theme:.config/alacritty/themes/
EOF
)

link_file() {
  type="$1"
  src="$2"
  dst="$3"

  # if `src` starts with "/", set relative to $HERE/home
  if [ "${src#/}" = "$src" ]; then
    src="$HERE/home/$src"
  fi

  # echo $type , $src , $dst
  # return

  # echo disabled
  # return

  # verify if it can be linked
  if [ ! -L "$dst" ]; then
    echo "skipped: $dst; already exists"
    return
  elif [ ! -e "$src" ]; then
    echo "skipped: $dst; $src missing"
    return
  fi

  mkdir -p "$(dirname "$dst")"
  ln -sfr -T "$src" "$dst"
  echo "added: [$type] $src -> $dst"
}

backup_file() {
  type="$1"
  src="$2"
  dst="$3"

  # if `src` starts with "/", set relative to $HERE/home
  if [ "${src#/}" = "$src" ]; then
    src="$HERE/home/$src"
  fi

  # if `dst` has not been a symbolic link and `src` isn't existed, move it
  # from `dst` to `src`
  if [ ! -L "$dst" ] && [ ! -e "$src" ]; then
    mkdir -p "$(dirname "$src")"
    cp -r -T "$dst" "$src"
    echo "added: $dst -> $src"
  else
    echo "skipped: $dst"
  fi
}

clone_repo() {
  type="$1"
  src="$2"
  dst="$3"

  if [ -d "$dst" ]; then
    echo "skipped: $dst"
    return
  fi

  mkdir -p "$(dirname "$dst")"
  git clone "$src" "$dst" >/dev/null 2>&1
  echo "added: $src -> $dst"
}

iter() {
  fn="$2"

  printf "%s\n" "$1" | while IFS= read -r line; do
    # skip the line
    if
      # starts with "#"
      [ "${line#\#}" != "$line" ] ||
      # is empty
      [ -z "$line" ]
    then continue; fi

    src="${line%:*}"
    dst="${line##*:}"

    # if `dst` ends with "/", set type to "d"
    type="f"
    if [ "${dst%/}" != "$dst" ]; then
      type="d"
    fi

    # if `dst` starts with "/", set relative to $HOME
    if [ "${dst#/}" = "$dst" ]; then
      dst="$HOME/$dst"
    fi

    $fn "$type" "$src" "$dst"
  done
}

backup() {
  iter "$LINKS" backup_file
}

install() {
  printf "\nfile\n"
  iter "$LINKS" link_file
  printf "\nrepo\n"
  iter "$REPOS" clone_repo
}

"$@"
