#!/bin/bash

if [[ ! -e /usr/bin/lynx ]]; then
    sudo dnf config-manager --set-enabled PowerTools
    sudo dnf install lynx -y 
fi

mkdir sample-app
pushd sample-app

odo login -u developer -p developer
odo project create sample-app
odo create nodejs --s2i --git https://github.com/openshift/nodejs-ex
odo url create --port 8080
odo push
odo url list

URL=$(odo url list | awk {'print $3'})
echo "lynx $URL"
