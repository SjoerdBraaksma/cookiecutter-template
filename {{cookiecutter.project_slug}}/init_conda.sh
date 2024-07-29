# install for extracting variables from files
command sudo apt-get -y install yq
command sudo apt-get -y install jq

# Check if miniconda is installed (put this in separate script, since after install it needs to initialize and restart shell)
if [ -d ~/miniconda3 ]; then
    echo "Miniconda3 already installed at ~/miniconda3, skipping miniconda3 installation."
else
    echo "Installing miniconda 3"
    mkdir -p ~/miniconda3
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
    bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
    rm -rf ~/miniconda3/miniconda.sh

    echo "Initializing miniconda"
    ~/miniconda3/bin/conda init bash
    ~/miniconda3/bin/conda init zsh
fi

command conda init