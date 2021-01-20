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
helper() {
  echo "\
    List alias commands:

     rfolder : "rm -rf"
     rfile : "rm"
     ch : "chmod"
     t : 'touch'
     c : 'clear'
     .~ : "cd ~"
     .1 : 'cd ../'
     .2 : 'cd ../../'
     .3 : 'cd ../../../'
     .4 : 'cd ../../../../'
     .5 : 'cd ../../../../../'
     .6 : 'cd ../../../../../../'
     l : "ls -las"
     w : "which"
     e : "echo"
    gclone : "git clone"
    gstatus : "git status"
    gpullo : "git pull origin"
    gpusho : "git push origin"
    gcommit : "git commit -m"
    gadd : "git add"
    grebase : "git rebase"
    gremove : "git rm"
    gcheckout : "git checkout"
"
}
#   -----------------------------
#   1. Linux Command Lines
#   -----------------------------
alias rfolder="rm -rf"
alias r="rm -rf"
alias ch="chmod"
alias t='touch'
alias c='clear'
alias .~="cd ~"
alias .1='cd ../'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'
alias l="ls -las"
alias w="which"
alias e="echo"

#   -----------------------------
#   2. Git Command Lines
#   -----------------------------
alias gclone="git clone"
alias gstatus="git status"
alias gpullo="git pull origin"
alias gpuso="git push origin"
alias gcommitm="git commit -m"
alias gadd="git add"
alias grebase="git rebase"
alias gremove="git rm"
alias gcheckout="git checkout"
