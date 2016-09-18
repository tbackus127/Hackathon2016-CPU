/*
 *-------------------------------------------
 * The shifter module. It's a barrel shifter!
 *-------------------------------------------
 */

module shifter(data,b,result);
   input  [15:0]     data; /* compute parity of these bits */
   input  [15:0]     b; /* amount to shift */
   output [15:0]     result; /* shift result */   
   assign result = data << b;
endmodule
