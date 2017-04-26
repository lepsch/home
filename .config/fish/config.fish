function v --description 'virtualenv creation/activation shortcut'
    if test (count $argv) -ge 1
        command python3.6 -m venv $argv
    else
        command python3.6 -m venv .venv
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

set VIRTUAL_ENV_DISABLE_PROMPT 1
set VISUAL "code -w"
set EDITOR $VISUAL
