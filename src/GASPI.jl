module GASPI

using Preferences: @load_preference, @set_preferences!
using Reexport: @reexport

export get_gaspi_library, set_gaspi_library!

get_gaspi_library() = @load_preference("gaspi_library", default=ENV["JULIA_GASPI_LIBRARY"])

function set_gaspi_library!(path)
  @set_preferences!("gaspi_library" => path)
end

include("LibGASPI.jl")
@reexport using .LibGASPI

end # module
