function pr
    set BRANCH (git branch | grep '^\*' | sed 's/\(^\* \)//g')
    set REPOURL (git remote get-url --push origin | sed 's|git@github.com:\(.*\)|https://github.com/\1|' | sed 's/\.git//g')
    set PULLREQUEST "$REPOURL/compare/$BRANCH?expand=1"
    echo "Review: $PULLREQUEST"
    open "$PULLREQUEST"
end
