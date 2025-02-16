#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"

LOGS_FOLDER="/var/log/shell-script-log"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"
VALIDATE(){
    if [ $? -ne 0 ]
    then
        echo -e "$2.......$R FAILURE"
        exit 1
    else
         echo -e "$2.......$G SUCCESS"
    fi
}

    echo "Script Started Executed at: $TIMESTAMP" &>>$LOG_FILE_NAME

if [ $USERID -ne 0 ]
then
  
    echo "Error: You Must Have Sudo Access to Execute This Script"
    exit 1
fi

#Whether it is  insatlled mysql or not 
dnf list insatlled mysql

if [ $? -ne 0 ]
then #NOT INSTALLED
    dnf install mysql -y &>>$LOG_FILE_NAME
    VALIDATE $? "Installing MySql"&>>$LOG_FILE_NAME
else
    echo -e "Mysql is Already.....$Y Insatlled"
fi

dnf list insatlled git

if [ $? -ne 0 ]
then
    dnf install git -y &>>$LOG_FILE_NAME
    VALIDATE $? "Insatlling Git" &>>$LOG_FILE_NAME
else
    echo -e "Git is Already..... $Y Insatlled"
fi

for package in $@
do
    dnf list insatlled $package &>>$LOG_FILE_NAME
    if [ $? -ne 0 ]
    then
        dnf install $package -y &>>$LOG_FILE_NAME
        VALIDATE $? "Insatlling $package"
    else
        echo -e "$package is already $Y ....INSTALLED $N"
    fi
done
