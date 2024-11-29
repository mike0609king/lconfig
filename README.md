# Linux Configuration
This document details my linux setup and configuration. In 
the following there are programs sorted after the sequence
I might install them in.

## nvim
1. Install nvim and load configuration file from github. Nvim 9 or older, 
if you want to use it to develop larger projects. Modifying a few scripts is
fine with any version, because you can simply not use plugins.
2. Install vim-plug

## Node js
1. Install `npm`
2. Install `browser-sync` with `npm install -g browser-sync` for
synchronization of HTML and CSS files with `serve`-command

## tmux
Install and get configuration from this repository.

## Setup zsh
1. Install zsh
2. Install oh-my-zsh.
3. Change .zshrc.
4. Install "DejaVuSansMono Nerd Font Mono"
5. Install powerlevel10k and configure with p10k configure.

## trash-cli
1. Install it.

## flameshot
Just install it with the package manager in order to be able 
to make the screenshots with Super+Shift+S (like in windows).
```
flameshot gui
```

## Window switcher
Create the shortcut ctrl+o
```
rofi -show window
```

## sxiv
1. Install.

## Jupyter
1. Install `jupyter`.
2. Setup vim-binding plugin (https://github.com/lambdalisue/jupyter-vim-binding)
3. Get the other extentions working (https://github.com/ipython-contrib/jupyter_contrib_nbextensions)
