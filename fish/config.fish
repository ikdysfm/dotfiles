# fish_user_pathsも使えるが、プロビジョニングで扱いづらいので環境変数はここに定義
# -gを付けなくても位置的にグローバルだが明示的に
set -gx GOPATH $HOME/.go
set -gx PATH $PATH $GOPATH/bin

# plugin-balias を使った定義。これで定義すると補完もやってくれる
balias g git