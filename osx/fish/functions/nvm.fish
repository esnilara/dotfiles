# For OSX
# ~> brew install nvm
# ~> mkdir ~/.nvm
# ~> ln -s (brew --prefix nvm)/nvm.sh ~/.nvm/nvm.sh

function nvm --description 'Node version manager'
  bass source ~/.nvm/nvm.sh ';' nvm $argv
end
