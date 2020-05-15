function v --description 'virtualenv creation/activation shortcut'
    if test (count $argv) -ge 1
        command virtualenv $argv
    else
        command virtualenv .venv
    end
    auto_activate_venv $argv
end

function pin --description 'pip install with dependency links'
    command pip install --process-dependency-links $argv
end

function auto_activate_venv --on-variable PWD --on-event fish_prompt
    if test -e "$PWD/$argv/bin/activate.fish"
        source "$PWD/$argv/bin/activate.fish"
    else if test -e "$PWD/bin/activate.fish"
        source "$PWD/bin/activate.fish"
    else if test -e "$PWD/.venv/bin/activate.fish"
        source "$PWD/.venv/bin/activate.fish"
    end
end

set -gx VIRTUAL_ENV_DISABLE_PROMPT 1
set -gx VISUAL "code -w"
set -gx EDITOR $VISUAL
set -gx TZ ":/etc/localtime"
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8
set -gx PATH "$HOME/.cargo/bin" $PATH
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
