post_install
============

The Shell Script used after a fresh install of a linux (ubuntu/mint). The Script uses aptitude and apt-get package handling utility for installing the packages from ubuntu repositories. The Packages are selected from the display interface using options which are provided on the screen. For now, once the package is selected it can not be removed, so please select the packages carefully otherwise you need to do the selection again. 

The Packages which are supported by the scripts are mentioned in the Package_list.md files. The Package_list.md is a markdown which is created to keep a track of the Packages which are supported by this script, since the post_script.sh file is tough to read and understand at once which packages are supported. If you have added new packages, please do not forget to edit the Package list file.

Moreover, the script implements a menu-based display interface which provides the user with an ease of searching the packages (since the packages are divided into different groups), and feels good to eyes of user. It is a fantastic script for a user. However, the working of the script that is internal is little bit complicated at first. Therefore, if you are a developer then the script might give you some trouble at first, if you started working on it directly. So please read this file somemore to understand the working of the script.

## For Users
### Overview
The script is an automatic to an extent. The script provides a way to automatically install packages which are listed on Package_list.md, but it allow to select you to select which packages you need to install. The selection interface is good and has a menu like display. There is a Home menu, which displays different groups under which the packages are divided. Moreover, every group has its own menu displaying constituent packages. 

For entering user-response the script provides a prompt from which user can enter his/her response (selecting a package to install). Also, the prompt, if a package number is typed and "enter" is pressed, provides a check on the typed numbers. If a wrong package is selected, the script warns the user about it; if a package is selected, user is notified about which package has been selected. There are options for "Home menu" on the group menus for user to return to the "Home menu". User can enter choices and move through what ever menu wanted.

Furthermore, a list(of selected packages) is provided above the menu for user. This list can be of huge advantage, since while moving through different menus, the user can forget which packages he/she has selected in previous menu. So, the list keeps track of the Packages which need to be installed.

After user has finished with the selection, he/she can move on to installation part by selecting the "Do Install and Exit" option on "Home menu". The option executes the aptitude utility to download and install the selected packages. 

### Automation to a certain point
The script does not provide any automation more than this. In detail, the script does not provide any options and ways to automate the password entry, other procedure of mysql, phpmyadmin. The script should be executed only to install packages the first time, please do not use the script to re-install packages like mysql, apache2, etc. since script does not provide a way to keep the old config files. If executed for re-installation, please beware that the script will copy the new config files, and all old config files will be lost.

The script also does not provide any options to purge or remove any packages.

### Platform
For now the script is dependent on the Ubuntu and Linux Mint. Because of the package handling utility and filesystem directories.

RedHat and Fedora are not supported. May be implemented in future releases.

### How to execute
Change the permissions of post_install.sh to executable by following terminal command: (command is executed from root dir of the project)

	chmod a+x src/post_install.sh

Now, run the post_install.sh as root using the following command: (commands can be executed prepending sudo)

	./post_install.sh

If the script opens the "Home menu", then you can select the packages which you want to install and after all select the "Do Install and Exit". This will start the installation procedure.

### Post installation
For some packages like phpmyadmin, there is a post installation steps which need to be executed manually or automatically for implementing phpmyadmin using apache2 server. This step is automatically proceeded and the Include statement is appended to the apache2 config file. Please beware that the script only does the minimum configuration to make the phpmyadmin run. Please read the manual of phpmyadmin for security settings and do it manually.

## For Developers
If you want to edit or add new software support, then **FORK AWAY!**