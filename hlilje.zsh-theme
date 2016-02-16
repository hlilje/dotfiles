# Prompt
PROMPT='[%{$fg[white]%}%B%n%b:%{$fg[red]%}%~%{$reset_color%}]%# '
RPROMPT='$(git_prompt_info)'

# Git prompt
ZSH_THEME_GIT_PROMPT_PREFIX="[git:%B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}+"
ZSH_THEME_GIT_PROMPT_CLEAN=""
