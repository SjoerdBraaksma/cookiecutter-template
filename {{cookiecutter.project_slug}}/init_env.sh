# Install all these in base environment of conda
echo "installing pre-commit in base conda environment"
command source activate base
command pip3 install pre-commit

# Install requirements.txt if it's there
if [ -f requirements.txt ]; then
    command pip install -r requirements.txt 
fi

# Install & activate conda environment 
conda_env=$(yq -r .name conda_env.yaml)
if [ -d ~/miniconda3/envs/$conda_env ]; then
    echo "A conda environment with the same name already exists, skipping installation."
else
    echo "Creating conda environment from YAML"
    command  conda env create -f conda_env.yaml 
fi
