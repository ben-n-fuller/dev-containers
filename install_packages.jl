import Pkg

packages = [
    "Combinatorics",
    "DataFrames",
    "Dates",
    "Distributions",
    "ForwardDiff",
    "HDF5",
    "IterTools",
    "Optim",
    "Optimization",
    "OptimizationNLopt",
    "Polyhedra",
    "SpecialFunctions",
    "StatsBase",
    "SymbolServer",
    "ThreadsX"
]

# Install each package
for pkg in packages
    Pkg.add(pkg)
end

# Precompile each package
Pkg.precompile()