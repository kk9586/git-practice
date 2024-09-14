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