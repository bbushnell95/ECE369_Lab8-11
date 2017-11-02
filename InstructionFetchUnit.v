`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Team Members:
// Overall percent effort of each team meber:
// Brett Bushnell -- 50%
// Derek Mcmullen -- 50% 
// 
// ECE369A - Computer Architecture
// Laboratory 3 (PostLab)
// Module - InstructionFetchUnit.v
// Description - Fetches the instruction from the instruction memory based on 
//               the program counter (PC) value.
// INPUTS:-
// Reset: 1-Bit input signal. 
// Clk: Input clock signal.
//
// OUTPUTS:-
// Instruction: 32-Bit output instruction from the instruction memory. 
//              Decimal value diplayed on the LCD usng the wrapper given in Lab 2
//
// FUNCTIONALITY:-
// Please connect up the following implemented modules to create this
// 'InstructionFetchUnit':-
//   (a) ProgramCounter.v
//   (b) PCAdder.v
//   (c) InstructionMemory.v
// Connect the modules together in a testbench so that the instruction memory
// outputs the contents of the next instruction indicated by the memory location
// in the PC at every clock cycle. Please initialize the instruction memory with
// some preliminary values for debugging purposes.
//
// @@ The 'Reset' input control signal is connected to the program counter (PC) 
// register which initializes the unit to output the first instruction in 
// instruction memory.
// @@ The 'Instruction' output port holds the output value from the instruction
// memory module.
// @@ The 'Clk' input signal is connected to the program counter (PC) register 
// which generates a continuous clock pulse into the module.
////////////////////////////////////////////////////////////////////////////////

module InstructionFetchUnit(Reset, Clk, PCSrcIn, JumpIn, BranchTargetAddressIn, JumpConcatPCValueIn, JRJumpPCValueIn, Instruction, PCValueOut);

    /* Please fill in the implementation here... */
    input Reset, Clk;
    input PCSrcIn; 
    input [1:0] JumpIn; 
    input [31:0] BranchTargetAddressIn; 
    input [31:0] JumpConcatPCValueIn;                 // used if J command jump taken
    input [31:0] JRJumpPCValueIn;               // used if JR command jump taken
    
    output [31:0] Instruction;
    output [31:0] PCValueOut;
    
    wire [31:0] addrOut, programCount, nextPC, branchAddWire, jumpWire;
    
    // Included Modules
    PCAdder PCAdder_1(programCount, addrOut);
    ProgramCounter ProgramCounter_1(nextPC, programCount, Reset, Clk);
    InstructionMemory InstuctionMemory_1(programCount, Instruction);
    Mux32Bit2To1 Mux32Bit2To1_1(branchAddWire, addrOut, BranchTargetAddressIn, PCSrcIn);
    
    Mux32Bit2To1 JR_JumpMux(jumpWire, branchAddWire, JRJumpPCValueIn, JumpIn[1]);
    Mux32Bit2To1 J_JumpMux1(nextPC, jumpWire, JumpConcatPCValueIn, JumpIn[0]);   
    
//    initial begin
//        CurrentPCOut <= 32'b0; 
//    end
    
//    always @(programCount) begin
//        CurrentPCOut <= programCount; 
//    end
    
    assign PCValueOut = addrOut; 
//    assign CurrentPCOut = programCount;

endmodule

