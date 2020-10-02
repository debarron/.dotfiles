#!/bin/bash

problable_repos=$(ls "$CODE")

actual_repos=""
for r in $(echo "$problable_repos")
do
  [ -d "$CODE/$r/.git" ] && actual_repos="$CODE/$r $actual_repos"
done

echo "STATUS FROM REPOS AT: $CODE"
printf "%-30s %s\n" "REPO_NAME" "# CHANGES"
for repo in $(echo "$actual_repos")
do
  cd "$repo"
  
  changes=$(git status -s)
  changes_lines=$(echo "$changes" | wc -l | cut -f1)
  [ "$changes_lines" -gt 0 ] && printf "%-30s %6d\n" $(basename "$repo") $changes_lines
  
done


