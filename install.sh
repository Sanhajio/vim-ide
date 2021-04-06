#!/bin/bash
#Try with docker

full_reqs_commands=(ack fzf ctags)
manual_install=(ycm syntastic)
ycm_libs_reqs=(cmake python xbuild mono-devel npm cargo ctags)

# Init option {{{
Color_off='\033[0m'       # Text Reset

# terminal color template {{{
# Regular Colors
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Cyan='\033[0;36m'         # Cyan
# }}}

# version
Version='0.0.1'
System="$(uname -s)"

# }}}

# usage {{{
usage () {
    echo "Usage: "
    echo "  ./install.sh <command>"
    echo
    echo "command:"
    echo "  full:          install full configuration"
    echo "  basic:         install basic configuration"
    echo "  requirements:  check system requirements"
    echo "  help:          show help message"
    echo
    echo "Enter \`./install <command> help\` for more."
}
# }}}

# usage_requirements {{{
usage_requirements () {
    echo "Usage: "
    echo "  ./install.sh requirements [option]"
    echo
    echo "options:"
    echo "  full:          check full requirements"
    echo "  basic:         install basic requirements"
    echo "  help:          show help message"
}
# }}}

# success/info/error/warn {{{
msg() {
  printf '%b\n' "$1" >&2
}

success() {
  msg "${Green}[✔]${Color_off} ${1}${2}"
}

info() {
  msg "${Cyan}[➭]${Color_off} ${1}${2}"
}

error() {
  msg "${Red}[✘]${Color_off} ${1}${2}"
  exit 1
}

warn () {
  msg "${Yellow}[⚠]${Color_off} ${1}${2}"
}
# }}}

# check_requirements {{{
check_requirements () {
  info "Checking Requirements"
  if hash "vim" &>/dev/null; then
    is_vim8=$(vim --version | grep "Vi IMproved 8")
    is_vim74=$(vim --version | grep "Vi IMproved 7.4")
    if [ -n "$is_vim8" ]; then
      success "Check Requirements: vim 8.0"
    elif [ -n "$is_vim74" ]; then
      success "Check Requirements: vim 7.4"
    else
        error "need vim 7.4 or above"
    fi
  else
    error "Check Requirement : vim"
  fi
  if hash "git" &>/dev/null; then
    git_version=$(git --version)
    success "Check Requirements: ${git_version}"
  else
    error "Check Requirements : git"
  fi

  if [ "$1" == "full" ]; then
    for req in "${full_reqs_commands[@]}"
    do
      case $req in
        ack)
          if hash "ack" &>/dev/null; then
            ack_version=$(ack --version | head -n 1)
            if [ "$(expr ${ack_version:5:1})" -gt 1 ]; then
              success "Check Requirements: ${ack_version}"
            else
              error "Check Requirements : ack version is lower than 2"
            fi
          else
            error "Check Requirements : ack"
          fi
          ;;
        fzf)
          if hash "fzf" &>/dev/null; then
            success "Check Requirements: fzf"
          else
            error "Check Requirements : fzf"
          fi
          ;;
        ctags)
          if hash "ctags" &>/dev/null; then
            success "Check Requirements: ctags"
          else
            error "Check Requirements : ctags"
          fi
          ;;
      esac
    done
  fi
}
# }}}

# install_basic {{{
install_basic () {
  check_requirements
  info "Actual configuration will be lost"
  read -p "Continue (y/n)?" CONT
  if [ "$CONT" = "y" ]; then
    if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
      echo "not exists"
      git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    fi
    cp ./vimrcs/basic.vim ~/.vimrc
    vim +PluginInstall +qall
  else
    exit 0
  fi
}
#}}}

# install_full {{{
install_full () {
  check_requirements "full"
  info "Actual configuration will be lost"
  read -p "Continue (y/n)?" CONT
  if [ "$CONT" = "y" ]; then
    if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
      echo "not exists"
      git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    fi
    cp ./vimrcs/full.vim ~/.vimrc
    vim +PluginInstall +qall

    info "Altough all plugins have been automatically installed: manual steps can be necessary for some plugins [To Be Automated]"
    echo ""
    for manual in "${manual_install[@]}"
    do
      case $manual in
        ycm)
          info "Go to ~/.vim/bundle/YouCompleteMe"
          info "Install YouCompleteMe with install.py"
          echo ""
          ;;
        syntastic)
          info "Syntastic: I still don't understand this plugin completely"
          echo ""
          ;;
      esac
    done
    info "Other plugins require libraries like:"
    for req in "${ycm_libs_reqs[@]}"
    do
      info " - "$req
    done
  else
    exit 0
  fi
}
#}}}

### main {{{
main () {
  if [ $# -gt 0 ]
  then
    case $1 in
      requirements)
        if [ "$2" == "full" ]; then
          check_requirements "full"
          exit 0
        elif [ "$2" == "basic" ]; then
          check_requirements
        fi
        usage_requirements
        exit 0
        ;;
      full)
        install_full
        exit 0
        ;;
      basic)
        install_basic
        exit 0
        ;;
      help)
        usage
        exit 0
        ;;
    esac
  else
    usage
    exit 0
  fi
}

# }}}

main $@

# vim:set foldenable foldmethod=marker:
