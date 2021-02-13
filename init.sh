#!/usr/bin/env bash

# parse any arguments
FLAG=
if [ "--force" = "$1" ] || [ "-f" = "$1" ]; then
    FLAG="force"
fi

# test to see if a function has been defined
fn_exists() {
    LC_ALL=C type $1 2> /dev/null | grep -q 'is a function'
}

# test to see if the read response was afirmative
is_yes() {
    echo $1 | egrep -q '^[yY]?$'
}

# link .bdlm file
bdlm_link() {
    bdlmfile=$1
    if [ -f "${HOME}/${bdlmfile}" ]; then
        mkdir -p "${HOME}/.bdlm.bkup"
        mv -f "${HOME}/${bdlmfile}" "${HOME}/.bdlm.bkup/"
    fi
    rm -rf ${HOME}/$(basename ${bdlmfile})
    ln -s ${HOME}/.bdlm/${bdlmfile} ${HOME}/$(basename ${bdlmfile})
}

# prompt to install brew package
brew_prompt() {
    package=$1
    [ "force" != "$FLAG" ] && read -p "
$package is not installed. Install it now?

[Y/n] > " read_response
    if [ "force" = "$FLAG" ] || is_yes $read_response; then
        brew install $package
    else
        echo -e "\tskipping $package"
    fi
}

# y/n prompt to run a command
yn_prompt() {
    msg=$1
    cmd=$2
    [ "force" != "$FLAG" ] && read -p "
$msg

[Y/n] > " read_response
    if [ "force" = "$FLAG" ] || is_yes $read_response; then
        eval $cmd
    else
        echo -e "\tskipping $cmd"
    fi
}

# define compatible initiaization files
echo 'source ${HOME}/.bashrc'       > ${HOME}/.profile
echo 'source ${HOME}/.bash_profile' > ${HOME}/.bashrc
echo 'source ${HOME}/.bdlm/bdlm.sh' >> ${HOME}/.bash_profile

# MAIN
mkdir -p ${HOME}/bin

# Mac OS
if [ "Darwin" = "$platform" ]; then
    if [ "" = "$(which brew)" ]; then
        [ "force" != "$FLAG" ] && read -p "
Homebrew is not installed. Install it now?

[Y/n] > " read_response
        if [ "force" = "$FLAG" ] || is_yes $read_response; then
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
        fi
    fi

    if [ "" != "$(which brew)" ]; then
        echo "installing required brew packages..."
        brew install bash
        brew install bash-completion
        brew install coreutils
        brew install gnu-sed
        brew install gnutils

        if [ "" = "$(which dnsmasq)" ]; then
            brew_prompt dnsmasq
        fi
        if [ "" != "$(which dnsmasq)" ]; then
            sudo brew services start dnsmasq # dnsmasq isn't started by default
        fi
        if [ "" = "$(which kubectl)" ]; then
            brew_prompt kubernetes-cli
        fi
        if [ "" = "$(which helm)" ]; then
            brew_prompt kubernetes-helm
        fi
        if [ "" = "$(which aws)" ]; then
            brew_prompt awscli
        fi
        if [ "" = "$(which tmux)" ]; then
            brew_prompt tmux
        fi
        if [ "" = "$(which ssh)" ]; then
            brew_prompt openssh
        fi
    fi

    # set bash as the login shell. also need to set it your the terminal emulator.
    echo "setting default shell to bash..."
    sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
    chsh -s /usr/local/bin/bash
fi

# common dotfiles
yn_prompt "Import .bdlm/ack/.ackrc?"           'bdlm_link ack/.ackrc'
yn_prompt "Import .bdlm/input/.inputrc?"       'bdlm_link input/.inputrc'
yn_prompt "Import .bdlm/mysql/.my.cnf?"        'bdlm_link mysql/.my.cnf'
yn_prompt "Import .bdlm/php/.phpcs_rules.xml?" 'bdlm_link php/.phpcs_rules.xml'
yn_prompt "Import .bdlm/pgsql/.psqlrc?"        'bdlm_link pgsql/.psqlrc'
yn_prompt "Import .bdlm/screen/.screenrc?"     'bdlm_link screen/.screenrc'
yn_prompt "Import .bdlm/tmux/.tmux.conf?"      'bdlm_link tmux/.tmux.conf'
yn_prompt "Import .bdlm/tmux/.tmux.sh?"        'bdlm_link tmux/.tmux.sh'
yn_prompt "Import .bdlm/vim/.vim/?"            'bdlm_link vim/.vim'
yn_prompt "Import .bdlm/vim/.vimrc?"           'bdlm_link vim/.vimrc'
yn_prompt "Import .bdlm/bash/.bash_login?"     'bdlm_link bash/.bash_login'
yn_prompt "Import .bdlm/bash/.bash_logout?"    'bdlm_link bash/.bash_logout'
yn_prompt "Install vim plugins?"               'cd $HOME && $(which vim) +silent +PluginInstall +qa!'

