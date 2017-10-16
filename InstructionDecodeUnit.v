`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Team Members:
// Overall percent effort of each team member:
// Brett Bushnell -- 50%
// Derek Mcmullen -- 50% 
// 
////////////////////////////////////////////////////////////////////////////////

module InstructionDecodeUnit(Instruction, PCValueIn, DestinationRegIn, WriteData, RegWriteIn, Reset, Clk, BranchOut, MemReadOut, MemWriteOut, RegWriteOut, MemToRegOut, RegDstOut, ALUOpOut, ALUSrcOut, PCValueOut, ReadData1Out, ReadData2Out, SignExtendOffsetOut, RDFieldOut, RTFieldOut);

    input Reset, Clk;
    input [31:0] Instruction;
	input [31:0] PCValueIn; 
	input [4:0] DestinationRegIn; 
	input [31:0] WriteData;
	input RegWriteIn; 
	
	/* Control Signals*/
    output BranchOut; 
    output MemReadOut; 
    output MemWriteOut; 
    output RegWriteOut; 
    output MemToRegOut; 
    output RegDstOut; 
    output [3:0] ALUOpOut; 
    output ALUSrcOut;
    
    output [31:0] PCValueOut; 
    output [31:0] ReadData1Out;
    output [31:0] ReadData2Out;
    output [31:0] SignExtendOffsetOut;
    output [4:0] RDFieldOut; 
    output [4:0] RTFieldOut; 
	
    // Included Modules
    RegisterFile RegisterFile_1(Instruction[25:21], Instruction[20:16], DestinationRegIn, WriteData, RegWriteIn, Clk, ReadData1Out, ReadData2Out);
    SignExtension SignExtension_1(Instruction[15:0],SignExtendOffsetOut);
    
    //controller needs to be implemented
    
    // Assign Statements
    assign RTFieldOut = Instruction[20:16];
    assign RDFieldOut = Instruction[15:11];
    assign PCValueOut = PCValueIn;     
    
endmodule

