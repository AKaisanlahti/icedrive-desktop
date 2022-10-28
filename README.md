Update: This project has served its purpose as Icedrive now offers AppImage and Snap options. Please use those instead. This setup is now obsolete.

# Icedrive desktop

This is a quick fix to Gnome desktop environment I whipped up during my free time. It's intended to modify the icedrive.desktop file to point to where you installed Icedrive and add an icon so that it's nicer to use on the desktop. When Icedrive client for Linux is a bit further along, this is probably no longer useful, but this project was created during July 2020, when no icon or desktop file was included.

## Usage

Copy/clone this directory to your Icedrive folder. Run ```./icedrive-gnome-setup.sh``` with the flag ```--environment``` or ```-e``` with either ```local``` or ```global``` depending on your preference. Running just ```./icedrive-gnome-setup.sh --environment``` will tell you the directories it's going to put the desktop file to.

## Manual setup if you don't want to run the script

Just take a look at the icedrive.desktop, modify Icon and Exec how you want and put it in the directories Gnome uses. If you want to get fancy with the icons and you have all the different resolutions, check Gnome documentation for desktop icons.

## Checking the results

After running the script or putting the file in manually, running Icedrive should be easily accessible from your activities view by typing it and the icon should change from this

![No-icon](No-icon.png)

To the normal Icedrive icon

![Icedrive-icon-fixed](Icedrive-icon-fixed.png)
