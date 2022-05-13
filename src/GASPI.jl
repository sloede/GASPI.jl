module GASPI

using Preferences: @load_preference, @set_preferences!, @has_preference
using Reexport: @reexport

export get_gaspi_library, set_gaspi_library!

function get_gaspi_library()
  if haskey(ENV, "JULIA_GASPI_LIBRARY")
    return ENV["JULIA_GASPI_LIBRARY"]
  elseif @has_preference("gaspi_library")
    return @load_preference("gaspi_library")
  else
    error("missing path to GASPI library (specify via `set_gaspi_library!(path)` or via environment variable `JULIA_GASPI_LIBRARY`)")
  end
end

function set_gaspi_library!(path)
  @set_preferences!("gaspi_library" => path)
end

include("LibGASPI.jl")
@reexport using .LibGASPI

end # module
