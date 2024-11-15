FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get -y install --no-install-recommends apt-utils 2>&1

# Verify git and needed tools are installed
RUN apt-get install --no-install-recommends -y git procps

# Install Tex Live
RUN apt-get update && apt-get -y upgrade \
    && apt-get -y install --no-install-recommends \
    texlive-latex-base \
    texlive-extra-utils \
    texlive-latex-extra \
    biber chktex latexmk make python3-pygments python3-pkg-resources \
    texlive-bibtex-extra \
    texlive-lang-english \
    acl

# latexindent modules
RUN apt-get install --no-install-recommends -y curl
RUN curl -L http://cpanmin.us | perl - App::cpanminus \
    && cpanm Log::Dispatch::File \
    && cpanm YAML::Tiny \
    && cpanm File::HomeDir \
    && cpanm Unicode::GCString

# Clean up
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
ENV DEBIAN_FRONTEND=dialog \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

# Create the user
RUN groupadd --gid 1001 scientist \
    && useradd --uid 1001 --gid 1001 -m scientist \
    && apt-get update \
    && apt-get install -y sudo \
    && echo scientist ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/scientist \
    && chmod 0440 /etc/sudoers.d/scientist
    
# Set the user
USER scientist

CMD ["bash"]