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
- Copy the `devcontainer.*.json` file corresponding with the desired image into `.devcontainers/devcontainer.json` at the root of the target project

## Build
| Image | Command |
|-|-|
| `data-science` | `docker build -t data-science-gpu:latest -f data-science-gpu/Dockerfile .` |
| `data-science-gpu` | `docker build -t data-science:latest -f data-science/Dockerfile .` |
| `data-science-lab` | `docker build -t data-science-lab:latest -f jupyter-lab/Dockerfile .` |

## Run
### VS Code
1. Press `Ctrl+Shift+P` and search for `Dev Containers: Open Folder in Container`
2. Open the container and choose the root project directory (not `.devcontainer`)
3. Code will launch a new window with your project running in the dev container 

### Jupyter Lab
1. Build the `data-science-jupyter` image
2. Run `docker run -p 8888:8888 data-science-lab`