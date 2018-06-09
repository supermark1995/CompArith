###################################################################

# Created by write_sdc on Fri Mar 23 15:15:06 2018

###################################################################
set sdc_version 2.0

create_clock [get_ports clk]  -period 10  -waveform {0 5}
