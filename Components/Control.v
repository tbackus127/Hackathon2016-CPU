//-----------------------------------------------------------------------------
// GoBoard Control module
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// Converts binary to 7-Segment encoding
//-----------------------------------------------------------------------------
module Binary_To_7Segment 
  (
   input       i_Clk,
   input [7:0] i_Binary_Num,
   output      o_Segment1_A,
   output      o_Segment1_B,
   output      o_Segment1_C,
   output      o_Segment1_D,
   output      o_Segment1_E,
   output      o_Segment1_F,
   output      o_Segment1_G,
   output      o_Segment2_A,
   output      o_Segment2_B,
   output      o_Segment2_C,
   output      o_Segment2_D,
   output      o_Segment2_E,
   output      o_Segment2_F,
   output      o_Segment2_G
   );

  reg [6:0]    r_Hex_Encoding1 = 7'h00;
  reg [6:0]    r_Hex_Encoding2 = 7'h00;
  
  reg [3:0]    rNumMSB = 4'b0000;
  reg [3:0]    rNumLSB = 4'b0000;
  
  // Purpose: Creates a case statement for all possible input binary numbers.
  // Drives r_Hex_Encoding appropriately for each input combination.
  always @(posedge i_Clk)
    begin
    rNumLSB <= (i_Binary_Num[3:0]);
    rNumMSB <= (i_Binary_Num[7:4]);
      case (rNumMSB)
        4'b0000 : r_Hex_Encoding1 <= 7'h7E;
        4'b0001 : r_Hex_Encoding1 <= 7'h30;
        4'b0010 : r_Hex_Encoding1 <= 7'h6D;
        4'b0011 : r_Hex_Encoding1 <= 7'h79;
        4'b0100 : r_Hex_Encoding1 <= 7'h33;          
        4'b0101 : r_Hex_Encoding1 <= 7'h5B;
        4'b0110 : r_Hex_Encoding1 <= 7'h5F;
        4'b0111 : r_Hex_Encoding1 <= 7'h70;
        4'b1000 : r_Hex_Encoding1 <= 7'h7F;
        4'b1001 : r_Hex_Encoding1 <= 7'h7B;
        4'b1010 : r_Hex_Encoding1 <= 7'h77;
        4'b1011 : r_Hex_Encoding1 <= 7'h1F;
        4'b1100 : r_Hex_Encoding1 <= 7'h4E;
        4'b1101 : r_Hex_Encoding1 <= 7'h3D;
        4'b1110 : r_Hex_Encoding1 <= 7'h4F;
        4'b1111 : r_Hex_Encoding1 <= 7'h47;
      endcase
      case (rNumLSB)
        4'b0000 : r_Hex_Encoding2 <= 7'h7E;
        4'b0001 : r_Hex_Encoding2 <= 7'h30;
        4'b0010 : r_Hex_Encoding2 <= 7'h6D;
        4'b0011 : r_Hex_Encoding2 <= 7'h79;
        4'b0100 : r_Hex_Encoding2 <= 7'h33;          
        4'b0101 : r_Hex_Encoding2 <= 7'h5B;
        4'b0110 : r_Hex_Encoding2 <= 7'h5F;
        4'b0111 : r_Hex_Encoding2 <= 7'h70;
        4'b1000 : r_Hex_Encoding2 <= 7'h7F;
        4'b1001 : r_Hex_Encoding2 <= 7'h7B;
        4'b1010 : r_Hex_Encoding2 <= 7'h77;
        4'b1011 : r_Hex_Encoding2 <= 7'h1F;
        4'b1100 : r_Hex_Encoding2 <= 7'h4E;
        4'b1101 : r_Hex_Encoding2 <= 7'h3D;
        4'b1110 : r_Hex_Encoding2 <= 7'h4F;
        4'b1111 : r_Hex_Encoding2 <= 7'h47;
      endcase
    end // always @ (posedge i_Clk)

  // r_Hex_Encoding[7] is unused
  assign o_Segment2_A = r_Hex_Encoding2[6];
  assign o_Segment2_B = r_Hex_Encoding2[5];
  assign o_Segment2_C = r_Hex_Encoding2[4];
  assign o_Segment2_D = r_Hex_Encoding2[3];
  assign o_Segment2_E = r_Hex_Encoding2[2];
  assign o_Segment2_F = r_Hex_Encoding2[1];
  assign o_Segment2_G = r_Hex_Encoding2[0];
  assign o_Segment1_A = r_Hex_Encoding1[6];
  assign o_Segment1_B = r_Hex_Encoding1[5];
  assign o_Segment1_C = r_Hex_Encoding1[4];
  assign o_Segment1_D = r_Hex_Encoding1[3];
  assign o_Segment1_E = r_Hex_Encoding1[2];
  assign o_Segment1_F = r_Hex_Encoding1[1];
  assign o_Segment1_G = r_Hex_Encoding1[0];

