local filename="$0"
debug_filename
alias localnet="ip addr show | grep -E 'inet[^6]' | grep global | sed -E -e 's/\s+/ /g' -e 's/^\s*//' | cut -d ' ' -f 2"
alias e='exit'

# Aliases
# Aliases
alias hgrep='cat ~/.zsh_history | grep'
alias dir='find . -type d -maxdepth'
alias hgrep='cat ~/.zsh_history | grep'
alias s='sudo'
if [ "$(command -v atom-beta)" ]; then
    alias a='atom-beta'
elif [ "$(command -v atom)" ]; then
    alias a='atom'
fi
alias k='kate'
# git aliases
alias gitb='git branch'
alias gitsub='git submodule'
alias s='sudo'
alias a='atom-beta'
alias k='kate'
alias gita='git add'
alias gitc='git commit'
alias gitl='git log --abbrev-commit --decorate --stat'
alias gitco='git checkout'
alias gitm='git merge'
alias gitf='git fetch'
alias gits='git status'
alias gitd='git diff'
alias gitl='git log --abbrev-commit --decorate --stat'
alias gitco='git checkout'
alias gitm='git merge'
alias gitf='git fetch'
alias gits='git status'
alias gitd='git diff'
alias gitp='git push'
alias gitpl='git pull'
alias gitrt='git reset'
alias gitrb='git rebase'
alias gitrm='git remove'
alias gitre='git remote -v'
alias gitmv='git mv'
alias gitp='git push'
alias gitpl='git pull'
alias gitrt='git reset'
alias gitrb='git rebase'
alias gitrm='git remove'
alias gitre='git remote -v'
alias gitmv='git mv'
alias gitp-all="git remote -v | cut -f 1 | sort -u | xargs -I '{}' git push -v '{}'"
# pulseaudio aliases
alias pa-k='pulseaudio --kill'
alias pa-s='pulseaudio --start'
alias vim-e='vim ~/.vimrc'
# zsh aliases
alias zsh-s='source ~/.zshrc.local'
alias zsh-e='vim ~/.zshrc.local'
# ruby alias
alias be='bundle exec'
# misc aliases
# Perl Aliases
alias p6='perl6'
alias 6='rlwrap perl6'
alias 6-m='rlwrap perl6-m'
alias 6-j='rlwrap perl6-j'
alias nqp='rlwrap nqp'
alias nqp-j='rlwrap nqp-j'
alias nqp-jvm='rlwrap nqp-jvm'
alias prove6='prove -e perl6'
alias make="/usr/bin/make -j $TEST_JOBS"
alias p='perl'
alias perl5='perl'
alias sctl='systemctl'
alias e='exit'
alias compose-edit='sudo vim /usr/share/X11/locale/en_US.UTF-8/Compose'
alias pg='pgrep'
alias pga='pgrep -a'
alias wcc="pee 'wc -l' 'cat'"
alias compose-edit='sudo vim /usr/share/X11/locale/en_US.UTF-8/Compose'
alias pg='pgrep'
alias pga='pgrep -a'
alias wcc="pee 'wc -l' 'cat'"
alias gitmlog='git log $(git merge-base --octopus $(git log --merges --pretty=format:%P)).. --boundary --graph --pretty=oneline --abbrev-commit'
alias isodate='date -u +"%Y-%m-%dT%H:%M:%SZ"'
alias ram='sudo dmidecode'
if [ "$(which chromium-dev )" ]; then
	alias c='chromium-dev'
elif [ "$(which chromium)" ]; then
	alias c='chromium'
fi

# Reload udev rules /* this may or may not actually work */
alias udev-r='sudo udevadm trigger'
command cmd-in-path () {
    command -v $1 > /dev/null 2>&1
}
alias gitmlog='git log $(git merge-base --octopus $(git log --merges --pretty=format:%P)).. --boundary --graph --pretty=oneline --abbrev-commit'
alias isodate='date -u +"%Y-%m-%dT%H:%M:%SZ"'
alias ram='sudo dmidecode'
if command -v chromium-dev >/dev/null 2>&1; then
	alias c='chromium-dev'
elif [ "$(which chromium)" ]; then
	alias c='chromium'
fi
