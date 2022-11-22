`timescale 1ps/1fs


module XORX1 (A, B, C);
  input A, B;
  output C;
  assign C = A ^ B ;
endmodule
    
module ANDX1 (A, B, C);
  input A, B;
  output C;
  assign C = A & B ;
endmodule
    
module ORX1 (A, B, C);
  input A, B;
  output C;
  assign C = A | B ;
endmodule

module Cout (A, B, Ci,Co);
  input A, B, Ci;
  output Co;
  logic x1, x2 , x3, x4 ;
  ANDX1 and1 (A, B, x1);
  ANDX1 and2 (A, Ci, x2);
  ANDX1 and3 (B, Ci, x3);
  ORX1 or1 (x1, x2, x4);
  ORX1 or2 (x4, x3, Co);
endmodule

module Sout (A, B, Ci, So);
  input A, B,Ci;
  output So;
  logic x1;
  XORX1 xor1 (A, B, x1 );
  XORX1 xor2 (Ci, x1, So);

endmodule

module fulladder (A, B, Ci, Co, So);
    input  A, B, Ci;
    output  Co, So;
    
    Cout CO (A, B, Ci, Co);
    Sout SO ( A, B, Ci, So);

    specify 
    (A, B, Ci => Co) = (500, 781);
    (A, B, Ci => So) = (245, 237);
    endspecify

endmodule