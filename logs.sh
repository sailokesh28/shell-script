#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"

LOGS_FOLDER="/var/log/shell-script-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S
)
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

    echo "Script Started Executed at: $TIMESTAMP &>>"$LOG_FILE

if [ $USERID -ne 0 ]
then
  
    echo "Error: You Must Have Sudo Access to Execute This Script"
    exit 1
fi

#Whether it is  insatlled mysql or not 
dnf list insatlled mysql

if [ $? -ne 0 ]
then #NOT INSTALLED
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "Installing MySql"&>>$LOG_FILE
else
    echo -e "Mysql is Already.....$Y Insatlled"
fi

dnf list insatlled git

if [ $? -ne 0 ]
then
    dnf install git -y &>>$LOG_FILE
    VALIDATE $? "Insatlling Git" &>>$LOG_FILE
else
    echo -e "Git is Already..... $Y Insatlled"
fi