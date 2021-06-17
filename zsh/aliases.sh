alias g='gs'
alias gl='git log'
alias gd='git diff '
alias ga='git add'
alias pu='git push origin'
alias pun='git push --no-verify origin'
alias pl='git pull origin'
alias st='git status'
alias ch='git checkout'
alias cm='git checkout master'
alias s='git stash'
alias sa='git stash apply'
alias gcp='git cherry-pick '
alias fp='git push --force origin'
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
alias tf='/opt/terraform'
alias d='docker '
alias dc='docker-compose '
alias dcd='docker-compose down'
alias dcu='docker-compose up'
alias ddc='docker rm $(docker ps -a -q)' # Delete all containers
alias ddi='docker rmi $(docker images -q)' # Delete all images
alias dds='docker stop $(docker ps -aq)' # Stop all containers
alias f='fg'
alias slsk='nohup /usr/bin/slsk &>/dev/null &'
alias dl="nohup dolphin .  &>/dev/null &"
alias lock='xscreensaver-command -lock  &>/dev/null'
alias down='sudo shutdown -h now'
alias cw='cd ~/work/src/gitlab.com/'
alias av='cw && cd pentoapp/pento && nvim .'
alias aa='cw && cd pentoapp/pento'
alias fm='gofmt -s -w'
alias nn='cd /data/sync/Dropbox/notes && nvim .'
alias le='npm run lint-eslint $(git diff --name-only | grep '.js' | xargs)'
alias lp='npm run lint-prettier $(git diff --name-only | grep '.js' | xargs)'
alias lf='npm run lint-flow $(git diff --name-only | grep '.js' | xargs)'
alias gg='go generate'
alias gmv='go mod vendor'
alias dark='xrdb -merge ~/work/src/github.com/fgrimme/dotfiles/.grayscale.dark.Xresources && exit -f'
alias dcp='docker-compose --profile seed-db-with-uk-production up'
alias ns='aa && cd client && yarn start'
alias dcb='docker-compose run web bash'
alias gg='git log --graph --all --decorate --oneline'
alias tt='tmux attach -t base || tmux new -s base'
alias ww='cd ~/work/src/github.com/fgrimme'
alias vt='nvim /tmp/t'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cr='cp -R'
# alias for long running commands.  Use like so:
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

v() {
  nvim ${1:-.}
}
r() {
  ranger ${1:-.}
}
