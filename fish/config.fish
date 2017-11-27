# fish_user_pathsも使えるが、プロビジョニングで扱いづらいので環境変数はここに定義
# -gを付けなくても位置的にグローバルだが明示的に
set -gx GOPATH $HOME/.go
set -gx PATH $PATH $GOPATH/bin
set -gx EDITOR /usr/bin/vi

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

