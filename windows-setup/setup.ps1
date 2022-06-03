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

# Setup vim backup directories
mkdir -force -p ~/docs/backup/vim/backup/
mkdir -force -p ~/docs/backup/vim/swap/
mkdir -force -p ~/docs/backup/vim/undo/
mkdir -force -p ~/docs/backup/vim/view/

# Install scoop
$env:SCOOP="$HOME/apps/scoop"
[Environment]::SetEnvironmentVariable('SCOOP', $env:SCOOP, 'User')
Set-ExecutionPolicy RemoteSigned -scope CurrentUser -Force -Confirm:$false
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
iwr get.scoop.sh -UseBasicParsing | iex

# Install git, gh, and configure user, and decrypt .ssh
scoop install git gh
git config --global user.name $user
git config --global user.email $user@gmail.com


# Load ssh keys
# Get the drive letter (since this cna change from machine to machine, use the below)
$usb = (Get-WmiObject -Class Win32_LogicalDisk | where DriveType -eq 2).DeviceID
cd $usb
[console]::beep(180,500)  # Audio signal for input
# Decrypt ssh keys then delete gnupg directory
git-bash -c 'gpg -d .ssh.tgz.gpg | tar -xzC ~/ ; rm -r ~/.gnupg'

# Clone projects from git
#	Git needs to clone to an empty directory
#	Since scoop installs a .config file already, the below commands merge both directories
cd ~
mv .config .config~
[console]::beep(180,500)  # Audio signal for input
git clone git@github.com:$user/.config.git
mv .config~/* .config
rm -r .config~

# Point /etc/*rc files to ~/.config/ (XDG base directory standard)
'source ~/.config/vim/vimfiles/vimrc'	| Out-File -encoding ascii -NoNewline -Append ~/apps/scoop/apps/git/current/etc/vimrc
'source ~/.config/bash/bashrc'		| Out-File -encoding ascii -NoNewline -Append ~/apps/scoop/apps/git/current/etc/bash.bashrc
'$include ~/.config/bash/inputrc'	| Out-File -encoding ascii -NoNewline -Append ~/apps/scoop/apps/git/current/etc/inputrc

# Configure pty used by git-bash
cp ~/.config/mintty/minttyrc ~/apps/scoop/apps/git/current/etc

# Install other tools
scoop bucket add extras
scoop install mupdf sharex

# Install languages
scoop install python sqlite
python -m pip install pyperclip pyautogui bext dicttoxml
setx PYTHONIOENCODING utf-8

[console]::beep(180,1500)  # Audio signal that process is finished
