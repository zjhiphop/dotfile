# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# function for add current path to ~/.zshrc
alias sourcepwd='echo "PATH=\"\$PATH:$(pwd)/\"" >> ~/.zshrc && source ~/.zshrc'

# export ctags
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# export charset setting
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias cls=clear
alias iftop='sudo /usr/local/Cellar/iftop/1.0pre4/sbin/iftop'
alias ws='cd ~/Documents/project/workspace/'
alias asg='cd ~/Documents/project/asg-website'
alias kawo='cd ~/Documents/project/workspace/kawo' 
alias gllue='cd ~/Documents/project/workspace/gllue'
alias runga='nohup python /Users/jade/百度云同步盘/goagent-goagent-1281719/local/proxy.py 2>&1 &'
#alias git=hub
alias iphone='ios-sim start --family iphone'
alias ipad='ios-sim start --family ipad'
alias runserver='cd $PWD; grunt server > /dev/null 2>&1 &'
alias cnpm="npm --registry=http://r.cnpmjs.org \
--cache=$HOME/.npm/.cache/cnpm \
--disturl=http://dist.u.qiniudn.com \
--userconfig=$HOME/.cnpmrc"
alias rake="noglob rake"
alias ttx=/Library/Frameworks/Python.framework/Versions/2.7/bin/ttx
alias autosave='node /Users/jade/npm/lib/node_modules/autosave/index.js'
alias proxy='export http_proxy=127.0.0.1:8087; export https_proxy=127.0.0.1:8087'
alias proxy1='export http_proxy=127.0.0.1:7001; export https_proxy=127.0.0.1:7001'
alias solr='cd /opt/web/java/solr; nohup java -jar start.jar 2>&1 &; cd -' 
alias vpnlocal='cd ~; nohup sslocal 2>&1 &'
alias runredis='cd ~; nohup redis-server 2>&1 &'
alias runssh='ssh -Nf -D 7001 -p23 root@106.186.126.248'
alias runssh1='ssh -Nf -D 7001 -p22 root@104.131.153.122'
alias flyssh='ssh -Nf -g -D 7002 zjhiphop@s04.flyssh.net'
alias appssh='ssh root@121.41.41.41 -p9998'
alias workdir='gllue;gllueweb;'
alias gpp='git pull gllue; git push gllue'
alias sshspeed='python ~/flyspeed.py ssh;'
alias plg='git pull gllue $(git rev-parse --abbrev-ref HEAD)'
alias psg='git push gllue $(git rev-parse --abbrev-ref HEAD)'

# To use Sublime Text 2 as the editor for many commands that prompt for input
export EDITOR='subl -w'

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# export GOOGLE_ISS for google big query testting
export GOOGLE_ISS='991604151059-6iamqc78hco0d9mv1jpj605e2k55a5cs@developer.gserviceaccount.com'

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh
# source ~/Documents/project/learn-gitflow/git-flow-completion/git-flow-completion.zsh

# Customize to your needs...
export PATH=/Users/jade/.rvm/gems/ruby-1.9.3-p327/bin:/Users/jade/.rvm/gems/ruby-1.9.3-p327@global/bin:/Users/jade/.rvm/rubies/ruby-1.9.3-p327/bin:/Users/jade/.rvm/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/local/bin:/Applications/Racket\ v5.3.5:/Applications/Racket\ v5.3.5/bin:$HOME/Documents/project/vert.x-1.3.1.final/bin/:/Users/jade/Downloads/mongodb-osx-x86_64-2.4.8/bin:/Users/jade/npm/bin/:~/.npm/:/usr/local/mysql/bin:/usr/local/go/bin:~/go/bin:$(brew --prefix coreutils)/libexec/gnubin

# Search path for the cd command
cdpath=(.. ~ ~/Documents ~/Documents/project ~/.zsh)


# safer curl | sh'ing
function curlsh {
    file=$(mktemp -t curlsh) || { echo "Failed creating file"; return; }
    curl -s "$1" > $file || { echo "Failed to curl file"; return; }
    $EDITOR $file || { echo "Editor quit with error code"; return; }
    sh $file;
    rm $file;
}

###-begin-bem-completion-###
#
# bem command completion script
#
# Installation: bem completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: bem completion > /usr/local/etc/bash_completion.d/bem
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if complete &>/dev/null; then
  _bem_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           bem completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F _bem_completion bem
elif compctl &>/dev/null; then
  _bem_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       bem completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _bem_completion bem
fi
###-end-bem-completion-###

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$PATH:/Users/jade/Documents/project/facebook-tech/flow/"
