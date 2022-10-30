module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire cout1, cout2;
    add16 low_bit(a[15:0], b[15:0], 0, sum[15:0], cout1);
    add16 high_bit(a[31:16], b[31:16], cout1, sum[31:16], cout2);
        

    
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

    assign {cout, sum} = a + b + cin;

endmodule
