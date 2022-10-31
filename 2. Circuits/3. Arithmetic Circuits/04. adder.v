module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);

    task fadd;
        input a, b, cin;
        output cout, sum;
        begin
            {cout, sum} = a + b + cin; 
        end
    endtask
    
    wire [3:1] cout;
    
    always @(*) begin
        fadd(x[0], y[0], 0, cout[1], sum[0]);
        fadd(x[1], y[1], cout[1], cout[2], sum[1]);
        fadd(x[2], y[2], cout[2], cout[3], sum[2]);
        fadd(x[3], y[3], cout[3], sum[4], sum[3]);
    end
    
endmodule