endmodule

//-----------------------------------------------------------------------------
// Switch Debouncing
//-----------------------------------------------------------------------------

module Debounce_Switch (input i_Clk, input i_Switch, output o_Switch);

  parameter c_DEBOUNCE_LIMIT = 250000;  // 10 ms at 25 MHz
  
  reg [17:0] r_Count = 0;
  reg r_State = 1'b0;

  always @(posedge i_Clk)
  begin
    // Switch input is different than internal switch value, so an input is
    // changing.  Increase the counter until it is stable for enough time.	
    if (i_Switch !== r_State && r_Count < c_DEBOUNCE_LIMIT)
      r_Count <= r_Count + 1;

    // End of counter reached, switch is stable, register it, reset counter
    else if (r_Count == c_DEBOUNCE_LIMIT)
    begin
      r_State <= i_Switch;
      r_Count <= 0;
    end  

    // Switches are the same state, reset the counter
    else
      r_Count <= 0;
  end

  // Assign internal register to output (debounced!)
  assign o_Switch = r_State;

endmodule

//-----------------------------------------------------------------------------
// Main program
//-----------------------------------------------------------------------------

module Project_7_Segment_Top
  (input  i_Clk,      // Main Clock (25 MHz)
   input  i_Switch_1,   // Increment counter
   input  i_Switch_2,   // Set A
   input  i_Switch_3,   // Add & Display
   input  i_Switch_4,   // Set B
   output o_Segment2_A,
   output o_Segment2_B,
   output o_Segment2_C,
   output o_Segment2_D,
   output o_Segment2_E,
   output o_Segment2_F,
   output o_Segment2_G,
   output o_LED_1,
   output o_LED_2,
   output o_Segment1_A,
   output o_Segment1_B,
   output o_Segment1_C,
   output o_Segment1_D,
   output o_Segment1_E,
   output o_Segment1_F,
   output o_Segment1_G
   );

  wire w_Switch_1;
  wire w_Switch_2;
  wire w_Switch_3;
  wire w_Switch_4;
  
  reg  r_Switch_1 = 1'b0;
  reg  r_Switch_2 = 1'b0;
  reg  r_Switch_3 = 1'b0;
  reg  r_Switch_4 = 1'b0;
  
  reg rLED1 = 1'b0;
  reg rLED2 = 1'b0;
  
  reg rSel = 1'b0;
  
  reg [7:0] r_Count = 4'b0000;
  reg [7:0] r_A = 4'b0000;
  reg [7:0] r_B = 4'b0000;
  reg [7:0] r_Res = 4'b0000;
  reg [7:0] rDisp = 4'b0000;
  
  wire w_Segment1_A;
  wire w_Segment1_B;
  wire w_Segment1_C;
  wire w_Segment1_D;
  wire w_Segment1_E;
  wire w_Segment1_F;
  wire w_Segment1_G;
  wire w_Segment2_A;
  wire w_Segment2_B;
  wire w_Segment2_C;
  wire w_Segment2_D;
  wire w_Segment2_E;
  wire w_Segment2_F;
  wire w_Segment2_G;

  // Instantiate Debounce Filter
  Debounce_Switch Debounce_Switch_Inst1
    (.i_Clk(i_Clk),
     .i_Switch(i_Switch_1),
     .o_Switch(w_Switch_1));
  Debounce_Switch Debounce_Switch_Inst2
    (.i_Clk(i_Clk),
     .i_Switch(i_Switch_2),
     .o_Switch(w_Switch_2));
  Debounce_Switch Debounce_Switch_Inst3
    (.i_Clk(i_Clk),
     .i_Switch(i_Switch_3),
     .o_Switch(w_Switch_3));
  Debounce_Switch Debounce_Switch_Inst4
    (.i_Clk(i_Clk),
     .i_Switch(i_Switch_4),
     .o_Switch(w_Switch_4));
     
	  
  // Purpose: When Switch is pressed, increment counter.
  // When counter gets to F, start it back at 0 again.
  always @(posedge i_Clk)
  begin
    r_Switch_1 <= w_Switch_1;
    r_Switch_2 <= w_Switch_2;
    r_Switch_3 <= w_Switch_3;
    r_Switch_4 <= w_Switch_4;
	  
      // Increment Count when switch is pushed down
      if (w_Switch_1 == 1'b1 && r_Switch_1 == 1'b0)
      begin
        if (r_Count == 256)
          r_Count <= 0;
        else 
          r_Count <= r_Count + 1;
        rSel <= 1'b0;
      end
      
      // Set A to counter's value
      if (w_Switch_2 == 1'b1 && r_Switch_2 == 1'b0)
      begin
        r_A <= r_Count;
        rLED1 <= 1'b1;
      end
      
      // Set B to counter's value
      if (w_Switch_4 == 1'b1 && r_Switch_4 == 1'b0)
      begin
        r_B <= r_Count;
        rLED2 <= 1'b1;
      end
      
      // Add and display
      if (w_Switch_3 == 1'b1 && r_Switch_3 == 1'b0)
      begin
        r_Res <= (r_A + r_B);
        rSel <= 1'b1;
      end
      
      // 0: r_Count, 1: r_Res
      if(rSel == 1'b0)
        rDisp <= r_Count;
      else
        rDisp <= r_Res;
      
  end
  
  // Instantiate Binary to 7-Segment Converter

  Binary_To_7Segment Inst
  (.i_Clk(i_Clk),
   .i_Binary_Num(rDisp),
   .o_Segment2_A(w_Segment2_A),
   .o_Segment2_B(w_Segment2_B),
   .o_Segment2_C(w_Segment2_C),
   .o_Segment2_D(w_Segment2_D),
   .o_Segment2_E(w_Segment2_E),
   .o_Segment2_F(w_Segment2_F),
   .o_Segment2_G(w_Segment2_G),
   .o_Segment1_A(w_Segment1_A),
   .o_Segment1_B(w_Segment1_B),
   .o_Segment1_C(w_Segment1_C),
   .o_Segment1_D(w_Segment1_D),
   .o_Segment1_E(w_Segment1_E),
   .o_Segment1_F(w_Segment1_F),
   .o_Segment1_G(w_Segment1_G)
   );
  
  assign o_Segment2_A = ~w_Segment2_A;
  assign o_Segment2_B = ~w_Segment2_B;
  assign o_Segment2_C = ~w_Segment2_C;
  assign o_Segment2_D = ~w_Segment2_D;
  assign o_Segment2_E = ~w_Segment2_E;
  assign o_Segment2_F = ~w_Segment2_F;
  assign o_Segment2_G = ~w_Segment2_G;
  assign o_Segment1_A = ~w_Segment1_A;
  assign o_Segment1_B = ~w_Segment1_B;
  assign o_Segment1_C = ~w_Segment1_C;
  assign o_Segment1_D = ~w_Segment1_D;
  assign o_Segment1_E = ~w_Segment1_E;
  assign o_Segment1_F = ~w_Segment1_F;
  assign o_Segment1_G = ~w_Segment1_G;
  
  assign o_LED_1 = ~rLED1;
  assign o_LED_2 = ~rLED2;
  
endmodule
