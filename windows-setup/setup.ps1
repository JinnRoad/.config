# Setup procedure
#   Put in USB
#   In powershell: USBDRIVE/windows-setup/setup.ps1
# Tear-down procedure
#   Close all git-bash terminals
#   Close all windows open in the USB directory
#   In powershell:  USBDRIVE/windows-setup/tear-down.ps1

./get-usb-name.ps1
./get-user.ps1
./make-vim-backup-dirs.ps1
./install-scoop.ps1
./install-git.ps1
./load-keys.ps1


# store ssh password in /tmp/ssh* so that the password isn't needed on every git push
# this must be done from within git-bash as powershell sometimes cannot run ssh-agent
git-bash -c '
eval $(ssh-agent) ; ssh-add
./clone-config.ps1
./clone-repos.ps1
'

./configure-rc-files.ps1
./todo-messages.ps1
./install-tools.ps1

[console]::beep(180,500)  # Audio signal that process is finished
exit
