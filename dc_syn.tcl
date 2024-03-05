#Read All Files
read_file -format verilog  LBP.v
#read_file -format sverilog  geofence.v
current_design LBP
link

#Setting Clock Constraints
source -echo -verbose LBP.sdc
check_design
set high_fanout_net_threshold 0
uniquify
set_fix_multiple_port_nets -all -buffer_constants [get_designs *]

#Synthesis all design
#compile -map_effort high -area_effort high
#compile -map_effort high -area_effort high -inc
compile

write -format ddc     -hierarchy -output "LBP.ddc"
write_sdf -version 1.0  LBP.sdf
write -format verilog -hierarchy -output LBP.v
report_area > area.log
report_timing > timing.log
report_qor   >  LBP.qor
