////////Control unit

module Contorl(opp, R1, R2, QR, RES);//takes in program counter and sends out control back to to program counter and ALU
//Declare inputs and outputs
  input [4:0]opp;//
  input [2:0]R1;
  input [2:0]R2;
  input [2:0]QR;
  input [1:0]RES;

  reg [1:0]Carry;
  reg Overflow;
  wire [15:0]aluResult;
  wire [15:0]moveResult;
  wire [15:0]jumpResult;
  

  ALU(.[15:0]R1, .[15:0]R2, [15:0]aluResult);
  move (.[:0]R1, .[15:0]moveResult);
  mux_31_1([4:0]opp,
            16'b00,
            [15:0]aluResult,//ADD
            [15:0]aluResult,//ADC
            [15:0]aluResult,//SUB
            [15:0]aluResult,//SDC
            [15:0]aluResult,//SBB
            [15:0]aluResult,//AND
            [15:0]aluResult,//OR
            [15:0]aluResult,//XOR
            [15:0]aluResult,//NOT
            [15:0]aluResult,//SHFT
            [15:0]moveResult,//MOV
            16'b00,//[15:0]jumpResult,//JMP
            16'b00,//[15:0]Result,//JGO
            16'b00,//[15:0]Result,//JLO
            16'b00,//[15:0]Result,//JEO
            16'b00,//hlt
            16'b00,//rst
            [15:0]Result,//SETH
            [15:0]Result,//SETL
            16'b00,
            16'b00,
            16'b00,
            16'b00,
            16'b00,
            16'b00,
            16'b00,
            16'b00,
            16'b00,
            16'b00,
            16'b00,
            16'b00);
  wire [15:0]RESULT
  //ALU(.[15:0]R1, .[15:0]R2, [15:0]aluResult);
  //move (.[:0]R1, .[15:0]moveResult);
  mux_31_1 MUX(.[4:0]opp,
            .16'b00,
            .[15:0]aluResult,//ADD
            .[15:0]aluResult,//ADC
            .[15:0]aluResult,//SUB
            .[15:0]aluResult,//SDC
            .[15:0]aluResult,//SBB
            .[15:0]aluResult,//AND
            .[15:0]aluResult,//OR
            .[15:0]aluResult,//XOR
            .[15:0]aluResult,//NOT
            .[15:0]aluResult,//SHFT
            .[15:0]moveResult,//MOV
            .16'b00,//[15:0]jumpResult,//JMP
            .16'b00,//[15:0]Result,//JGO
            .16'b00,//[15:0]Result,//JLO
            .16'b00,//[15:0]Result,//JEO
            .16'b00,//hlt
            .16'b00,//rst
            .[15:0]Result,//SETH
            .[15:0]Result,//SETL
            .16'b00,
            .16'b00,
            .16'b00,
            .16'b00,
            .16'b00,
            .16'b00,
            .16'b00,
            .16'b00,
            .16'b00,
            .16'b00,
            .16'b00,
            .16'b00
            .RESULT);
endmodule//Control

module mux_32_1 (
		 Control,
		 A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12,
		 A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23,
		 A24, A25, A26, A27, A28, A29, A30, A31, Result);

   input  [15:0] A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12,
		 A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23,
		 A24, A25, A26, A27, A28, A29, A30, A31;
   input  [4:0]  Control;
   output [15:0] Result;

   assign Result = (Control[4] == 0
		    ?(Control[3] == 0
		      ?(Control[2] == 0
			?(Control[1] == 0
			  ?(Control[0] == 0
			    ? A0             //5'b00000
			    : A1)            //5'b00001
			  :(Control[0] == 0
			    ? A2             //5'b00010
			    : A3)
			  )           //5'b00011
			:(Control[1] == 0
			  ?(Control[0] == 0
			    ? A4             //5'b00100
			    : A5)            //5'b00101
			  :(Control[0] == 0
			    ? A6             //5'b00110
			    : A7)
			  )
			)          //5'b00111
		      :(Control[2] == 0
			?(Control[1] == 0
			  ?(Control[0] == 0
			    ? A8             //5'b01000
			    : A9)            //5'b01001
			  :(Control[0] == 0
			    ? A10            //5'b01010
			    : A11)
			  )          //5'b01011
			:(Control[1] == 0
			  ?(Control[0] == 0
			    ? A12            //5'b01100
			    : A13)           //5'b01101
			  :(Control[0] == 0
			    ? A14            //5'b01110
			    : A15)
			  )
			)
		      )         //5'b01111
		    :(Control[3] == 0
		      ?(Control[2] == 0
			?(Control[1] == 0
			  ?(Control[0] == 0
			    ? A16              //5'b10000
			    : A17)             //5'b10001
			  :(Control[0] == 0
			    ? A18              //5'b10010
			    : A19)
			  )            //5'b10011
			:(Control[1] == 0
			  ?(Control[0] == 0
			    ? A20              //5'b10100
			    : A21)             //5'b10101
			  :(Control[0] == 0
			    ? A22              //5'b10110
			    : A23)
			  )
			)
		                //5'b10111
		    :(Control[2] == 0
			?(Control[1] == 0
			  ?(Control[0] == 0
			    ? A24              //5'b11000
			    : A25)             //5'b11001
			  :(Control[0] == 0
			    ? A26              //5'b11010
			    : A27)
			  )            //5'b11011
			:(Control[1] == 0
			  ?(Control[0] == 0
			    ? A28              //5'b11100
			    : A29)             //5'b11101
			  :(Control[0] == 0
			    ? A30              //5'b11110
			    : A31)
			  )
		      )
		      )
		    )       //5'b11111
		    ;
endmodule // mux_32_1

module memory(address, inreg, outreg);
  input [2:0] address;
  input [15:0]inreg;
  output [15:0]outreg;

  reg[15:7]registers;

  reg[15:0] reg1;
  reg[15:1] reg2;
  reg[15:2] reg3;
  reg[15:3] reg4;
  reg[15:3] reg4;
  reg[15:5] reg6;
  reg[15:6] reg7;
  reg[15:7] reg8;
//3-1MUX
  mux_8_1(X, .[15:0]reg1, .[15:0]reg2, .[15:0]reg3, .[15:0]reg4, .[15:0]reg5, .[15:0]reg6, .[15:0]reg7, .[15:0]reg8, .[2:0]address);

endmodule//memory

module WriteToReg(
		   RegNum,
		   Data,
		   RegList,
		   Regs
		   );

   input  [2:0]  RegNum;  //The register number to write to
   input  [15:0] Data;    //The data to write to the register
   input  [15:7] RegList; //The full list of registers
   output [15:7] Regs;    //The full list of registers
   wire 	 Holder;  //Don't worry about it.
   

   assign Holder = (RegNum[2] == 0 
		    ? (RegNum[1] == 0 
		       ? (RegNum[0] == 0 
			  ? 0       // {S2,S1,S0} = 3'b000
			  : 1)      // {S2,S1,S0} = 3'b001
		       : (RegNum[0] == 0 
			  ? 2       // {S2,S1,S0} = 3'b010
			  : 3))     // {S2,S1,S0} = 3'b011
		    : (RegNum[1] == 0 
		       ? (RegNum[0] == 0 
			  ? 4       // {S2,S1,S0} = 3'b100
			  : 5)      // {S2,S1,S0} = 3'b101
		       : (RegNum[0] == 0 
			  ? 6       // {S2,S1,S0} = 3'b110
			  : 7)));   // {S2,S1,S0} = 3'b111

   assign Regs = RegList;
   assign Regs[0:Holder] = Data[0];
   assign Regs[1:Holder] = Data[1];
   assign Regs[2:Holder] = Data[2];
   assign Regs[3:Holder] = Data[3];
   assign Regs[4:Holder] = Data[4];
   assign Regs[5:Holder] = Data[5];
   assign Regs[6:Holder] = Data[6];
   assign Regs[7:Holder] = Data[7];
   assign Regs[8:Holder] = Data[8];
   assign Regs[9:Holder] = Data[9];
   assign Regs[10:Holder] = Data[10];
   assign Regs[11:Holder] = Data[11];
   assign Regs[12:Holder] = Data[12];
   assign Regs[13:Holder] = Data[13];
   assign Regs[14:Holder] = Data[14];
   assign Regs[15:Holder] = Data[15];   
   
endmodule // WriteToReg

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
endmodule
 // multiplexer_8_1
