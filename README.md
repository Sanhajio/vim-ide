# vim-ide
My personal vim configuration, I have written this script just for fun.
It contains my current configuration I use for vim.

I also use it to get my configuration going on a new setup (VM, machine, environment)

It is mainly inspired from [amix/vimrc](https://github.com/amix/vimrc) and [spacevim](https://github.com/Spacevim/Spacevim)

I use this one because it is lighter than amix, and vim is can natively be found on linux environments.

## Usage

```
Usage:
  ./install.sh <command>

command:
  full:          install full configuration
  basic:         install basic configuration
  requirements:  check system requirements
  help:          show help message

Enter `./install <command> help` for more.

```

Full and basic installation differ by the Plugins that are installed:
- Basic: I use it when I have to connect temporarely to a server and read code, but also on my Chromebook and Chrometab.
- Full: I use it when I install a new VM that is meant for development, or when I get a new work laptop.
