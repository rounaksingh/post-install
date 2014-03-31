#!/bin/bash  
#

VERSION="1.1"
# PACKAGE_MANAGER=""

# clear
echo "Post install script"
echo "Author  : Quentin Boileau"
echo "Contact : quentin.boileau@gmail.com"
echo "Updated by: Rounak SIngh <rounaksingh17@gmail.com>"
echo "Version : $VERSION"

sleep 2;

if [ $EUID -ne 0 ]; then
  echo "This script must be launched as root; use sudo $0" 1>&2
  exit 1
fi


#start by updating the apt-cache
# apt-get update

#install aptitude 
apt-get -y install aptitude

echo "Make temporary ./temp_dir_install directory"
mkdir -p temp_dir_install
cd ./temp_dir_install

##################
# Script global variables
##################
LIST=""
SELECTED_PACKAGES=""

select_package()
{
	SELECTED_PACKAGES=$SELECTED_PACKAGES" $1";
	echo "Selected Packages: $SELECTED_PACKAGES";
}

echo_menu_start()
{
	clear
	echo "Post install script $VERSION"
	echo "Selected Packages: $SELECTED_PACKAGES"
	echo
	echo "/Home$1 : "
	echo 
}

#install states

#dev -- Anything which is used by programmers or developers
bool_mercurial=false
bool_git=false
bool_meld=false
bool_lamp=false
bool_mongodb=false
bool_golang=false
bool_postgresql=false
bool_sublimetext_2=false
bool_sublimetext_3=false
bool_phpmyadmin=false
bool_lampp=false
bool_node=false

#internet -- anything which uses the Internet
bool_chrome=false
bool_skype=false
bool_fatrat=false
bool_filezilla=false
bool_nemodropbox=false
bool_nautilusdropbox=false

#game
bool_steam=false

#Music & Video related packages
bool_spotify=false
bool_vlc=false

#tools -- System related tools -- ease the usability
bool_gparted=false
bool_terminator=false
bool_printer=false
bool_grubcustomizer=false
bool_wireshark=false
bool_wine=false
bool_htop=false

#other
bool_equinox=false
bool_wallch=false

home_menu() {
	
	echo_menu_start;
	select choix in "Developement" "Internet" "Games" "Music" "Tools" "Others" "Do install and Exit" "Exit" 
	do 
			
	        case $REPLY in 
	                1) dev_menu ;; 
	                2) internet_menu ;; 
	                3) games_menu ;; 
	                4) music_menu ;; 
	                5) tools_menu ;; 
	                6) others_menu ;; 
	                7) start_install ;; 
	                8) exit ;; 
	                *) echo "~ unknow choice $REPLY" ;; 
	        esac 
	done 
}

dev_menu() {
	clear
	echo_menu_start "/Developement";
	select choix in "Mercurial (Hg)" "Meld" "Git" "LAMP (Apache2/PHP5/MySQL from ubuntu repo)" "MongoDB" "GO language" \
	"PostgreSQL 9.1" "Sublime Text 2 from webupd8team repo" "Sublime Text 3 from webupd8team repo" \
	"PHPMyAdmin from ubuntu repo" "LAMPP with PHPMyAdmin(from apachefriends.org)" "Node.js" "Home menu" 
	do 
	        case $REPLY in 
	                1) bool_mercurial=true ;
						select_package Mercurial;;
	                2) bool_meld=true ;
						select_package Meld;; 
	                3) bool_git=true ;
						select_package Git;;
	                4) bool_lamp=true ;
						select_package LAMP;;
					5) bool_mongodb=true ;
						select_package MongoDB;;
	                6) bool_golang=true ;
						select_package 'GO Language';;
					7) bool_postgresql=true ;
						select_package 'PostgreSQL 9.1';;
					8) bool_sublimetext_2=true ;
						select_package SublimeText_2;;
					9) bool_sublimetext_3=true ;
						select_package SublimeText_3;;
					10) bool_phpmyadmin=true ;
						select_package PHPMyAdmin;;
					11) bool_lampp=true;
						select_package "LAMPP with PHPMyAdmin";;
					12) bool_node=true;
						select_package "Node.js";;
	                13) home_menu ;; 
	                *) echo "~ unknow choice $REPLY" ;; 
	        esac 
	done 
}

