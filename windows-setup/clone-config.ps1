# Git needs to clone to an empty directory
# Since scoop installs a .config file already, the below commands merge both directories

cd ~
[console]::beep(180,500)  # Audio signal for input
git clone git@github.com:$user/.config.git tmp
mv tmp/* .config
rm -r tmp
cd $Global:usb
if ( -not (Test-Path -Path '~/.config/vim' -PathType Container) ) { [Environment]::SetEnvironmentVariable('SCOOP', $env:SCOOP, 'User') ; read-host ABORT: config not loaded ; exit }
