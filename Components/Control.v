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
  wire [15:0]adderResult;
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
//case of chosing bank 1
  //assign [0]outreg = [0]reg1;
  //assign [1]outreg = [1]reg1;
  //assign [2]outreg = [2]reg1;
  //assign [3]outreg = [3]reg1;
  //assign [4]outreg = [4]reg1;
  //assign [5]outreg = [5]reg1;
  //assign [6]outreg = [6]reg1;
  //assign [7]outreg = [7]reg1;
  //assign [8]outreg = [8]reg1;
  //assign [9]outreg = [9]reg1;
  //assign [10]outreg = [10]reg1;
  //assign [11]outreg = [11]reg1;
  //assign [12]outreg = [12]reg1;
  //assign [13]outreg = [13]reg1;
  //assign [14]outreg = [14]reg1;
  //assign [15]outreg = [15]reg1;

//case of chosing bank 2
    //assign [0]outreg = [0]reg2;
    //assign [1]outreg = [1]reg2;
    //assign [2]outreg = [2]reg2;
    //assign [3]outreg = [3]reg2;
    //assign [4]outreg = [4]reg2;
    //assign [5]outreg = [5]reg2;
    //assign [6]outreg = [6]reg2;
    //assign [7]outreg = [7]reg2;
    //assign [8]outreg = [8]reg2;
    //assign [9]outreg = [9]reg2;
    //assign [10]outreg = [10]reg2;
    //assign [11]outreg = [11]reg2;
    //assign [12]outreg = [12]reg2;
    //assign [13]outreg = [13]reg2;
    //assign [14]outreg = [14]reg2;
    //assign [15]outreg = [15]reg2;

//case of chosing bank 3
    //assign [0]outreg = [0]reg3;
    //assign [1]outreg = [1]reg3;
    //assign [2]outreg = [2]reg3;
    //assign [3]outreg = [3]reg3;
    //assign [4]outreg = [4]reg3;
    //assign [5]outreg = [5]reg3;
    //assign [6]outreg = [6]reg3;
    //assign [7]outreg = [7]reg3;
    //assign [8]outreg = [8]reg3;
    //assign [9]outreg = [9]reg3;
    //assign [10]outreg = [10]reg3;
    //assign [11]outreg = [11]reg3;
    //assign [12]outreg = [12]reg3;
    //assign [13]outreg = [13]reg3;
    //assign [14]outreg = [14]reg3;
    //assign [15]outreg = [15]reg3;

//case of chosing bank 4
    //assign [0]outreg = [0]reg4;
    //assign [1]outreg = [1]reg4;
    //assign [2]outreg = [2]reg4;
    //assign [3]outreg = [3]reg4;
    //assign [4]outreg = [4]reg4;
    //assign [5]outreg = [5]reg4;
    //assign [6]outreg = [6]reg4;
    //assign [7]outreg = [7]reg4;
    //assign [8]outreg = [8]reg4;
    //assign [9]outreg = [9]reg4;
    //assign [10]outreg = [10]reg4;
    //assign [11]outreg = [11]reg4;
    //assign [12]outreg = [12]reg4;
    //assign [13]outreg = [13]reg4;
    //assign [14]outreg = [14]reg4;
    //assign [15]outreg = [15]reg4;

//case of chosing bank 5
    //assign [0]outreg = [0]reg5;
    //assign [1]outreg = [1]reg5;
    //assign [2]outreg = [2]reg5;
    //assign [3]outreg = [3]reg5;
    //assign [4]outreg = [4]reg5;
    //assign [5]outreg = [5]reg5;
    //assign [6]outreg = [6]reg5;
    //assign [7]outreg = [7]reg5;
    //assign [8]outreg = [8]reg5;
    //assign [9]outreg = [9]reg5;
    //assign [10]outreg = [10]reg5;
    //assign [11]outreg = [11]reg5;
    //assign [12]outreg = [12]reg5;
    //assign [13]outreg = [13]reg5;
    //assign [14]outreg = [14]reg5;
    //assign [15]outreg = [15]reg5;

//case of chosing bank 6
    //assign [0]outreg = [0]reg6;
    //assign [1]outreg = [1]reg6;
    //assign [2]outreg = [2]reg6;
    //assign [3]outreg = [3]reg6;
    //assign [4]outreg = [4]reg6;
    //assign [5]outreg = [5]reg6;
    //assign [6]outreg = [6]reg6;
    //assign [7]outreg = [7]reg6;
    //assign [8]outreg = [8]reg6;
    //assign [9]outreg = [9]reg6;
    //assign [10]outreg = [10]reg6;
    //assign [11]outreg = [11]Reg6;
    //assign [12]outreg = [12]reg6;
    //assign [13]outreg = [13]reg6;
    //assign [14]outreg = [14]reg6;
    //assign [15]outreg = [15]reg6;

//case of chosing bank 7
    //assign [0]outreg = [0]reg7;
    //assign [1]outreg = [1]reg7;
    //assign [2]outreg = [2]reg7;
    //assign [3]outreg = [3]reg7;
    //assign [4]outreg = [4]reg7;
    //assign [5]outreg = [5]reg7;
    //assign [6]outreg = [6]reg7;
    //assign [7]outreg = [7]reg7;
    //assign [8]outreg = [8]reg7;
    //assign [9]outreg = [9]reg7;
    //assign [10]outreg = [10]reg7;
    //assign [11]outreg = [11]reg7;
    //assign [12]outreg = [12]reg7;
    //assign [13]outreg = [13]reg7;
    //assign [14]outreg = [14]reg7;
    //assign [15]outreg = [15]reg7;

//case of chosing bank 8
    //assign [0]outreg = [0]reg8;
    //assign [1]outreg = [1]reg8;
    //assign [2]outreg = [2]reg8;
    //assign [3]outreg = [3]reg8;
    //assign [4]outreg = [4]reg8;
    //assign [5]outreg = [5]reg8;
    //assign [6]outreg = [6]reg8;
    //assign [7]outreg = [7]reg8;
    //assign [8]outreg = [8]reg8;
    //assign [9]outreg = [9]reg8;
    //assign [10]outreg = [10]reg8;
    //assign [11]outreg = [11]reg8;
    //assign [12]outreg = [12]reg8;
    //assign [13]outreg = [13]reg8;
    //assign [14]outreg = [14]reg8;
    //assign [15]outreg = [15]reg8;
endmodule//memory
