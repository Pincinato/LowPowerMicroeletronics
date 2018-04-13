source TCL/definitions.tcl

#define process technology to 180nm
setDesignMode -process 180

# define standard-cell timing library sets
create_library_set -name bc_1v0 -timing [list /opt/cadence/gsclib045_all_v4.4/lan/flow/t1u1/reference_libs/GPDK045/gsclib045_all_v4.4/gsclib045/timing/fast_vdd1v2_basicCells.lib /opt/cadence/giolib045_v3.2/lan/flow/t1u1/reference_libs/GPDK045/giolib045_v3.2/giolib045/timing/pads.lib]
create_library_set -name wc_1v0 -timing [list /opt/cadence/gsclib045_all_v4.4/lan/flow/t1u1/reference_libs/GPDK045/gsclib045_all_v4.4/gsclib045/timing/slow_vdd1v0_basicCells.lib /opt/cadence/giolib045_v3.2/lan/flow/t1u1/reference_libs/GPDK045/giolib045_v3.2/giolib045/timing/pads.lib]

# define default RC corner
create_rc_corner -name rcx_typical -qx_tech_file /opt/cadence/gsclib045_all_v4.4/lan/flow/t1u1/reference_libs/GPDK045/gsclib045_all_v4.4/gsclib045/qrc/qx/gpdk045.tch
setExtractRCMode -lefTechFileMap /opt/cadence/gpdk045_v_5_0/soce/streamOut.map

# define delay corners
create_delay_corner -name wc -library_set wc_1v0 -rc_corner rcx_typical
create_delay_corner -name bc -library_set bc_1v0 -rc_corner rcx_typical

# add synopsys constraints as corner
create_constraint_mode -name func_typ -sdc_files [list CONSTRAINTS/_func.sdc]

# define analsyis views
create_analysis_view -name wc -constraint_mode func_typ -delay_corner wc
create_analysis_view -name bc -constraint_mode func_typ -delay_corner bc

# set analysis views to be used in static timing analysis
set_analysis_view -setup [list wc] -hold [list bc]
