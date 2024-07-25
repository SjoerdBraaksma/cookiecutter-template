# import re
# import os


# if __name__ == '__main__':

#     project_name = '{{ cookiecutter.project_name }}'

#     repo_foldername= re.sub("\\\hooks", "", os.path.dirname(os.path.realpath(__file__)))
#     new_foldername= re.sub("cc_template", "test", repo_foldername)
#     os.rename(
#         repo_foldername,
#         new_foldername
#     )