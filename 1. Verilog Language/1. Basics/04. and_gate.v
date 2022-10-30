module top_module( 
    input a, 
    input b, 
    output out );
	assign out = a & b;    // & is bitwise-AND and && is logical-AND
endmodule
