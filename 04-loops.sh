#!/bin/bash


USERID=$(id -u)
echo "User Id is : $USERID"
if [ $USERID -ne 0 ]
then 
   echo "please run this script with root priveleges"
   exit 1
fi

VALIDATE(){
       if [ $1 -eq 0 ]
          then  
            echo "$2 is success .. check it"
            exit 1
          else 
            echo "$2 is failure."
          fi
}

# dnf list installed git 

# if [ $? -ne 0 ]
# then
#     echo "git is not installed, going to install it .."
#     dnf install git -y
#     VALIDATE $? "Installing git"
# else 
#     echo "git is already installed. Nothing to do...."
# fi    

# dnf list installed mysql

# if [ $? -ne 0 ]
# then
#     echo "MYSQL is not installed going to install"
#     dnf install mysql -y
#     VALIDATE $? "Installing mysql"
        
# else
#     echo "MYSQL is already installed."
# fi    

for package in $@   #here @ stores all the values.
do
   echo "dnf install $package -y "
   VALIDATE $? installing $package
done   