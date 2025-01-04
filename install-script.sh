#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
  
  echo "Error: You Must Have Sudo Access to Execute This Script"
    exit 1
fi

dnf install mysql -y

dnf install git -y

