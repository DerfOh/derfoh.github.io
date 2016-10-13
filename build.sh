#!/usr/bin/env bash
# Ensure utf-8 locale
export LC_ALL=en_US.UTF-8
export JEKYLL_ENV=production
export REPO_URL=https://github.com/DerfOh/derfoh.github.io.git
git clone $REPO_URL source_code
cd source_code
bundle install
jekyll build
jekyll serve
