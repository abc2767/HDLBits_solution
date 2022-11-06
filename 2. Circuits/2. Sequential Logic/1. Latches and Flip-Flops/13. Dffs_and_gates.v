module top_module (
    input clk,
    input x,
    output z
); 
    reg q1 , q2 , q3 = 0;
	wire q2n, q3n;

    assign q2n = ~q2;
    assign q3n = ~q3;
    
    assign z = ~(q1 | q2 | q3);
    
    always @(posedge clk) begin
        q1 <= x ^ q1;
        q2 <= x & q2n;
        q3 <= x | q3n;
    end
endmodule
