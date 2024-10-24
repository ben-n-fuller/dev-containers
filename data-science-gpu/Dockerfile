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
    && pip install jupyterlab jupyterlab-lsp ipykernel \
    && pip install 'python-language-server[all]' \
    && python -m ipykernel install --sys-prefix

# Install additional python packages
COPY requirements.txt .
RUN pip install -r requirements.txt

# Install IRKernel and other R packages
COPY install_packages.R .
RUN Rscript install_packages.R

# Create a non-root user and set permissions
RUN adduser --disabled-password --gecos '' scientist && \
    mkdir -p /home/scientist && \
    chown -R scientist:scientist /home/scientist /usr/src/app /usr/local

# Set the user
USER scientist

# Install juliaup
RUN curl -fsSL https://install.julialang.org -o ~/juliup.sh && \
    bash ~/juliup.sh --yes && \
    rm ~/juliup.sh

ENV PATH="/home/scientist/.juliaup/bin:$PATH"

# Install Julia packages
COPY install_packages.jl .
RUN julia install_packages.jl

# Expose port for TensorBoard (optional)
EXPOSE 6006

# Expose Jupyter
EXPOSE 8888

# Define default command
CMD ["bash"]
