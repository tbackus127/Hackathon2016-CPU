//-----------------------------------------------------------------------------
// 16-bit Register
//-----------------------------------------------------------------------------

module Reg16(reset, CLK, D, Q);
   

  // I/O Declarations
  input reset;
  input CLK;
  input  [15:0] D;
  output [15:0] Q;
  reg    [15:0] Q;

  always @ (posedge CLK)
    if(reset)
      Q=0
    else
      Q=D

endmodule



//-----------------------------------------------------------------------------
// D Flip-Flop
//-----------------------------------------------------------------------------
//module flipFlopD

  // I/O Declarations
  //(
    //inD,
    //inClk,
    //inClr,
    //inSet,
    //outQ
  //);
  
  // I/O Assignments
  
  //input inD, inClk, inClr, inSet;
  //output outQ;
    
  // Internal state  
  //reg r;  
  
  // Synchronous
  //always @ (posedge inClr or negedge inClk)
    //if(inClr)
      //r <= 1'b0;
    //else
      //r <= inD;
  
//endmodule


