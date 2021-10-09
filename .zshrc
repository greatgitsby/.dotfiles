# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias tmux='TERM=xterm-256color tmux'

# Git in prompt
autoload -Uz add-zsh-hook vcs_info
setopt prompt_subst
add-zsh-hook precmd vcs_info

# Change styles of git
# %b the current branch name
# %u are there any unstaged changes
# %c are there any staged changes
# %a the current Git action being performed (this only makes sense in actionformats)
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats       '(%b%u%c)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'

# My prompt
PROMPT='%F{cyan}%n%f@%F{green}%m%f:%F{magenta}%2~%f%F{red}${vcs_info_msg_0_}%f %# '
