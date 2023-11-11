aptStr="$(which apt)"
if [[ $(uname) == "Darwin" ]]; then
    path=("/usr/local/bin" $path)
fi

eval "$(direnv hook zsh)"

export EDITOR="nvim"

#load work environment if it exists
if test -f ~/.config/zsh/work/env.sh; then
    echo "work env found, loading..."
    . ~/.config/zsh/work/env.sh
fi

function new_branch() {
    local branch="master"

    if [[ $(git ls-remote --heads origin main | wc) != 0 ]]; then
        branch="main"
    fi

    git checkout -b $1 
    git fetch origin $branch
    git reset --hard origin/$branch
}

alias nb="new_branch"
