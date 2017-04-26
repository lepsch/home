function fish_prompt --description 'Write out the prompt'
  # Just calculate these once, to save a few cycles when displaying the prompt
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname -s)
  end

  if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color normal)
  end

  if not set -q __fish_prompt_cwd
    set -g __fish_prompt_cwd (set_color $fish_color_cwd)
  end

  if set -q VIRTUAL_ENV
    echo -n -s (set_color normal) "(" (set_color -o blue) "🐍" (set_color -o yellow) "🐍" (set_color normal) ") "
  end

  echo -n -s "$USER" @ "$__fish_prompt_hostname" ' ' "$__fish_prompt_cwd" (prompt_pwd) (set_color '007e00') (__fish_git_prompt) "$__fish_prompt_normal" ' λ '
end
