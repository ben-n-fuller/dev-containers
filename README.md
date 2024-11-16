# Overview
This repository includes Dockerfiles and template `devcontainer.json` definitions for containerized data science and .NET development. 

The LaTex container is based on the VSCode Workshop container [example from James Yu](https://github.com/James-Yu/LaTeX-Workshop/tree/master/samples/docker).

# Prerequisites
- [Docker Engine for Linux](https://docs.docker.com/engine/install/)
- [Docker Desktop for Windows or Mac](https://www.docker.com/products/docker-desktop/)

# Containers
| Name | Description |
|-|-|
| Data Science | Jupyter support for Julia, R, and Python with default packages for each |
| Data Science (GPU) | Jupyter support for Julia, R, and Python with Tensorflow GPU acceleration |
| Dotnet Interactive | Dotnet C# and F# Jupyter notebooks |
| Tex Live | Tools for editing and compiling LaTex documents |

# Usage
## Open Project in Container
1. Copy the `devcontainer.json` file corresponding to the desired container into `.devcontainers/` at the root of the target project
2. Open the folder in VS Code and press `Ctrl+Shift+P` to find `Dev Containers: Open Folder in Container`
3. Open the container and choose the project root
4. VS Code will launch a new window with your project running in the dev container 

## Jupyter Notebooks
1. In VS Code, type `Ctrl+Shift+P` to open the command palette
2. Search for `Create: New Jupyter notebook`
3. In the top right, choose the kernel. Choose from `julia 1.x.x` (not release channel), `base (python 3.x.x)` (not other kernels), or `R`
