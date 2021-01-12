#!/bin/bash
master='master'
read command
main(){
    case ${command} in
        "master")
        git checkout ${master} && git pull --rebase ${master}
        ;;

        "brand")
        read branch
        git checkout -b ${branch}
        ;;

        *)
        echo -n "unknow"
        ;;
    esac
}
