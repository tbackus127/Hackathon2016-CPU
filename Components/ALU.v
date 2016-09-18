/*
 * ----------------------------------------------------
 * The ALU and all of its nonsense
 * ----------------------------------------------------
 */

module AndOp(
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

module OrOp(
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

module XorOp(
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

module NotOp(
	     OperandA,
	     Result
	     );
   input  [15:0] OperandA;
   output [15:0] Result;
   
   not(Result[0],  OperandA[0]);
   not(Result[1],  OperandA[1]);   
   not(Result[2],  OperandA[2]);   
   not(Result[3],  OperandA[3]);   
   not(Result[4],  OperandA[4]);   
   not(Result[5],  OperandA[5]);   
   not(Result[6],  OperandA[6]);   
   not(Result[7],  OperandA[7]);   
   not(Result[8],  OperandA[8]);   
   not(Result[9],  OperandA[9]);   
   not(Result[10], OperandA[10]);   
   not(Result[11], OperandA[11]);   
   not(Result[12], OperandA[12]);   
   not(Result[13], OperandA[13]);   
   not(Result[14], OperandA[14]);   
   not(Result[15], OperandA[15]);
endmodule // NotOp

module carry_select_adder_subtractor(S, C, V, A, B, Op);
   output [15:0] S;   // The 16-bit sum/difference.
   output 	 C;   // The 1-bit carry/borrow status.
   output 	 V;   // The 1-bit overflow status.
   input [15:0]  A;   // The 16-bit augend/minuend.
   input [15:0]  B;   // The 16-bit addend/subtrahend.
   input 	 Op;  // The operation: 0 => Add, 1=>Subtract.
   
   wire 	 C15; // The carry out bit of adder/subtractor, used to generate final carry/borrrow.   
   wire [15:0] 	 Bx;
   
   // Looking at the truth table for not we see that  
   // B xor 0 = B, and
   // B xor 1 = not(B).
   // So, if Op==1 means we are subtracting, then
   // adding A and B xor Op alog with setting the first
   // carry bit to Op, will give us a result of
   // A+B when Op==0, and A+not(B)+1 when Op==1.
   // Note that not(B)+1 is the 2's complement of B, so
   // this gives us subtraction.     
   xor(Bx[0], B[0], Op);
   xor(Bx[1], B[1], Op);
   xor(Bx[2], B[2], Op);
   xor(Bx[3], B[3], Op);
   xor(Bx[4], B[4], Op);
   xor(Bx[5], B[5], Op);
   xor(Bx[6], B[6], Op);
   xor(Bx[7], B[7], Op);
   xor(Bx[8], B[8], Op);
   xor(Bx[9], B[9], Op);
   xor(Bx[10], B[10], Op);
   xor(Bx[11], B[11], Op);
   xor(Bx[12], B[12], Op);
   xor(Bx[13], B[13], Op);
   xor(Bx[14], B[14], Op);
   xor(Bx[15], B[15], Op);
   xor(C, C15, Op);            // Carry = C15 for addition, Carry = not(C15) for subtraction.
   carry_select_adder csa(S, C15, V, A, Bx, Op);   
endmodule // carry_select_adder_subtractor 

//The actual adder. 
module carry_select_adder(S, C, V, A, B, Cin);
   output [15:0] S;   // The 16-bit sum.
   output 	 C;   // The 1-bit carry.
   output 	 V;   // The 1-bit overflow status.
   input [15:0]  A;   // The 16-bit augend.
   input [15:0]  B;   // The 16-bit addend.
   input 	 Cin; // The initial carry in.

   
   wire [3:0] 	S1_0;   // Nibble 1 sum output with carry input 0.
   wire [3:0] 	S1_1;   // Nibble 1 sum output with carry input 1.
   wire [3:0] 	S2_0;   // Nibble 2 sum output with carry input 0.
   wire [3:0] 	S2_1;   // Nibble 2 sum output with carry input 1.
   wire [3:0] 	S3_0;   // Nibble 3 sum output with carry input 0.
   wire [3:0] 	S3_1;   // Nibble 3 sum output with carry input 1.
   wire 	C1_0;   // Nibble 1 carry output with carry input 0.
   wire 	C1_1;   // Nibble 1 carry output with carry input 1.
   wire 	C2_0;   // Nibble 2 carry output with carry input 0.
   wire 	C2_1;   // Nibble 2 carry output with carry input 1.
   wire 	C3_0;   // Nibble 3 carry output with carry input 0.
   wire 	C3_1;   // Nibble 3 carry output with carry input 1.
   wire 	C0;     // Nibble 0 carry output used to select multiplexer output.
   wire 	C1;     // Nibble 1 carry output used to select multiplexer output.
   wire 	C2;     // Nibble 2 carry output used to select multiplexer output.
   wire         V0;     // Nibble 0 overflow output.
   wire 	V1_0;   // Nibble 1 overflow output with carry input 0.
   wire 	V1_1;   // Nibble 1 overflow output with carry input 1.
   wire 	V2_0;   // Nibble 2 overflow output with carry input 0.
   wire 	V2_1;   // Nibble 2 overflow output with carry input 1.
   wire 	V3_0;   // Nibble 3 overflow output with carry input 0.
   wire 	V3_1;   // Nibble 3 overflow output with carry input 1.

   // Calculate S nibble 0.
   ripple_carry_adder rc_nibble_0(S[3:0], C0, V0, A[3:0], B[3:0], Cin);

   // Calculate S nibble 1 with carry input 0.
   ripple_carry_adder rc_nibble_1_carry_0(S1_0, C1_0, V1_0, A[7:4], B[7:4], 0);

   // Calculate S nibble 1 with carry input 1.
   ripple_carry_adder rc_nibble_1_carry_1(S1_1, C1_1, V1_1, A[7:4], B[7:4], 1);

   // Calculate S nibble 2 with carry input 0.
   ripple_carry_adder rc_nibble_2_carry_0(S2_0, C2_0, V2_0, A[11:8], B[11:8], 0);  

   // Calculate S nibble 2 with carry input 1.  
   ripple_carry_adder rc_nibble_2_carry_1(S2_1, C2_1, V2_1, A[11:8], B[11:8], 1);  

   // Calculate S nibble 3 with carry input 0.
   ripple_carry_adder rc_nibble_3_carry_0(S3_0, C3_0, V3_0, A[15:12], B[15:12], 0);

   // Calculate S nibble 3 with carry input 1.
   ripple_carry_adder rc_nibble_3_carry_1(S3_1, C3_1, V3_1, A[15:12], B[15:12], 1);  

   // C0 selects the carry output for nibble 1.
   multiplexer_2_1 #(1) muxc1(C1, C1_0, C1_1, C0);

   // C1 selects the carry output for nibble 2.
   multiplexer_2_1 #(1) muxc2(C2, C2_0, C2_1, C1);

   // C2 selects the carry output for nibble 3 which is the global carry output.
   multiplexer_2_1 #(1) muxc(C, C3_0, C3_1, C2);

   // C2 selects the overflow output for nibble 3 which is the global overflow output.
   multiplexer_2_1 #(1) muxv(V, V3_0, V3_1, C2);   

   // C0 selects the result for nibble 1.
   multiplexer_2_1 #(4) muxs1(S[7:4], S1_0, S1_1, C0); 

   // C1 selects the result for nibble 2
   multiplexer_2_1 #(4) muxs2(S[11:8], S2_0, S2_1, C1);

   // C2 selects the result for nibble 3.
   multiplexer_2_1 #(4) muxs3(S[15:12], S3_0, S3_1, C2);  
endmodule // carry_select_adder

module ripple_carry_adder(S, C, V, A, B, Cin);
   output [3:0] S;   // The 4-bit sum.
   output 	C;   // The 1-bit carry.
   output       V;   // The 1-bit overflow status.   
   input [3:0] 	A;   // The 4-bit augend.
   input [3:0] 	B;   // The 4-bit addend.
   input 	Cin; // The carry input.
 	
   wire 	C0; // The carry out bit of fa0, the carry in bit of fa1.
   wire 	C1; // The carry out bit of fa1, the carry in bit of fa2.
   wire 	C2; // The carry out bit of fa2, the carry in bit of fa3.
	
   full_adder fa0(S[0], C0, A[0], B[0], Cin);    // Least significant bit.
   full_adder fa1(S[1], C1, A[1], B[1], C0);
   full_adder fa2(S[2], C2, A[2], B[2], C1);
   full_adder fa3(S[3], C, A[3], B[3], C2);    // Most significant bit.
   xor(V, C, C2);  // Overflow   
endmodule // ripple_carry_adder

module full_adder(
		  Sum, 
		  CarryOut, 
		  A, 
		  B, 
		  CarryIn);
   output Sum;
   output CarryOut;
   input  A;
   input  B;
   input  CarryIn;
   
   wire   w1;
   wire   w2;
   wire   w3;
   wire   w4;
   
   xor(A, B, w1);
   xor(S, Cin, w1);
   and(A, B, w2);   
   and(A, Cin, w3);
   and(B, Cin, w4);   
   or(Cout, w2, w3, w4);
endmodule // full_adder

module multiplexer_2_1(X, A0, A1, S);
   parameter WIDTH=16;     // How many bits wide are the lines

   output [WIDTH-1:0] X;   // The output line

   input [WIDTH-1:0]  A1;  // Input line with id 1'b1
   input [WIDTH-1:0]  A0;  // Input line with id 1'b0
   input 	      S;  // Selection bit
   
   assign X = (S == 1'b0) ? A0 : A1;
endmodule // multiplexer_2_1


module IsEqual(
	       OperandA,
	       OperandB,
	       Result);

   input [15:0] OperandA;
   input [15:0] OperandB;
   output       Result;
   input   [15:0] Holder;
   
   XorOp Big_Xor(.OperandA(OperandA), 
		 .OperandB(OperandB), 
		 .Result(Holder));
   assign Result = 0;
   or(Result, Result, Holder[0]);
   or(Result, Result, Holder[1]);
   or(Result, Result, Holder[2]);
   or(Result, Result, Holder[3]);
   or(Result, Result, Holder[4]);
   or(Result, Result, Holder[5]);
   or(Result, Result, Holder[6]);
   or(Result, Result, Holder[7]);
   or(Result, Result, Holder[8]);
   or(Result, Result, Holder[9]);
   or(Result, Result, Holder[10]);
   or(Result, Result, Holder[11]);
   or(Result, Result, Holder[12]);
   or(Result, Result, Holder[13]);
   or(Result, Result, Holder[14]);
   or(Result, Result, Holder[15]);

   not(Result,Result);
endmodule // IsEqual

module SetH(
	    OperandA,
	    Result
	    );

   input  [15:0] OperandA;
   output [15:0] Result;

   assign Result[8] = OperandA[0];
   assign Result[9] = OperandA[1];
   assign Result[10] = OperandA[2];
   assign Result[11] = OperandA[3];
   assign Result[12] = OperandA[4];
   assign Result[13] = OperandA[5];
   assign Result[14] = OperandA[6];
   assign Result[15] = OperandA[7];
endmodule // SetH

module SetL(
	    OperandA,
	    Result
	    );

   input  [15:0] OperandA;
   output [15:0] Result;

   assign Result[0] = OperandA[0];
   assign Result[1] = OperandA[1];
   assign Result[2] = OperandA[2];
   assign Result[3] = OperandA[3];
   assign Result[4] = OperandA[4];
   assign Result[5] = OperandA[5];
   assign Result[6] = OperandA[6];
   assign Result[7] = OperandA[7];
endmodule // SetL
