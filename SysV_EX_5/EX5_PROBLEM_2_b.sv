`timescale 1ns/1ps

module MealyMachine (
    input logic clock,
    input logic reset,
    input logic w,
    output logic y
);
    typedef enum logic [2:0] { A, B, C, D, E } state;
    state c_state , n_state ;
    always_ff @( c_state, w ) begin
        case (c_state)
          A  : if (w) n_state = B;
               else n_state = A ;
          B  : if (w) n_state = C;
               else n_state = A ;
          C  : if (w) n_state = D;
               else n_state = A;
          D  : if (w) n_state = E;
               else n_state = A;
          E  : if (w) n_state = E;
               else n_state = A;  
            default: n_state = A;  
        endcase
    end
    always_ff @( posedge clock ) begin 
        if (reset) c_state = A ;
        else c_state = n_state ;
        
    end
endmodule