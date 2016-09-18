/*
 * --------------------------------------------------------
 * Jump stuff
 * --------------------------------------------------------
 */
module ProgramCounter(
		      Opcode,
		      OperandA,
		      OperandB,
		      Count,
		      Result);

   input  [4:0]  Opcode;
   input  [15:0] OperandA;
   input  [15:0] OperandB;
   input  [4:0]  Reserve;
   output [15:0] Result;
   wire   [1:0]  OpTemp;
   reg    [16:0] Initial;
   

   assign OpTemp[0:0] = Opcode [0:0];
   assign OpTemp[1:0] = Opcode [1:0];

   assign 
   
   (Control[1] == 0
    ?(Control[0] == 0
      ? JumpIfGreaterThan Jump_Op(.OperatorA(OperandA)             //2'b00
				  .OperatorB(OperandB)
				  .Initial(Initial)
				  .Count(Count)
				  .Result(Result));
      : JumpIfLessThan    Jump_Op(.OperatorA(OperandA)            //2'b01
				  .OperatorB(OperandB)
				  .Initial(Initial)
				  .Count(Count)
				  .Result(Result));
    :(Control[0] == 0
      ? JumpIfEqual       Jump_Op(.OperatorA(OperandA)           //2'b10
				  .OperatorB(OperandB)
				  .Initial(Initial)
				  .Count(Count)
				  .Result(Result));
      : A3)          //2'b11
    ) ;
   
      
endmodule // ProgramCounter

module Jump(
	    OperatorA,
	    Initial,
	    Result);

endmodule // Jump

module JumpIfGreaterThan(
			 OperatorA,
			 OperatorB,
			 Initial,
			 Count,
			 Result);

endmodule // JumpIfGreaterThan

module JumpIfLessThan(
		      OperatorA,
		      OperatorB,
		      Initial,
		      Count,
		      Result);

endmodule // JumpIfLessThan

module JumpIfEqual(
		   OperatorA,
		   OperatorB,
		   Initial,
		   Count,
		   Result);
endmodule // JumpIfEqual


	    
