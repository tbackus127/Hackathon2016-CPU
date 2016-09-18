module jump (offset);

reg [15:0]regOP;
input [15:0]offset;

program_counter pc (.offset(offset));

endmodule

module jump_less_than (CompareA, ComapareB, offset);

input [15:0]CompareA;
input [15:0]CompareB;
input [15:0]offset;
wire result;

IsLessThan ilt (CompareA, CompareB, result);
always @* begin
if (result == 0)
    begin
        offset[0] = 0;
        offset[1] = 0;
        offset[2] = 0;
        offset[3] = 0;
        offset[4] = 0;
        offset[5] = 0;
        offset[6] = 0;
        offset[7] = 0;
        offset[8] = 0;
        offset[9] = 0;
        offset[10] = 0;
        offset[11] = 0;
        offset[12] = 0;
        offset[13] = 0;
        offset[14] = 0;
        offset[15] = 0;
    end   
end
jump jp (offset);   
endmodule

module jump_greater_than (CompareA, CompareB, offset);
    
input [15:0]CompareA;
input [15:0]CompareB;
input [15:0]offset;
wire result;

IsGreaterThan igt (CompareA, CompareB, result);

always @* begin
if (result == 0)
    begin
        offset[0] = 0;
        offset[1] = 0;
        offset[2] = 0;
        offset[3] = 0;
        offset[4] = 0;
        offset[5] = 0;
        offset[6] = 0;
        offset[7] = 0;
        offset[8] = 0;
        offset[9] = 0;
        offset[10] = 0;
        offset[11] = 0;
        offset[12] = 0;
        offset[13] = 0;
        offset[14] = 0;
        offset[15] = 0;
    end
end
jump jp (offset);
endmodule

module jump_equal_to (CompareA, CompareB, offset);

input [15:0]CompareA;
input [15:0]CompareB;
input [15:0]offset;
wire result;

IsEqual iq (CompareA, CompareB, result);

always @* begin
if (result == 0)
    begin
        offset[0] = 0;
        offset[1] = 0;
        offset[2] = 0;
        offset[3] = 0;
        offset[4] = 0;
        offset[5] = 0;
        offset[6] = 0;
        offset[7] = 0;
        offset[8] = 0;
        offset[9] = 0;
        offset[10] = 0;
        offset[11] = 0;
        offset[12] = 0;
        offset[13] = 0;
        offset[14] = 0;
        offset[15] = 0;
    end
end
jump jp (offset);
endmodule
