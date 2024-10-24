FROM mcr.microsoft.com/dotnet/sdk:8.0

# Set the working directory in the container
WORKDIR /usr/src/app

RUN apt install -y --no-install-recommends wget && \
    apt autoremove -y && \
    apt clean

# Create a non-root user and set permissions
RUN adduser --disabled-password --gecos '' developer && \
    mkdir -p /home/developer && \
    chown -R developer:developer /home/developer /usr/src/app /usr/local

# Set the user
USER developer

# Install Miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh && \
    bash miniconda.sh -b -p /usr/local/miniconda3 && \
    rm miniconda.sh

# Add Conda to the path
ENV PATH="/usr/local/miniconda3/bin:$PATH"

RUN conda install -y jupyter

# Install .NET kernel
RUN dotnet tool install --global Microsoft.dotnet-interactive --version 1.0.522904
ENV PATH="/home/developer/.dotnet/tools:${PATH}"
ENV DOTNET_CLI_TELEMETRY_OPTOUT=1
RUN dotnet interactive jupyter install

# Run Jupyter Notebook
EXPOSE 8888
ENTRYPOINT ["bash"]