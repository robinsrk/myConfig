#!/bin/sh


case "$1" in
    lock)
    # create a temp file
    xdotool key Escape
    sleep 0.5
    img=$(mktemp /tmp/XXXXXXXXXX.png)
    # Take a screenshot of current desktop
    import -window root $img 
    # Pixelate the screenshot
    convert $img -scale 10% -scale 1000% $img
    # Alternatively, blur the screenshot (slow!)
    #convert $img -blur 2,5 $img
    # Add the lock image
    #convert $img $icon -gravity center -composite $img
    # Run i3lock with custom background
    #i3lock -u -i $img
    # Remove the tmp file

    #       rm ~/Pictures/lock.png
    #import -window root "$(xdg-user-dir PICTURES)/lock".png
    #convert  ~/Pictures/lock.png  -scale 10% -scale 1000%  ~/Pictures/lock.png 
    betterlockscreen -u $img -l
    rm $img
        ;;
    logout)
        i3-msg exit
        ;;
    suspend)
        systemctl suspend
        ;;
    hibernate)
        systemctl hibernate
        ;;
    reboot)
        systemctl reboot
        ;;
    shutdown)
        systemctl poweroff
        ;;
    *)
        echo "Usage: $0 {lock|logout|suspend|hibernate|reboot|shutdown}"
        exit 2
esac

exit 0
