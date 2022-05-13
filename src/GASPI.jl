module GASPI

using Preferences: load_preference, set_preferences!
using Reexport: @reexport

include("LibGASPI.jl")

@reexport using .LibGASPI

get_gaspi_library() = load_preference(GASPI, "gaspi_library", default=ENV["JULIA_GASPI_LIBRARY"])

function set_gaspi_library!(path)
  set_preferences!(GASPI, "gaspi_library" => path, force=true)
end

end # module
