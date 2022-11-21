module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q
	
    wire [2:0] D;
    assign D = KEY[1] ? SW :  {LEDR[1] ^ LEDR[2], LEDR[0] , LEDR[2]};
    
    always @(posedge KEY[0]) begin
        LEDR <= D;
    end

endmodule