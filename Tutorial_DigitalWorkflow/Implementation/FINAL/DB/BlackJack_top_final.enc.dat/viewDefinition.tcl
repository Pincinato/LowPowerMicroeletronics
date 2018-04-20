if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name wc_1v0\
   -timing\
    [list ${::IMEX::libVar}/mmmc/slow_vdd1v0_basicCells.lib\
    ${::IMEX::libVar}/mmmc/pads.lib]
create_library_set -name bc_1v0\
   -timing\
    [list ${::IMEX::libVar}/mmmc/fast_vdd1v2_basicCells.lib\
    ${::IMEX::libVar}/mmmc/pads.lib]
create_rc_corner -name rcx_typical\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -qx_tech_file ${::IMEX::libVar}/mmmc/gpdk045.tch
create_delay_corner -name wc\
   -library_set wc_1v0\
   -rc_corner rcx_typical
create_delay_corner -name bc\
   -library_set bc_1v0\
   -rc_corner rcx_typical
create_constraint_mode -name func_typ\
   -sdc_files\
    [list ${::IMEX::libVar}/mmmc/BlackJack_top_func.sdc]
create_analysis_view -name wc -constraint_mode func_typ -delay_corner wc
create_analysis_view -name bc -constraint_mode func_typ -delay_corner bc
set_analysis_view -setup [list wc] -hold [list bc]
