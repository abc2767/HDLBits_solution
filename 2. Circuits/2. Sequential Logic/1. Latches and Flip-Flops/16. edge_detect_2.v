module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg [7:0] past;
    always @(posedge clk) begin
        past <= in;
        anyedge <= past ^ in;
    end
endmodule
