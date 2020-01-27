#!/bin/bash
for branch in $(git branch --all | grep '^\s*remotes' | grep -v "BlazeDroid-Q" | egrep --invert-match '(:?HEAD|master)$'); do
    git branch --track "${branch##*/}" "$branch"
    git push origin --delete "${branch##*/}"
done

#Get all remotes, check them out, delete them, then delete the remote.
