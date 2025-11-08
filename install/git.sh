#!/usr/bin/env bash
read -p "Enter your git email: " email
read -p "Enter your git username: " user

git config --global user.email $email
git config --global user.name $user
