function cramshell
  # 接続するたびに変わる可能性があるのでその時の値を取得
  set number (cat /proc/bus/input/devices | grep -A 4 'HHKB Pro' | grep -o 'event[0-9]\+')

  if test -n "$number"
    sudo -b xkeysnail /home/yoshifumi/src/github.com/ikdysfm/dotfiles/xkeysnail/hhkb_types.py --devices /dev/input/"$number" > /dev/null
  end
end