# didyoumean menu wrapper
if ! fn_exists didyoumean; then
    [ "force" != "$FLAG" ] && read "
github.com:bdlm/didyoumean not available. Install it now?

[Y/n]" > read_response
    if [ "force" = "$FLAG" ] || is_yes $read_response; then
        cd $HOME
        git clone https://github.com/bdlm/didyoumean.git $HOME/.bdlm/didyoumean
        echo 'source $HOME/.bdlm/didyoumean/didyoumean.sh' >> ${HOME}/.bash_profile
    fi
fi

# git status prompt
if ! fn_exists __git_status_cmd; then
    [ "force" != "$FLAG" ] && read "
github.com:mkenney/git-status not available. Install it now?

[Y/n]" > read_response
    if [ "force" = "$FLAG" ] || is_yes $read_response; then
        cd $HOME
        git clone https://github.com/mkenney/git-status.git $HOME/.bdlm/git-status
        echo 'source $HOME/.bdlm/git-status/git-status' >> ${HOME}/.bash_profile
        [ -f $HOME/bin/git-status-darwin-amd64 ] && rm -f $HOME/bin/git-status-darwin-amd64 && ln -s $HOME/.bdlm/git-status/bin/git-status-darwin-amd64 $HOME/bin/git-status-darwin-amd64
        [ -f $HOME/bin/git-status-linux-amd64 ] && rm -f $HOME/bin/git-status-linux-amd64 && ln -s $HOME/.bdlm/git-status/bin/git-status-linux-amd64 $HOME/bin/git-status-linux-amd64
        [ -f $HOME/bin/git-status-linux-arm7 ] && rm -f $HOME/bin/git-status-linux-arm7 && ln -s $HOME/.bdlm/git-status/bin/git-status-linux-arm7 $HOME/bin/git-status-linux-arm7
    fi
fi

# configurations and extensions
mkdir -p $HOME/.bdlmrc/ext
# docker extensions
if [ ! -d $HOME/.bdlmrc/ext/docker ]; then
    [ "force" != "$FLAG" ] && read "
Install \`docker\` command extensions?

[Y/n]" > read_response
    if [ "force" = "$FLAG" ] || is_yes $read_response; then
        rsync -a $HOME/.bdlm/ext/docker/ $HOME/.bdlmrc/ext/docker/
    fi
fi
# git extensions
if [ ! -d $HOME/.bdlmrc/ext/git ]; then
    [ "force" != "$FLAG" ] && read "
Install \`git\` command extensions?

[Y/n]" > read_response
    if [ "force" = "$FLAG" ] || is_yes $read_response; then
        rsync -a $HOME/.bdlm/ext/git/ $HOME/.bdlmrc/ext/git/
    fi
fi
# go extensions
if [ ! -d $HOME/.bdlmrc/ext/go ]; then
    [ "force" != "$FLAG" ] && read "
Install \`go\` command extensions?

[Y/n]" > read_response
    if [ "force" = "$FLAG" ] || is_yes $read_response; then
        rsync -a $HOME/.bdlm/ext/go/ $HOME/.bdlmrc/ext/go/
    fi
fi

# global git configuration
if [ ! -f ~/.gitconfig ] || ! grep -q ".bdlm/.gitconfig" ~/.gitconfig; then
    yn_prompt "Extend global git config?" 'git config --global include.path "~/.bdlm/git/.gitconfig"'
    if [ ! -f ~/.gitignore_global ]; then
        yn_prompt "Create ~/.gitignore_global?" 'bdlm_link git/.gitignore_global'
    fi
fi
if [ ! -f ~/.gitconfig ] || ! grep -q ".bdlm/.gitconfig" ~/.gitconfig; then
    yn_prompt "Rewrite git URLs to use SSH (may cause some automation issues)?" 'git config --global url."https://github".insteadOf git://github'
    if [ ! -f ~/.gitignore_global ]; then
        yn_prompt "Create ~/.gitignore_global?" 'bdlm_link git/.gitignore_global'
    fi
fi


# init
source ${HOME}/.bdlm/bdlm.sh
