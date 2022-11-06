module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
	reg ten, hundred, thousand;
    reg [3:0] q1, q2, q3;

    bcdcount counter0 (clk, reset, c_enable[0], q1);
    bcdcount counter1 (clk, reset, c_enable[1], q2);
    bcdcount counter2 (clk, reset, c_enable[2], q3);
    
    assign c_enable[0] = ~reset;
    assign c_enable[1] = ~reset & (q1 == 9 & c_enable[0]) ? 1 : 0;
    assign c_enable[2] = ~ reset & (q2 == 9 & c_enable[1]) ? 1 : 0;
    
    assign OneHertz = (q3 == 9 & c_enable[2]);

endmodule
