# 文字コードの設定
export LANG=ja_JP.UTF-8

# prompt

autoload colors
colors

#PROMPT="%{${fg[green]}%}[%n@%m] %(!.#.$) %{${reset_color}%}"
#PROMPT_LINE_1="%{${fg[green]}%}[%n@%m]  [ %D %T ] %{${reset_color}%}"
PROMPT_LINE_1="%{${fg[green]}%}[%n@%m] %{${reset_color}%}"
PROMPT_LINE_2="%{${fg[magenta]}%}%(!.#.$) %{${reset_color}%}"
PROMPT="${PROMPT_LINE_1}
${PROMPT_LINE_2}"


PROMPT2="%{${fg[green]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
#RPROMPT="%{$fg_bold[white]%}[%{$reset_color%}%{$fg[cyan]%}%~%{$reset_color%}%{$fg_bold[white]%}]%{$reset_color%}"


# パスの設定
PATH=/usr/local/bin:/usr/bin:$PATH
export MANPATH=/usr/local/share/man:/usr/local/man:/usr/share/man
export PHANTOMJS_EXECUTABLE=$HOME/./node_modules/casperjs/node_modules/.bin/phantomjs


# 関数
find-grep () { find . -type f -print | xargs grep -n --binary-files=without-match $@ }

# alias
alias ls='ls -G --color -a'
alias ll='ls -ltr'
#alias vi='vim'
#alias gd='dirs -v; echo -n "select number: "; read newdir; cd +"$newdir"'
alias c='clear'

# alias(ruby)
alias be='bundle exec'
alias ber='bundle exec rake'
alias bi='bundle instal'
alias bu='bundle update'

# git
alias gs="git status"
alias gd="git diff"
alias br="git branch"
alias ga="git add ."
alias gh="git help"
alias gc="git commit -a "
alias ch="git checkout"

alias gl='git log --graph --decorate --pretty=format:"%ad [%cn] <c:%h t:%t p:%p> %n %Cgree
n%d%Creset %s %n" --stat -p'
alias gls='git log --stat --summary'

alias dos2unix='fromdos'
alias unix2dos='todos'

#
# # プロンプトの設定
#
# # ヒストリの設定
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
#
# # 履歴ファイルに時刻を記録
setopt extended_history
#
# # 補完するかの質問は画面を超える時にのみに行う｡
LISTMAX=0
# autoload -Uz compinit; compinit #
# # sudo でも補完の対象
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
#
# # cdのタイミングで自動的にpushd
setopt auto_pushd
#
# # 複数の zsh を同時に使う時など history ファイルに上書きせず追加
setopt append_history
#
# # 補完候補が複数ある時に、一覧表示
setopt auto_list
#
# # 保管結果をできるだけ詰める
setopt list_packed
#
# # 補完キー（Tab, Ctrl+I) を連打するだけで順に補完候補を自動で補完
setopt auto_menu
#
# # カッコの対応などを自動的に補完
setopt auto_param_keys
#
# # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash
#
# # ビープ音を鳴らさないようにする
setopt no_beep
#
# # 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_dups
#
# # ヒストリにhistoryコマンドを記録しない
setopt hist_no_store
#
# # 余分なスペースを削除してヒストリに記録する
setopt hist_reduce_blanks
#
# # 行頭がスペースで始まるコマンドラインはヒストリに記録しない
#setopt hist_ignore_spece
#
# # 重複したヒストリは追加しない
setopt hist_ignore_all_dups
#
# # ヒストリを呼び出してから実行する間に一旦編集できる状態になる
setopt hist_verify
#
# # auto_list の補完候補一覧で、ls -F のようにファイルの種別をマーク表示しない
setopt no_list_types
#
# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst
#
# # ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt mark_dirs
#
# 8 ビット目を通すようになり、日本語のファイル名を表示可能
setopt print_eight_bit
#
# シェルのプロセスごとに履歴を共有
setopt share_history
#
# # Ctrl+wで､直前の/までを削除する｡
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
#
# # ディレクトリを水色にする｡
export LS_COLORS='di=01;36'
#
# # ファイルリスト補完でもlsと同様に色をつける｡
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
#
# # cd をしたときにlsを実行する
function chpwd() { ls }
#
# # ディレクトリ名だけで､ディレクトリの移動をする｡
setopt auto_cd
#
# # C-s, C-qを無効にする。
setopt no_flow_control

# PostgreSQL
#export PGDATA=/usr/local/var/postgres

# gvim setting
gvim(){ /usr/bin/gvim -f "$@" & true; }

# rvm
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
#rvm use 2.0.0-p195

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"


# display
xgamma -bgamma 0.87


_set_env_git_current_branch() {
  GIT_CURRENT_BRANCH=$( git branch &> /dev/null | grep '^\*' | cut -b 3- )
}

_update_rprompt () {
  if [ "`git ls-files 2>/dev/null`" ]; then
    RPROMPT="%{$fg_bold[white]%}[%{$reset_color%}%{$fg[cyan]%}%~%{$reset_color%}%{$fg[red]%}:$GIT_CURRENT_BRANCH%{$reset_color%}]%{$fg_bold[white]%}%{$reset_color%}"
  else
    RPROMPT="%{$fg_bold[white]%}[%{$reset_color%}%{$fg[cyan]%}%~%{$reset_color%}%{$fg_bold[white]%}]%{$reset_color%}"
  fi
}

precmd()
{
  _set_env_git_current_branch
  _update_rprompt
}

chpwd()
{
  _set_env_git_current_branch
  _update_rprompt
}

export JSTESTDRIVER_HOME=~/tool/program/javascript/jstestdriver

alias historyall='history -E 1'
limit coredumpsize unlimited

# R
export R_LIBS=~/Rlib

# Android
export ANDROID_HOME=/home/yaginuma/tool/program/android-sdk
export PATH="/home/yaginuma/tool/program/android-sdk/tools/templates/gradle/wrapper:/home/yaginuma/tool/program/android-studio/sdk/platform-tools:$PATH"


# BEGIN Ruboto setup
source ~/.rubotorc
# END Ruboto setup


# nvm
[ -s "/home/yaginuma/.nvm/nvm.sh" ] && . "/home/yaginuma/.nvm/nvm.sh" # This loads nvm
nvm use 0.10
export PATH="/home/yaginuma/node_modules/.bin:$PATH"


# go
export GOPATH=/home/yaginuma/program/go/go_home
export PATH="$GOPATH/bin:$PATH"
export GOSRC=/home/yaginuma/tool/program/go

# peco
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history


function peco-cdr () {
    local selected_dir=$(cdr -l | awk '{ print $2 }' | peco)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-cdr
bindkey '^@' peco-cdr


function agvim () {
  vim $(ag $@ | peco --query "$LBUFFER" | awk -F : '{print "-c " $2 " " $1}')
}

function gomilkvim () {
  vim $(gomilk -a $@ | peco --query "$LBUFFER" | awk -F : '{print "-c " $2 " " $1}')
}

function find_rails_commitlog() {
  cd /home/yaginuma/program/rails/rails/ && git log | peco
}

function find_rails() {
  vim $(find /home/yaginuma/program/rails/rails -type f | peco )
}

# added by travis gem
[ -f /home/yaginuma/.travis/travis.sh ] && source /home/yaginuma/.travis/travis.sh
