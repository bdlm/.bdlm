#!/usr/bin/env bash

export OS=$(uname)

# clickhouse
if [ command -v clickhouse &> /dev/null ] \
    || [ command -v clickhouse-client &> /dev/null ] \
    || [ command -v clickhouse-server &> /dev/null ]
then
    source ~/.bdlm/clickhouse/clickhouse.sh
    [ -d ~/.bdlmrc/clickhouse ] && for ext in $(find ~/.bdlmrc/clickhouse -type f); do source $ext; done
fi

# cvs
if [ -d /usr/local/cvs/bin ] || [ command -v cvs &> /dev/null ]; then
    source ~/.bdlm/cvs/cvs.sh
    [ -d ~/.bdlmrc/cvs ] && for ext in $(find ~/.bdlmrc/cvs -type f); do source $ext; done
fi

# docker
if [ -d /usr/local/docker/bin ] || [ command -v docker &> /dev/null ]; then
    source ~/.bdlm/docker/docker.sh
    [ -d ~/.bdlmrc/docker ] && for ext in $(find ~/.bdlmrc/docker -type f); do source $ext; done
fi

# git
if [ -d /usr/local/git/bin ] || [ command -v cvs &> /dev/null ]; then
    source ~/.bdlm/git/completion.sh
    [ -d ~/.bdlmrc/git ] && for ext in $(find ~/.bdlmrc/git -type f); do source $ext; done
fi

# go
if [ -d /usr/local/go/bin ] || [ command -v go &> /dev/null ]; then
    source ~/.bdlm/go/go.sh
    [ -d ~/.bdlmrc/go ] && for ext in $(find ~/.bdlmrc/go -type f); do source $ext; done
fi

# helm
if [ -d /usr/local/helm/bin ] || [ command -v helm &> /dev/null ]; then
    source ~/.bdlm/helm/helm.sh
    [ -d ~/.bdlmrc/helm ] && for ext in $(find ~/.bdlmrc/helm -type f); do source $ext; done
fi

# k8s
if [ -d /usr/local/kubectl/bin ] || [ command -v kubectl &> /dev/null ]; then
    source ~/.bdlm/k8s/k8s.sh
    [ -d ~/.bdlmrc/k8s ] && for ext in $(find ~/.bdlmrc/k8s -type f); do source $ext; done
fi

# perl
if [ command -v perl &> /dev/null ]; then
    source ~/.bdlm/perl/perl.sh
    [ -d ~/.bdlmrc/perl ] && for ext in $(find ~/.bdlmrc/perl -type f); do source $ext; done
fi

# screen
if [ -d /usr/local/screen/bin ] || [ command -v screen &> /dev/null ]; then
    source ~/.bdlm/screen/screen.sh
    [ -d ~/.bdlmrc/screen ] && for ext in $(find ~/.bdlmrc/screen -type f); do source $ext; done
fi

# terraform
if [ -d /usr/local/terraform/bin ] || [ command -v terraform &> /dev/null ]; then
    source ~/.bdlm/terraform/terraform.sh
    [ -d ~/.bdlmrc/terraform ] && for ext in $(find ~/.bdlmrc/terraform -type f); do source $ext; done
fi

# tmux
if [ -d /usr/local/tmux/bin ] || [ command -v tmux &> /dev/null ]; then
    source ~/.bdlm/tmux/tmux.sh
    [ -d ~/.bdlmrc/tmux ] && for ext in $(find ~/.bdlmrc/tmux -type f); do source $ext; done
    source ~/.bdlm/tmux/tmuxinator.sh
    [ -d ~/.bdlmrc/tmux ] && for ext in $(find ~/.bdlmrc/tmux -type f); do source $ext; done
fi

# vim
if [ -d /usr/local/vim/bin ] || [ command -v vim &> /dev/null ]; then
    source ~/.bdlm/vim/vim.sh
    [ -d ~/.bdlmrc/vim ] && for ext in $(find ~/.bdlmrc/vim -type f); do source $ext; done
fi

# func
source ~/.bdlm/func/extract.sh
[ -d ~/.bdlmrc/func ] && for ext in $(find ~/.bdlmrc/func -type f); do source $ext; done
source ~/.bdlm/func/lsbytes.sh
[ -d ~/.bdlmrc/func ] && for ext in $(find ~/.bdlmrc/func -type f); do source $ext; done
source ~/.bdlm/func/makedvd.sh
[ -d ~/.bdlmrc/func ] && for ext in $(find ~/.bdlmrc/func -type f); do source $ext; done

# shell
source ~/.bdlm/bash/aliases.sh
source ~/.bdlm/bash/completion.sh
source ~/.bdlm/bash/env.sh
source ~/.bdlm/bash/path.sh
[ -d ~/.bdlmrc/bash ] && for ext in $(find ~/.bdlmrc/bash -type f); do source $ext; done
source ~/.bdlm/color/color.sh
[ -d ~/.bdlmrc/color ] && for ext in $(find ~/.bdlmrc/color -type f); do source $ext; done

# command extensions
source ~/.bdlm/ext/cmd.sh

# prompt
if [ -f ~/.bdlmrc/prompt/prompt.sh ]; then
    source ~/.bdlmrc/prompt/prompt.sh # user prompt
else
    source ~/.bdlm/prompt/prompt.sh   # bdlm prompt
fi
