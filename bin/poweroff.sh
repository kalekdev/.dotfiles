#!/usr/bin/env bash

read -p "Reminder to push all repositories to remote. Are you sure you want to shutdown? (y/N)" -n 1 -r
echo 
if [[ $REPLY =~ ^[Yy]$ ]]
then
	poweroff
fi

