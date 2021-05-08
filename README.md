# wallpapchanger

Script can be made executable as a program with macos' automator's "shell-script execution".
Enter the following command lines into the shell-script and select the zsh shell:

cd /location/of/script
source background.sh; input /location/of/light/background /location/of/dark/background
source background.sh; change_wallpaper

Make sure that the location of the wallpapers as well as the location of the background.sh script is specified correctly
Safe the script as an executable program and add it under "login items" in your system preferences
