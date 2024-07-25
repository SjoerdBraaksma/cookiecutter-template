# isntall for extracting variables from files
command sudo apt-get -y install yq
command sudo apt-get -y install jq

# Check if miniconda is installed
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

# Install all these when in base environment of conda
echo "installing pre-commit in base conda environment"
command conda init
command conda activate base
command pip install pre-commit

# Install requirements.txt if it's there
if [ -f requirements.txt ]; then
    command pip install -r requirements.txt 
fi

# Install & activate conda environment 
conda_env=$(yq -r .name conda_env.yaml)
if [ -d ~/miniconda3/envs/$conda_env ]; then
    echo "A conda environment with the same name already exists, skipping installation."
    command conda activate $conda_env
else
    echo "Creating conda environment from YAML"
    command  conda env create -f conda_env.yaml 
fi

command pip install poetry
command poetry install