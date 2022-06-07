# Setup procedure
#   Put in USB
#   In powershell: USBDRIVE/windows-setup/setup.ps1
#
# Tear-down procedure
#   Close all git-bash terminals
#   Close all windows open in the USB directory
#   In powershell:  USBDRIVE/windows-setup/tear-down.ps1

# Get user information
[console]::beep(180,500)  # Audio signal for input
$user = read-host -p user

<#
echo ''
echo '__________________________________________________'
echo 'Setup vim backup directories'
mkdir -force -p ~/docs/backup/vim/backup/
mkdir -force -p ~/docs/backup/vim/swap/
mkdir -force -p ~/docs/backup/vim/undo/
mkdir -force -p ~/docs/backup/vim/view/

echo ''
echo '__________________________________________________'
echo 'Install scoop'
$env:SCOOP="$HOME/apps/scoop"
[Environment]::SetEnvironmentVariable('SCOOP', $env:SCOOP, 'User')
Set-ExecutionPolicy RemoteSigned -scope CurrentUser -Force -Confirm:$false
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
iwr get.scoop.sh -UseBasicParsing | iex
#>
echo ''
echo '__________________________________________________'
echo 'Install git and configure user, and decrypt .ssh'
scoop install git
git config --global user.name $user
git config --global user.email $user@gmail.com

echo ''
echo '__________________________________________________'
echo 'Decrypt ssh keys then delete gnupg directory'
$usb = (Get-WmiObject -Class Win32_LogicalDisk | where DriveType -eq 2).DeviceID
cd $usb
git-bash -c "echo -en '\007'; cd $usb ; pwd ; gpg -d keys | tar -xzC ~/ ; rm -r ~/.gnupg"
if ( -not (Test-Path -Path '~/.ssh' -PathType Container) ) { [Environment]::SetEnvironmentVariable('SCOOP', $env:SCOOP, 'User') ; read-host ABORT: Keys not loaded ; exit }
# to compress and encrypt
#   tar -cz .ssh | gpg -c > keys ; rm -r .ssh
# then delete .ssh and rename .ssh~ to .ssh
mv -force '~/.ssh/Github CLI' ~/AppData/Roaming/

echo ''
echo '__________________________________________________'
echo 'Clone config files'
#	Git needs to clone to an empty directory
#	Since scoop installs a .config file already, the below commands merge both directories
cd ~
mv .config .config~
[console]::beep(180,500)  # Audio signal for input
git clone git@github.com:$user/.config.git
mv .config~/scoop .config
rm -r -force .config~
cd $usb
if ( -not (Test-Path -Path '~/.config/vim' -PathType Container) ) { [Environment]::SetEnvironmentVariable('SCOOP', $env:SCOOP, 'User') ; read-host ABORT: config not loaded ; exit }

echo ''
echo '__________________________________________________'
echo 'Configure etc rc files to point to .config (XDG base directory standard)'
'source ~/.config/vim/vimfiles/vimrc'	| Out-File -encoding ascii -NoNewline -Append ~/apps/scoop/apps/git/current/etc/vimrc
'source ~/.config/bash/bashrc'		| Out-File -encoding ascii -NoNewline -Append ~/apps/scoop/apps/git/current/etc/bash.bashrc
'$include ~/.config/bash/inputrc'	| Out-File -encoding ascii -NoNewline -Append ~/apps/scoop/apps/git/current/etc/inputrc

echo ''
echo '__________________________________________________'
echo 'Configure pty used by git-bash'
cp ~/.config/mintty/minttyrc ~/apps/scoop/apps/git/current/etc

echo ''
echo '__________________________________________________'
echo 'Clone project files'
cd ~/docs
~/.config/windows-setup/clone-repos.ps1

echo ''
echo '__________________________________________________'
echo 'Install other tools'
scoop install gh
scoop bucket add extras
scoop install mupdf sharex

echo ''
echo '__________________________________________________'
echo 'Install languages'
scoop install python sqlite
python -m pip install pyperclip pyautogui bext dicttoxml
setx PYTHONIOENCODING utf-8

[console]::beep(180,500)  # Audio signal that process is finished
exit
