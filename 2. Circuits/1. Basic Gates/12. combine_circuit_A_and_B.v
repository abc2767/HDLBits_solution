module top_module (input x, input y, output z);
    wire [3:0] temp;
    task A;
        input x, y;
        output z;
        z = (x^y) & x;
    endtask
    
 	task B;
        input x, y;
        output z;
        z = ~(x ^ y);
    endtask
    
    always @(*) begin
        A(x, y, temp[0]);
        B(x, y, temp[1]);
        A(x, y, temp[2]);
        B(x, y, temp[3]);
        
    end
    assign z = (temp[0] | temp[1]) ^ (temp[2] & temp[3]);
endmodule
