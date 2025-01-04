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
    echo "Installing MySql........FAILURE"
    exit1
else
    echo "Installing MySql ........SUCCESS"
fi

dnf install git -y

if [ $? -ne 0 ]
then 
    echo "Installing Git........FAILURE"
    exit1
else
    echo "Installing Git ........SUCCESS"
fi


