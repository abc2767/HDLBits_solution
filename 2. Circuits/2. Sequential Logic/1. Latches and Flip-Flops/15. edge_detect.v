module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0] past;
    always @(posedge clk) begin
        past <= in;
        pedge <= in & ~past; 
    end
endmodule
