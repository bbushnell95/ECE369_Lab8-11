`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
//
// Student(s) Name and Last Name:   Derek McMullen
//                                  Brett Bushnell
// Module - EX_Mem_PipeReg.v
// Description - Implements a register between EX and Mem stage of processor
////////////////////////////////////////////////////////////////////////////////

module EX_Mem_PipeReg(BranchIn, MemReadIn, MemWriteIn, RegWriteIn, BranchTargetAddressIn, ALUIn, ZeroIn, DestinationRegIn, Clk, BranchOut, MemReadOut, MemWriteOut, RegWriteOut, BranchTargetAddressOut, ALUOut, ZeroOut, DestinationRegOut);

	/* Control Signals*/
    output reg BranchOut; 
    output reg MemReadOut; 
    output reg MemWriteOut; 
    output reg RegWriteOut; 
    
    output reg [31:0] BranchTargetAddressOut;
    output reg [63:0] ALUOut;
    output reg ZeroOut;
    output reg [4:0] DestinationRegOut; 
    
    /* Control Signals*/
    input BranchIn; 
    input MemReadIn; 
    input MemWriteIn; 
    input RegWriteIn; 
    
    input [31:0] BranchTargetAddressIn;
    input [63:0] ALUIn;
    input ZeroIn;
    input [4:0] DestinationRegIn; 
    input Clk; 
        
    always @ (negedge Clk)
        begin
            BranchOut <= BranchIn; 
            MemReadOut <= MemReadIn; 
            MemWriteOut <= MemWriteIn; 
            RegWriteOut <= RegWriteIn; 
        
            BranchTargetAddressOut <= BranchTargetAddressIn;
            ALUOut <= ALUIn;
            ZeroOut <= ZeroIn;
            DestinationRegOut <= DestinationRegIn; 
        end

endmodule
