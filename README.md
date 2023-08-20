[![Build and Publish Docker](https://github.com/BrownCS1260/devcontainer/actions/workflows/docker-image.yml/badge.svg)](https://github.com/BrownCS1260/devcontainer/actions/workflows/docker-image.yml)

# The cs1260 Devcontainer

This is the definition of the cs1260 Docker image and devcontainer. Devcontainers (as well as GitHub Codespaces, which relies on devcontainers) provide a simple one-click install solution to set up a development environment. In this case, it sets up the compilers and tools necessary for cs1260. 

## How do I use this? 

### I want to use the cs1260 devcontainer setup

> :warning: **If you are a student who is trying to work on an assignment**: Everything, including the `.devcontainer` folder, should be set up for you within the GitHub classroom repository. You shouldn't need to refer to these instructions. Contact a TA if you need help setting up your developer environment. 

The Docker image is automatically built and published from this repository. First ensure that you have the `.devcontainer` folder in your repository. This is included by default on all cs1260 assignments. 

If you wish to spin up a GitHub codespaces, 
1. Ensure that you have GitHub codespaces enabled [here](https://github.com/features/codespaces). For students using the GitHub student developer pack, you should have ample credits to do this across a few courses. 
2. From the repository you wish to create a codespace for, click on the "<> Code" button and select codespaces. 
3. When you create a new codespace, you should be redirected to VS Code, and it will take a few minuts to set up your container. 

If you wish to use devcontainers locally on your computer: you should ensure that you have the Dev Container VS Code extension installed first. Then, clone the repository you wish to use, using {<kbd>Ctrl</kbd>/<kbd>Cmd</kbd>}-<kbd>Shift</kbd>-<kbd>P</kbd> to bring up the VS Code command palette, and search for "Dev Containers: Open Folder in Container". 

### I want to set up a version of this for my course/use case

You might want to adapt some existing version of a Vagrantfile/Dockerfile. A script in `.github` will build the Dockerfile and publish it to Dockerhub. Make sure that this file `.github/workflows/docker-image.yml` contains the correct image name you want to publish under. 

In the GitHub repository settings (of this repository), make sure that under `Environments`, you have environment secrets for `DOCKER_USERNAME` and `DOCKER_PASSWORD` for a "Production" environment. 

Finally, edit the `.devcontainer/.devcontainer.json` to reflect your use case. You should replace the image name with the name of the image you wish to use, and add any VS Code extensions or settings. 
