#!/bin/bash

# git branch | awk "{print $1}" > branches.txt

while read p; do
	mkdir "$p"
	git worktree add "$p" "$p"
done<branches.txt
