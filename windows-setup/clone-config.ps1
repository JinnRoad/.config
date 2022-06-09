# Git needs to clone to an empty directory

# Since scoop installs a .config file already, the below commands merge both directories
cd
git clone git@github.com:JinnRoad/.config.git tmp
mv .config/* tmp
rm -rf .config
mv tmp .config
