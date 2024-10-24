# Overview
This repository includes Dockerfiles and template `devcontainer.json` definitions to simplify data science dev container environments. 

# Containers
| Name | Description |
|-|-|
| Data Science | Base container with Julia, R, and Python and default packages for each|
| Data Science (GPU) | Container with Julia, R, and Python as well as Tensorflow and PyTorch GPU acceleration |
| Jupyter Lab | Runs the Data Science container as a Jupyter lab instance |

# Usage
To use the dev containers:
- Install Docker (and Docker Desktop if using Windows)
- Build the required images
- Copy the `devcontainer.*.json` file into `.devcontainers/devcontainer.json` in the target project

## Build
| Image | Command |
|-|-|
| `data-science` | `docker build -t data-science-gpu:latest -f data-science-gpu/Dockerfile .` |
| `data-science-gpu` | `docker build -t data-science:latest -f data-science/Dockerfile .` |
| `data-science-jupyter` | `docker build -t data-science-jupyter:latest -f jupyter-lab/Dockerfile .` |