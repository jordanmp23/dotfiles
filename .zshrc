# ====== General Aliases ======
alias ls="ls -al"
alias update-branch="git fetch origin && git rebase origin/master"


# ====== Git prompt stuff to make prettier ======
source ~/.git-prompt.sh
export GIT_PS1_SHOWUPSTREAM="auto"
# When in a git repo, this method is used to determine the current branch
function parse_git_branch {
    git branch 2>/dev/null | grep '^*' | sed 's_^..__' | sed 's_\(.*\)_(\1)_'
}

# When in a git repo, this method is used to determine if there are changes
function git_dirty {
    git diff --quiet HEAD &>/dev/null
    [[ $? == 1 ]] && echo "!"
}

ps1_star="%F{yellow}%B*%b%f"
ps1_dir="%F{cyan}%1~ %f"
ps1_git="%F{magenta}$(parse_git_branch)%f %F{red}$(git_dirty)%f"

export PS1=${ps1_star}' '${ps1_dir}' '${ps1_git}' $ '
