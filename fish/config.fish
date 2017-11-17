# 2.3未満なら必要な記述
for file in ~/.config/fish/conf.d/*.fish
  source $file
end

# fish_user_pathsも使えるが、プロビジョニングで扱いづらいので環境変数はここに定義
# -gを付けなくても位置的にグローバルだが明示的に
set -gx GOPATH $HOME/.go
set -gx PATH $PATH $GOPATH/bin
