`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Team Members:
// Overall percent effort of each team member:
// Brett Bushnell -- 50%
// Derek Mcmullen -- 50% 
// 
////////////////////////////////////////////////////////////////////////////////

module MemoryUnit(Clk, BranchIn, MemReadIn, MemWriteIn, RegWriteIn, MemToRegIn, LoadStoreByteIn, LoadStoreHalfIn, BranchTargetAddressIn, NotZeroIn, JumpIn, ALUIn, ZeroIn, MemoryWriteDataIn, DestinationRegIn, PCValueForJALIn, RegWriteOut, MemToRegOut, PCSrcOut, JumpOut, BranchTargetAddressOut, ALUOut, DataMemOut, DestinationRegOut, PCValueForJALOut);
	
    /* Control Signals*/
    output RegWriteOut; 
    output MemToRegOut; 
    output PCSrcOut;
    output [1:0] JumpOut; 
    
    output [31:0] BranchTargetAddressOut;
    output [31:0] ALUOut;
    output [31:0] DataMemOut;
    output [4:0] DestinationRegOut; 
    output [31:0] PCValueForJALOut; 
	
	/* Control Signals*/
	input Clk; 
    input BranchIn; 
    input MemReadIn; 
    input MemWriteIn; 
    input RegWriteIn; 
    input MemToRegIn;
    input LoadStoreByteIn;
    input LoadStoreHalfIn;
    input NotZeroIn; 
    input [1:0] JumpIn; 
    
    input [31:0] BranchTargetAddressIn;
    input [31:0] ALUIn;
    input ZeroIn;
    input [31:0] MemoryWriteDataIn; 
    input [4:0] DestinationRegIn;
    input [31:0] PCValueForJALIn;


    wire ZeroMuxOut; 
    
	DataMemory DataMemory_1(ALUIn[31:0], MemoryWriteDataIn, Clk, MemWriteIn, MemReadIn, DataMemOut, LoadStoreByteIn, LoadStoreHalfIn);
    Mux32Bit2To1 Mux32Bit2To1_1(ZeroMuxOut, ZeroIn, ~ZeroIn, NotZeroIn);
	
	// Assign Statements
	assign RegWriteOut = RegWriteIn; 
	assign MemToRegOut = MemToRegIn; 
	assign DestinationRegOut = DestinationRegIn; 
	assign BranchTargetAddressOut = BranchTargetAddressIn; 
    assign ALUOut = ALUIn; 
    assign PCValueForJALOut = PCValueForJALIn;
    assign JumpOut = JumpIn; 
    
    // Branch AND Gate Logic
    assign PCSrcOut = (ZeroMuxOut & BranchIn); 
    
endmodule