###################################################################

# Created by write_sdc on Thu Apr 19 08:06:24 2018

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions WORST -library pads
set_wire_load_mode top
set_wire_load_model -name 10k -library pads
set_driving_cell -lib_cell PADDO -library pads -pin PAD [get_ports cardReady]
set_driving_cell -lib_cell PADDO -library pads -pin PAD [get_ports             \
{cardValue[3]}]
set_driving_cell -lib_cell PADDO -library pads -pin PAD [get_ports             \
{cardValue[2]}]
set_driving_cell -lib_cell PADDO -library pads -pin PAD [get_ports             \
{cardValue[1]}]
set_driving_cell -lib_cell PADDO -library pads -pin PAD [get_ports             \
{cardValue[0]}]
set_driving_cell -lib_cell PADDO -library pads -pin PAD [get_ports start]
set_load -pin_load 20 [get_ports lost]
set_load -pin_load 20 [get_ports finished]
set_load -pin_load 20 [get_ports newCard]
set_load -pin_load 20 [get_ports {score[4]}]
set_load -pin_load 20 [get_ports {score[3]}]
set_load -pin_load 20 [get_ports {score[2]}]
set_load -pin_load 20 [get_ports {score[1]}]
set_load -pin_load 20 [get_ports {score[0]}]
create_clock [get_ports clk]  -period 100  -waveform {0 50}
set_clock_latency 5  [get_clocks clk]
set_clock_uncertainty 2.5  [get_clocks clk]
set_clock_transition -max -rise 2.5 [get_clocks clk]
set_clock_transition -max -fall 2.5 [get_clocks clk]
set_clock_transition -min -rise 2.5 [get_clocks clk]
set_clock_transition -min -fall 2.5 [get_clocks clk]
set_input_delay -clock clk  0  [get_ports cardReady]
set_input_delay -clock clk  0  [get_ports {cardValue[3]}]
set_input_delay -clock clk  0  [get_ports {cardValue[2]}]
set_input_delay -clock clk  0  [get_ports {cardValue[1]}]
set_input_delay -clock clk  0  [get_ports {cardValue[0]}]
set_input_delay -clock clk  0  [get_ports start]
