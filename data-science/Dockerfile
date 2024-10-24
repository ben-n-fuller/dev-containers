FROM julia:latest

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

# Install additional python requirements
COPY requirements.txt .
RUN pip install -r requirements.txt

# Install ipykernel and register it with Jupyter before switching to non-root
RUN pip install ipykernel && \
    python -m ipykernel install --sys-prefix

# Install IRKernel and other R packages
COPY install_packages.R .
RUN Rscript install_packages.R

# Create a non-root user and set permissions
RUN adduser --disabled-password --gecos '' scientist && \
    mkdir -p /home/scientist && \
    chown -R scientist:scientist /home/scientist /usr/src/app /usr/local
    
# Set the user
USER scientist

# Enable Julia notebook development
RUN julia -e 'using Pkg; Pkg.add("IJulia");' && \
    julia -e 'using IJulia; notebook()'

# Install Julia packages
COPY install_packages.jl .
RUN julia install_packages.jl

# Expose the default port for Jupyter Lab
EXPOSE 8888

CMD ["bash"]
