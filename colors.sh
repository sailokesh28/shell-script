#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"

VALIDATE(){
    if [ $? -ne 0 ]
    then
        echo -e "$2.......$R FAILURE"
        exit 1
    else
         echo -e "$2.......$G SUCCESS"
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
    echo -e "Mysql is Already.....$Y Insatlled"
fi

dnf list insatlled git

if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "Insatlling Git"
else
    echo -e "Git is Already..... $Y Insatlled"
fi
