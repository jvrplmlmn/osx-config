#!/usr/bin/env bash

# This can be generated with:
#  apm list --packages --installed --bare | grep . | cut -d"@" -f 1 | awk '{ print "apm install " $0 }'

apm install language-chef
apm install language-docker
apm install language-groovy
apm install language-hcl
apm install language-terraform
apm install linter
apm install linter-flake8
apm install multi-cursor
apm install tabs-to-spaces
