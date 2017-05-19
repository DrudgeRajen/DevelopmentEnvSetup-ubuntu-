#!/usr/bin/env bash

###########################
# Bash script to install the required application for web developer after the installation of ubuntu
# Written by @drudge_rajen <drudge.rajan@gamil.com>
#########################

#COLORS

#Reset
Color_Off='\033[0m'     #Text Reset


# Regular Colors
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan



#Update Package
echo "$Cyan \n Upadting Packages.. $Color_Off"
sudo apt-get update

#Install Apache
while true; do
    read -p "Do you wish to install apache[y/n] ?" yn
    case $yn in
        [Yy]*) echo "$Cyan \n Installing Apache.. $Color_Off";
           sudo apt-get install apache2
           echo " $Green \n Apache2 installed successfully.$Color_Off  $Cyan \n Now adusting the firewall to allow web traffic.. $Color_Off"
          sudo ufw allow info "Aapache Full"
          echo "$Green \n Firewall adjusted for apache.Please Visit http://localhost/ in web browser.$Color_Off"
            break;;
        [Nn]*) echo "$Yellow \n We assume that you are not a web developer :P. $Color_Off"
            exit;;
        *) echo "$Red \n Plese answer yes or no. $Color_Off";;
    esac
done

#Install Mysql

while true; do
    read -p "Do you want to intall mysql[y/n] ?" yn
    case $yn in
        [Yy]*) echo "$Cyan \n Installing Mysql. Please go thorugh the installation wizard.. $Color_Off";
            sudo apt-get install mysql-server
            echo "$Green Mysql Installed Successfully $Color_Off"
            break;;
        [Nn]*) exit;;
        *) echo "$Red \n Plese answer yes or no. $Color_Off";;
    esac
done

#Install PHP

while true; do
    read -p "Do you want to install PHP7[y/n] ?" yn
    case $yn in
        [Yy]*) echo "$Cyan \n Installing php7.. $Color_Off";
            sudo apt-get install php libapache2-mod-php php-mcrypt php-mysql
            echo "$Green \n Php7 Installed sucessfully.$Color_Of $Cyan \n Restarting Apache2.. $Color_Off"
            sudo systemctl restart apache2
            break;;
        [Nn]*) exit;;
        *) echo "$Red \n Plese answer yes or no. $Color_Off";;
    esac
done

#Install Composer
while true; do
    read -p "Do you want to install Composer?" yn
    case $yn in
        [Yy]*) echo "$Cyan \n Installing Composer... $Color_Off";
            sudo apt-get install curl php-cli php-mbstring git unzip
            php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
             php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
             php composer-setup.php
             php -r "unlink('composer-setup.php');"
             sudo mv composer.phar /usr/local/bin/composer
             echo "$Green \n Composer installed successfully, open terminal and hit composer to verify :). $Color_Off"
             break;;
        [Nn]*) exit;;
        *) echo "$Red \n Plese answer yes or no. $Color_Off";;
    esac
done


#Install Git
while true; do
    read -p "Do you want to install git?" yn
    case $yn in
        [Yy]*) echo "$Cyan \n Installing git... $Color_Off";
            sudo apt-get install git
            echo "$Green \n Git Sucessfully Installed.$Color_Off";
            break;;
        [Nn]*) exit;;
        *) echo "$Red \n Plese answer yes or no. $Color_Off";;
    esac
done


