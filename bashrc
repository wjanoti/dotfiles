# Docker
eval $(docker-machine env default)

# Git
if [ -f "$HOME/.git-prompt.sh" ]; then
  source "$HOME/.git-prompt.sh"
fi

# Composer
if [ -d "$HOME/.composer/vendor/bin" ]; then
  export PATH="$HOME/.composer/vendor/bin:$PATH"
fi

# Prompt colors
if [ -f "$HOME/.bashcolors" ]; then
  source "$HOME/.bashcolors"
fi

PS1="[$BIGreen\u$Color_Off@$BICyan\h$Color_Off $BIBlue\w$Color_Off] "

# Add git info to the prompt
PS1=$PS1'$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
  echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
  if [ "$?" -eq "0" ]; then \
    # @4 - Clean repository - nothing to commit
    echo "'$BIYellow'"$(__git_ps1 "(%s)"); \
  else \
    # @5 - Changes to working tree
    echo "'$BIRed'"$(__git_ps1 "(%s)"); \
  fi)"; \
fi)'

export PS1=$PS1$Color_Off' \$ ';

