#!/bin/bash

#Created by:
#Sean Roy 

active=$true

while $active; do

#Menu
echo
echo
echo "Welcome to the User Management Application, $USER."
echo "Enter number to select an option"
echo
echo "1. Create a new user."
echo "2. Delete a user."
echo "3. Modify a user."
echo "4. See last 10 created users."
echo "5. Quit."
echo
echo "Choice:"

   read choice

   if [ $choice -eq 1 ]; then
       echo "Enter Username below:"
       read username
       sudo adduser $username 
       echo
       exists=$(grep -c "^$username:" /etc/passwd)

       if [ $exists -eq 0 ]; then
          echo "The user $username does not exist."
       else
          echo "The user $username exists."
       fi

       elif [ $choice -eq 2 ] ; then
           echo -e "Which user would you like to delete?"
           read delusername
           echo

           exists=$(grep -c "^$username:" /etc/passwd)

           if [ $exists -eq 0 ]; then
              echo "The user $delusername does not exist."
           else
              echo "Would you like to delete $delusername's home directory? Y/N"
              read userinput
              if [ "$userinput" = "N" ] || [ "$userinput" = "n" ] ; then
                 echo "User deleted but user home directory has not been deleted."
                 sudo userdel $delusername
              else
                  echo "User & user home directory have been deleted."
                  sudo userdel $delusername
                  sudo rm -r /home/$delusername
              fi
           fi


       elif [ $choice -eq 3 ] ; then
	   echo -e "Which user would you like to modify?"
           read modifyusername
           echo "Specify what you would like to change."
           echo
           echo "1. Change full name."
           echo "2. Change shell."
           echo "3. Set home directory."
           echo "4. Set the new password."
           echo "5. Expire the password."
           echo "6. Add user to group."
           echo "7. Remove user from group."
	   read modifychoice

           if [ $modifychoice -eq 1 ] ; then 
              sudo chfn -f $modifyusername
           elif [ $modifychoice -eq 2 ] ; then
	      echo "Enter the shell you wish to use:"
              read newshell 
              sudo usermod -s $newshell $modifyusername
           elif [ $modifychoice -eq 3 ] ; then
              echo "Provide the new home directory below:"
              read homedir
              sudo usermod -d $homedir
           elif [ $modifychoice -eq 4 ] ; then
              echo "Please enter the new password:"
              sudo passwd $modifyusername
           elif [ $modifychoice -eq 5 ] ; then
	      echo "Enter the date in this format: YYYY-MM-DD"
              read date
              sudo usermod -e $date $modifyusername
              sudo chage -l $modifyusername
           elif [ $modifychoice -eq 6 ] ; then
              echo "Does this group exist? Y/N"
              read response
              if [ "$response" = "N" ] || [ "$response" = "n" ] ; then
                 echo "What do you want to call this group?"
                 read groupname
                 sudo groupadd $groupname
                 sudo usermod -a -G $groupname $modifyusername
                 echo
                 echo "Group $groupname created."
                 echo "User $modifyusername has been added to group $groupname."
              else
                  echo "Enter the group name:"
                  read group
                  sudo usermod -a -G $group $modifyusername
              fi
           elif [ $modifychoice -eq 7 ] ; then
              echo "Enter the group name:"
              read group
              sudo deluser $modifyusername $group

           echo 
           fi
       elif [ $choice -eq 4 ] ; then
           echo -e "Displaying last 10 created users."
	   grep -m 10 useradd /var/log/auth.log

       elif [ $choice -eq 5 ] ; then 
           echo "Shutting down... Goodbye!"
           exit 1
      fi


done
