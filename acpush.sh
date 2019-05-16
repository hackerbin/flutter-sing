#!/usr/bin/env bash

read -p "Commit Message: "  commit_message
git add -A

if [[ -z "$commit_message" ]]; then
    git commit --reuse-message=HEAD
else
    git commit -m "$commit_message"
fi


branch_name="$(git symbolic-ref HEAD 2>/dev/null)" ||
branch_name="(unnamed branch)"     # detached HEAD
branch_name=${branch_name##refs/heads/}

git push origin $branch_name