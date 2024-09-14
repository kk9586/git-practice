#!/bin/bash


USERID=$(id -u)
echo "User Id is : $USERID"
if [ $USERID -ne 0 ]
then 
   echo "please run this script with root priveleges"
   exit 1
fi

dnf list installed mysql 

if [ $? -ne 0 ]
then
    echo "Git is not installed, going to install it .."
    dnf intsall mysql -y
else 
    echo "Git is already installed"
fi    