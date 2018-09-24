# Yay! High voltage and arrows!

# user part, color coded by privileges
local LAMBDA="%(?,%{$fg_bold[magenta]%}λ,%{$fg_bold[red]%}λ) "
local user="%(!.%{$fg[red]%}.%{$fg[white]%})%n%{$reset_color%}"

prompt_setup_pygmalion(){
  # Format for git_prompt_info()
  ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%} "
  ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}⚡%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_CLEAN=""

  # Format for git_prompt_status()
  ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%}+"
  ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[blue]%}!"
  ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}-"
  ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[blue]%}>"
  ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[blue]%}#"

  base_prompt='$user@%{$reset_color%}%{$fg[yellow]%}%m%{$reset_color%}%{$fg_bold[cyan]%}:%{$reset_color%}%{$fg[cyan]%}%0~%{$reset_color%}%{$fg[red]%}|%{$reset_color%}'
  post_prompt='%{$reset_color%}%{$fg[cyan]%}⇒%{$reset_color%} '

  base_prompt_nocolor=$(echo "$base_prompt" | perl -pe "s/%\{[^}]+\}//g")
  post_prompt_nocolor=$(echo "$post_prompt" | perl -pe "s/%\{[^}]+\}//g")

  precmd_functions+=(prompt_pygmalion_precmd)
}

prompt_pygmalion_precmd(){
  local gitinfo=$(git_prompt_info)
  local gitstatus=$(git_prompt_status)
  local gitinfo_nocolor=$(echo "$gitinfo" | perl -pe "s/%\{[^}]+\}//g")
  local exp_nocolor="$(print -P \"$base_prompt_nocolor$gitinfo_nocolor$post_prompt_nocolor\")"
  local prompt_length=${#exp_nocolor}

  local nl=""

  if [[ $prompt_length -gt 40 ]]; then
    nl=$'\n%{\r%}';
  fi
  PROMPT="$LAMBDA$base_prompt$gitinfo$gitstatus$nl$post_prompt"
}


prompt_setup_pygmalion


