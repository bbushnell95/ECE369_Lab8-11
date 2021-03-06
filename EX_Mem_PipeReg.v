`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
//
// Student(s) Name and Last Name:   Derek McMullen
//                                  Brett Bushnell
// Module - EX_Mem_PipeReg.v
// Description - Implements a register between EX and Mem stage of processor
////////////////////////////////////////////////////////////////////////////////

module EX_Mem_PipeReg(Reset, BranchIn, MemReadIn, MemWriteIn, RegWriteIn, MemToRegIn, LoadStoreByteIn, LoadStoreHalfIn, NotZeroIn, JumpIn, BranchTargetAddressIn, ALUIn, ZeroIn, MemoryWriteDataIn, DestinationRegIn, PCValueForJALIn, InstructionIn, Clk, BranchOut, MemReadOut, MemWriteOut, RegWriteOut, MemToRegOut, BranchTargetAddressOut, ALUOut, ZeroOut, MemoryWriteDataOut, DestinationRegOut, PCValueForJALOut, LoadStoreByteOut, LoadStoreHalfOut, NotZeroOut, JumpOut, InstructionOut);

	/* Control Signals*/
    output reg BranchOut; 
    output reg MemReadOut; 
    output reg MemWriteOut; 
    output reg RegWriteOut; 
    output reg MemToRegOut;
    output reg LoadStoreByteOut;
    output reg LoadStoreHalfOut; 
    output reg NotZeroOut;
    output reg [1:0] JumpOut; 

    output reg [31:0] BranchTargetAddressOut;
    output reg [31:0] ALUOut;
    output reg ZeroOut;
    output reg [31:0] MemoryWriteDataOut;
    output reg [4:0] DestinationRegOut; 
    output reg [31:0] PCValueForJALOut; 
    output reg [31:0] InstructionOut; 
    
    /* Control Signals*/
    input Reset; 
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
    input [31:0] InstructionIn; 
    input Clk; 
        
    always @ (posedge Clk)
        begin
        
        if (Reset == 1) begin
            BranchOut <= 0; 
            MemReadOut <= 0; 
            MemWriteOut <= 0; 
            RegWriteOut <= 0; 
            MemToRegOut <= 0;
            LoadStoreByteOut <= 0;
            LoadStoreHalfOut <= 0;
            NotZeroOut <= 0; 
            JumpOut <= 0;
        
            BranchTargetAddressOut <= 0;
            ALUOut <= 0;
            ZeroOut <= 0;
            MemoryWriteDataOut <= 0; 
            DestinationRegOut <= 0; 
            PCValueForJALOut <= 0; 
            InstructionOut <= 0; 
        end 
        else begin
            BranchOut <= BranchIn; 
            MemReadOut <= MemReadIn; 
            MemWriteOut <= MemWriteIn; 
            RegWriteOut <= RegWriteIn; 
            MemToRegOut <= MemToRegIn;
            LoadStoreByteOut <= LoadStoreByteIn;
            LoadStoreHalfOut <= LoadStoreHalfIn;
            NotZeroOut <= NotZeroIn; 
            JumpOut <= JumpIn;
        
            BranchTargetAddressOut <= BranchTargetAddressIn;
            ALUOut <= ALUIn;
            ZeroOut <= ZeroIn;
            MemoryWriteDataOut <= MemoryWriteDataIn; 
            DestinationRegOut <= DestinationRegIn; 
            PCValueForJALOut <= PCValueForJALIn; 
            InstructionOut <= InstructionIn; 
        end
    end
    
endmodule
