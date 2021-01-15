#!/usr/bin/env bash
#  ---------------------------------------------------------------------------
#
#  Description:  This file holds all my BASH configurations and aliases
#
#  Sections:
#  1.  Linux Command Lines
#  2.  Git Command Lines
#
#  ---------------------------------------------------------------------------

#   -----------------------------
#   1. Linux Command Lines
#   -----------------------------
alias r="rm -rf"                            # r: Remove file
alias ch="chmod"                            # ch: Grant permission for specific file or folder
alias t='touch'                             # t: Create new file
alias c='clear'                             # c: Clear terminal display
alias .~="cd ~"                             # ~: Go Home
alias .1='cd ../'                           # Go back 1 directory level
alias .2='cd ../../'                        # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias l="ls -las"                           # List down all directory and hidden directory with size and permission

#   -----------------------------
#   2. Git Command Lines
#   -----------------------------
alias gc="git clone"
alias gs="git status"
alias glo="git pull origin"
alias gpo="git push origin"
alias gc="git commit"
alias ga="git add"
alias grb="git rebase"
alias gr="git rm"
