#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
  
  echo "Error: You Must Have Sudo Access to Execute This Script"
    exit 1
fi

#Whether it is  insatlled mysql or not 
dnf list insatlled mysql

if [ $? -ne 0 ]
then
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
    echo "Insatlling Mysql.....FAILURE"
    exit 1
else
    echo "Installing Mysql.......SUCCESS"
fi
else
    echo "Mysql is Already.....Insatlled"
fi

# dnf install mysql -y
# if [ $? -ne 0 ]
# then 
#     echo "Installing MySql........FAILURE"
#     exit1
# else
#     echo "Installing MySql ........SUCCESS"
# fi

dnf list insatlled git

if [ $? -ne 0 ]
then
    dnf install git -y
    if [ $? -ne 0 ]
    then
    echo "Insatlling Git.....FAILURE"
    exit 1
else
    echo "Installing Git.......SUCCESS"
fi
else
    echo "Git is Already.....Insatlled"
fi

# dnf install git -y

# if [ $? -ne 0 ]
# then 
#     echo "Installing Git........FAILURE"
#     exit1
# else
#     echo "Installing Git ........SUCCESS"
# fi