internet_menu() {
	clear
	echo_menu_start "/Internet";
	select choix in "Google Chrome" "Skype" "FatRat" "Filezilla" "Dropbox-Nemo" "Dropbox-Nautilus" "Home menu" 
	do 
	        case $REPLY in 
	                1) bool_chrome=true ;
						select_package Google-Chrome;;
	                2) bool_skype=true ;
						select_package Skype;;
	                3) bool_fatrat=true ;
						select_package FatRat;;
	                4) bool_filezilla=true ;
						select_package Filezilla;;
	                5) bool_nemodropbox=true ;
						select_package Nemo-Dropbox;;
	                6) bool_nautilusdropbox=true ;
						select_package Nautilus-Dropbox;;
	                7) home_menu ;; 
	                *) echo "~ unknow choice $REPLY" ;; 
	        esac 
	done 
}


games_menu() {
	clear
	echo_menu_start "/Games";
	select choix in "Steam" "Home menu" 
	do 
	        case $REPLY in 
	                1) bool_steam=true ;
						select_package Steam;;
	                2) home_menu ;; 
	                *) echo "~ unknow choice $REPLY" ;; 
	        esac 
	done 
}

music_menu() {
	clear
	echo_menu_start "/Music";
	select choix in "Spotify" "VLC" "Home menu" 
	do 
	        case $REPLY in 
	                1) bool_spotify=true ;
						select_package Spotify;; 
	                2) bool_vlc=true ;
						select_package VLC;; 
	                3) home_menu ;; 
	                *) echo "~ unknow choice $REPLY" ;; 
	        esac 
	done 
}

tools_menu() {
	clear
	echo_menu_start "/Tools";
	select choix in "Gparted" "Terminator" "Printer Canon MP620" "Grub-Customizer" "Wireshark" "Wine-1.7" "Htop" "Home menu" 
	do 
	        case $REPLY in 
	                1) bool_gparted=true ;
						select_package Gparted;;
	                2) bool_terminator=true ;
						select_package Terminator;;
	                3) bool_printer=true ;
						select_package Printer;;
   					4) bool_grubcustomizer=true ;
						select_package Grub-Customizer;;
					5) bool_wireshark=true ;
						select_package Wireshark;;
					6) bool_wine=true ;
						select_package Wine-1.7;;
					7) bool_htop=true ;
						select_package Htop;;
	                8) home_menu ;; 
	                *) echo "~ unknow choice $REPLY" ;; 
	        esac 
	done 
}

