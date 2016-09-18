//-----------------------------------------------------------------------------
// 16-bit Register
//-----------------------------------------------------------------------------

module Reg16(RES, CLK, D, Q);
   

  // I/O Declarations
  input RES; //The reset bit. If this is high, all bits go to 0.
  input CLK; //Clock
  input  [15:0] D; //Creates one bus of size 16 to address the register.  
  output [15:0] Q; //Creates one bus of size 16 for output from the register.

  //This is the actual memory unit that powers the whole thing. There is one set
  //of 16 registers, as denoted by [15:0]. 
  reg    [15:0] Q;

  always @ (posedge CLK)
    if(RES)
      Q <= 0; 
    else
      Q <= D; 

endmodule // Reg16

