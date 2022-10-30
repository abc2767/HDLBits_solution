module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout1, cout2, cout3;
    wire [31:16] sum0, sum1;
    add16 low_bit(a[15:0], b[15:0], 0, sum[15:0], cout1);
    add16 high_with_zero(a[31:16], b[31:16], 0, sum0[31:16], cout2);
    add16 high_with_one(a[31:16], b[31:16], 1, sum1[31:16], cout3);
    
    assign sum[31:16] = cout1 ? sum1[31:16] : sum0[31:16];
endmodule
