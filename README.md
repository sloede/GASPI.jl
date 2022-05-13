# GASPI.jl
GASPI.jl is a lightweight Julia wrapper for any GASPI-conforming library.


## Installation
If you have not yet installed Julia, please [follow the instructions for your
operating system](https://julialang.org/downloads/platform/). Trixi works
with Julia v1.7.

Execute the following command to install GASPI:
```shell
julia -e 'using Pkg; Pkg.add("https://github.com/sloede/GASPI.jl.git")'
```

Before using GASPI via GASPI.jl, you need to specify the path to the GASPI
library you want to use. Thus you need to have a GASPI library installed on your
system prior to using GASPI.jl. Execute
```julia
julia -e 'using GASPI; set_gaspi_library!("/path/to/libGPI2.so")'
```
where `/path/to/libGPI.so` should be the absolute path to your GASPI library,
e.g., to `libGPI2.so` if you are on Linux and using the
[GPI-2](https://github.com/cc-hpc-itwm/GPI-2) library. This step is necessary
only once per project in which you use GASPI.jl.


## Usage
You can start running GASPI functions after executing `using GASPI`. All GASPI
functions are prefixed by `gaspi_`. For example, to check the version of the
currently used GASPI library, start the Julia REPL and past the following
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


## License and contributing
The contents of this repository are published under the MIT license (see [LICENSE](LICENSE)). We are
very happy to accept contributions from everyone, preferably in the form of a PR.


## Authors
This repository is maintained by
[Michael Schlottke-Lakemper](https://www.hlrs.de/about-us/organization/divisions-departments/av/tasc/)
(University of Stuttgart, Germany).
