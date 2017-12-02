function tmux_smart_attach
  if [ -z "$TMUX" ] # ログインシェルかどうかはとりあえず見ない
    set -l sessions (tmux list-sessions)
    if [ -z "$sessions" ]  # セッションがなければ新しく作る
      tmux new-session
      return
    end

    set -l new_session 'Create New Session'
    set -l list $sessions "$new_session":
    set -l choice (echo -s {$list}\n | peco | cut -d: -f1)
    
    if [ "$choice" = "$new_session" ]
      tmux new-session
    else if [ -n "$choice" ]
      tmux attach-session -t "$choice"
    end
    # 何も選択されなかった場合は普通に端末を表示する
  end
end

