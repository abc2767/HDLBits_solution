module top_module (
    input clk,
    input d,
    output q
);
    reg q1, q2;
    reg sel1, sel2 = 0;

    always @(posedge clk) begin
       sel1 <= ~sel1;
       q1 <= d;
    end
    
    always @(negedge clk) begin
       q2 <= d;
       sel2 <= ~sel2;
    end
    
    assign q = sel1 ^ sel2 ? q1 : q2;
    
endmodule
