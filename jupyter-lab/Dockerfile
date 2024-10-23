FROM julia:1.10.5

# Set the working directory inside the container
WORKDIR /usr/src/app

# Install dependencies for Jupyter Lab
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    git \
    r-base \
    python3-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libgit2-dev

# Install Miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    bash ~/miniconda.sh -b -p /opt/miniconda3 && \
    rm ~/miniconda.sh

# Add Conda to the path
ENV PATH="/opt/miniconda3/bin:$PATH"

# Install Jupyter Lab
RUN conda install -y -c conda-forge jupyterlab jupyterlab-lsp jedi-language-server

# Copy the Python requirements file into the container
COPY requirements.txt .

# Install Python packages
RUN pip install -r requirements.txt

# Install ipykernel and register it with Jupyter before switching to non-root
RUN pip install ipykernel && \
    python -m ipykernel install --sys-prefix

# Install IRKernel and other R packages
COPY install_packages.R .
RUN Rscript install_packages.R

ENV JULIA_DEPOT_PATH="/usr/local/julia"

# Enable Julia notebook development
RUN julia -e 'using Pkg; Pkg.add("IJulia");' && \
    julia -e 'using IJulia; notebook()'

# Install Julia packages
COPY install_packages.jl .
RUN julia install_packages.jl

# Create a non-root user and set permissions
RUN adduser --disabled-password --gecos '' scientist && \
    mkdir -p /home/scientist && \
    chown -R scientist:scientist /home/scientist /usr/src/app /usr/local /workspaces

# Set the user
USER scientist

# Add Conda to the path
ENV PATH="/opt/miniconda3/bin:$PATH"
ENV JULIA_DEPOT_PATH="/usr/local/julia"

# Expose the default port for Jupyter Lab
EXPOSE 8888

# Start Jupyter Lab when the container starts
CMD ["jupyter-lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
