# Setup procedure
#   Put in USB
#   In powershell: USBDRIVE/windows-setup/setup.ps1
# Tear-down procedure
#   Close all git-bash terminals
#   Close all windows open in the USB directory
#   In powershell:  USBDRIVE/windows-setup/tear-down.ps1


<#
./get-usb-name.ps1

./get-user.ps1
./make-vim-backup-dirs.ps1
./install-scoop.ps1
./install-git.ps1
./load-keys.ps1
./clone-config.ps1
./configure-rc-files.ps1
./clone-repos.ps1
./install-tools.ps1
#>

./get-usb-name.ps1
./load-keys.ps1

[console]::beep(180,500)  # Audio signal that process is finished
exit

