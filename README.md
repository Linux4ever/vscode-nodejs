# Using dev-nodejs image

## Docker hub url
[Click Here!](https://hub.docker.com/r/linux4ever/vscode-node)

## List of version
linux4ever/vscode-node:10.16.0

## Pulling dev-nodejs images
docker pull linux4ever/vscode-node

## Envirnoment
GIT_REPO is optional which is the url of the git repo.

GIT_USERNAME is required, use your git repo username

GIT_EMAIL is required, use your git repo email

PASSWORD is optional to set a password to get to vscoder

## Volume to mount
/home/coder/vscode/data - vscode extensions saved to your local machine

/home/coder/.ssh - this points to your local machine ssh keys to connect to git repo

/home/coder/src - this points to your local machine project file

## Running dev-nodejs image
docker run -p8443:8443 -p4200:4200 -p4201:4201 -p9229:9229 -v /path/to/your/.ssh:/home/coder/.ssh -v /path/to/vscode:/home/coder/vscode/data -e GIT_REPO=repo_url linux4ever/vscode-node:10.16.0

docker run -p8443:8443 -p4200:4200 -p4201:4201 -p9229:9229 -v /path/to/your/.ssh:/home/coder/.ssh -v /path/to/vscode:/home/coder/vscode/data -v /path/to/your/project:/home/coder/src linux4ever/vscode-node:10.16.0

Example:
```
docker run -p8443:8443 -p4200:4200 -p4201:4201 -p9229:9229 -v ~/.ssh:/home/coder/.ssh -v ~/vscode:/home/coder/vscode/data -e GIT_REPO=repo_url -e GIT_USERNAME=username -e GIT_EMAIL=email linux4ever/vscode-node:10.16.0
```

## Default node global install
angular-cli
nodemon
node-gyp

## Running vscode in browser
```
http://localhost:8443/
```

## Running ng serve in vscode

use the following command:

```
ng serve --host 0.0.0.0
```
## Running node debugger
```
node --inspect 0.0.0.0 start.js
nodemon --inspect 0.0.0.0 start.js
```

## Credits
Thank you for Code-server to convert vscode into a browser format.
[Coder-Server](https://github.com/cdr/code-server)
