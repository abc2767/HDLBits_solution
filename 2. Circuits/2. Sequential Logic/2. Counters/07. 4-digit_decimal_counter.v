module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);

    reg [3:1] reg_ena;
    
    decade_counter counter1(clk, reset, 1, q[3:0]);
    decade_counter counter2(clk, reset, ena[1], q[7:4]);
    decade_counter counter3(clk, reset, ena[2], q[11:8]);
    decade_counter counter4(clk, reset, ena[3], q[15:12], );
    assign ena[1] = (q[3:0] == 9);
    assign ena[2] = (q[7:4] == 9 && ena[1]);
    assign ena[3] = (q[11:8] == 9 && ena[2]);
    
endmodule

module decade_counter(
	input clk,
    input reset,
    input enable,
    output [3:0] q
);
    reg flag;
    
    always @(posedge clk) begin

        if(reset) begin 
            q <= 0;
        end
        else if (q ==9 & enable) begin
            q <= 0;
        end
        else begin 
            q <= enable ? q + 1 : q;
   		 end
    end
    
endmodule
