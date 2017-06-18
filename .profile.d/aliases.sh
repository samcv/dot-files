local filename="$0"
debug_filename
alias localnet="ip addr show | grep -E 'inet[^6]' | grep global | sed -E -e 's/\s+/ /g' -e 's/^\s*//' | cut -d ' ' -f 2"
alias printerscan='nmap -p 9100,515,631 $(localnet) -oX printers.xml'
alias e='exit'
# Aliases
alias hgrep='cat ~/.zsh_history | grep'
alias dir='find . -type d -maxdepth'
alias s='sudo -E'
if cmd-in-path atom-beta ; then
    alias a='atom-beta'
elif cmd-in-path atom ; then
    alias a='atom'
fi
alias t='task'
# tyil's
alias l-tyil='ls -Fhl --color=auto'
alias k='kate'
# text processing
alias dedupe='awk '\''!seen[$0]++'\'' '
alias clip='xclip -selection clipboard'
# strips ANSI Terminal Color
alias stripcolor='sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g" '
# grep
alias g='grep'
# git aliases
alias gitb='git b'
alias gitsub='git submodule'
alias gita='git add'
alias gitc='git commit'
alias gitl='git log --abbrev-commit --decorate --stat'
alias gitco='git checkout'
alias gitm='git merge'
alias gitf='git fetch'
#~/bin/gitstatus-reverse.p6
#alias gits='git status'
alias gitd='git diff'
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
alias zsh-s='source ~/.zshenv'
alias zsh-e='cd ~/.profile.d && atom . ~/.zshrc ~/.zshrc.local ~/.zpreztorc ~/.profile'
# ruby alias
if cmd-in-path bundle; then alias be='bundle exec' ; fi
# misc aliases
# Perl Aliases
if cmd-in-path perl6 ; then
    alias p6='perl6'
    alias fm='cd ~/git/MoarVM'
    alias fr='cd ~/git/rakudo'
    alias fn='cd ~/git/nqp'
    if cmd-in-path rlwrap ; then
        local rl_txt='rlwrap '
    else
        local rl_txt=''
    fi
    alias 6="${rl_txt}perl6"
    alias 6-m="${rl_txt}perl6-m"
    alias 6-j='rlwrap perl6-j'
    alias nqp='rlwrap nqp'
    alias nqp-j="${rl_txt}nqp-j"
    alias nqp-m="${rl_txt}nqp-m"
    alias prove6='prove -e perl6'
    local gitstatus_reverse="$HOME/bin/gitstatus-reverse.p6"
    if cmd-in-path "$gitstatus_reverse" ; then
        alias gits="git status | $gitstatus_reverse"
    else
        if cmd-in-path perl6 ; then
            alias gits='git status | perl6 -e '\''my $out = $*IN.slurp(:close); $out ~~ s/$<untracked>=("Untracked files:".*)//; print $<untracked> ~ $out'
        else
            alias gits='git status'
        fi
    fi
else
    alias gits="git status"
fi
alias make="/usr/bin/make -j $TEST_JOBS"
alias p='perl'
alias perl5='perl'
alias sctl='systemctl'
alias compose-edit='sudo vim /usr/share/X11/locale/en_US.UTF-8/Compose'
alias pg='pgrep'
alias pga='pgrep -a'
alias wcc="pee 'wc -l' 'cat'"
alias gitmlog='git log $(git merge-base --octopus $(git log --merges --pretty=format:%P)).. --boundary --graph --pretty=oneline --abbrev-commit'
alias isodate='date -u +"%Y-%m-%dT%H:%M:%SZ"'
alias ram='sudo dmidecode'
if cmd-in-path chromium-dev ; then
	alias c='chromium-dev'
elif cmd-in-path chromium ; then
	alias c='chromium'
fi
# Reload udev rules /* this may or may not actually work */
alias udev-r='sudo udevadm trigger'
alias p="pgrep -ai"
