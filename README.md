# Overview
This repository includes Dockerfiles and template `devcontainer.json` definitions for containerized data science and .NET development. 

# Containers
| Name | Description |
|-|-|
| Data Science | Base container with Julia, R, and Python and default packages for each|
| Data Science (GPU) | Container with Julia, R, and Python with Tensorflow GPU acceleration |
| Jupyter Lab | Runs the Data Science container as a Jupyter lab instance |
| Dotnet Interactive | Dotnet C# and F# Jupyter notebooks |

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
| `data-science-lab` | `docker build -t data-science-lab:latest -f jupyter-lab/Dockerfile .` |
| `dotnet-interactive` | `docker build -t dotnet-interactive:latest -f dotnet-interactive/Dockerfile .` |

## Run
### VS Code
1. Press `Ctrl+Shift+P` and search for `Dev Containers: Open Folder in Container`
2. Open the container and choose the project root
3. VS Code will launch a new window with your project running in the dev container 

### Jupyter Lab
1. Build the `data-science-jupyter` image
2. Run `docker run -p 8888:8888 data-science-lab`
