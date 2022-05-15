# GASPI.jl
GASPI.jl is a lightweight Julia wrapper for any [GASPI](https://www.gaspi.de/)-conforming library.


## Installation
If you have not yet installed Julia, please [follow the instructions for your
operating system](https://julialang.org/downloads/platform/). GASPI.jl works
with Julia v1.7.

At the time of writing, GASPI.jl is not a registered package. Thus to install it
in your default environment, execute the following command:
```shell
julia -e 'using Pkg; Pkg.add("https://github.com/sloede/GASPI.jl.git")'
```
Alternatively, you can also just clone this repository and then instantiate it,
i.e., installing all dependencies:
```shell
git clone https://github.com/sloede/GASPI.jl.git
julia --project=GASPI.jl -e 'using Pkg; Pkg.instantiate()'
```
If you decide to use the latter approach with a cloned `GASPI.jl` directory, in
the following, you need to run all commands from within the cloned folder and
add `--project=.` to the `julia` command, e.g.,
```shell
julia --project=. -e 'using GASPI; ...'
```

Before using GASPI.jl, you need to specify the path to the GASPI
library you want to use. Thus you need to have a GASPI-conforming library installed on your
system, e.g., [GPI-2](https://github.com/cc-hpc-itwm/GPI-2). Execute
```julia
julia -e 'using GASPI; set_gaspi_library!("/path/to/libGPI2.so")'
```
where `/path/to/libGPI.so` should be the *absolute* path to your *shared* GASPI library,
e.g., to `libGPI2.so` if you are on Linux and using the
GPI-2 library. This step is necessary only once per project in which you use
GASPI.jl.


## Usage
You can start running GASPI functions after executing `using GASPI`. All GASPI
functions are prefixed by `gaspi_`. For example, to check the version of the
currently used GASPI library, start the Julia REPL and paste the following
snippet:
```julia
julia> using GASPI

julia> version = Ref{Cfloat}()
Base.RefValue{Float32}(0.0f0)

julia> gaspi_version(version)
GASPI_SUCCESS::gaspi_return_t = 0

julia> println("GASPI library version: $(version[])")
GASPI library version: 1.51
```

### Using GASPI.jl with GPI-2
If you want to start a parallel process using GPI-2's `gaspi_run`, there are
some issues you need to handle in order to make a GASPI program run properly.
They boil down to the fact that, as far as I can tell, GPI-2 uses SSH to set up
communication between nodes and uses a non-login shell for this purpose. This
means that, e.g., the `module` command prevalent on compute clusters will not
work and thus you need to manually put all relevant changes to the environment
variables directly in your `~/.bashrc` file.

As a workaround, this repository provides two auxiliary utilities:
[`storeenv.jl`](utils/storeenv.jl) and [`launcher.jl`](utils/launcher.jl). They
help you to run a GPI-2-powered Julia program on a cluster with the environment
set up using, e.g., Lmod.

First, go to the folder from which you want to start your GASPI-parallelized Julia program
and execute the `storeenv.jl` script:
```shell
julia --project=path/to/GASPI.jl path/to/storeenv.jl
```
If you installed GASPI.jl as a package instead of just cloning this repo, you
can also omit the `--project` part. The `storeenv.jl` script will record the
current environment variables and store them in a file `gaspi-jl-env.toml`.

Then, run your Julia program in parallel with the `launcher.jl` script using the
following command:
```shell
gaspi_run -m <machinefile> $(which julia) /abs/path/to/launcher.jl $(pwd)/gaspi-jl-env.toml path/to/julia/program.jl
```
The `<machinefile>` is the normal machinefile with all nodes on which to start a
GASPI rank. `$(which julia)` is required since without `module` support, the
remote ranks might not know where the Julia executable is located. The
`/abs/path/to/launcher.jl` must be an *absolute* path again. The launcher script will
take care of recreating the environment using the information in the TOML file
`$(pwd)/gaspi-jl-env.toml`. Finally, you can provide the path to the Julia
programm (and optional command line arguments to it) as the final part. The path
to the Julia program may be relative or absolute, since the launcher knows your
current directory by now.


## License and contributing
The contents of this repository are published under the MIT license (see [LICENSE](LICENSE)). We are
very happy to accept contributions from everyone, preferably in the form of a PR.


## Authors
This repository is maintained by
[Michael Schlottke-Lakemper](https://www.hlrs.de/about-us/organization/divisions-departments/av/tasc/)
(University of Stuttgart, Germany).
