// MOV op for copying register A -> B
module move (OperandA, Result);
// Register to copy from
input [15:0]OperandA;
// Register to copy to
output [15:0]Result;

// The individual bit assigns from Ax -> Bx
assign Result[0] = OperandA[0];
assign Result[1] = OperandA[1];
assign Result[2] = OperandA[2];
assign Result[3] = OperandA[3];
assign Result[4] = OperandA[4];
assign Result[5] = OperandA[5];
assign Result[6] = OperandA[6];
assign Result[7] = OperandA[7];
assign Result[8] = OperandA[8];
assign Result[9] = OperandA[9];
assign Result[10] = OperandA[10];
assign Result[11] = OperandA[11];
assign Result[12] = OperandA[12];
assign Result[13] = OperandA[13];
assign Result[14] = OperandA[14];
assign Result[15] = OperandA[15];
// end
endmodule
