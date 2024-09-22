#!/bin/bash

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)
echo "User Id is : $USERID"

CHECK_ROOT(){
if [ $USERID -ne 0 ]
then 
   echo -e $R "please run this script with root priveleges" $N | tee -a &>>$LOG_FILE
   exit 1
fi
} 

USAGE(){
    echo -e $R "USAGE: $N sudo sh 16-redirectors.sh package1 package2..." | tee -a &>>$LOG_FILE
}

VALIDATE(){
       if [ $1 -eq 0 ]
          then  
            echo -e "$2 is $G success $N .. check it" &>>$LOG_FILE
            exit 1
          else 
            echo -e "$2 is $R failed. $N "  &>>$LOG_FILE
          fi
}

echo "script started executing at $(date)" | tee -a &>>$LOG_FILE

if [ $# -eq 0 ]
  then 
     USAGE
  fi   

CHECK_ROOT

for package in $@   #here @ stores all the values.
do
   dnf list installed $package &>>$LOG_FILE
   if [ $? -ne 0 ]
   then
       echo -e $Y "$package is not installed...Going to install" $N  &>>$LOG_FILE
       dnf install $package -y
       VALIDATE $? "installing $package"
    else
       echo -e $Y "$package is already installed" $N &>>$LOG_FILE 
    fi
done