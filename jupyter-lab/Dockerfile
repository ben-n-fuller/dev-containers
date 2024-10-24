FROM data-science-gpu:latest

# Set the working directory
WORKDIR /usr/src/app

# Ensure the user is set to 'scientist'
USER scientist

# Install jedi-language-server (for Python)
RUN pip install jedi-language-server

# Install julia-language-server (for Julia)
RUN julia -e 'using Pkg; Pkg.add("LanguageServer"); Pkg.add("SymbolServer")'

# Start Jupyter Lab when the container starts
CMD ["jupyter-lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
