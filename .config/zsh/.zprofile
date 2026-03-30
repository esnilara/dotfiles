if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export LANG="en_US.UTF-8"
export EDITOR="nvim"
export VISUAL="nvim"
export PGDATABASE="postgres"

if command -v brew >/dev/null 2>&1; then
  export ES_JAVA_HOME="$(brew --prefix openjdk)"
  export PATH="$(brew --prefix libpq)/bin:$ES_JAVA_HOME/bin:$PATH"
fi

[ -f "$HOME/.zprofile.local" ] && source "$HOME/.zprofile.local"
