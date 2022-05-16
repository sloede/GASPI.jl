module GPI2

using Preferences: load_preference, @set_preferences!
using Reexport: @reexport
using GPI2_jll

const libGPI2 = load_preference(GPI2, "libGPI2", GPI2_jll.libGPI2)

function use_jll_library()
  @set_preferences!("libGPI2" => GPI2_jll.libGPI2)
  @info "Using JLL-provided GPI-2 library. Please restart Julia for the change to take effect."
end

function use_system_library(path)
  @set_preferences!("libGPI2" => path)
  @info "Using user-provided GPI-2 library. Please restart Julia for the change to take effect."
end

include("LibGPI2.jl")
@reexport using .LibGPI2

end # module
