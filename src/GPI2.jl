module GPI2

using Preferences: load_preference, @set_preferences!
using Reexport: @reexport
using GPI2_jll

export gaspi_logger, gaspi_run

const libGPI2 = load_preference(GPI2, "libGPI2", GPI2_jll.libGPI2)
const gaspi_logger_executable = load_preference(GPI2, "gaspi_logger_executable", GPI2_jll.gaspi_logger_path)
const gaspi_run_executable = load_preference(GPI2, "gaspi_run_executable", GPI2_jll.gaspi_run_path)

function use_jll_library()
  @set_preferences!("libGPI2" => GPI2_jll.libGPI2)
  @info "Using JLL-provided GPI-2 library. Please restart Julia for the change to take effect."
end

function use_system_library(path)
  @set_preferences!("libGPI2" => path)
  @info "Using user-provided GPI-2 library. Please restart Julia for the change to take effect."
end

function gaspi_logger()
  try
    run(`$gaspi_logger_executable`)
  catch InterruptException
    if !isinteractive()
      println("Caught Ctrl-C, stopping...")
      exit()
    end
  end
end

function gaspi_run()
  try
    run(`$gaspi_run_executable $ARGS`)
  catch InterruptException
    if !isinteractive()
      println("Caught Ctrl-C, stopping...")
      exit()
    end
  end
end

include("LibGPI2.jl")
@reexport using .LibGPI2

end # module
