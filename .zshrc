# 文字コードの設定
export LANG=ja_JP.UTF-8

# prompt

autoload colors
colors
autoload -Uz zmv

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
export PATH="$HOME/my-exe/:$PATH"


# 関数
find-grep () { find . -type f -print | xargs grep -n --binary-files=without-match $@ }

# alias
alias ls='ls -G --color -a'
alias ll='ls -ltr'
alias exa='exa -a'
#alias vi='vim'
#alias gd='dirs -v; echo -n "select number: "; read newdir; cd +"$newdir"'
alias c='clear'
alias sl='sl -e'

# alias(ruby)
alias be='bundle exec'
alias ber='bundle exec rake'
alias bi='bundle instal'
alias bu='bundle update'

# git
alias gs="git status"
alias gd="git diff"
alias gdn="git diff --name-only"
alias br="git branch --sort=committerdate"
alias ga="git add ."
alias gc="git commit -a "
alias ch="git checkout"
alias gpl="git pull"
alias gps="git push"
alias gfixup="git commit --amend --no-edit"

alias gl='git log --graph --decorate --pretty=format:"%ad [%cn] <c:%h t:%t p:%p> %n %Cgree
n%d%Creset %s %n" --stat -p'
alias gls='git log --stat --summary'
alias glf='git log --follow --graph --decorate --pretty=format:"%ad [%cn] <c:%h t:%t p:%p> %n %Cgree
n%d%Creset %s %n" --stat -p'


alias dos2unix='fromdos'
alias unix2dos='todos'

# for work
alias drun='docker-compose run --rm app'

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
# # ディレクトリ名だけで､ディレクトリの移動をする｡
setopt auto_cd
#
# # C-s, C-qを無効にする。
setopt no_flow_control

# PostgreSQL
#export PGDATA=/usr/local/var/postgres

# gvim setting
gvim(){ /usr/bin/gvim -f "$@" & true; }

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# display
#xgamma -bgamma 0.87

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

_change_go_version() {
  if [ -f "go.mod" ]; then
    local version=(`grep -Po "^go \K([0-9\.]*)$" go.mod`)
    gvm use ${version}
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
  # _change_go_version
  ls
}

export JSTESTDRIVER_HOME=~/tool/program/javascript/jstestdriver

alias historyall='history -E 1'
limit coredumpsize unlimited

# R
export R_LIBS=~/Rlib

# gvm
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
if [ ! -f "go.mod" ]; then
  gvm use 1.23
fi
_change_go_version
go env -w GOBIN="$HOME/gobin"
export PATH="$HOME/gobin:$PATH"

# elasticsearch
export PATH="/usr/share/elasticsearch/bin/":$PATH
export TEST_CLUSTER_COMMAND="/usr/share/elasticsearch/bin/elasticsearch"

# go
# export GOROOT=/home/yaginuma/tool/program/go/
# export PATH=$GOROOT/bin:$PATH
# export GOPATH=/home/yaginuma/program/go/go_home
# export PATH=$GOPATH/bin:$PATH
export PATH=$PATH:/home/yaginuma/tool/program/go/go_appengine

# embulk
export PATH=$HOME/.embulk/bin:$PATH

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

function multi-agvim () {
  vim $(multi-ag $@ | peco --query "$LBUFFER" | awk -F : '{print "-c " $2 " " $1}')
}
alias mav='multi-agvim'

function gomilkvim () {
  vim $(gomilk -a $@ | peco --query "$LBUFFER" | awk -F : '{print "-c " $2 " " $1}')
}

function rails_commitlog() {
  cd /home/y-yagi/src/github.com/rails/rails && git log | peco
}

function rails_source() {
  vim $(find /home/yaginuma/program/rails/master_test/rails -type f | peco )
}

function lvim() {
  arrs=(`echo $1 | tr ":" "\n"`)
  vim -c ${arrs[2]} ${arrs[1]}
}

function g() {
  local next=(`goto $1`)
  if [ -n "$next" ]; then
    cd ${next}
  fi
}

function rewrite() {
  `git grep -l $1 | xargs sed -i '' -e "s/$1/$2/g"`
}


. /etc/profile.d/vte-2.91.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="/home/yaginuma/tool/browser:$PATH"

### for pip
export PATH="/home/yaginuma/.local/bin:$PATH"

[ -f .work ] && source .work

alias py=python3

export ENCORE_INSTALL="/home/y-yagi/.encore"
export PATH="$ENCORE_INSTALL/bin:$PATH"
export PATH="/home/y-yagi/.deno/bin/:$PATH"

once gtodo notify
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="$HOME/.nodenv/bin:$PATH"

export WASMTIME_HOME="$HOME/.wasmtime"

export PATH="$WASMTIME_HOME/bin:$PATH"
