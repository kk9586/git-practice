#!/bin/bash


USERID=$(id -u)
echo "User Id is : $USERID"
if [ $USERID -ne 0 ]
then 
   echo "please run this script with root priveleges"
   exit 1
fi

dnf list installed git 

if [ $? -ne 0 ]
then
    echo "git is not installed, going to install it .."
    dnf install git -y
else 
    echo "git is already installed. Nothing to do...."
fi    

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MYSQL is not installed going to install"
    dnf install mysql -y
        if [ $? -eq 0 ]
          then  
            echo "MYSQL installation is success .. check it"
            exit 1
          else 
            echo "MYSQL installation is failure."
          fi
else
    echo "MYSQL is already installed."
fi    