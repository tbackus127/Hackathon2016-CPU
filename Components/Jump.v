module jump (offset);

reg [15:0]regOP;
input [15:0]offset;

program_counter pc (.offset(offset));

end module

module jump_less_than (CompareA, ComapareB, offset);

input [15:0]CompareA;
input [15:0]CompareB;
input [15:0]offset;
wire result;

IsLessThan ilt (CompareA, CompareB, result);

if (result == 1)
    begin
        jump jp (offset);
    end   
end module

module jump_greater_than (CompareA, CompareB, offset);
    
input [15:0]CompareA;
input [15:0]CompareB;
input [15:0]offset;
wire result;

IsGreaterThan igt (CompareA, CompareB, result);

if (result == 1)
    begin
        jump jp (offset);
    end 
end module

module jump_equal_to (CompareA, CompareB, offset);

input [15:0]CompareA;
input [15:0]CompareB;
input [15:0]offset;
wire result;

IsEqual(CompareA, CompareB, result);

if (result == 1)
    begin
        jump jp (offset);
    end
end module
