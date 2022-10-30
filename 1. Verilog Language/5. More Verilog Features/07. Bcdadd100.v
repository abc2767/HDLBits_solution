module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
	
    wire [99:1] c;
    genvar i;
    generate
        for(i = 0; i < 100; i = i +1) begin: bcd
          	if(i==0) 
                bcd_fadd fadd(.a(a[3:0]), .b(b[3:0]), .cin(cin), .cout(c[1]), .sum(sum[3:0]));
       	    else if(i == 99)
                bcd_fadd fadd(.a(a[399:396]), .b(b[399:396]), .cin(c[99]), .cout(cout), .sum(sum[399:396]));
            else bcd_fadd fadd(.a(a[4*(i+1)-1:4*i]), .b(b[4*(i+1)-1:4*i]), .cin(c[i]), .cout(c[i+1]), .sum(sum[4*(i+1)-1:4*i]));
        end

    endgenerate
endmodule
