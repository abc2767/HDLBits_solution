module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] past;
    always @(posedge clk) begin

        if(reset) begin 
            past <= {32{1'b0}};
            out <= {32{1'b0}};
        end
        else if(|(past & ~in)) begin
            out <= out | (past & ~in);
        end
        else begin
            out <= out;
        end
        past <= in;        
    end
    
endmodule
