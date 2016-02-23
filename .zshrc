# Path to your oh-my-zsh installation.
export ZSH=/Users/Gu3nol/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="avit"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git macports osx sudo web-search colored-man-pages cp extract)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/usr/local/MacGPG2/bin:/Library/TeX/texbin"
# export MANPATH="/usr/local/man:$MANPATH"

# PYTHONPATH
export PYTHONPATH=~/.site-packages:$PYTHONPATH

# OpenOCD
export PATH=$PATH:/opt/openocd/bin

# Tools ARM
export PATH=/opt/tools_arm/bin:$PATH

# MacPorts Installer addition on 2013-01-31_at_14:38:47: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias mv='nocorrect mv'       # no spelling correction on mv
alias cp='nocorrect cp'       # no spelling correction on cp
alias mkdir='nocorrect mkdir' # no spelling correction on mkdir
alias j=jobs
alias h=history
alias grep=egrep
alias ls='ls -G'
alias ll='ls -lh'
alias la='ls -ah'
alias lla='ls -lah'
alias lsa='ls -ldh .*'
alias pico='nano -mw'
alias nano='nano -mw'
alias ssh='ssh -X'
alias more='less'
alias sl='ls -G'
alias cd..='cd ..'
alias e='open -a emacs'
alias make='make -j'
alias top='htop'
alias blublu='yes "$(seq 231 -1 16)" | while read i; do printf "\x1b[48;5;${i}m\n"; sleep .02; done'
alias update_port='sudo port selfupdate && sudo port upgrade outdated && sudo port clean --all installed && sudo port -f uninstall inactive'
eval "$(thefuck-alias)"
alias zshconfig="less ~/.zshrc"
alias ohmyzsh="less ~/.oh-my-zsh"

# Options
setopt nobeep                      # keep quiet
setopt auto_cd                     # type directly a dir name to cd into it
setopt auto_pushd pushd_minus      # don't use cd, use pushd
setopt pushd_silent pushd_to_home
setopt pushd_ignore_dups
setopt chase_links                 # converts links to real path
setopt noclobber                   # don't allow > to clobber files
setopt complete_aliases
setopt extended_glob
setopt hist_ignore_all_dups
setopt hist_ignore_space
unsetopt share_history
setopt no_flow_control
setopt list_types
setopt mark_dirs
setopt path_dirs
setopt auto_remove_slash
setopt prompt_percent
setopt prompt_subst
setopt rm_star_wait                # rm * waits 10 seconds
setopt multios                     # allow multiple redirection echo 'a'>b>c
setopt bang_hist                   # allow ! for accessing history
setopt nohup                       # don't hup running jobs on logout.

# on slow disk access, show moving dots
expand-or-complete-with-dots() {
  echo -n "\e[31m......\e[0m"
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

# Just look for hosts and users in the following lists
users=(lallement gu3nol guenole)
hosts=(localhost a406-01.enst.fr ssh.enst.fr ib-pegasus.ib.ic.ac.uk ib-zeus.ib.ic.ac.uk)
zstyle ':completion:*' users $users
zstyle ':completion:*:hosts' hosts $hosts


unsetopt LIST_AMBIGUOUS
setopt  COMPLETE_IN_WORD

# Just look for hosts and users in the following lists
users=(lallement gu3nol guenole)
hosts=(localhost a406-01.enst.fr ssh.enst.fr ib-pegasus.ib.ic.ac.uk ib-zeus.ib.ic.ac.uk)
zstyle ':completion:*' users $users
zstyle ':completion:*:hosts' hosts $hosts
