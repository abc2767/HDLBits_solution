module top_module ( input a, input b, output out );
    mod_a inst(.in1(a),
               .in2(b),
               .out(out)); // it is usefult to separate the line for correcting error
endmodule