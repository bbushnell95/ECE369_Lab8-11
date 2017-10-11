`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Team Members:
// Overall percent effort of each team member:
// Brett Bushnell -- 50%
// Derek Mcmullen -- 50% 
// 
////////////////////////////////////////////////////////////////////////////////

module MemoryUnit(Clk, BranchIn, MemReadIn, MemWriteIn, RegWriteIn, MemToRegIn, BranchTargetAddressIn, ALUIn, ZeroIn, MemoryWriteDataIn, DestinationRegIn, RegWriteOut, MemToRegOut, ALUOut, DataMemOut, DestinationRegOut);
	
    /* Control Signals*/
    output RegWriteOut; 
    output MemToRegOut; 
    
    output [63:0] ALUOut;
    output [31:0] DataMemOut;
    output [4:0] DestinationRegOut; 
	
	/* Control Signals*/
	input Clk; 
    input BranchIn; 
    input MemReadIn; 
    input MemWriteIn; 
    input RegWriteIn; 
    input MemToRegIn; 
    
    input [31:0] BranchTargetAddressIn;
    input [63:0] ALUIn;
    input ZeroIn;
    input [31:0] MemoryWriteDataIn; 
    input [4:0] DestinationRegIn; 

    wire [31:0] ALUInputData1;              // First Input of ALU
    wire [31:0] ALUInputData2;              // Second Input of ALU
    wire [31:0] AltALUInputData;            // wire from mux to mux at input 1 of ALU
    
	DataMemory DataMemory_1(ALUIn[31:0], MemoryWriteDataIn, Clk, MemWriteIn, MemReadIn, DataMemOut);
	
	//need to pass regwrite and memtoreg control signals through
    //need to pass destination reg through
    //need to implement the branch and logic
    //need to pass lower 32?64? from ALUIn to ALUOut 
    
endmodule

