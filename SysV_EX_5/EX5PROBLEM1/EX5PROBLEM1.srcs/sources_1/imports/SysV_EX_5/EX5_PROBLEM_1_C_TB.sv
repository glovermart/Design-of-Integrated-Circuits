`timescale 1ns/1ps
module fulladder_tb();
logic A,B,Ci,Co,So;

fulladder DUT (A,B,Ci,Co,So);

initial begin
    A = 0; B = 0 ; Ci = 0; # 10;
    A = 0; B = 0 ; Ci = 1; # 10;
    A = 0; B = 1 ; Ci = 0; # 10;
    A = 0; B = 1 ; Ci = 1; # 10;
    A = 1; B = 0 ; Ci = 0; # 10;
    A = 1; B = 0 ; Ci = 1; # 10;
    A = 1; B = 1 ; Ci = 0; # 10;
    A = 1; B = 1 ; Ci = 1; # 10;
end
endmodule