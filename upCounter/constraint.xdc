set_property PACKAGE_PIN W5 [get_ports intClk]							
	set_property IOSTANDARD LVCMOS33 [get_ports intClk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports intClk]

set_property PACKAGE_PIN W7 [get_ports {sevenSeg[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sevenSeg[6]}]
set_property PACKAGE_PIN W6 [get_ports {sevenSeg[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sevenSeg[5]}]
set_property PACKAGE_PIN U8 [get_ports {sevenSeg[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sevenSeg[4]}]
set_property PACKAGE_PIN V8 [get_ports {sevenSeg[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sevenSeg[3]}]
set_property PACKAGE_PIN U5 [get_ports {sevenSeg[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sevenSeg[2]}]
set_property PACKAGE_PIN V5 [get_ports {sevenSeg[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sevenSeg[1]}]
set_property PACKAGE_PIN U7 [get_ports {sevenSeg[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sevenSeg[0]}]

##DP not used
##set_property PACKAGE_PIN V7 [get_ports dp]							
	##set_property IOSTANDARD LVCMOS33 [get_ports dp]

set_property PACKAGE_PIN U2 [get_ports {anodes[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anodes[0]}]
set_property PACKAGE_PIN U4 [get_ports {anodes[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anodes[1]}]
set_property PACKAGE_PIN V4 [get_ports {anodes[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anodes[2]}]
set_property PACKAGE_PIN W4 [get_ports {anodes[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anodes[3]}]
	
##Buttons
set_property PACKAGE_PIN U18 [get_ports reset]						
	set_property IOSTANDARD LVCMOS33 [get_ports reset]
	
##Switches
set_property PACKAGE_PIN R2 [get_ports {pause}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {pause}]
set_property PACKAGE_PIN T1 [get_ports {speed}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {speed}]
