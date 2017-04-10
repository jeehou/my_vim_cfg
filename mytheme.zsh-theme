# vim:ft=zsh ts=2 sw=2 sts=2

rvm_current() {
  rvm current 2>/dev/null
}

rbenv_version() {
  rbenv version 2>/dev/null | awk '{print $1}'
}

battery=$(battery_pct_prompt)

PROMPT='
 🔆  %{$fg_bold[green]%}%n@%M ${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)'
PROMPT+=' %{$fg_bold[red]%}<⏰  %*>%{$reset_color%} 🔋 :$(battery_pct_prompt)
$ '

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}🌀 :"    
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

RPROMPT='%{$fg_bold[red]%}$(rbenv_version)%{$reset_color%}'
