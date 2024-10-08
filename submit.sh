#!/bin/bash

git add .
git commit -m "auto submit"
git push origin main

hexo clean
hexo generate

rm -rf /tmp/blog
git worktree add /tmp/blog gh-pages
cp -r ./public/* /tmp/blog

cd /tmp/blog
git add .
git commit -m "auto submit"
git pull
git push origin gh-pages

cd -
git worktree remove /tmp/blog

echo "submit success"
