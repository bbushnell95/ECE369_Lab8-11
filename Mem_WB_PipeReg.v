`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
//
// Student(s) Name and Last Name:   Derek McMullen
//                                  Brett Bushnell
// Module - Mem_WB_PipeReg.v
// Description - Implements a register between Mem and WB stage of processor
////////////////////////////////////////////////////////////////////////////////

module Mem_WB_PipeReg(RegWriteIn, MemToRegIn, JumpIn, ALUIn, DataMemIn, DestinationRegIn, PCValueForJALIn, Clk, RegWriteOut, MemToRegOut, JumpOut, ALUOut, DataMemOut, DestinationRegOut, PCValueForJALOut);

	/* Control Signals*/
    output reg RegWriteOut; 
    output reg MemToRegOut;
    output reg [1:0]JumpOut; 
    
    output reg [31:0] ALUOut;
    output reg [31:0] DataMemOut;
    output reg [4:0] DestinationRegOut; 
    output reg [31:0] PCValueForJALOut;
    
    /* Control Signals*/
    input RegWriteIn; 
    input MemToRegIn; 
    input [1:0] JumpIn; 
    
    input [31:0] ALUIn;
    input [31:0] DataMemIn;
    input [4:0] DestinationRegIn; 
    input [31:0] PCValueForJALIn;
    input Clk; 
        
    always @ (posedge Clk)
        begin
        RegWriteOut <= RegWriteIn; 
        MemToRegOut <= MemToRegIn;
        JumpOut <= JumpIn; 
        
        ALUOut <= ALUIn;
        DataMemOut <= DataMemIn;
        DestinationRegOut <= DestinationRegIn; 
        PCValueForJALOut <= PCValueForJALIn;
        end

endmodule
