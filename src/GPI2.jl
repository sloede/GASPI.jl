module GPI2

using Preferences: @load_preference, @set_preferences!, @has_preference
using Reexport: @reexport

export get_gpi2_library, set_gpi2_library!

function get_gpi2_library()
  if haskey(ENV, "JULIA_GPI2_LIBRARY")
    return ENV["JULIA_GPI2_LIBRARY"]
  elseif @has_preference("gpi2_library")
    return @load_preference("gpi2_library")
  else
    error("missing path to GPI-2 library (specify via `set_gpi2_library!(path)` or via environment variable `JULIA_GPI2_LIBRARY`)")
  end
end

function set_gpi2_library!(path)
  @set_preferences!("gpi2_library" => path)
end

include("LibGPI2.jl")
@reexport using .LibGPI2

end # module
