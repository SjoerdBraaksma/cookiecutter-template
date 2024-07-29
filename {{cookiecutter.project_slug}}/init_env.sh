#  Ensure in base environment of conda
# Install all these
echo "installing pre-commit"
command source activate base
command pip3 install pre-commit

# Install requirements.txt if it's there
if [ -f requirements.txt ]; then
    command pip3 install -r requirements.txt 
fi

# Install & activate conda environment 
conda_env=$(yq -r .name conda_env.yaml)
if if conda env list | grep -q "\b$conda_env\b"; then
    echo "A conda environment with the same name already exists, skipping installation."
else
    echo "Creating conda environment from YAML"
    command  conda env create -f conda_env.yaml 
fi
