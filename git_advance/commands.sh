# add & commit
git commit -am
# undo the change but keep it on log
git revert
# stash
git stash save [preference name]
git stash list
git stash apply [index on the list]
# log
git log --graph --oneline --decorate
# find bad commit by binary search
git biset [reset/start/bad/good]
# rebase
git rebase -i --autosquash
# hook, use when need to execute something before commit
# checkout previous branch
git checkout -
# git add exclude
git add -- . :![link]
