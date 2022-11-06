module top_module( 
    input [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different );
	
    always@(*) begin
        out_both = 1'h0;
        out_any = 1'h0;
        out_different = 1'h0;
        for(integer i =0; i <3; i ++) begin
            if(in[i] & in[i+1]) begin
                out_both[i] = 1; 
            end
            if(in[i+1] | in[i]) begin
                out_any[i+1]  = 1;
            end
            if(in[i+1] != in[i]) begin
                out_different[i] = 1; 
            end
        end
        if(in[3] != in[0]) out_different[3] = 1;
    end
endmodule
