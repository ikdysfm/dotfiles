# fish_user_pathsも使えるが、プロビジョニングで扱いづらいので環境変数はここに定義
# tmuxやサブシェル起動時にも読み込まれるためその都度PATHが長くならないようにフラグ制御
if [ -z $LOADED ]
  set -x GOPATH $HOME/.go
  set -x PATH $PATH $GOPATH/bin
  set -x PATH $PATH $HOME/.local/bin
  set -x EDITOR /usr/bin/vi
  set -x PIPENV_VENV_IN_PROJECT true
end

# キーバインド定義
function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
  bind \c] peco_select_ghq_repository
end

# plugin-balias を使った定義。これで定義すると補完もやってくれる
balias g git
balias open xdg-open
balias tmux "direnv exec / tmux" # tmux起動前にdirenvを一旦unload

# env系
eval (direnv hook fish)
eval (pipenv --completion)

# 最初の一回だけ実行。サブシェル起動時も除外されるようにexportする
if [ -z $LOADED ]
  set -x LOADED y
  tmux_smart_attach
end
