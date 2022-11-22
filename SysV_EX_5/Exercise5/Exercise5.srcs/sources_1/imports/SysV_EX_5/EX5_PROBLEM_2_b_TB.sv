`timescale 1ns/1ps
module MealyMachine_tb ();

logic w, clock, reset, out;

MealyMachine DUT (
   .w(w),
   .clock(clock),
   .reset(reset),
   .out(out)
);

initial 
 clock = 1'b0;
always #5
 clock = ~clock; 
    
initial begin
    w = 1'b0 ; #20;
    reset = 1'b1 ;#20;
    reset = 1'b0 ;#40;
    w = 1'b1 ;#30; 
    w = 1'b1 ;#10;
    w = 1'b0 ;#30;
    w = 1'b1 ;#40;
    w = 1'b1 ;#25;
  $finish();
end    
endmodule