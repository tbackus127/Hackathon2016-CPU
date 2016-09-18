module mux_8_1(X, A0, A1, A2, A3, A4, A5, A6, A7, S);   
   output [15:0] X;   // The output line

   input [15:0]  A7;  // Input line with id 3'b111
   input [15:0]  A6;  // Input line with id 3'b110
   input [15:0]  A5;  // Input line with id 3'b101
   input [15:0]  A4;  // Input line with id 3'b100
   input [15:0]  A3;  // Input line with id 3'b011
   input [15:0]  A2;  // Input line with id 3'b010
   input [15:0]  A1;  // Input line with id 3'b001
   input [15:0]  A0;  // Input line with id 3'b000
   input [2:0]	      S;   

   assign X = (S[2] == 0 
	       ? (S[1] == 0 
		  ? (S[0] == 0 
		     ? A0       // {S2,S1,S0} = 3'b000
		     : A1)      // {S2,S1,S0} = 3'b001
		  : (S[0] == 0 
		     ? A2       // {S2,S1,S0} = 3'b010
		     : A3))     // {S2,S1,S0} = 3'b011
	       : (S[1] == 0 
		  ? (S[0] == 0 
		     ? A4       // {S2,S1,S0} = 3'b100
		     : A5)      // {S2,S1,S0} = 3'b101
		  : (S[0] == 0 
		     ? A6       // {S2,S1,S0} = 3'b110
		     : A7)));   // {S2,S1,S0} = 3'b111
endmodule // multiplexer_8_1
