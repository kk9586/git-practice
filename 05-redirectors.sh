#!/bin/bash

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=&(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE=$LOGS_FOLDER/$SCRIPT_NAME/$TIMESTAMP
mkdir -p $LOGS_FOLDER

USERID=$(id -u)
echo "User Id is : $USERID"

CHECK_ROOT(){
if [ $USERID -ne 0 ]
then 
   echo "please run this script with root priveleges"
   exit 1
fi
} 

USAGE(){
    echo "USAGE: sudo sh 16-redirectors.sh package1 package2..."
}

VALIDATE(){
       if [ $1 -eq 0 ]
          then  
            echo "$2 is success .. check it"
            exit 1
          else 
            echo "$2 is failed."
          fi
}

echo "script started executing at $(date)"

CHECK_ROOT
USAGE

for package in $@   #here @ stores all the values.
do
   dnf list installed $package
   if [ $? -ne 0 ]
   then
       echo "$package is not installed...Going to install"
       dnf install $package -y
       VALIDATE $? "installing $package"
    else
       echo "$package is already installed"   
    fi
done