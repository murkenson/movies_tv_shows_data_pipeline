# Step 1: Install Terraform
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg \
&& echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list \
&& sudo apt update \
&& sudo apt install -y terraform

echo "=============================================================================="
echo "---------------------- Terraform is installed! ----------------------"
echo "=============================================================================="

# Step 2: Install Docker
cd ~ \
&& sudo apt-get update \
&& sudo apt-get install -y docker.io 

echo "=============================================================================="
echo "---------------------- Docker is installed! ----------------------"
echo "=============================================================================="

# Step 3: Install Docker Compose
mkdir soft \
&& cd soft \
&& sudo wget https://github.com/docker/compose/releases/download/v2.24.7/docker-compose-linux-x86_64 -O  docker-compose \
&& sudo chmod +x docker-compose \
&& cd ~ \
&& echo 'export PATH="${HOME}/soft:${PATH}"' >> .bashrc \


echo "=============================================================================="
echo "---------------------- Docker Compose is installed! ----------------------"
echo "=============================================================================="

# Step 4: Add current user to Docker group and restart Docker service
sudo usermod -aG docker ${USER} 

echo "=============================================================================="
echo "---------------------- User is added! ----------------------"
echo "=============================================================================="