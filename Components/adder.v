///////////////////////////////////////////////////////////////////////////////
module Adder(A, B, i_carry, out, o_carry);

  input  [0:15]A;
  input  [0:15]B;
  input  i_carry;
  output [0:15]out;
  output o_carry;

  wire a;
  wire b;
  wire c;
  assign o_sum   = A ^ B ^ i_carry;
  assign a = A^B;
  assign b = a & i_carry;
  assign c = A&B;
  assign o_carry = b | c;

endmodule//
