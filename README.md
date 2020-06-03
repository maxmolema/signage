# Signage

Signage is a signage platform developed for the Raspberry Pi. It uses Electron running HTML and Javascript.

# Important Note
This system has been developed for deployment where the only purpose of the system is this Signage platform. I'm working on a solution where it can run paralel with other programs. Installing this software will change settings on your Pi. (i.e. Change the wallpaper, hide the taskbar, hide the cursor.)

# Features

Signage deliveres you a custom signage platform. It was designed to be used in aviation related businesses, showing METAR's and TAF's, but can be tailored to your requirements. You supply it with a PDF link and it automatically extracts the pages as slides. It will also work **offline** using the latest downloaded pdf.

## Dependencies

Signage requires you to have the following pre-installed:

 - Raspberry Pi OS
 - Node.JS
     > Tested with Node.JS v12.16.3
 - The rest will be installed by the setup file.

## Installation

This installation assumes a fresh install of Raspberry Pi OS. For installation instructions for Raspberry Pi OS visit [the Raspberry Pi Setup](https://projects.raspberrypi.org/en/projects/raspberry-pi-setting-up) instructions page.

 1. Clone the Github repository
    `git clone git://github.com/maxmolema/signage`
  2. Execute the setup script.
    `bash setup.sh`
  3. Restart your Pi.
  
  On the next startup, your Pi should boot into the signage system. Please note that the first startup can take relatively long due to the fact that the Pi has to download & install all the required Node Packages.
## Startup
On boot the Pi will automatically startup the Signage system. It will also try to update to the latest version.

## Beta version
If you want to take part in the beta version, change the following line in the start shell script:
Change `git clone git://github.com/maxmolema/signage tmp`
to `git clone git://github.com/maxmolema/signage@beta tmp`
The beta version can include visual and performance updates, but is unsupported and might include bugs. It is not recommended to use this version in any active deployment. If you however find bugs in the program, it is highly encouraged to create an issue.

## Support
The support program includes setup, deployment, and maintenance. For more information regarding the support program, please visit signage.maxmolema.com. 
