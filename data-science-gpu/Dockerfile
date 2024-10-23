# Use the official TensorFlow GPU base image
FROM tensorflow/tensorflow:latest-gpu

# Set the working directory in the container
WORKDIR /usr/src/app

# Install Linux dependencies
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    git \
    r-base \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libgit2-dev

# Install ipykernel
RUN pip install --upgrade pip \
    && pip install jupyterlab ipykernel \
    && pip install 'python-language-server[all]' \
    && python -m ipykernel install --sys-prefix

# Install additional python packages
COPY requirements.txt .
RUN pip install -r requirements.txt

# Install juliaup
RUN curl -fsSL https://install.julialang.org | sh -s -- --yes

# Install Julia packages
# COPY install_packages.jl .
# RUN julia install_packages.jl

# ENV JULIA_DEPOT_PATH="/usr/local/julia"

# Enable Julia notebook development
# RUN julia -e 'using Pkg; Pkg.add("IJulia");' && \
#     julia -e 'using IJulia; notebook()'

# Create a non-root user and set permissions
RUN adduser --disabled-password --gecos '' scientist && \
    mkdir -p /home/scientist && \
    chown -R scientist:scientist /home/scientist /usr/src/app /usr/local /workspaces

# Set the user
USER scientist

# Expose port for TensorBoard (optional)
EXPOSE 6006

# Expose Jupyter
EXPOSE 8888

# Define default command
CMD ["bash"]
