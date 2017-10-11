`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
//
// Student(s) Name and Last Name:   Derek McMullen
//                                  Brett Bushnell
// Module - IF_ID_PipeReg.v
// Description - Implements a register between IF and ID stage of processor
////////////////////////////////////////////////////////////////////////////////

module IF_ID_PipeReg(PCValueIn, InstructionIn, Clk, PCValueOut, InstructionOut);

    output reg [31:0] PCValueOut;
    output reg [31:0] InstructionOut;

    input [31:0] PCValueIn;
    input [31:0] InstructionIn;
    input Clk; 
        
    always @ (negedge Clk)
        begin
            PCValueOut <= PCValueIn; 
            InstructionOut <= InstructionIn; 
        end

endmodule
