module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0] b_xor_sub;
    wire cout1, cout2;
    assign b_xor_sub = b ^ {32{sub}};
    add16 low_bit(a[15:0], b_xor_sub[15:0], sub, sum[15:0], cout1);
    add16 high_bit(a[31:16], b_xor_sub[31:16], cout1, sum[31:16], cout2);
    
endmodule
