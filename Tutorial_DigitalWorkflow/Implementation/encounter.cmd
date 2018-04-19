#######################################################
#                                                     
#  Encounter Command Logging File                     
#  Created on Thu Apr 19 09:29:37 2018                
#                                                     
#######################################################

#@(#)CDS: Encounter v14.28-s033_1 (64bit) 03/21/2016 13:34 (Linux 2.6.18-194.el5)
#@(#)CDS: NanoRoute v14.28-s005 NR160313-1959/14_28-UB (database version 2.30, 267.6.1) {superthreading v1.25}
#@(#)CDS: CeltIC v14.28-s006_1 (64bit) 03/08/2016 00:08:23 (Linux 2.6.18-194.el5)
#@(#)CDS: AAE 14.28-s002 (64bit) 03/21/2016 (Linux 2.6.18-194.el5)
#@(#)CDS: CTE 14.28-s007_1 (64bit) Mar  7 2016 23:11:05 (Linux 2.6.18-194.el5)
#@(#)CDS: CPE v14.28-s006
#@(#)CDS: IQRC/TQRC 14.2.2-s217 (64bit) Wed Apr 15 23:10:24 PDT 2015 (Linux 2.6.18-194.el5)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
getVersion
set init_design_settop 0
set defHierChar /
set init_lef_file { /opt/cadence/gsclib045_all_v4.4/lan/flow/t1u1/reference_libs/GPDK045/gsclib045_all_v4.4/gsclib045/lef/gsclib045_tech.lef /opt/cadence/gsclib045_all_v4.4/lan/flow/t1u1/reference_libs/GPDK045/gsclib045_all_v4.4/gsclib045/lef/gsclib045_macro.lef /opt/cadence/giolib045_v3.2/lan/flow/t1u1/reference_libs/GPDK045/giolib045_v3.2/giolib045/lef/giolib045.lef}
set init_pwr_net vdd
set init_gnd_net vss
set init_verilog VERILOG/BlackJack_top_compiled.v
set init_top_cell BlackJack_top
set init_io_file CONSTRAINTS/BlackJack_IORING.io
set init_mmmc_file TCL/mmmc.tcl
win
setDrawView ameba
setDrawView fplan
setDrawView ameba
setDrawView place
init_design
selectInst CORNER4
fit
saveDesign DB/BlackJack_encounter.enc
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site CoreSite -r 0.995823529412 0.7 50.0 50 50.0 50
uiSetTool select
getIoFlowFlag
fit
saveDesign DB/BlackJack_encounter.enc
addNet -physical VSSIOR
addNet -physical VDDIOR
setNet -net VSSIOR -type special
setNet -net VDDIOR -type special
clearGlobalNets
clearGlobalNets
globalNetConnect vdd -type pgpin -pin VDD -inst * -module {}
clearGlobalNets
globalNetConnect vdd -type pgpin -pin VDD -inst *
globalNetConnect vss -type pgpin -pin VSS -inst *
clearGlobalNets
globalNetConnect vdd -type pgpin -pin VDD -inst *
globalNetConnect vss -type pgpin -pin VSS -inst *
globalNetConnect VDDIOR -type pgpin -pin VDDIOR -inst *
globalNetConnect VSSIOR -type pgpin -pin VSSIOR -inst *
clearGlobalNets
globalNetConnect vdd -type pgpin -pin VDD -inst *
globalNetConnect vss -type pgpin -pin VSS -inst *
globalNetConnect VDDIOR -type pgpin -pin VDDIOR -inst *
globalNetConnect VSSIOR -type pgpin -pin VSSIOR -inst *
clearGlobalNets
globalNetConnect vdd -type pgpin -pin VDD -inst *
globalNetConnect vss -type pgpin -pin VSS -inst *
globalNetConnect VDDIOR -type pgpin -pin VDDIOR -inst *
globalNetConnect VSSIOR -type pgpin -pin VSSIOR -inst *
saveDesign DB/BlackJack_encounter.enc
