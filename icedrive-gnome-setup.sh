#!/bin/bash
environmentkey="$1"
environment="$2"

install-global () {
    sudo cp icedrive.desktop /usr/share/applications/icedrive.desktop
    echo Installed to /usr/share/applications
}

install-local () {
    cp icedrive.desktop ~/.local/share/applications/icedrive.desktop
    echo Installed to ~/.local/share/applications/
}

prep-desktop-file () {
    chmod 664 icedrive.desktop #Feel free to edit, setting baseline permissions
    #Modifying the Exec and Icon lines to use the directory above where we are
    desktopexec="$(dirname $(pwd))/Icedrive --no-sandbox --disable-gpu"
    awk 'NR==5 {$0="Exec='"$desktopexec"'"} 1' icedrive.desktop > icedrive.desktop.tmp && mv icedrive.desktop.tmp icedrive.desktop
    desktopicon="$(dirname $(pwd))/resources/Icedrive.png"
    awk 'NR==6 {$0="Icon='"$desktopicon"'"} 1' icedrive.desktop > icedrive.desktop.tmp && mv icedrive.desktop.tmp icedrive.desktop
}

copy-icon-to-resources () {
    cp Icedrive.png ../resources/Icedrive.png
}

#Main, checking flags and running functions above
if [[ $environmentkey == "--environment" || $environmentkey == "-e" ]]; then
    if [[ $environment == "local" || $environment == "global" ]]; then
        echo Installing to $environment
        copy-icon-to-resources
        prep-desktop-file
        if [ $environment == "local" ]; then
            install-local
        else
            install-global
        fi
    else
        echo "Either use value \"local\" to install the desktop file to ~/.local/share/applications/ or use \"global\" to install to /usr/share/applications/"
    fi
else
    echo "Use environment parameter --environment or -e to configure whether icedrive is local or global"
fi


