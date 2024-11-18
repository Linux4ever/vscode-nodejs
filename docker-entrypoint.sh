#!/bin/bash

if [ -n "$GIT_REPO" ]
    then
        # start code-server
        git clone $GIT_REPO /home/coder/src
        cd /home/coder/src
        npm install
fi

if [ -n "$GIT_USERNAME" ]
    then
        git config --global user.name $GIT_USERNAME
    else
        echo ERROR: GIT_USERNAME is required. 1>&2
        exit 1 # terminate and indicate error
fi

if [ -n "$GIT_EMAIL" ]
    then
        git config --global user.email $GIT_EMAIL
    else
        echo ERROR: GIT_EMAIL is required. 1>&2
        exit 1 # terminate and indicate error
fi

if [ -n "$PASSWORD" ]
    then
        /code-server-4.95.1-linux-amd64/bin/code-server --bind-addr 0.0.0.0:8443 --auth $PASSWORD --user-data-dir /home/coder/vscode/data /home/coder/src
    else
        /code-server-4.95.1-linux-amd64/bin/code-server --bind-addr 0.0.0.0:8443 --auth none --user-data-dir /home/coder/vscode/data /home/coder/src
fi
