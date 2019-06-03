# Using dev-nodejs image

## List of version

## Pulling dev-nodejs images
docker pull

## Envirnoment
GIT_REPO is optional which is the url of the git repo.

GIT_USERNAME is required, use your windows username

GIT_EMAIL is required, use your work email

PASSWORD is optional to set a password to get to vscoder

## Volume to mount
/home/coder/vscode/data - vscode extensions saved to your local machine

/home/coder/.ssh - this points to your local machine ssh keys to connect to ditscm using git

/home/coder/src - this points to your local machine project file if using -e GIT_REPO=repo_url this command is not needed.

## Running dev-nodejs image
docker run -p8443:8443 -p4200:4200 -p4201:4201 -p9229:9229 -v /path/to/your/.ssh:/home/coder/.ssh -v /path/to/vscode:/home/coder/vscode/data -e GIT_REPO=repo_url

docker run -p8443:8443 -p4200:4200 -p4201:4201 -p9229:9229 -v /path/to/your/.ssh:/home/coder/.ssh -v /path/to/vscode:/home/coder/vscode/data -v /path/to/your/project:/home/coder/src

Example:
```
docker run -p8443:8443 -p4200:4200 -p4201:4201 -p9229:9229 -v ~/.ssh:/home/coder/.ssh -v ~/vscode:/home/coder/vscode/data -e GIT_REPO=repo_url -e GIT_USERNAME=username -e GIT_EMAIL=email 
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

