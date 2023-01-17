module vga_sync
	(
		input wire clk, reset, //We need a 25MHz clock, and resettable through button press
		output wire hsync, vsync, video_on,//We signal whether hsync, vsync, and video should be on
		//Hsync and vsync should be on at all times but within the retrace period
		//Video on only within the 640x480 pixel display zone
		output wire [9:0] x, y //Multi-bit wire data for pixel position(x,y)
	);
	
	// constant declarations for VGA sync parameters
	localparam H_DISPLAY       = 640; // horizontal display area
	localparam H_L_BORDER      =  48; // horizontal left border //same as back porch
	localparam H_R_BORDER      =  16; // horizontal right border //same as front porch
	localparam H_RETRACE       =  96; // horizontal retrace
	localparam H_MAX           = H_DISPLAY + H_L_BORDER + H_R_BORDER + H_RETRACE - 1; //799
	localparam START_H_RETRACE = H_DISPLAY + H_R_BORDER; //640+16 = 656
	localparam END_H_RETRACE   = H_DISPLAY + H_R_BORDER + H_RETRACE - 1; //640+16+96-1 = 751
	
	localparam V_DISPLAY       = 480; // vertical display area
	localparam V_T_BORDER      =  10; // vertical top border
	localparam V_B_BORDER      =  33; // vertical bottom border
	localparam V_RETRACE       =   2; // vertical retrace
	localparam V_MAX           = V_DISPLAY + V_T_BORDER + V_B_BORDER + V_RETRACE - 1; //524
    localparam START_V_RETRACE = V_DISPLAY + V_B_BORDER; //480+33 = 513
	localparam END_V_RETRACE   = V_DISPLAY + V_B_BORDER + V_RETRACE - 1; //514
	
	// mod-4 counter to generate 25 MHz pixel tick
	reg [1:0] pixel_reg; //Current-State
	wire [1:0] pixel_next; //Nextstate
	wire pixel_tick; //Increment signal
	
	always @(posedge clk, posedge reset) //Uses internal clock
		if(reset)
		  pixel_reg <= 0; //Reset signal
		else
		  pixel_reg <= pixel_next; //Get the nextstate
	
	assign pixel_next = pixel_reg + 1; // increment pixel_reg 
	
	assign pixel_tick = (pixel_reg == 0); //When pixel_reg becomes 2'b11 it will roll over to 0 on next pos clock edge
	
	// registers to keep track of current pixel location
	reg [9:0] h_count_reg, h_count_next, v_count_reg, v_count_next;
	
	// register to keep track of vsync and hsync signal states
	reg vsync_reg, hsync_reg;
	wire vsync_next, hsync_next;
 
	// infer registers
	always @(posedge clk, posedge reset)
		if(reset)
		    begin //Default state
                    v_count_reg <= 0;
                    h_count_reg <= 0;
                    vsync_reg   <= 0;
                    hsync_reg   <= 0;
		    end
		else
		    begin //Next state
                    v_count_reg <= v_count_next;
                    h_count_reg <= h_count_next;
                    vsync_reg   <= vsync_next;
                    hsync_reg   <= hsync_next;
		    end
			
	// next-state logic of horizontal vertical sync counters
	always @* //combinational
		begin
		h_count_next = pixel_tick ? //Check if pixel_tick is true then check if h_count_reg is at the max and needs to roll-over  to 0 
		               (h_count_reg == H_MAX ? 0 : h_count_reg + 1)
			       : h_count_reg;
		
		v_count_next = pixel_tick && h_count_reg == H_MAX ? //If we are at bottom of screen we retrace back to top 
		               (v_count_reg == V_MAX ? 0 : v_count_reg + 1) 
			       : v_count_reg;
		end
		
        // hsync and vsync are active low signals
        // hsync signal asserted during horizontal retrace
        assign hsync_next = h_count_reg >= START_H_RETRACE
                            && h_count_reg <= END_H_RETRACE;
   
        // vsync signal asserted during vertical retrace
        assign vsync_next = v_count_reg >= START_V_RETRACE 
                            && v_count_reg <= END_V_RETRACE;

        // video only on when pixels are in both horizontal and vertical display region
        assign video_on = (h_count_reg < H_DISPLAY) 
                          && (v_count_reg < V_DISPLAY);

        // output signals
        assign hsync  = hsync_reg;
        assign vsync  = vsync_reg;
        assign x      = h_count_reg;
        assign y      = v_count_reg;
endmodule