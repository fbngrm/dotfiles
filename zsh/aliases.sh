# diff
alias kkd="kitty +kitten diff"
alias kkg="git difftool --no-symlinks --dir-diff"
alias confl='nvim $(git diff --name-only --diff-filter=U)'

# pacman
alias pi='sudo pacman -S'

# terraform
alias tf='/usr/bin/terraform'

alias g='gs'
alias gl='git log'
alias gd='git diff '
alias ga='git add'
alias pu='git push origin'
alias pus='git push --no-verify origin'
alias pul='git pull origin'
alias gst='git status'
alias ch='git checkout'
alias s='git stash'
alias sa='git stash apply'
alias gcp='git cherry-pick '
alias fp='git push --force origin'
alias gmm='git fetch origin master:master; git merge master'
alias grm='git fetch origin master:master; git rebase master'
alias gbc='git branch --show-current '
alias k='kubectl'
alias ked='kubectl edit deployment'
alias kes='kubectl edit service'
alias kw='kubectl get pods --watch'
alias kd='kubectl describe'
alias ktx='kubectl config get-contexts'
alias tmux='tmux -2'
alias ta='tmux attach -t '
alias tn='tmux new -s '
alias tk='tmux kill-session -t '
alias tl='tmux ls'
alias cg='cd $GOPATH'
alias lint='golangci-lint run --deadline=3m --enable=maligned --enable=gocyclo --enable=golint --enable=dupl --enable=interfacer --enable=unconvert --enable=gosec'
alias t='go test ./...'
alias b='go build cmd/main.go'
alias gs='gsutil '
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias md='mkdir -p'
alias rd=rmdir
alias d='dirs -v'
alias db='nohup /usr/share/dbeaver/dbeaver &>/dev/null &'
alias d='docker '
alias dc='docker-compose '
alias dcd='docker-compose down'
alias dcdv='docker-compose down && docker volume rm pento_pgdata'
alias dcu='docker-compose up'
alias ddc='docker rm $(docker ps -a -q)' # Delete all containers
alias ddi='docker rmi $(docker images -q)' # Delete all images
alias dds='docker stop $(docker ps -aq)' # Stop all containers
alias f='fg'
alias slsk='nohup /usr/bin/slsk &>/dev/null &'
alias dl="nohup dolphin .  &>/dev/null &"
alias lock='xscreensaver &; xscreensaver-command -lock  &>/dev/null'
alias down='sudo shutdown -h now'
alias fm='gofmt -s -w'
alias le='npm run lint-eslint $(git diff --name-only | grep '.js' | xargs)'
alias lp='npm run lint-prettier $(git diff --name-only | grep '.js' | xargs)'
alias lf='npm run lint-flow $(git diff --name-only | grep '.js' | xargs)'
alias gg='go generate'
alias gmv='go mod vendor'
alias dct='docker-compose --profile tracing up'
alias dcp='docker-compose --profile seed-db-with-uk-production up'
alias dcb='docker-compose run web bash'
alias gg='git log --graph --all --decorate --oneline'
alias ww='cd ~/work/src/github.com/fbngrm'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cr='cp -R'
# alias for long running commands.  Use like so:
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias syncAliases='ln -vsf "${HOME}/work/src/github.com/fgrimme/dotfiles/zsh/aliases.sh" "${HOME}/.bash_aliases"'
alias dot='cd "${HOME}/work/src/github.com/fbngrm/dotfiles"'
alias bwu='nohup /usr/local/bin/Bitwarden-1.27.1-x86_64.AppImage &'
alias p='python'
alias nv='nordvpn'
alias nvd='nordvpn set killswitch off && nordvpn d'
alias nvc='nordvpn set killswitch on && nordvpn c belgium'
alias ncp='ncmpcpp'
alias yn="/usr/bin/yarnpkg"
alias vd="pulsemixer --change-volume=-10 --id=sink-48"
alias vu="pulsemixer --change-volume=+10 --id=sink-48"
alias x='cd ~/Dropbox/notes && nvim .'
alias xw='cd ~/Dropbox/notes && nvim ./writing/w/scratch.md'
alias ba='nvim ~/.bash_aliases'
alias sba='source ~/.bash_aliases'
alias xoff='xrandr --output DP3 --off'
alias xr='i3-msg move workspace to output right'
alias xl='i3-msg move workspace to output left'
alias v='nvim'
alias kdu='today=`date +%d.%m.%Y`;for file in ~/Dropbox/notes/kieser/up/*.txt; do echo $today";" >> "$file"; done'
alias kdl='today=`date +%d.%m.%Y`;for file in ~/Dropbox/notes/kieser/low/*.txt; do echo $today";" >> "$file"; done'
alias cdz='~/work/src/github.com/fbngrm/zh'
alias audio='pavucontrol'
alias ssc='sudo systemctl'
alias sc='systemctl'
alias xo='xdg-open'

alias cz='cd ~/go/src/github.com/zededa'
alias czz='cd ~/go/src/github.com/zededa/zedcloud'
alias czt='cd ~/go/src/github.com/zededa/terraform-provider-zedcloud'
alias z='./zmanage'
alias rmvol='docker volume rm local_cert-store local_esdata1 local_image-store local_influxdb-data local_kafka-data01 local_postgresql-data local_vault-data01 local_vault-secrets local_zk-data01 local_zk-txn-logs01 local_zredis01-data local_zsentinel01-data'
# v() {
#   nvim ${1:-.}
# }
r() {
  ranger ${1:-.}
}
# view a given git lo, side by side
ydl() {
  git log -p -"${1}" | ydiff -s -w0
}
# view a given git revision, side by side
ydr() {
  git diff "$1" | ydiff -s -w0
}
# view a given git commit, side by side
yds() {
  git show "$1" | ydiff  -s -w0
}
# view diff between two files (note the '-u')
ydf() {
  diff -u "$1" "$2" | ydiff  -s -w0
}
# view diff between two dirs
ydd() {
  diff -ur "$1" "$2"  | ydiff  -s -w0
}
