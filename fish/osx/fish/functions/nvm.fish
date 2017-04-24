function nvm --description 'Node version manager'
  bass source (brew --prefix nvm)/nvm.sh ';' nvm $argv
end
