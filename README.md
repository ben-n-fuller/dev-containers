# Overview
This repository includes Dockerfiles and template `devcontainer.json` definitions for containerized data science and .NET development. 

The LaTex container is based on the VSCode Workshop container [example from James Yu](https://github.com/James-Yu/LaTeX-Workshop/tree/master/samples/docker).

# Prerequisites
- [Docker Engine](https://docs.docker.com/engine/install/)

# Containers
| Name | Description |
|-|-|
| Data Science | Julia, R, and Python and default packages for each |
| Data Science (GPU) | Julia, R, and Python with Tensorflow GPU acceleration |
| Dotnet Interactive | Dotnet C# and F# Jupyter notebooks |
| LaTex Live | Tools for editing and compiling LaTex documents with the VS Code LaTex Workshop extension |

# Usage
To use the dev containers:
- Install Docker (and Docker Desktop if using Windows)
- Build the required image (described below)
- Copy the `devcontainer.json` file corresponding with the desired container into `.devcontainers/devcontainer.json` at the root of the target project

## Build
| Image | Command |
|-|-|
| `data-science` | `docker build -t data-science-gpu:latest -f data-science-gpu/Dockerfile .` |
| `data-science-gpu` | `docker build -t data-science:latest -f data-science/Dockerfile .` |
| `dotnet-interactive` | `docker build -t dotnet-interactive:latest -f dotnet-interactive/Dockerfile .` |
| `tex-live` | `docker build -t tex-live:latest -f tex-live/Dockerfile .` |

## Run
### VS Code
1. Press `Ctrl+Shift+P` and search for `Dev Containers: Open Folder in Container`
2. Open the container and choose the project root
3. VS Code will launch a new window with your project running in the dev container 

### Jupyter Lab
1. Build the `data-science-jupyter` image
2. Run `docker run -p 8888:8888 data-science-lab`

## Default Packages
The list of default packages installed in the container for each language can be modified in the corresponding installer file.

| Language | Package |
|-|-|
| Julia | `install_packages.jl` |
| Python | `requirements.txt` |
| R | `install_packages.R` |
