source TCL/definitions.tcl
# _final.enc → The final design as an Encounter database for later design changes.
saveDesign FINAL/DB/${des_designtop}_final.enc

#_final.def → Description of the complete design (used as a design exchange format).
defOut -floorplan -netlist -routing FINAL/${des_designtop}_final.def

#_final.v → A stripped down version of the final netlist without filler and corner cells, used for simulations.
saveNetlist FINAL/NETLIST/${des_designtop}_final.v
saveNetlist FINAL/NETLIST/${des_designtop}_layout.v -excludeLeafCell -includePowerGround -flat
saveNetlist FINAL/NETLIST/${des_designtop}_layout_nopwr.v -excludeLeafCell

#_final.spef → Standard Parasitic Exchange Format describing parasitic elements of the final netlist (used for analogue simulations).
setExtractRCMode -engine postRoute -effortLevel high
extractRC
rcOut -spef FINAL/${des_designtop}_final.spef

#_max.sdf → SDF (Standard Delay Format) of the circuit, which describes time delays of the nets in our final Verilog netlist. We create an SDF for the worst case scenario (largest delays)
write_sdf FINAL/${des_designtop}_layout.sdf -min_view bc -max_view wc -recompute_parallel_arcs

#_final_fe.gds → The chip layout for production
streamOut FINAL/GDS/${des_designtop}_final.gds -mapFile /opt/cadence/gpdk045_v_5_0/soce/streamOut.map -libName DesignLib -units 2000 -mode ALL
