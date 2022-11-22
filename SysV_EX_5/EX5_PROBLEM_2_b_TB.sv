`timescale 1ns/1ps
module MealyMachine_tb ();

logic w, clock, reset, out;

MealyMachine DUT (w, clock, reset, out);

initial 
 clock = 1'b0;
always #5
 clock = ~clock; 
    
initial begin
  #20  w = 1'b0 ;
  #20  reset = 1'b1 ;
  #40  reset = 1'b0 ;
  #30  w = 1'b1 ;
  #10  w = 1'b1 ;
  #30  w = 1'b0 ;
  #40  w = 1'b1 ;
  #25  w = 1'b1 ;
  $finish();
end    
endmodule