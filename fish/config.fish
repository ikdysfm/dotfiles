# fish_user_pathsも使えるが、プロビジョニングで扱いづらいので環境変数はここに定義
# tmuxやサブシェル起動時にも読み込まれるためその都度PATHが長くならないようにフラグ制御
if [ -z $LOADED ]
  set -x GOPATH $HOME/.go
  set -x PATH $PATH $GOPATH/bin
  set -x EDITOR /usr/bin/vi
end

# キーバインド定義
function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
  bind \c] peco_select_ghq_repository
end

# nvmの読み込み。nvmインストール時に.profileにも書かれるがここでも一応やる
# fish用がないのでbassを通している
# --no-useを付けていないのでデフォルトverがPATHにセットされる
bass source ~/.nvm/nvm.sh

# plugin-balias を使った定義。これで定義すると補完もやってくれる
balias g git
balias tmux "direnv exec / tmux" # tmux起動前にdirenvを一旦unload

# direnv
eval (direnv hook fish)

# 最初の一回だけ実行。サブシェル起動時も除外されるようにexportする
if [ -z $LOADED ]
  set -x LOADED y
  tmux_smart_attach
end
