module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 

    always @(posedge clk) begin
        if(reset) begin
           pm <= 0;
           hh <= 8'h12;
           mm <= 8'h00;
           ss <= 8'h00;
        end
        else if	(ena) begin
            hh <=  (mm == 8'h59 && ss == 8'h59) ? (hh==8'h12 ? 1 : (hh[3:0] == 9 ? {hh[7:4]+1, 4'b0000} :hh +1)) : hh;
            mm <= (ss == 8'h59) ? (mm == 8'h59 ? 0 :(mm[3:0] == 9 ? {mm[7:4]+1, 4'b0000} :mm + 1)) : mm;
            ss <= (ss == 8'h59) ? 0 : (ss[3:0] == 9 ? {ss[7:4]+1, 4'b0000} : ss + 1);
            pm <= (hh == 8'h11 && mm == 8'h59 && ss == 8'h59) ? ~pm : pm;
        end
    end
    
endmodule
