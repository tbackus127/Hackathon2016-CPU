//-----------------------------------------------------------------------------
// Not Gate
//-----------------------------------------------------------------------------
module flipFlopD

  // I/O Declarations
  (
    inD,
    inClk,
    inZero,
    inOne,
    outQ
  );
  
  // I/O Assignments
  
  input inD, inClk, inZero, inOne;
  output outQ;
    
  // Internal state  
  reg r;  
  
  always @ (posedge inClk)
    if(~inZero) begin
      r <= 1'b0;
    end
    else
      r <= inD;
    end
    
  always @ (negedge inZero)
    if(~inZero) begin
      r <= 1'b0;
    end
  
endmodule
   