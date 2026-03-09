# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# My Custom aliases & functions
#
# alias p='python'
# alias cx="claude --permission-mode=plan --allow-dangerously-skip-permissions"

# --- EASY NAVIGATION ---
#alias home='cd ~/'

# ---Modified Commands ---
alias la='ls -a'
alias mkdir='mkdir -p'

# --- Git ---
alias gst='git status'
alias gaa='git add .'

# --- REFRESH SETTINGS ---
# Run this after you edit this file to apply changes immediately.
alias reload='source ~/.bashrc'
