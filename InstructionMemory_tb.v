`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory 
// Module - InstructionMemory_tb.v
// Description - Test the 'InstructionMemory_tb.v' module.
////////////////////////////////////////////////////////////////////////////////

module InstructionMemory_tb(); 

    wire [31:0] Instruction;

    reg [31:0] Address;

	InstructionMemory u0(
		.Address(Address),
        .Instruction(Instruction)
	);

	initial begin
	
    /* Please fill in the implementation here... */
    
    //Case 0: 0000 0000 (Should see Instruction = 0)
    Address <= 'h00000000;
    #1 $display("Instruction = %d, should be: 0", Instruction);
    
    //Case 1: 0000 0001 (Should see Instruction = 16)
    Address <= 'h00000011;
    #1 $display("Instruction = %d, should be: 16", Instruction);
    
    //Case 2: FFFF 0078 (Should see Instruction = 120)
    Address <= 'hFFFF0078;
    #1 $display("Instruction = %d, should be: 120", Instruction);
    
    //Case 3: 0000 12AC (Should see Instuction = 172)
    Address <= 'h000012AC;
    #1 $display("Instruction = %d, should be 172", Instruction);
    
    //Case 4: FFFF FFFF (Should see Instruction = 508)
    Address <= 'hFFFFFFFF;
	#1 $display("Instruction = %d, should be 508", Instruction);
	end

endmodule

