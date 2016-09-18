/*
 * ----------------------------------------------------
 * Implementation of basic logic
 * ----------------------------------------------------
 */
module alu(
	   Opcode,
	   OperandA,
	   OperandB,
	   Carry,
	   Negative,
	   Overflow,
	   Result);
   

   input  [4:0]  Opcode; //The opcode for what the ALU is actually doing
   input [15:0]  OperandA;
   input [15:0]  OperandB;

   output        Carry;
   output        Negative;
   output        Overflow;
   output [15:0] Result;
   

endmodule // alu

module andop(
	     OperandA,
	     OperandB,
	     Result);
   

   input  [15:0]  OperandA;
   input  [15:0]  OperandB;
   output [15:0]  Result;

   and(Result[0],  OperandA[0],  OperandB[0]);
   and(Result[1],  OperandA[1],  OperandB[1]);   
   and(Result[2],  OperandA[2],  OperandB[2]);   
   and(Result[3],  OperandA[3],  OperandB[3]);   
   and(Result[4],  OperandA[4],  OperandB[4]);   
   and(Result[5],  OperandA[5],  OperandB[5]);   
   and(Result[6],  OperandA[6],  OperandB[6]);   
   and(Result[7],  OperandA[7],  OperandB[7]);   
   and(Result[8],  OperandA[8],  OperandB[8]);   
   and(Result[9],  OperandA[9],  OperandB[9]);   
   and(Result[10], OperandA[10], OperandB[10]);   
   and(Result[11], OperandA[11], OperandB[11]);   
   and(Result[12], OperandA[12], OperandB[12]);   
   and(Result[13], OperandA[13], OperandB[13]);   
   and(Result[14], OperandA[14], OperandB[14]);   
   and(Result[15], OperandA[15], OperandB[15]);
endmodule // andop

module orop(
	    OperandA,
	    OperandB,
	    Result);

   input  [15:0]  OperandA;
   input  [15:0]  OperandB;
   output [15:0]  Result;

   or(Result[0],  OperandA[0],  OperandB[0]);
   or(Result[1],  OperandA[1],  OperandB[1]);   
   or(Result[2],  OperandA[2],  OperandB[2]);   
   or(Result[3],  OperandA[3],  OperandB[3]);   
   or(Result[4],  OperandA[4],  OperandB[4]);   
   or(Result[5],  OperandA[5],  OperandB[5]);   
   or(Result[6],  OperandA[6],  OperandB[6]);   
   or(Result[7],  OperandA[7],  OperandB[7]);   
   or(Result[8],  OperandA[8],  OperandB[8]);   
   or(Result[9],  OperandA[9],  OperandB[9]);   
   or(Result[10], OperandA[10], OperandB[10]);   
   or(Result[11], OperandA[11], OperandB[11]);   
   or(Result[12], OperandA[12], OperandB[12]);   
   or(Result[13], OperandA[13], OperandB[13]);   
   or(Result[14], OperandA[14], OperandB[14]);   
   or(Result[15], OperandA[15], OperandB[15]);
endmodule // orop

module xorop(
	    OperandA,
	    OperandB,
	    Result);

   
   input  [15:0]  OperandA;
   input  [15:0]  OperandB;
   output [15:0]  Result;

   xor(Result[0],  OperandA[0],  OperandB[0]);
   xor(Result[1],  OperandA[1],  OperandB[1]);   
   xor(Result[2],  OperandA[2],  OperandB[2]);   
   xor(Result[3],  OperandA[3],  OperandB[3]);   
   xor(Result[4],  OperandA[4],  OperandB[4]);   
   xor(Result[5],  OperandA[5],  OperandB[5]);   
   xor(Result[6],  OperandA[6],  OperandB[6]);   
   xor(Result[7],  OperandA[7],  OperandB[7]);   
   xor(Result[8],  OperandA[8],  OperandB[8]);   
   xor(Result[9],  OperandA[9],  OperandB[9]);   
   xor(Result[10], OperandA[10], OperandB[10]);   
   xor(Result[11], OperandA[11], OperandB[11]);   
   xor(Result[12], OperandA[12], OperandB[12]);   
   xor(Result[13], OperandA[13], OperandB[13]);   
   xor(Result[14], OperandA[14], OperandB[14]);   
   xor(Result[15], OperandA[15], OperandB[15]);
endmodule // xorop

