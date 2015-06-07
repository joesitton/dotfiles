#!/bin/sh

source ~/.config/global.conf

getOldColor() {
    echo -n $(cat ~/.config/scripts/popup.conf | grep "$1" | grep -oE "[a-zA-Z0-9]{6}")
}

getConkyColor() {
    echo -n $(cat ~/.config/conky/panel_conky | grep "$1" | grep -oE "[a-zA-Z0-9]{6}")
}

getGTKSel() {
    echo -n $(cat /usr/share/themes/Numix-ArchBlue/gtk-2.0/gtkrc | grep gtk-color-scheme | cut -d "\\" -f 5 | cut -c 21-)
}

getGTKTitle(){
    echo -n $(cat /usr/share/themes/Numix-ArchBlue/gtk-2.0/gtkrc | grep gtk-color-scheme | cut -d "\\" -f 9 | cut -c 21-)
}

sed -i "s/$(getOldColor BAR_COLOR)/$MAIN_COLOR/g" ~/.config/scripts/popup.conf
sed -i "s/$(getOldColor BG)/$BAR_BACKGROUND/g" ~/.config/scripts/popup.conf
sed -i "s/$(getOldColor FG)/$BAR_FOREGROUND/g" ~/.config/scripts/popup.conf
sed -i "s/$(getOldColor BLACK)/$BLACK2/g" ~/.config/scripts/popup.conf

sed -i "s/$(getConkyColor Main)/$MAIN_COLOR/g" ~/.config/conky/panel_conky

sed -i "s/$(getGTKSel)/$MAIN_COLOR/g" /usr/share/themes/Numix-ArchBlue/gtk-2.0/gtkrc
sed -i "s/$(getGTKTitle)/$BLACK/g" /usr/share/themes/Numix-ArchBlue/gtk-2.0/gtkrc
