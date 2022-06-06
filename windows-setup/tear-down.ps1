scoop uninstall scoop --purge

# Get the drive letter (since this can change from machine to machine, use the below)
$usb = (Get-WmiObject -Class Win32_LogicalDisk | where DriveType -eq 2).DeviceID


# Copy setup files to USB to capture any changes
cp -force -r ~/.config/windows-setup/* $usb/windows-setup

# Delete config files and directories
cd ~/
rm .bash_history,.lesshst,.gitconfig
rm -r -force .config,.vim,.ssh,.gnupg,apps,docs
rm -r -force 'AppData/Roaming/Github CLI'

$driveEject = New-Object -comObject Shell.Application
$driveEject.Namespace(17).ParseName($usb).InvokeVerb("Eject")

[console]::beep(180,1500)
