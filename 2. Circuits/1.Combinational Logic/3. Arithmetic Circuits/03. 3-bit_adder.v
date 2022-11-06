module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );

    task fadd;
        input a, b, cin;
        output cout, sum;
        begin
            {cout, sum} = a + b + cin; 
        end
    endtask
    
    always @(*) begin
    	fadd(a[0], b[0], cin, cout[0], sum[0]);
        fadd(a[1], b[1], cout[0], cout[1], sum[1]);
        fadd(a[2], b[2], cout[1], cout[2], sum[2]);
    end
endmodule
