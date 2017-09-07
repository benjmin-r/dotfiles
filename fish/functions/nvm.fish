function nvm -d "Wrapper function that first sources brew-installed nvm and then runs it"
  bass source (brew --prefix nvm)/nvm.sh ';' nvm $argv
end
