#!/bin/sh
# this file exists so one can choose to not apply distro specific patches (again)
# launch other scripts
sh -c "$(curl "https://raw.githubusercontent.com/Rob9315/installscripts/master/non-distro-specific.sh")"
