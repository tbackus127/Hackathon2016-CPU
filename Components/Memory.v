//-----------------------------------------------------------------------------
// D Flip-Flop
//-----------------------------------------------------------------------------
module flipFlopD

  // I/O Declarations
  (
    inD,
    inClk,
    inClr,
    inSet,
    outQ
  );
  
  // I/O Assignments
  
  input inD, inClk, inClr, inSet;
  output outQ;
    
  // Internal state  
  reg r;  
  
  // Synchronous
  always @ (posedge inClr or negedge inClk)
    if(inClr)
      r <= 1'b0;
    else
      r <= inD;
  
endmodule