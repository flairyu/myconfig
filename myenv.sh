# If you come from bash you might have to change your $PATH.

# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH

# Preferred editor for local and remote sessions
export EDITOR='vim'

# for nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# for x server with WSL
#if grep -q "microsoft" /proc/version &>/dev/null; then
    # WSL2
#    export DISPLAY="$(ip route|awk '/^default/{print $3}'):0.0"
#    export PULSE_SERVER="${PULSE_SERVER:-tcp:$(ip route|awk '/^default/{print $3}')}"
    # export LIBGL_ALWAYS_INDIRECT=1
    # export XDG_SESSION_TYPE=x11
#fi

# for npm manager 'n'
export N_PREFIX=$HOME/apps/nodejs
export PATH=$N_PREFIX/bin:$PATH

# for dotnet tools
export DOTNET_ROOT=/snap/dotnet-sdk/current
export PATH=$PATH:$HOME/.dotnet/tools/

# for snap
export PATH=$PATH:/snap/bin

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'
