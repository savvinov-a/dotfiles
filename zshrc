# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh
  export PATH=$HOME/Downloads/GoLand-2018.3.3/bin:$PATH
  export PATH=$HOME/Downloads/RubyMine-2018.3.3/bin/:$PATH
  export GOPATH=$HOME/projects/go/gopath
  export PATH=$PATH:$GOPATH/bin
  export PATH=$PATH:/home/savvinovan/.gem/ruby/2.6.0/bin
  export PATH=$HOME/.cargo/bin:$PATH
  export NNN_PLUG='f:finder;o:fzopen;p:mocplay;d:diffs;t:nmount;v:imgview'
  export GIT_TERMINAL_PROMPT=1
  export TRUCK_API_HOST=http://localhost:8091
  export TRUCK_API_ACCESS_KEY=8QmuN6s9ab43zGxbkU
  export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters
alias hm="hostname"
alias sk="cat ~/.ssh/id_rsa.pub"
alias lc='colorls -lA --sd'
alias vim='nvim'
# Open modified files
# ACMR = Added || Copied || Modified || Renamed
alias v="vim"
alias vd="vim \$(git diff HEAD --name-only --diff-filter=ACMR)"
alias vds="vim \$(git diff --staged --name-only --diff-filter=ACMR)"
alias vdc="vim \$(git diff HEAD^ --name-only --diff-filter=ACMR)"
alias bol="cd /Users/aleksandr/Projects/go/boltalka-backend"
alias boldoc="cd /Users/aleksandr/Projects/go/boltalka-docs"
alias gitl="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
alias gpg="gpg --keyserver keys.gnupg.net"
alias readlink=greadlink
# alias gotest="go test -v -cover -race ./..."
alias golint="golangci-lint run -E=revive -E=stylecheck -E=gosec -E=goconst -E=gocyclo -E=lll -E=nakedret -E=gocritic -E=gochecknoglobals -E=gomnd -E=unconvert -E=dupl ./..."
# preview files using fzf like in vim
alias pf="fzf --preview='less {}' --bind shift-up:preview-page-up,shift-down:preview-page-down"

# List files after cding
chpwd() {
  ls -lrthG
}

plugins=(
  git
  dotenv
  vi-mode
  docker
  docker-compose
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

### Fix slowness of pastes with zsh-syntax-highlighting.zsh
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
### Fix slowness of pastes

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
prompt_context () {}
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"

if [ -f ./zshalias ]; then
    source ./zshalias
fi

if [ -f /usr/bin/screenfetch ]; 
  then screenfetch; 
fi

if [ -f /usr/local/bin/screenfetch ];
  then screenfetch;
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

