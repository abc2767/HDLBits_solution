module top_module( 
    input a, 
    input b, 
    output out );
  assign out = ~(a ^ b);    // ^ is bitwise-xor and there is no logical-xor
endmodule
