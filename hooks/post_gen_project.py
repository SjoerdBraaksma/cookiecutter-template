import os
import subprocess

environment_files = ["../{{cookiecutter.project_slug}}/init_env.sh"]

if __name__ == "__main__":

    if "{{cookiecutter.initialize_environment}}" == "true":
        for file in environment_files:
            subprocess.run(["sh", file],  check=False)
            os.remove(file)
