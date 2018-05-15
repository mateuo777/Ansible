#!/bin/bash

cd /home/mateuo/scripts/Ansible
git add *

to_remove=$(git status | grep "deleted" | awk '{print $2}')

if [[ -n $to_remove ]]; then
    git rm --ignore-unmatch $to_remove
fi

git commit -m "Automated commit for Ansible powered by cron"
ssh -T mateuo777@github.com/Ansible
git push -u origin master
