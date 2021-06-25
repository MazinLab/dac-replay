open_project dac-replay
set_top dac_table
add_files src/fine_channelizer.cpp
add_files src/fine_channelizer.hpp
add_files src/dac_replay.cpp
add_files -tb src/tb.cpp
open_solution "solution1"
set_part {xczu28dr-ffvg1517-2-e}
create_clock -period 550MHz -name default
config_export -description {Gen3 DAC Input/ADC Output} -display_name "DAC Replay" -format ip_catalog -library mkidgen3 -rtl verilog -vendor MazinLab -version 0.1
csim_design
csynth_design
cosim_design -tool xsim
export_design -flow impl -rtl verilog -format ip_catalog -description "Gen3 DAC Input/ADC Output" -vendor "MazinLab" -library "mkidgen3" -version "0.1" -display_name "DAC Replay"
