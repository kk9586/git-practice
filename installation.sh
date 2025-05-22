#!/bin/bash


# USERID=$(id -u)
# echo "User Id is : $USERID"
# if [ $USERID -ne 0 ]
# then 
#    echo "please run this script with root priveleges"
#    exit 1
# fi

# VALIDATE(){
#        if [ $1 -eq 0 ]
#           then  
#             echo "$2 is success .. check it"
#             exit 1
#           else 
#             echo "$2 is failure."
#           fi
# }

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


USERID=$(id -u)
#echo "user id is : 0"

if [ $USERID -ne 0 ]
then 
    echo "please run this script with root priviliges"
    exit 1
fi

dnf list installed git
if [ $? -ne 0 ]
then   
    echo "git is not installed, going to install now"
else
    echo "git is already installed"
fi        

dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo "mysql is not installed, going to install now"
    dnf install mysql -y
    if [ $? -eq 0 ]
    then 
        echo "installing mysql"
    fi    
else
    echo "mysql is installed successfully"
fi    