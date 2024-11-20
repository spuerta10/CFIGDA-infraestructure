sudo apt-get update
sudo apt-get install -y docker.io
systemctl start docker
systemctl enable docker

# Fix docker daemon fetch problem
sudo groupadd docker
sudo usermod -aG docker $(whoami)

sudo service docker start