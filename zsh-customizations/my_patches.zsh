function git_prompt_info() {
  local ref
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX\e[0m\e[3m${ref#refs/heads/}\e[0m$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}