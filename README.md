# Contains the files necessary for building the UniMath plugin for jsCoq

## Installation
Tested on Ubuntu 22.04.3. Did not work out of the box, so improvements are still necessary.

### Getting the prerequisites
```sh
# Install applications
sudo apt update
sudo apt install git make docker.io opam
# The newest version of nodejs is not available via apt, so we need to install it via snap
snap install node --classic
# Dune is available via the opam package manager
opam init
opam install dune coq # Not sure whether coq is necessary

# Make sure that docker has the right permissions. See for example https://phoenixnap.com/kb/docker-permission-denied
sudo groupadd -f docker
sudo usermod -aG docker $USER
newgrp docker

# Build the plugin itself
git clone https://github.com/UniMath/UniMath-jsCoq.git
cd UniMath-jsCoq
make setup
make
```