FROM node:10.16.0-stretch

# get update for apk before install packages
RUN apt-get update
RUN apt-get install -y git openssl curl net-tools sudo libstdc++6

WORKDIR /

# get code-server
RUN wget https://github.com/cdr/code-server/releases/download/1.1119-vsc1.33.1/code-server1.1119-vsc1.33.1-linux-x64.tar.gz \
    && tar -xzvf code-server1.1119-vsc1.33.1-linux-x64.tar.gz && chmod a+x code-server1.1119-vsc1.33.1-linux-x64/code-server

RUN adduser --gecos '' --disabled-password coder && \
	echo "coder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/nopasswd

# install npm gobal packages
RUN npm install -g @angular/cli
RUN npm install -g nodemon
RUN npm install -g node-gyp

USER coder

# Copy the start script
COPY ./docker-entrypoint.sh /home/coder/docker-entrypoint.sh

# Make a folder to host ssh keys
RUN mkdir -p /home/coder/.ssh

# Make a folder for git repo
RUN mkdir -p /home/coder/src

# Make a folder for vscode data
RUN mkdir -p /home/coder/vscode/data

# expose ports
# Port 8443 - code-server
# Port 4200 - nodejs (angular ng server uses this port)
# Port 4201 - nodejs https
# Port 9229 - nodejs debugger
EXPOSE 8443 4200 4201 9229

# initiate container and start WSO2 Carbon server
ENTRYPOINT ["sh", "/home/coder/docker-entrypoint.sh"]
