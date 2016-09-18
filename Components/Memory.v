//-----------------------------------------------------------------------------
// 16-bit Register
//-----------------------------------------------------------------------------

module Reg16(reset, CLK, D, Q);
   

  // I/O Declarations
  input RES; //The reset bit. If this is high, all bits go to 0.
  input CLK; //Clock
  input  [15:0] D; //Creates one bus of size 16 to address the register.  
  output [15:0] Q; //Creates one bus of size 16 for output from the register.

  //This is the actual memory unit that powers the whole thing. There is one set
  //of 16 registers, as denoted by [15:0]. 
  reg    [15:0] Q;

  //Creates 32 wires, 2 sets of 16. the first 16 are input to the register,
  //And the 2nd 16 are output from the register.
  input wire   [15:0] wRegIn;
  output wire   [15:0] wRegOut;

  always @ (posedge CLK)
    if(RES)
      wRegOut = 0; 
    else
      wRegOut = wRegIn; 

endmodule; // Reg16

