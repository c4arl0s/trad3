#!/usr/bin/env bash

CURRENT_DIRECTORY_PROJECT=$(pwd)
echo "current directory project = $CURRENT_DIRECTORY_PROJECT"
#give permissions
chmod +x trad3.sh
ln -s $CURRENT_DIRECTORY_PROJECT/trad3.sh /usr/local/bin/trad3
sed -e "s/INSTALLER_PATH/$(echo $CURRENT_DIRECTORY_PROJECT | sed -e "s=/=\\\/=g")/g" -i "" directoryPaths.sh
sed -e "s/INSTALLER_PATH/$(echo $CURRENT_DIRECTORY_PROJECT | sed -e "s=/=\\\/=g")/g" -i "" trad3.sh
