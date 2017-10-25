`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
//
// Student(s) Name and Last Name:   Derek McMullen
//                                  Brett Bushnell
// Module - EX_Mem_PipeReg.v
// Description - Implements a register between EX and Mem stage of processor
////////////////////////////////////////////////////////////////////////////////

module EX_Mem_PipeReg(BranchIn, MemReadIn, MemWriteIn, RegWriteIn, MemToRegIn, LoadStoreByteIn, LoadStoreHalfIn, NotZeroIn, BranchTargetAddressIn, ALUIn, ZeroIn, MemoryWriteDataIn, DestinationRegIn, Clk, BranchOut, MemReadOut, MemWriteOut, RegWriteOut, MemToRegOut, BranchTargetAddressOut, ALUOut, ZeroOut, MemoryWriteDataOut, DestinationRegOut, LoadStoreByteOut, LoadStoreHalfOut, NotZeroOut);

	/* Control Signals*/
    output reg BranchOut; 
    output reg MemReadOut; 
    output reg MemWriteOut; 
    output reg RegWriteOut; 
    output reg MemToRegOut;
    output reg LoadStoreByteOut;
    output reg LoadStoreHalfOut; 
    output reg NotZeroOut;

    output reg [31:0] BranchTargetAddressOut;
    output reg [31:0] ALUOut;
    output reg ZeroOut;
    output reg [31:0] MemoryWriteDataOut;
    output reg [4:0] DestinationRegOut; 
    
    /* Control Signals*/
    input BranchIn; 
    input MemReadIn; 
    input MemWriteIn; 
    input RegWriteIn;
    input MemToRegIn;
    input LoadStoreByteIn;
    input LoadStoreHalfIn; 
    input NotZeroIn;

    input [31:0] BranchTargetAddressIn;
    input [31:0] ALUIn;
    input ZeroIn;
    input [31:0] MemoryWriteDataIn; 
    input [4:0] DestinationRegIn; 
    input Clk; 
        
    always @ (posedge Clk)
        begin
            BranchOut <= BranchIn; 
            MemReadOut <= MemReadIn; 
            MemWriteOut <= MemWriteIn; 
            RegWriteOut <= RegWriteIn; 
            MemToRegOut <= MemToRegIn;
            LoadStoreByteOut <= LoadStoreByteIn;
            LoadStoreHalfOut <= LoadStoreHalfIn;
            NotZeroOut <= NotZeroIn; 
        
            BranchTargetAddressOut <= BranchTargetAddressIn;
            ALUOut <= ALUIn;
            ZeroOut <= ZeroIn;
            MemoryWriteDataOut <= MemoryWriteDataIn; 
            DestinationRegOut <= DestinationRegIn; 
        end

endmodule