others_menu() {
	clear
	echo_menu_start "/Others"
	select choix in "Equinox themes" "Wallch" "Home menu" 
	do 
	        case $REPLY in 
	        		1) bool_equinox=true;
						select_package Equinox;;
	                2) bool_wallch=true ;
						select_package Wallch;;
	                3) home_menu ;; 
	                *) echo "~ unknow choice $REPLY" ;; 
	        esac 
	done 
}
############################################################################################
# Install function
start_install() {

	##################################################
	#  Development Packages
	##################################################
	
	##################
	#Developement - Mercurial
	if $bool_mercurial ; then
		echo "Add Mercurial to list" 
		LIST=$LIST" mercurial"
	fi

	##################
	#Developement - Git
	if $bool_git ; then
		echo "Add Git to list" 
		LIST=$LIST" git"
	fi

	##################
	#Developement - Meld
	if $bool_meld ; then
		echo "Add Meld to list" 
		LIST=$LIST" meld"
	fi

	##################
	#Developement - Apache2/PHP5/MySQL
	if $bool_lamp ; then
		echo "Add Apache2/PHP5/MySQL to list" 
		LIST=$LIST" apache2 mysql-server php5 php5-mysql libapache2-mod-php5"
	fi

	##################
	#Developement - MongoDB
	if $bool_mongodb ; then
		echo "Add MongoDB to list" 
		LIST=$LIST" mongodb"
	fi

	##################
	#Developement - Go language
	if $bool_golang ; then
    	echo "Add Go language to list" 
		LIST=$LIST" golang"
	fi

	##################
	##Development - PostGreSQL
	if $bool_postgresql ; then
		echo "Add Postgresql 9.1 to list" 
		LIST=$LIST" libpq5 postgresql-9.1 postgresql-client-9.1 postgresql-client-common postgresql-9.1-postgis pgadmin3"
	fi

	##################
	##Development - SublimeText_2
	if $bool_sublimetext_2 ; then
		echo "Add Sublime Text 2 to list" 
		add-apt-repository -y ppa:webupd8team/sublime-text-2
		LIST=$LIST" sublime-text"
	fi

	##################
	##Development - SublimeText_3
	if $bool_sublimetext_3 ; then
		echo "Add Sublime Text 3 to list" 
		add-apt-repository -y ppa:webupd8team/sublime-text-3
		LIST=$LIST" sublime-text-installer"
	fi

	##################
	#Developement - PHPMyAdmin
	if $bool_phpmyadmin ; then
    	echo "Add PHPMyAdmin to list" 
		LIST=$LIST" phpmyadmin"
	fi

	##################################################
	#  Internet Packages
	##################################################

	##################
	#Internet - Skype
	if $bool_skype ; then
	    echo "Add Skype to list" 
		LIST=$LIST" skype libasound2-plugins"
	fi

	##################
	#Internet - Nautilus-Dropbox -- from ubuntu repo
	if $bool_nautilusdropbox ; then
		echo "Add Dropbox to list" 
		LIST=$LIST" nautilus-dropbox"
	fi

	##################
	#Internet - Nemo-Dropbox
	# if $bool_nemodropbox ; then
		
	# fi

	##################
	#Internet - Chrome Stable -- from google repo
	if $bool_chrome ; then
		echo -e "\n\n Creating a source.list file for Google Chrome"
		echo -e "#Google Chrome Repo; automatically added by post_install.sh\ndeb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list
		######################
		echo -e "\n\nInstalling Google GPG key"
		wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - -y
		echo -e "\nAdd Google Chrome to list" 
		LIST=$LIST" google-chrome-stable"
	fi

	###################
	#Internet - Filezilla -- from ubuntu repo
	if $bool_filezilla; then
		echo "Add Filezilla to list" 
		LIST=$LIST" filezilla"
	fi
	
	###################
	#Internet - FatRat -- from ubuntu repo
	if $bool_fatrat; then
	    echo "Add FatRat to list" 
		LIST=$LIST" fatrat"
	fi


	##################################################
	#  Music Packages
	##################################################

	##################
	#Music - Spotify
	if $bool_spotify ; then
		echo "Prepare Spotify" 
		sh -c 'echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list.d/spotify.list' 
		apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59 
		LIST=$LIST" spotify-client"
	fi

	##################
	#Music - VLC
	if $bool_vlc ; then
		echo "Adding VLC to list"
		LIST=$LIST" vlc"
	fi

	##################################################
	#  Tools Packages
	##################################################

	##################
	#Tools - Gparted
	if $bool_gparted ; then
	    echo "Add Gparted to list" 
		LIST=$LIST" gparted"
	fi

	##################
	#Tools - Terminator
	if $bool_terminator ; then
	   	echo "Add Terminator to list" 
		LIST=$LIST" terminator"

	fi

	##################
	#Tools - Printer Canon MP620
	#https://github.com/cloudnull/MP620-630-Linux-Printer
	if $bool_printer ; then
		echo "Get MP620 Printer script"
		git clone git://github.com/cloudnull/MP620-630-Linux-Printer.git
		cd ./MP620-630-Linux-Printer
		chmod +x install.sh
		sh ./install.sh
	fi

	##################
	#Tools - Grub-Customizer
	# if $bool_terminator ; then
	#    	echo "Add Grub-Customizer to list" 
	# 	LIST=$LIST" grub-customizer"

	# fi

	##################
	#Tools - Wireshark
	if $bool_wireshark ; then
	   	echo "Add WireShark to list" 
		LIST=$LIST" wireshark"
	fi
	
	##################
	#Tools - Wine
	if $bool_wine ; then
	   	echo "Add Wine to list" 
		# LIST=$LIST" wine" # uncomment and it will install from the debian repo
		# while below installs wine 1.7 (dev release) from ubuntu repo.
		add-apt-repository -y ppa:ubuntu-wine/ppa
		LIST=$LIST" wine1.7"

	fi

	##################
	#Tools - Htop
	if $bool_htop ; then
	   	echo "Add Htop to list" 
		LIST=$LIST" htop"

	fi

	##################################################
	#  Others functions
	##################################################

	##################
	#Others - Equinox themes
	if $bool_equinox ; then
		echo "Add Equinox themes to list" 
		add-apt-repository -y ppa:tiheum/equinox
		LIST=$LIST" gtk2-engines-equinox equinox-theme equinox-ubuntu-theme faenza-icon-theme faenza-dark-extras"
	fi

	##################
	#Others - Wallch
	if $bool_wallch ; then
		echo "Add wallch to list" 
		LIST=$LIST" wallch"
	fi


	echo "Start install of "$LIST
	# check if the LIST is not empty
	if [[ -n "$LIST" ]]; then
	aptitude update
	aptitude -y install $LIST
	fi
	
	###################################################
	# Post Installation procedure for PHPMyAdmin
	###################################################
	if $bool_phpmyadmin ; then
		
		echo -e '\n\nStarting PHPMyAdmin Post Installation Procedure:'
		echo -e '\n\n#For Phpmyadmin; Automatically edited by post_install.sh\nInclude /etc/phpmyadmin/apache.conf' >> /etc/apache2/apache2.conf
		echo -e 'Processed the Apache2 config file: /etc/apache2/apache2.conf'
		#if[ -e /etc/apache2/apache2.conf -a -e /etc/phpmyadmin/apache.conf]; then
		
		#fi

	fi

	###################################################
	# Post Installation procedure for Wine
	###################################################
	if $bool_wine ; then
		echo -e "\nConfiguring Wine...Please wait\n"
		winecfg &
	fi
	##################################################
	#  Games functions
	##################################################

	##################
	#Games - Steam -- Uncomment if you want to install steam
	# if $bool_steam ; then
	#     echo "Install Steam" 
	# 	wget http://media.steampowered.com/client/installer/steam.deb 
	# 	dpkg -i steam.deb
	# fi
	
	##################################################
	# LAMPP package
	##################################################
	##################
	# Lampp with phpmyadmin -- Uncomment if you want to install steam
	 if $bool_lampp ; then
	    echo "Installing LAMPP with phpmyadmin" 
	 	wget http://downloads.sourceforge.net/project/xampp/XAMPP%20Linux/1.8.3/xampp-linux-1.8.3-3-installer.run && chmod 700 ./xampp-linux-1.8.3-3-installer.run && ./xampp-linux-1.8.3-3-installer.run
	 fi

	##################################################
	# Node.js package
	##################################################
	##################
	# Installation of Developement - Node.js
	if $bool_node ; then
    	echo "Add Node.js to list" 
    	echo -e "\n\nStarting Installation of node -- Latest version from github.com\n"
    	echo -e "Installing Dependencies of node\n"
		aptitude -y install g++ curl libssl-dev apache2-utils git-core
		echo -e "Cloning Node.js using git from github.com\n"
		git clone https://github.com/joyent/node.git
		echo -e "Building Node.js...\n"
		cd node && ./configure && make && make install && echo -e "Node.js Installation Complete.\n" 
		cd ..
	fi

	exit
}
###################################
# MAIN

home_menu
