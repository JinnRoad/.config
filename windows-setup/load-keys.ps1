# decrypt .ssh keys

# how to do the reverse process: begin with .ssh/ and lock it under gpg
#   tar -cz .ssh | gpg -c > keys ; rm -r .ssh

./get-usb-name.ps1
cd $Global:usb

# copy ssh keys to ~/
git-bash -c "
echo -en '\007'             # make a sound to prompt user for input
cd $Global:usb              # move to the usb directory
gpg -d keys | tar -xzC ~/   # unlock gpg and decompress .ssh/ into ~/
rm -r ~/.gnupg              # remove the ~/.gnupg that stores password data
read
"

# if the above process was unsuccessful, abort the script and notify user
if ( -not (Test-Path -Path '~/.ssh' -PathType Container) ) { [Environment]::SetEnvironmentVariable('SCOOP', $env:SCOOP, 'User') ; read-host ABORT: Keys not loaded ; exit }

# copy the github cli keys so that gh will not need to authenticate
mv -force '~/.ssh/Github CLI' ~/AppData/Roaming/
