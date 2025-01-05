#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $? -ne 0 ]
    then
        echo "$2.......FAILURE"
        exit 1
    else
         echo "$?.......SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then
  
    echo "Error: You Must Have Sudo Access to Execute This Script"
    exit 1
fi

#Whether it is  insatlled mysql or not 
dnf list insatlled mysql

if [ $? -ne 0 ]
then #NOT INSTALLED
    dnf install mysql -y
    VALIDATE $? "Installing MySql"
else
    echo "Mysql is Already.....Insatlled"
fi

dnf list insatlled git

if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "Insatlling Git"
else
    echo "Git is Already.....Insatlled"
fi

