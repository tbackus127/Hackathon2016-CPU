module program_counter (offset)

input  [15:0]offset;  // offset into the program
reg    [15:0]regOP;  // the original register location
output [15:0]newReg; // the new location

carry_select_adder_subtractor(newReg, 0, 0, regOP, offset, 0);

end module
