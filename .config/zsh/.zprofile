eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(mise activate zsh)"
export PGDATABASE=postgres
export ES_JAVA_HOME="$(brew --prefix openjdk)"
export PATH="/Users/Shared/DBngin/redis/7.0.0/bin:/Users/Shared/DBngin/postgresql/17.0/bin:$(brew --prefix libpq)/bin:$ES_JAVA_HOME/bin:$PATH"
