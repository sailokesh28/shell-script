#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
  
  echo "Error: You Must Have Sudo Access to Execute This Script"
    exit 1
fi

dnf install mysql -y
if [ $? -ne 0 ]
then 
    echo "Installing MySql........Failure"
    exit1
else
    echo "Installing MySql ........Sucsess"
fi

dnf install git -y

if [ $? -ne 0 ]
then 
    echo "Installing Git........Failure"
    exit1
else
    echo "Installing Git ........Sucsess"
fi


