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


