///////////////////////////////////////////////////////////////////////////////
module Adder(A, B, i_carry, out, o_carry);
//Define inputs and outputs
  input  [15:0]A;
  input  [15:0]B;
  input  i_carry;
  output [14:0]out;
  output o_carry;
//define inputs and outputs

//wires
  wire [15:0]carry_wire;
//wires

  Add firstbit(.[0]A, .[0]B, .i_carry, .[0]out., .[0]carry_wire);
  Add firstbit(.[1]A, .[1]B, .[0]carry_wire, .[1]out., .[1]carry_wire);
  Add firstbit(.[2]A, .[2]B, .[1]carry_wire, .[2]out., .[2]carry_wire);
  Add firstbit(.[3]A, .[3]B, .[2]carry_wire, .[3]out., .[3]carry_wire);
  Add firstbit(.[4]A, .[4]B, .[3]carry_wire, .[4]out., .[4]carry_wire);
  Add firstbit(.[5]A, .[5]B, .[4]carry_wire, .[5]out., .[5]carry_wire);
  Add firstbit(.[6]A, .[6]B, .[5]carry_wire, .[6]out., .[6]carry_wire);
  Add firstbit(.[7]A, .[7]B, .[6]carry_wire, .[7]out., .[7]carry_wire);
  Add firstbit(.[8]A, .[8]B, .[7]carry_wire, .[8]out., .[8]carry_wire);
  Add firstbit(.[9]A, .[9]B, .[8]carry_wire, .[9]out., .[9]carry_wire);
  Add firstbit(.[10]A, .[10]B, .[9]carry_wire, .[10]out., .[10]carry_wire);
  Add firstbit(.[11]A, .[11]B, .[10]carry_wire, .[11]out., .[11]carry_wire);
  Add firstbit(.[12]A, .[12]B, .[11]carry_wire, .[12]out., .[12]carry_wire);
  Add firstbit(.[13]A, .[13]B, .[12]carry_wire, .[13]out., .[13]carry_wire);
  Add firstbit(.[14]A, .[14]B, .[13]carry_wire, .[14]out., .[14]carry_wire);
  Add firstbit(.[15]A, .[15]B, .[14]carry_wire, .[15]out., .o_carry);


endmodule//
module Add(abit, bbit, carryin, outbit, carryout);
//Define inputs and outputs
  input abit;
  input bbit;
  input carryin;
  output outbit;
  output carryout;
//Define inputs and outputs

//wires
  wire a;
  wire b;
  wire c;
//wires

//adder
  assign a = abit ^ bbit;
  assign b = a & carryin;
  assign c = abit & bbit;
//adder

//assign ouputs of adder
  assign carryout = b|c;
  assign  outbit= a ^ carryin;
