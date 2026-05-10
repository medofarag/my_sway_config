mkcd() {
  mkdir -p $1
  cd $1
}

cdls() {
  cd $1
  eza -lh --group-directories-first --git
}

update() {
  ble-update
  yay -Syu
}

# runit
sv-ls() {
  echo "===available services==="
  ls -laF /etc/runit/sv/
}

sv-add() {
  sudo ln -s /etc/runit/sv/$1 /run/runit/service/
}

sv-add-default() {
  sudo ln -s /etc/runit/sv/$1 /etc/runit/runsvdir/default/
}

sv-show() {
  ls -laF /run/runit/service/
}

sv-show-default() {
  ls -laF /etc/runit/runsvdir/default/
}

sv-rm() {
  sudo rm -rf /var/service/$1
  sudo rm -rf /etc/runit/runsvdir/default/$1
}
