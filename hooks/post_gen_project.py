import subprocess
import os

environment_files= [
    "../{{cookiecutter.project_slug}}/init_conda.sh",
    "../{{cookiecutter.project_slug}}/init_env.sh"
]

if __name__ == '__main__':

    if "{{cookiecutter.initialize_environment}}" == "true":
        for file in environment_files:
            subprocess.run(["sh", file])
            os.remove(file)
