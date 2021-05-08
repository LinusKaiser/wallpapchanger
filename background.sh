###################
#function to initiallize wallpapers between which the background should toggle

function input(){
  lightbackground=$1
  darkbackground=$2
  background_status=Light
}

###################

function change_wallpaper() {

  while true; do
    isdark=$(/bin/zsh -i -c "defaults read -g AppleInterfaceStyle")
    sleep 5;

#############
#as "defaults read -g AppleInterfaceStyle" can only retreive "Dark", the oposite case (Light) needs to be classified manually

    if [[ $isdark == Dark ]]; then
      boolisdark=Dark
    else
      boolisdark=Light
    fi

#############

#######
#asks wether the background has changed between the last time checked and now

    if [[ $boolisdark != $background_status ]]; then

#######

      if [[ $isdark == Dark ]]; then
        background_status=Dark
        sqlite3 ~/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '$darkbackground'";
        killall Dock;
      else
        background_status=Light
        sqlite3 ~/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '$lightbackground'";
        killall Dock;
      fi
    fi

  done
}
