#!/bin/bash

#Enable ARD for Specific Users
/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -configure -allowAccessFor -specifiedUsers

#Enable ARD Agent for CRADMIN
/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate -configure -access -on -users cradmin -privs -all -restart -agent -menu

#Enable SSH
systemsetup -setremotelogin on

#Create SSH Group
dseditgroup -o create -q com.apple.access_ssh

#Add CRADMIN to SSH Group
dseditgroup -o edit -a cradmin -t user com.apple.access_ssh

