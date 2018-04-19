source TCL/definitions.tcl

#Import Design and LEF Files
set init_design_settop 0
set defHierChar /
set init_lef_file { /opt/cadence/gsclib045_all_v4.4/lan/flow/t1u1/reference_libs/GPDK045/gsclib045_all_v4.4/gsclib045/lef/gsclib045_tech.lef /opt/cadence/gsclib045_all_v4.4/lan/flow/t1u1/reference_libs/GPDK045/gsclib045_all_v4.4/gsclib045/lef/gsclib045_macro.lef /opt/cadence/giolib045_v3.2/lan/flow/t1u1/reference_libs/GPDK045/giolib045_v3.2/giolib045/lef/giolib045.lef}
set init_pwr_net vdd
set init_gnd_net vss
set init_verilog "VERILOG/${des_designtop}_compiled.v"
set init_top_cell ${des_designtop}
set init_io_file CONSTRAINTS/BlackJack_IORING.io
set init_mmmc_file TCL/mmmc.tcl

